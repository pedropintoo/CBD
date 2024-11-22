package pt.ua.cbd.lab3.ex5;

import com.datastax.oss.driver.api.core.CqlSession;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.BufferedReader;
import java.io.FileReader;

public class InsertData {
    public static void main(String[] args) {
        // Path to the JSON file
        String filePath = "./resources/restaurants.json";

        // Criar o mapeador JSON
        ObjectMapper mapper = new ObjectMapper();

        try (CqlSession session = CqlSession.builder().build();
             BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            session.execute("USE restaurants");

            String line;
            int count = 0;
            while ((line = br.readLine()) != null) {
                System.out.println("Inserindo documento " + ++count);
                // Ler cada linha como um documento JSON
                JsonNode node = mapper.readTree(line);

                // Extrair os campos do JSON
                JsonNode addressNode = node.get("address");
                String building = addressNode != null ? addressNode.get("building").asText() : null;
                Double latitude = addressNode != null ? addressNode.get("coord").get(1).asDouble() : null;
                Double longitude = addressNode != null ? addressNode.get("coord").get(0).asDouble() : null;
                String rua = addressNode != null ? addressNode.get("rua").asText() : null;
                String zipcode = addressNode != null ? addressNode.get("zipcode").asText() : null;

                String localidade = node.get("localidade").asText();
                String gastronomia = node.get("gastronomia").asText();
                String nome = node.get("nome").asText();
                String restaurantId = node.get("restaurant_id").asText();

                // Inserir na tabela `restaurants`
                session.execute(
                    "INSERT INTO restaurants (building, latitude, longitude, rua, zipcode, localidade, gastronomia, nome, restaurant_id) " +
                            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)",
                    building, latitude, longitude, rua, zipcode, localidade, gastronomia, nome, restaurantId
                );

                // Inserir na tabela `restaurants_gastronomia`
                session.execute(
                    "INSERT INTO restaurants_gastronomia (nome, gastronomia, localidade) VALUES (?, ?, ?)",
                    nome, gastronomia, localidade
                );

                // Processar as notas (grades)
                JsonNode grades = node.get("grades");
                if (grades != null) {
                    for (JsonNode gradeNode : grades) {
                        long date = gradeNode.get("date").get("$date").asLong();
                        String grade = gradeNode.get("grade").asText();
                        int score = gradeNode.get("score").asInt();

                        // Inserir na tabela `restaurants_grades`
                        session.execute(
                            "INSERT INTO restaurants_grades (nome, data, grade, score) VALUES (?, ?, ?, ?)",
                            nome, date, grade, score
                        );
                    }

                    // Inserir na tabela `restaurants_grades_date`
                    int evaluations_number = 1;
                    for (JsonNode gradeNode : grades) {
                        long date = gradeNode.get("date").get("$date").asLong();
                        String grade = gradeNode.get("grade").asText();
                        int score = gradeNode.get("score").asInt();
                        
                        session.execute(
                            "INSERT INTO restaurants_grades_date (nome, restaurant_id, data, grade, score, evaluations_number) VALUES (?, ?, ?, ?, ?, ?)",
                            nome, restaurantId, date, grade, score, evaluations_number++
                        );
                    }
                }
            }

            System.out.println("Inserção concluída com sucesso!");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}