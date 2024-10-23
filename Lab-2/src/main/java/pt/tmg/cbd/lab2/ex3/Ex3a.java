package pt.tmg.cbd.lab2.ex3;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

import org.bson.Document;
import org.bson.conversions.Bson;

import java.util.List;

public class Ex3a {

    private MongoClient mongoClient;
    protected MongoDatabase database = null;

    public Ex3a() {
        this.mongoClient = MongoClients.create("mongodb://localhost:27017");
        this.database = this.mongoClient.getDatabase("cbd");
    }

    public void insertDocuments(MongoCollection<Document> collection, List<Document> documents) {
        collection.insertMany(documents);
    }

    public void updateCity(MongoCollection<Document> collection, String name, String newCity) {
        Bson filter = new Document("name", name);
        Bson update = new Document("$set", new Document("city", newCity));
        collection.updateOne(filter, update);
    }

    public void findByAge(MongoCollection<Document> collection, int age) {
        Bson filter = new Document("age", age); // {"age": age}
        collection.find(filter).forEach(document -> {
            System.out.println(document.toJson());
        });
    }

    public void clearAllDocuments(MongoCollection<Document> collection) {
        collection.deleteMany(new Document());
    }

    public MongoDatabase getDatabase() {
        return this.database;
    }

    public void close() {
        this.mongoClient.close();
    }

    public static void main(String[] args) {

        Ex3a ex3a = new Ex3a();
        
        MongoCollection<Document> collection = ex3a.getDatabase().getCollection("ex3a");
        
        ex3a.clearAllDocuments(collection);

        // Insert many documents
        ex3a.insertDocuments(collection, List.of(
            new Document("name", "John Doe").append("age", 30).append("city", "Lisbon"),
            new Document("name", "Kyle Doe").append("age", 25).append("city", "Porto"),
            new Document("name", "Alice Doe").append("age", 35).append("city", "Faro"),
            new Document("name", "Bob Doe").append("age", 40).append("city", "Coimbra"),
            new Document("name", "Charlie Doe").append("age", 30).append("city", "Aveiro")
        ));
        
        ex3a.updateCity(collection, "Charlie Doe", "Amoreira");

        ex3a.findByAge(collection, 30);

        ex3a.close();
        // 
    }
}