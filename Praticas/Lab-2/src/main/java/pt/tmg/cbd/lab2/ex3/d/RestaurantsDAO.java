package pt.tmg.cbd.lab2.ex3.d;

import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import org.bson.Document;
import org.bson.conversions.Bson;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class RestaurantsDAO {
    private final MongoCollection<Document> mongoCollection;

    public RestaurantsDAO(MongoCollection<Document> mongoCollection) {
        this.mongoCollection = mongoCollection;
    }

    public int countLocalidades() {
        Bson group = new Document("$group", new Document("_id", "$localidade"));
        Bson count = new Document("$count", "numLocalidades");
        List<Document> results = this.mongoCollection.aggregate(List.of(
            group, 
            count
        )).into(new ArrayList<Document>());

        return results.get(0).getInteger("numLocalidades");
    }

    public Map<String, Integer> countRestByLocalidade() {
        Bson group = new Document("$group", new Document("_id", "$localidade").append("count", new Document("$sum", 1)));
        
        List<Document> aggregationDocuments = this.mongoCollection.aggregate(List.of(
            group
        )).into(new ArrayList<Document>());
        
        return aggregationDocuments.stream().collect(
            Collectors.toMap(
                document -> document.getString("_id"),
                document -> document.getInteger("count")
            )
        );
    }

    public List<String> getRestWithNameCloserTo(String name) {
        Bson filter = new Document("nome", new Document("$regex", ".*" + name + ".*"));
        List<Document> documents = this.mongoCollection.find(filter).into(new ArrayList<Document>());
        return documents.stream().map(document -> document.getString("nome")).collect(Collectors.toList());
    }

    public static void main(String[] args) {
        MongoCollection<Document> restaurantes = MongoClients.create("mongodb://localhost:27017").getDatabase("cbd").getCollection("restaurants");
        RestaurantsDAO restaurantsDAO = new RestaurantsDAO(restaurantes);
        System.out.println("======== Exercicio d ========");
        
        System.out.println("- Metodo countLocalidades()");
        System.out.print("Numero de localidades distintas: ");
        System.out.println(restaurantsDAO.countLocalidades());
        
        System.out.println("- Metodo countRestByLocalidade()");
        System.out.println("Numero de restaurantes por localidade:");
        restaurantsDAO.countRestByLocalidade().forEach(
            (localidade, count) -> System.out.println(" -> " + localidade + " - " + count)
        );
        
        System.out.println("- getRestWithNameCloserTo()");
        System.out.println("Nome de restaurantes contendo 'Park' no nome:");
        restaurantsDAO.getRestWithNameCloserTo("Park").forEach(
            name -> System.out.println(" -> " + name)
        );
        
        System.out.println("=============================");


    }
}
