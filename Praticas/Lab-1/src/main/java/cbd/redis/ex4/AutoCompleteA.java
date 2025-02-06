package cbd.redis.ex4;
import redis.clients.jedis.Jedis;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class AutoCompleteA {
    public static String RESOURCES_PATH = "./src/main/resources/";
    private final String NAMES_KEY = "names";

	private Jedis jedis;

    public AutoCompleteA() {
        this.jedis = new Jedis("localhost", 6379);
        this.jedis.del(NAMES_KEY);
    }

    private void searchPrefix(String prefix) {
        this.jedis.zrangeByLex(NAMES_KEY, "[" + prefix, "[" + prefix + Character.MAX_VALUE).forEach(System.out::println); // Character.MAX_VALUE or \uFFFF
    }

    private void insertUsers(Scanner fNames) {
        while (fNames.hasNextLine()) {
            this.jedis.zadd(NAMES_KEY, 0, fNames.nextLine());
        }
    }

    private void close() {
        this.jedis.close();
    }

    public static void main(String[] args) throws FileNotFoundException {
        AutoCompleteA autoCompleteA = new AutoCompleteA();

        Scanner fNames = new Scanner(new File(RESOURCES_PATH + "names.txt"));
        autoCompleteA.insertUsers(fNames);
        fNames.close();

        Scanner sc = new Scanner(System.in);
        String input;
        while (true) {
            System.out.print("Search for ('Enter' for quit): ");
            input = sc.nextLine();
            if (input.isEmpty()) {
                break;
            }
            
            System.out.println();
            autoCompleteA.searchPrefix(input);
            System.out.println();
        }
        
        sc.close();

        autoCompleteA.close();
    }
}