CREATE KEYSPACE IF NOT EXISTS restaurants WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };

USE restaurants;

// Drop existing tables
DROP TABLE IF EXISTS restaurants;
DROP TABLE IF EXISTS restaurants_gastronomia;

DROP TABLE IF EXISTS restaurants_grades;
DROP TABLE IF EXISTS restaurants_grades_date;

CREATE TABLE IF NOT EXISTS restaurants (
    building text,
    latitude double,
    longitude double,
    rua text,
    zipcode text,
    localidade text,
    gastronomia text,
    nome text,
    restaurant_id text,
    PRIMARY KEY (localidade, nome, restaurant_id)
);


CREATE TABLE IF NOT EXISTS restaurants_gastronomia (
    nome text,
    gastronomia text,
    localidade text,
    PRIMARY KEY ((localidade, gastronomia), nome)
);


CREATE TABLE IF NOT EXISTS restaurants_grades (
    nome text,
    data timestamp,
    grade text,
    score int,
    PRIMARY KEY (score, grade, data, nome)
);

CREATE INDEX IF NOT EXISTS ON restaurants_grades (grade);

CREATE TABLE IF NOT EXISTS restaurants_grades_date (
    nome text,
    restaurant_id text,
    data timestamp,
    grade text,
    score int,
    evaluations_number int,
    PRIMARY KEY (data, grade, evaluations_number, restaurant_id, nome)
);
