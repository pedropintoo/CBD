package pt.tmg.cbd.lab2.ex3.d;

import com.mongodb.client.MongoCollection;
import org.bson.Document;

import java.util.List;
import java.util.Map;

public class RestaurantsDAO {
    private final MongoCollection<Document> mongoCollection;

    public RestaurantsDAO(MongoCollection<Document> mongoCollection) {
        this.mongoCollection = mongoCollection;
    }

    public int countLocalidades() {
        // TODO: Implement
        throw new UnsupportedOperationException();
    }

    public Map<String, Integer> countRestByLocalidade() {
        // TODO: Implement
        throw new UnsupportedOperationException();
    }

    public List<String> getRestWithNameCloserTo(String name) {
        // TODO: Implement
        throw new UnsupportedOperationException();
    }
}
