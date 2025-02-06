package pt.tmg.cbd.lab2.ex4;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

import org.bson.Document;

import java.time.Instant;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Scanner;
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
                // No prior requests, allow up to the limit
                List<Date> timestamps = new ArrayList<>();
                this.rateLimit.insertOne(
                    new Document("username", userFilter.getString("username"))
                        .append("timestamps", timestamps)
                );
            } else {
                return false;
            }            
        } else {
            long cutoffTime = currentTime.getTime() - (timeslot * MILLISECONDS_IN_SECOND);

            this.rateLimit.updateOne(
                userFilter,
                new Document("$pull", new Document("timestamps", new Document("$lt", new Date(cutoffTime))))
            );
        }

        System.out.println(retValue.toJson());
        
        // count the number of timestamps for a user
        long timestampCount = this.rateLimit.aggregate(List.of(
            new Document("$match", userFilter),
            new Document("$project", new Document("_id", 0).append("timestampCount", new Document("$size", "$timestamps")))
        )).first().getInteger("timestampCount");

        if (timestampCount + quantity > this.limit) {
            return true; // rate limit exceeded
        }

        List<Date> timestamps = new ArrayList<>();
        // Add the current request timestamp and update the database
        for (int i = 0; i < quantity; i++) {
            timestamps.add(currentTime);
        }

        this.rateLimit.updateOne(
            userFilter,
            new Document("$push", new Document("timestamps", new Document("$each", timestamps)))
        );

        return false;
    }

    public void request(String username, String product, int quantity) {
        if (this.products.find(new Document("name", product)).first() == null) {
            System.out.println("Product not found.");
            return;
        }

        Document userRateLimitFilter = new Document("username", username);

        if (requestIsLimited(userRateLimitFilter, quantity)) {
            System.out.println("Rate limit exceeded. Please try again later.");
        } else {
            System.out.println("Request successful.");
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
