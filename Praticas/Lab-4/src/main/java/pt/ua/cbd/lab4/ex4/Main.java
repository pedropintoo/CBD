package pt.ua.cbd.lab4.ex4;

import org.neo4j.driver.AuthTokens;
import org.neo4j.driver.Driver;
import org.neo4j.driver.GraphDatabase;
import org.neo4j.driver.Result;
import org.neo4j.driver.Session;

public class Main {

    public static void main(String... args) {
        Neo4jDatabase db = new Neo4jDatabase("neo4j://localhost:7687", "neo4j", "password");
        db.clearData();
        db.loadCSVData();
        db.queryData();
        db.close();
    }
}

class Neo4jDatabase {
    private final Driver driver;

    public Neo4jDatabase(String uri, String user, String password) {
        driver = GraphDatabase.driver(uri, AuthTokens.basic(user, password));
    }

    public void clearData() {
        try (Session session = driver.session()) {
            session.run("MATCH (n) DETACH DELETE n");
        }
    }

    public void loadCSVData() {
        try (Session session = driver.session()) {
            session.run("LOAD CSV WITH HEADERS FROM 'file:///resources/space_launches.csv' AS row " +
                        "MERGE (c:Company {name: row.Company}) " +
                        "MERGE (m:Mission {name: row.Mission, status: row.MissionStatus}) " +
                        "MERGE (rocket:Rocket {name: row.Rocket, status: row.RocketStatus, price: coalesce(toFloat(row.Price), 0)}) " +
                        "MERGE (c)-[r:STARTS]->(m) " +
                        "MERGE (m)-[l:LAUNCHES {date: row.Date, time: coalesce(row.Time, '00:00:00'), location: row.Location}]->(rocket)");
        }
    }

    public void queryData() {
        Result result = null;
        try (Session session = driver.session()) {

            // 1. List all companies that have launched a mission
            System.out.println("\n1. Companies that have launched a mission: ");
            result = session.run("MATCH (c:Company)-[r:STARTS]->(m:Mission) " +
                                 "RETURN distinct c.name");
            result.list().stream().limit(5).forEach(record -> System.out.println(record.values().get(0)));
            System.out.println("...");

            // 2. Rockets with more than 50 launches
            System.out.println("\n2. Rockets more than 50 launches: ");
            result = session.run("MATCH ()-[l:LAUNCHES]->(rocket:Rocket)" +
                                 "WITH rocket, count(l) as launches " +
                                 "WHERE launches > 50 " +
                                 "RETURN rocket.name");
            result.list().stream().limit(5).forEach(record -> System.out.println(record.values().get(0)));
            System.out.println("...");
            
            // 3. Rocket more expensive (order by price)
            System.out.println("\n3. Rocket more expensive: ");
            result = session.run("MATCH (rocket:Rocket) " +
                                 "RETURN rocket.name, rocket.price " +
                                 "ORDER BY rocket.price DESC");
            result.list().stream().limit(5).forEach(record -> System.out.println(record.values().get(0) + " - " + record.values().get(1)));
            System.out.println("...");

            // 4. Number of launches per company (order by number of launches)
            System.out.println("\n4. Number of launches per company: ");
            result = session.run("MATCH (c:Company)-[r:STARTS]->(m:Mission)-[l:LAUNCHES]->(rocket:Rocket) " +
                                 "RETURN c.name, count(l) as launches " +
                                 "ORDER BY launches DESC");
            result.list().stream().limit(5).forEach(record -> System.out.println(record.values().get(0) + " - " + record.values().get(1)));
            System.out.println("...");

            // 5. Company with more missions failed (order by number of missions failed)
            System.out.println("\n5. Company with more missions failed: ");
            result = session.run("MATCH (c:Company)-[r:STARTS]->(m:Mission {status: 'Failure'}) " +
                                 "RETURN c.name, count(m) as failedMissions " +
                                 "ORDER BY failedMissions DESC");
            result.list().stream().limit(5).forEach(record -> System.out.println(record.values().get(0) + " - " + record.values().get(1)));
            System.out.println("...");

            // 6. Most common location for launches (order by number of launches)
            System.out.println("\n6. Most common location for launches: ");
            result = session.run("MATCH ()-[l:LAUNCHES]->(rocket:Rocket) " +
                                 "RETURN l.location, count(l) as launches " +
                                 "ORDER BY launches DESC");
            result.list().stream().limit(5).forEach(record -> System.out.println(record.values().get(0) + " - " + record.values().get(1)));
            System.out.println("...");

            // 7. Distance between US Air Force and NASA (distance is the shortest path between nodes in the graph)
            System.out.println("\n7. Distance between US Air Force and NASA: ");
            result = session.run("MATCH (us:Company {name: 'US Air Force'}), (nasa:Company {name: 'NASA'}), p = shortestPath((us)-[*]-(nasa)) " +
                                 "RETURN length(p) as distance");
            result.list().forEach(record -> System.out.println(record.values().get(0)));

            // 8. Number of missions launched by year in SpaceX vs NASA
            System.out.println("\n8. Number of missions launched by year in SpaceX vs NASA: ");
            result = session.run("MATCH (c:Company)-[r:STARTS]->(m:Mission)-[l:LAUNCHES]->(rocket:Rocket) " +
                                 "WHERE c.name IN ['NASA', 'SpaceX'] " +
                                 "RETURN c.name, toInteger(split(l.date, '-')[0]) as year, count(l) as launches " +
                                 "ORDER BY c.name, year");
            result.list().forEach(record -> System.out.println(record.values().get(0) + " - " + record.values().get(1) + " - " + record.values().get(2)));

            // 9. Pairs of companies that launched the same rocket
            System.out.println("\n9. Pairs of companies that launched the same rocket: ");
            result = session.run("MATCH (c1:Company)-[r1:STARTS]->(m:Mission)-[l:LAUNCHES]->(rocket:Rocket)<-[l2:LAUNCHES]-(m2:Mission)<-[r2:STARTS]-(c2:Company) " +
                                 "WHERE id(c1) < id(c2) " +
                                 "RETURN c1.name, c2.name, rocket.name");
            result.list().stream().limit(5).forEach(record -> System.out.println(record.values().get(0) + " - " + record.values().get(1) + " - " + record.values().get(2)));
            System.out.println("...");

            // 10. Failed missions by location (order by number of failed missions)
            System.out.println("\n10. Failed missions by location: ");
            result = session.run("MATCH (m:Mission {status: \"Failure\"})-[l:LAUNCHES]->() " +
                                 "RETURN l.location, count(l) as failedMissions " +
                                 "ORDER BY failedMissions DESC");
            result.list().stream().limit(5).forEach(record -> System.out.println(record.values().get(0) + " - " + record.values().get(1)));
            System.out.println("...");

        }
    }

    public void close() {
        driver.close();
    }
}