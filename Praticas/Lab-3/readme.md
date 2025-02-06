# CBD Lab 3

Sample workspace for completing the CBD Lab 3.

This workspace provides a docker-compose file to an instance of Cassandra, and it's companions, in a dockerized enviromnment.

The [resources folder](resources) is automatically mounted to `/resources` in the container.
It contains some assets required to complete the Lab.

## Docker

Start the cassandra server
`docker compose up -d`

Open `cqlsh` on the container:
`docker exec -it lab-3-cassandra-1 cqlsh`

Destroy the cassandra server
`docker compose down -v`

To execute the provided CQL scripts, use the following commands:

```sh
docker exec -it lab-3-cassandra-1 cqlsh -f /resources/CBD_L302_115304_DDL.cql
docker exec -it lab-3-cassandra-1 cqlsh -f /resources/CBD_L302_115304_SEEDDATA.cql
```

## Java

This project uses Maven Wrapper.

Compile
`./mvnw package`

Clean: **Important** Execute the clean-up before 
`./mvnw clean`

## Additional Notes

* Make sure you have previously installed [Docker Desktop](https://docs.docker.com/desktop/), or at least Docker Engine.
* [Official Docker Compose tutorial](https://docs.docker.com/compose/gettingstarted/)
