package pt.tmg.cbd.lab2.ex3;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;
import org.bson.conversions.Bson;

import java.time.Instant;
import java.util.Date;
import java.util.List;

public class Main {
    private static long startTime;
    private MongoClient mongoClient;
    protected MongoDatabase database = null;

    public Main() {
        this.mongoClient = MongoClients.create("mongodb://localhost:27017");
        this.database = this.mongoClient.getDatabase("cbd");
    }

    public void clearAllDocuments(MongoCollection<Document> collection) {
        collection.deleteMany(new Document());
    }

    public MongoDatabase getDatabase() {
        return this.database;
    }

    public void testIndexesTime(MongoCollection<Document> restaurants) {
        
        tic();
        restaurants.find(new Document("localidade", "Manhattan"));
        tac();

        tic();
        restaurants.find(new Document("localidade", "Manhattan").append("gastronomia", "Ice Cream, Gelato, Yogurt, Ices"));
        tac();

        tic();
        restaurants.find(new Document("nome", new Document("$regex", ".*Coffee.*")));
        tac();

    }

    public void tryIndexes(MongoCollection<Document> restaurants) {
        // Remove all indexes
        restaurants.dropIndexes();

        //////////////////////////////////// WITHOUT INDEXES ////////////////////////////////////

        testIndexesTime(restaurants);

        /////////////////////////////////////////////////////////////////////////////////////////

        // Create indexes
        restaurants.createIndex(new Document("localidade", 1));
        restaurants.createIndex(new Document("gastronomia", 1));
        // Text index
        restaurants.createIndex(new Document("nome", "text"));

        System.out.println("Indexes created");
        //////////////////////////////////// WITH INDEXES ////////////////////////////////////

        testIndexesTime(restaurants);

        /////////////////////////////////////////////////////////////////////////////////////////

    }

    public void close() {
        this.mongoClient.close();
    }

    public static void tic() {
        startTime = System.nanoTime();
    }

    public static void tac() {
        long endTime = System.nanoTime();
        long elapsedTime = (endTime - startTime) / 1_000; // Convert to milliseconds
        System.out.println("Elapsed time: " + elapsedTime + " micro seconds");
    }

    // 5. Apresente os primeiros 15 restaurantes localizados no Bronx, ordenados por ordem crescente de nome.
    public void ex5(MongoCollection<Document> restaurants) {
        Bson filter = new Document("localidade", "Bronx");
        Bson projection = new Document("_id", 0).append("nome", 1);
        Bson sort = new Document("nome", 1);
        restaurants.find(filter).projection(projection).sort(sort).limit(15).forEach(document -> System.out.println(document.toJson()));    
    }

    // 10. Liste o restaurant_id, o nome, a localidade e gastronomia dos restaurantes cujo nome começam por "Wil".
    public void ex10(MongoCollection<Document> restaurants) {
        Bson filter = new Document("nome", new Document("$regex", "^Wil").append("$options", "i"));
        Bson projection = new Document("_id", 0).append("restaurant_id", 1).append("nome", 1).append("localidade", 1).append("gastronomia", 1);
        restaurants.find(filter).projection(projection).forEach(document -> System.out.println(document.toJson()));
    }

    // 15. Liste o restaurant_id, o nome e os score dos restaurantes nos quais a segunda avaliação foi grade "A" e ocorreu em ISODATE "2014-08-11T00: 00: 00Z".
    public void ex15(MongoCollection<Document> restaurants) {
        Bson filter = new Document("grades.1.grade", "A").append("grades.1.date", Date.from(Instant.parse("2014-08-11T00:00:00Z")));
        Bson projection = new Document("_id", 0).append("restaurant_id", 1).append("nome", 1).append("grades", 1);
        restaurants.find(filter).projection(projection).forEach(document -> System.out.println(document.toJson()));
    }

    // 20. Apresente o nome e número de avaliações (numGrades) dos 3 restaurante com mais avaliações.
    public void ex20(MongoCollection<Document> restaurants) {
        Bson projection = new Document("$project", new Document("_id", 0).append("nome", 1).append("numGrades", new Document("$size", "$grades")));
        Bson sort = new Document("$sort", new Document("numGrades", -1));
        Bson limit = new Document("$limit", 3);
        restaurants.aggregate(List.of(
            projection,
            sort,
            limit
        )).forEach(document -> System.out.println(document.toJson()));
    }

    // 25. Apresente o nome e o score médio (avgScore) e número de avaliações (numGrades) dos restaurantes com score médio superior a 30 desde 1-Jan-2014.
    public void ex25(MongoCollection<Document> restaurants) {
        Bson unwind = new Document("$unwind", "$grades");
        Bson match1 = new Document("$match", new Document("grades.date", new Document("$gte", Date.from(Instant.parse("2014-01-01T00:00:00Z")))));
        Bson group = new Document("$group", new Document("_id", "$_id").append("nome", new Document("$first", "$nome")).append("avgScore", new Document("$avg", "$grades.score")).append("numGrades", new Document("$sum", 1)));
        Bson match2 = new Document("$match", new Document("avgScore", new Document("$gt", 30)));
        Bson project = new Document("$project", new Document("nome", 1).append("avgScore", 1).append("numGrades", 1));
        restaurants.aggregate(List.of(
            unwind,
            match1,
            group,
            match2,
            project
        )).forEach(document -> System.out.println(document.toJson()));
    }

    public static void main(String[] args) {

        Main mongoDB = new Main();
        
        MongoCollection<Document> restaurants = mongoDB.getDatabase().getCollection("restaurants");
        
        mongoDB.tryIndexes(restaurants);

        System.out.println("Ex5 ---");
        mongoDB.ex5(restaurants);

        System.out.println("Ex10 ---");
        mongoDB.ex10(restaurants);

        System.out.println("Ex15 ---");
        mongoDB.ex15(restaurants);

        System.out.println("Ex20 ---");
        mongoDB.ex20(restaurants);

        System.out.println("Ex25 ---");
        mongoDB.ex25(restaurants);

        mongoDB.close();
        // 
    }
}