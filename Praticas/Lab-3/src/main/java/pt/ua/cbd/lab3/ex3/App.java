package pt.ua.cbd.lab3.ex3;

import java.time.Instant;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import com.datastax.oss.driver.api.core.CqlSession;
import com.datastax.oss.driver.api.core.cql.ResultSet;
import com.datastax.oss.driver.api.core.cql.Row;

public class App {

    private static CqlSession session;

    public static void main(String[] args) {
        connect();
        insertData();
        updateData();
        queryData();
        
        String query;
        ResultSet result;


        // Query 2
        System.out.println("\n--- Query 2 ---");
        query = "SELECT tag FROM videos WHERE video_name = 'Travel Vlog: Japan'";
        result = session.execute(query);
        for (Row row : result) {
            Set<String> tags = row.getSet("tag", String.class);
            System.out.println(tags);
        }

        // Query 4a
        System.out.println("\n--- Query 4a ---");
        query = "SELECT video_name, event_type FROM events WHERE username = 'asmith' AND video_name = 'Cooking with Chef John' ORDER BY event_date DESC LIMIT 5";
        result = session.execute(query);
        for (Row row : result) {
            System.out.println(row.getString("video_name") + " - " + row.getString("event_type"));
        }

        // Query 8
        System.out.println("\n--- Query 8 ---");
        query = "SELECT video_name, author, content FROM comments_following WHERE follower = 'asmith'";
        result = session.execute(query);
        for (Row row : result) {
            System.out.println(row.getString("video_name") + " - " + row.getString("author") + " - " + row.getString("content"));
        }

        // Query 11
        System.out.println("\n--- Query 11 ---");
        query = "SELECT tag, COUNT(video_name) AS videos FROM tags_video GROUP BY tag";
        result = session.execute(query);
        for (Row row : result) {
            System.out.println(row.getString("tag") + " - " + row.getLong("videos"));
        }

        close();
    }

    private static void connect() {
        session = CqlSession.builder().build();
        session.execute("use cbd_videos");
        System.out.println("Connected to Cassandra");
    }

    private static void insertData() {
        // Insert a new user
        String insertUserCQL = "INSERT INTO users (username, name, email, registration_date) VALUES (?, ?, ?, ?)";
        session.execute(insertUserCQL, "testuser", "Test User", "testuser@example.com", Instant.now());

        // Insert a new video
        String insertVideoCQL = "INSERT INTO videos (video_name, description, tag) VALUES (?, ?, ?)";
        Set<String> tags = new HashSet<>(Arrays.asList("test", "sample"));
        session.execute(insertVideoCQL, "Test Video", "A test video description.", tags);

        System.out.println("Data inserted successfully");
    }

    private static void updateData() {
        // Update the user's email
        String updateUserCQL = "UPDATE users SET email = ? WHERE username = ? AND registration_date = ?";
        session.execute(updateUserCQL, "newemail@example.com", "testuser", Instant.now());

        System.out.println("Data updated successfully");
    }

    private static void queryData() {
        // Query user data
        String queryUserCQL = "SELECT * FROM users WHERE username = ?";
        var userResult = session.execute(queryUserCQL, "testuser").one();
        System.out.println("User Data:");
        System.out.println("Username: " + userResult.getString("username"));
        System.out.println("Name: " + userResult.getString("name"));
        System.out.println("Email: " + userResult.getString("email"));
        System.out.println("Registration Date: " + userResult.getInstant("registration_date"));

        // Query all tags
        String queryTagsCQL = "SELECT * FROM videos";
        ResultSet tagsResult = session.execute(queryTagsCQL);
        System.out.println("Tags:");
        for (Row row : tagsResult) {
            System.out.println(row.getSet("tag", String.class));
        }
    }

    private static void close() {
        // Close the session
        session.close();
        System.out.println("Connection closed");
    }


}