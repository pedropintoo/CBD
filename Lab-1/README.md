## Redis with docker

### Pull redis image
```bash
docker pull redis:7
```

### Run redis in background
```bash
docker run -d --name redis-server -p 6379:6379 redis:7
```

For next runs, you can start the container with the following command:
```bash
docker start redis-server
```

### Connect to redis
```bash
docker exec -it redis-server redis-cli
```

### Enter the redis container
```bash
docker exec -it redis-server /bin/bash
```

To find `.rediscli_history` file, you can use the following command:
```bash
ll /root
```

Or, to copy automatically to your local machine:
```bash
docker cp redis-server:/root/.rediscli_history CBD-11-115304.txt
```


### Execute redis-cli with args
```bash
docker exec -i redis-server redis-cli < CBD-12-batch.txt
```

## Package the code
```bash
mvn package
```

## Run the code
```bash
mvn exec:java -Dexec.mainClass="cbd.redis.ex4.AutoCompleteA" -Dexec.args="nomes-pt-2021.csv"
```

## See monitor in redis
```bash
docker exec -it redis-server redis-cli MONITOR
```