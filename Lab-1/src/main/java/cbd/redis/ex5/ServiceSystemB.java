package cbd.redis.ex5;
import redis.clients.jedis.Jedis;

import java.util.Scanner;
import java.util.Set;

public class ServiceSystemB {
    public static String PRODUCTS_KEY = "products";
    private static String RATE_LIMIT_PREFIX = "rate_limit:";

    private Jedis jedis;
    private int limit;
    private int timeslot; // in seconds
    
    public ServiceSystemB(int limit, int timeslot) {
        this.jedis = new Jedis("localhost", 6379);
        this.limit = limit;
        this.timeslot = timeslot;
        this.jedis.del(PRODUCTS_KEY);
    }

    public void addProduct(String prod) {
        this.jedis.sadd(PRODUCTS_KEY, prod);
    }

    public Set<String> getAllProducts() {
        return this.jedis.smembers(PRODUCTS_KEY);
    }

    public boolean requestIsLimited(String key, int quantity) {
        if (this.jedis.setnx(key, String.valueOf(this.limit)) == 1) {
            this.jedis.expire(key, this.timeslot);
        }
        String retValue = this.jedis.get(key); 

        if (retValue != null && Integer.valueOf(retValue) >= quantity) {
            this.jedis.decrBy(key, quantity);
            return false;
        }
        return true;
    }

    public void request(String username, String product, int quantity) {
        if (!this.jedis.sismember(PRODUCTS_KEY, product)) {
            System.out.println("Product not found!");
            return;
        }
        
        String key = RATE_LIMIT_PREFIX + username;
        if (requestIsLimited(key, quantity)) {
            System.out.printf("Rate limit reached. [wait for %s seconds, currently available: %s]\n", this.jedis.ttl(key), this.jedis.get(key));
        } else {
            System.out.printf("Acquired! [%s/%d]\n", this.jedis.get(key), this.limit);
        }
    }

    public void close() {
        this.jedis.close();
    }

    public static void main(String[] args) {
        // 5 request per minute
        ServiceSystemB serviceSystemB = new ServiceSystemB(5, 60);
        
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
    
    }
}
