package cbd.redis.ex3;

import redis.clients.jedis.Jedis;

public class Forum {
    public static void main(String[] args) {
        Jedis jedis = new Jedis();
        System.out.println(jedis.ping());
        System.out.println(jedis.info());

        // more commands
        jedis.set("name", "John Doe");
        System.out.println(jedis.get("name"));

        jedis.zadd("ranking", 100, "Alice");
        jedis.zadd("ranking", 200, "Bob");
        jedis.zadd("ranking", 300, "Charlie");

        System.out.println(jedis.zrange("ranking", 0, -1));

        jedis.close();
    }
}