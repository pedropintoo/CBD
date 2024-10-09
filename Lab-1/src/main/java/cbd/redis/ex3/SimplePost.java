package cbd.redis.ex3;

import java.util.List;
import java.util.Set;
import java.util.UUID;
import java.util.Map;

import redis.clients.jedis.Jedis;
 
public class SimplePost {
	private final String USERS_KEY_LIST = "users_list";
    private final String USERS_KEY_HASHMAP = "users_map";

	private Jedis jedis;
	
	public SimplePost() {
		this.jedis = new Jedis("localhost", 6379);
		jedis.del(USERS_KEY_LIST); 
        jedis.del(USERS_KEY_HASHMAP);
	}

	public void saveUser(String username) {
		jedis.lpush(USERS_KEY_LIST, username);
		jedis.hset(USERS_KEY_HASHMAP, "user:" + UUID.randomUUID(), username);
	}

	public List<String> getUserList() {
		return jedis.lrange(USERS_KEY_LIST, 0, -1);
	}

	public Map<String, String> getUserMap() {
		return jedis.hgetAll(USERS_KEY_HASHMAP);
	}
	
	public Set<String> getAllKeys() {
		return jedis.keys("*");
	}
	
	public void close() {
		jedis.close();
	}
	
	public static void main(String[] args) {
		SimplePost board = new SimplePost();
		// set some users
		String[] users = { "Ana", "Pedro", "Maria", "Luis" };
		for (String user: users) 
			board.saveUser(user);

		board.getAllKeys().stream().forEach(System.out::println);
		board.getUserList().stream().forEach(System.out::println);
		board.getUserMap().forEach((k, v) -> System.out.printf("[%s] - %s\n", k, v));
		
		board.close();
	}
}



