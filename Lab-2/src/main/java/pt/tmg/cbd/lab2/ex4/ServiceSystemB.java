package pt.tmg.cbd.lab2.ex4;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.IndexOptions;

import org.bson.Document;

import java.time.Instant;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Scanner;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

public class ServiceSystemB {
    public static final String PRODUCTS_KEY = "products";
    private static final String RATE_LIMIT_KEY = "rate_limit";
    private static final long MILLISECONDS_IN_SECOND = 1000L;

    private final MongoClient mongoClient;
    private final MongoDatabase db;
    private final MongoCollection<Document> products;
    private final MongoCollection<Document> rateLimit;
    private final int limit;
    private final int timeslot; // in seconds

    public ServiceSystemB(int limit, int timeslot) {
        this.mongoClient = MongoClients.create("mongodb://localhost:27017");
        this.db = mongoClient.getDatabase("products");
        this.products = this.db.getCollection(PRODUCTS_KEY);
        this.rateLimit = this.db.getCollection(RATE_LIMIT_KEY);
        this.limit = limit;
        this.timeslot = timeslot;
        // Drop product collection
        this.products.drop();
    }

    public void addProduct(String product) {
        this.products.insertOne(new Document("name", product));
    }

    public List<String> getAllProducts() {
        return this.products.find()
                .into(new ArrayList<>())
                .stream()
                .map(document -> document.getString("name"))
                .collect(Collectors.toList());
    }

    public boolean requestIsLimited(Document userFilter, int quantity) {
        Document retValue = this.rateLimit.find(userFilter).first();
        Date currentTime = Date.from(Instant.now());

        if (retValue == null) {
            if (quantity <= this.limit) {
                // insert with full quantity minus current request
                this.rateLimit.insertOne(
                    new Document("username", userFilter.getString("username"))
                        .append("quantity", this.limit - quantity)
                        .append("timestamp", currentTime)
                );
                return false;
            } else {
                return true; // The user has exceeded the rate limit in the first request
            }
        }

        Date lastRequestTime = retValue.getDate("timestamp");
        long elapsedTime = (currentTime.getTime() - lastRequestTime.getTime()) / MILLISECONDS_IN_SECOND;

        if (elapsedTime >= timeslot) {
            // Timeslot has expired; reset quota
            if (quantity <= this.limit) {
                this.rateLimit.updateOne(
                    userFilter,
                    new Document("$set", new Document("quantity", this.limit - quantity)
                        .append("timestamp", currentTime)) // Reset timestamp!!!
                );
                return false;
            } else {
                return true; // Exceeds limit even after reset
            }
        } else {
            int remainingQuantity = retValue.getInteger("quantity");
            if (remainingQuantity >= quantity) {
                // decrement quantity
                this.rateLimit.updateOne(
                    userFilter,
                    new Document("$set", new Document("quantity", remainingQuantity - quantity))
                );
                return false;
            } else {
                return true; // rate limit exceeded
            }
        }
    }

    public void request(String username, String product, int quantity) {
        if (this.products.find(new Document("name", product)).first() == null) {
            System.out.println("Product not found.");
            return;
        }

        Document userRateLimitFilter = new Document("username", username);

        if (requestIsLimited(userRateLimitFilter, quantity)) {
            // Fetch the user's rate limit document
            Document userRateLimitDoc = this.rateLimit.find(userRateLimitFilter).first();

            if (userRateLimitDoc == null) {
                System.out.println("Rate limit exceeded. Please try again.");
                return;
            }

            Date lastRequestTime = userRateLimitDoc.getDate("timestamp");
            long elapsedTime = (Instant.now().toEpochMilli() - lastRequestTime.getTime()) / MILLISECONDS_IN_SECOND;
            long remainingSeconds = timeslot - elapsedTime;

            System.out.printf("Rate limit reached. [wait for %d seconds, currently available %d]%n", remainingSeconds, userRateLimitDoc.getInteger("quantity"));
        } else {
            Document userRateLimitDoc = this.rateLimit.find(userRateLimitFilter).first();
            int remainingQuantity = userRateLimitDoc != null ? userRateLimitDoc.getInteger("quantity") : this.limit;
            System.out.printf("Acquired! [%d/%d]%n", remainingQuantity, this.limit);
        }
    }

    public void close() {
        this.mongoClient.close();
    }

    public static void main(String[] args) {
        int limit = 5;
        int timeslot = 60; // 120 seconds

        // 5 requests per 2 minute
        ServiceSystemB serviceSystemB = new ServiceSystemB(limit, timeslot);
            
        for (int i = 0; i < 10; i++) {
            serviceSystemB.addProduct("prod-"+i);
        }
        System.out.print("Products: ");
        serviceSystemB.getAllProducts().forEach((id) -> System.out.print(" "+id+","));
            
        Scanner sc = new Scanner(System.in);
        System.out.print("\n\nUsername: ");
        String username = sc.nextLine();
        String product;
        int quantity;
        while (true) {
            System.out.print("Acquire a product [product,quantity] ('Enter' for quit): ");
            product = sc.nextLine();
            if (product.isEmpty()) {
                break;
            }

            if (!product.contains(",")) {
                System.out.println("Invalid input!\n");
                continue;
            }

            quantity = Integer.valueOf(product.split(",")[1]);
            product = product.split(",")[0];

            serviceSystemB.request(username, product, quantity);
            System.out.println();
        }
        
        sc.close();

        serviceSystemB.close();
        System.exit(0);
    
    }
}
