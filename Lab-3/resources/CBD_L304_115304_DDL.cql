CREATE KEYSPACE IF NOT EXISTS football_stats WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };

USE football_stats;

// Drop existing tables
DROP TABLE IF EXISTS teams;
DROP TABLE IF EXISTS players;
DROP TABLE IF EXISTS matches;
DROP TABLE IF EXISTS stadiums;

CREATE TABLE IF NOT EXISTS teams (
    team_name text,
    players set<text>,
    coach text,
    PRIMARY KEY (team_name)
);

CREATE TABLE IF NOT EXISTS players (
    player_name text,
    team_name text,
    position text,
    stats map<text, int>,
    PRIMARY KEY (player_name)
);

CREATE INDEX IF NOT EXISTS ON players (team_name);

CREATE TABLE IF NOT EXISTS matches (
    home_team_name text,
    away_team_name text,
    stadium_name text,
    attendance int,
    events list<text>,
    PRIMARY KEY ((home_team_name, away_team_name))
);

CREATE INDEX IF NOT EXISTS ON matches (home_team_name);
CREATE INDEX IF NOT EXISTS ON matches (away_team_name);
CREATE INDEX IF NOT EXISTS ON matches (stadium_name);

CREATE TABLE IF NOT EXISTS stadiums (
    stadium_name text,
    capacity int,
    PRIMARY KEY (stadium_name, capacity)
);


-- !IMPORTANT: a change in docker compose file is required to enable UDF & UDA

-- Create UDF & UDA, for counting the number of yellow cards received by a player
CREATE OR REPLACE FUNCTION yellow_cards_received(events list<text>, player_name text)
    RETURNS NULL ON NULL INPUT
    RETURNS int
    LANGUAGE java AS '
        if (events == null || player_name == null) return 0;

        int count = 0;
        String keyword = "yellow card to " + player_name.toLowerCase();

        for (String event : events) {
            if (event != null && event.toLowerCase().contains(keyword)) {
                count++;
            }
        }
        return count;
    ';

CREATE OR REPLACE FUNCTION sum_yellow_cards_received(current int, additional int)
    RETURNS NULL ON NULL INPUT
    RETURNS int
    LANGUAGE java AS '
        if (current == 0) return additional;
        if (additional == 0) return current;
        return current + additional;
    ';

CREATE OR REPLACE AGGREGATE total_yellow_cards_received(int)
    SFUNC sum_yellow_cards_received
    STYPE int
    INITCOND 0; -- starts the aggregation with 0

    

