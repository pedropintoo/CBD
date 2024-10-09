package cbd.redis.ex6;
import redis.clients.jedis.Jedis;

import java.util.Scanner;

public class MessageSystem {
    private String USERS_KEY = "users";
    private String MESSAGES_PREFIX = "messages:";
    private String FOLLOWING_PREFIX = "following:"; // following:<user>
    private String BLOCKED_PREFIX = "blocked:"; // blocked:<user>

    private Jedis jedis;
    private Scanner stdIn;
    private String username;

    public MessageSystem() {
        this.jedis = new Jedis("localhost", 6379);
        this.stdIn = new Scanner(System.in);
        loginUsername();
    }

    public void loginUsername() {
        this.username = getAnswer("Username: ");
        if (this.jedis.sismember(USERS_KEY, this.username)) {
            System.out.println("Welcome back, " + this.username + "!");
        } else {
            this.jedis.sadd(USERS_KEY, this.username);
            System.out.println("Welcome, " + this.username + "!");
        }
    }

    public String getAnswer(String quest) {
        System.out.print(quest);
        String option = this.stdIn.nextLine();
        System.out.println(); // Empty line
        return option;
    }

    public void storeMsg(String message) {
        this.jedis.lpush(MESSAGES_PREFIX + this.username, message);
        System.out.println("Message stored!");
    }

    public void followUser(String user) {
        if (!this.jedis.sismember(USERS_KEY, user)) {
            System.out.println("User does not exist!");
            return;
        }
        this.jedis.sadd(FOLLOWING_PREFIX + this.username, user);
        System.out.println("You are now following " + user + "!");
    }

    public void fetchMessages(String user) {
        if (!this.jedis.sismember(USERS_KEY, user)) {
            System.out.println("User does not exist!");
            return;
        }
        if (this.jedis.sismember(BLOCKED_PREFIX + user, this.username)) {
            System.out.println("You are blocked by " + user + "!");
            return;
        }
        if (!this.jedis.sismember(FOLLOWING_PREFIX + this.username, user)) {
            System.out.println("You are not following " + user + "!");
            return;
        }
        System.out.println("Messages from " + user + ":");
        System.out.println("--------------------");
        this.jedis.lrange(MESSAGES_PREFIX + user, 0, -1).forEach(System.out::println);
        System.out.println("--------------------");
    }

    public void blockUser(String user) {
        if (!this.jedis.sismember(USERS_KEY, user)) {
            System.out.println("User does not exist!");
            return;
        }
        this.jedis.sadd(BLOCKED_PREFIX + this.username, user);
        System.out.println("You have blocked " + user + "!");
    }

    public boolean showMenu() {
        System.out.println();
        System.out.println("1. Write a message");
        System.out.println("2. Follow a user");
        System.out.println("3. Fetch a followed user's messages");
        System.out.println("4. Block a user");
        System.out.println("5. Exit");
        String option = getAnswer("Choose an option: ");
        String user;
        switch (option) {
            case "1":
                String message = getAnswer("Enter a message: ");
                storeMsg(message);
                break;
            case "2":
                user = getAnswer("Enter a user: ");
                followUser(user);
                break;
            case "3":
                user = getAnswer("Enter a user: ");
                fetchMessages(user);
                break;
            case "4":
                user = getAnswer("Enter a user: ");
                blockUser(user);
                break;
            case "5":
                System.out.println("Goodbye!");
                return false; // exit
            default:
                System.out.println("Invalid option!");
                break;
        }
        return true;
    }

    public void close() {
        this.jedis.close();
        this.stdIn.close();
    }

    public static void main(String[] args) {
        MessageSystem messageSystem = new MessageSystem();
        while (messageSystem.showMenu()) {

        }
        messageSystem.close();
    }
}
