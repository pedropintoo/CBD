# CBD Lab 2

Sample workspace for completing the CBD Lab 2.

This workspace provides a docker-compose file to run the MongoDB server, and it's companions, in a dockerized enviromnment.

The [resources folder](resources) is automatically mounted to `/resources` in the MongoDB container.
It contains some assets required to complete the Lab.

Docker compose creation and start:
```bash
docker compose up -d
```

Open `mongosh` on the container:
```bash
docker compose exec -it mongodb mongosh --db cbd
```

Import restaurants: 
```bash
docker compose exec -it mongodb mongoimport --db cbd --collection restaurants --drop --file /resources/restaurants.json
```

## Run commands

Try running the following commands in the `mongosh` shell:

```bash
use cbd
db.restaurants.find()
```

Finding the nearest restaurant to a given location:
```bash
db.restaurants.createIndex({ "address.coord": "2dsphere" });  // Create a 2dsphere index
db.restaurants.find({ "address.coord": { $near: { $geometry: { type: "Point", coordinates: [40.6385227, 8.6515333] }, $maxDistance: 8000000 } } }); 
```