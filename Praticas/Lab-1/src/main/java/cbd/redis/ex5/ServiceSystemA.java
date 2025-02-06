package cbd.redis.ex5;
import redis.clients.jedis.Jedis;

import java.util.Scanner;
import java.util.Set;

public class ServiceSystemA {
    public static String PRODUCTS_KEY = "products";
    private static String RATE_LIMIT_PREFIX = "rate_limit:";

    private Jedis jedis;
    private final int limit;
    private final int timeslot; // in seconds
    
    public ServiceSystemA(int limit, int timeslot) {
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

    public void request(String username, String product) {
        if (!this.jedis.sismember(PRODUCTS_KEY, product)) {
            System.out.println("Product not found!");
            return;
        }
        
        String key = RATE_LIMIT_PREFIX + username;
        if (requestIsLimited(key, 1)) {
            System.out.printf("Rate limit reached. [wait for %s seconds]\n", this.jedis.ttl(key));
        } else {
            System.out.printf("Acquired! [%s/%d]\n", this.jedis.get(key), this.limit);
        }
    }

    public void close() {
        this.jedis.close();
    }

    public static void main(String[] args) {
        // 5 request per minute
        ServiceSystemA serviceSystemA = new ServiceSystemA(5, 60);
        
        for (int i = 0; i < 10; i++) {
            serviceSystemA.addProduct("prod-"+i);
        }
        System.out.print("Products: ");
        serviceSystemA.getAllProducts().forEach((id) -> System.out.print(" "+id+","));
            
        Scanner sc = new Scanner(System.in);
        System.out.print("\n\nUsername: ");
        String username = sc.nextLine();
        String product;
        while (true) {
            System.out.print("Acquire a product ('Enter' for quit): ");
            product = sc.nextLine();
            if (product.isEmpty()) {
                break;
            }

            serviceSystemA.request(username, product);
            System.out.println();
        }
        
        sc.close();

        serviceSystemA.close();
    
    }
}
