package cbd.redis.ex4;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.params.ZRangeParams;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
import java.util.UUID;

public class AutoCompleteB {
    public static String RESOURCES_PATH = "./src/main/resources/";
    private final String NAMES_KEY = "names";
    private final String TEMP_FILTER_NAMES = "names:filter";
    private final String TEMP_INTERSECTION_NAMES = "names:intersection";
    private final String REGISTRATIONS_KEY = "registrations";
    private final String CVS_DELIMITER = ";";
    private final int NAME_INDEX = 0;
    private final int REGISTRATIONS_INDEX = 1;

	private Jedis jedis;

    public AutoCompleteB() {
        this.jedis = new Jedis("localhost", 6379);
        this.jedis.del(NAMES_KEY);
        this.jedis.del(REGISTRATIONS_KEY);
    }

    private void searchPrefix(String prefix) {
        // temporary keys must be unique! due to simultaneous requests
        String filter_key = TEMP_FILTER_NAMES+":"+UUID.randomUUID();
        String intersection_key = TEMP_INTERSECTION_NAMES+":"+UUID.randomUUID();

        try {
            // filter by name
            this.jedis.zrangestore(filter_key, NAMES_KEY, ZRangeParams.zrangeByLexParams("[" + prefix, "[" + prefix + Character.MAX_VALUE));
            // intersect with score's set
            this.jedis.zinterstore(intersection_key, new String[] {filter_key, REGISTRATIONS_KEY});

            this.jedis.zrevrange(intersection_key, 0, -1).forEach((name) -> System.out.printf("[%d] %s\n", this.jedis.zscore(REGISTRATIONS_KEY, name).intValue(), name));

        } finally {
            this.jedis.del(new String[] {filter_key, intersection_key});
        }
    }

    private void insertUsersRegistrations(Scanner fNames) {
        String line = null;
        String name = null;
        double registrations;
        while (fNames.hasNextLine()) {
            line = fNames.nextLine();
            name = line.split(CVS_DELIMITER)[NAME_INDEX];
            registrations = Double.parseDouble(line.split(CVS_DELIMITER)[REGISTRATIONS_INDEX]);
            this.jedis.zadd(REGISTRATIONS_KEY, registrations, name);
            this.jedis.zadd(NAMES_KEY, 0, name);
        }
    }

    private void close() {
        this.jedis.close();
    }

    public static void main(String[] args) throws FileNotFoundException {
        AutoCompleteB autoCompleteB = new AutoCompleteB();

        Scanner fNames = new Scanner(new File(RESOURCES_PATH + "nomes-pt-2021.csv"));
        autoCompleteB.insertUsersRegistrations(fNames);
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
            autoCompleteB.searchPrefix(input);
            System.out.println();
        }
        
        sc.close();

        autoCompleteB.close();
    }
}

