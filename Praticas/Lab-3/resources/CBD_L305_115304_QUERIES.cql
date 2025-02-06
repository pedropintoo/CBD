use restaurants;

-- 1. Liste todos os documentos da coleção.
SELECT * 
FROM restaurants;

--  localidade | nome           | building | coord                 | gastronomia  | restaurant_id | rua                      | zipcode
-- ------------+----------------+----------+-----------------------+--------------+---------------+--------------------------+---------
--      Queens |       101 Deli |    10016 | [40.58382, -73.82166] | Delicatessen |      40591271 | Rockaway Beach Boulevard |   11694
--      Queens | 111 Restaurant |        0 | [40.64335, -73.78897] |     American |      40884354 |        Central Taxi Hold |   11430
--      Queens |   5 Burro Cafe |     7205 |  [40.71945, -73.8424] |      Mexican |      40390163 |            Austin Street |   11375
-- (3772 rows)

-- 2. Apresente os campos restaurant_id, nome, localidade e gastronomia para todos os documentos da coleção.
SELECT restaurant_id, nome, localidade, gastronomia 
FROM restaurants;

--  restaurant_id | nome           | localidade | gastronomia
-- ---------------+----------------+------------+--------------
--       40591271 |       101 Deli |     Queens | Delicatessen
--       40884354 | 111 Restaurant |     Queens |     American
--       40390163 |   5 Burro Cafe |     Queens |      Mexican
-- (3772 rows)

-- 3. Apresente os campos restaurant_id, nome, localidade e código postal (zipcode), mas exclua o campo _id de todos os documentos da coleção.
SELECT restaurant_id, nome, localidade, zipcode 
FROM restaurants;

--  restaurant_id | nome           | localidade | zipcode
-- ---------------+----------------+------------+---------
--       40591271 |       101 Deli |     Queens |   11694
--       40884354 | 111 Restaurant |     Queens |   11430
--       40390163 |   5 Burro Cafe |     Queens |   11375
-- (3772 rows)

-- 4. Indique o total de restaurantes localizados no Bronx.
SELECT COUNT(*) AS total_restaurantes_bronx
FROM restaurants
WHERE localidade = 'Bronx';

--  total_restaurantes_bronx
-- --------------------------
--                       309

-- 5. Apresente os primeiros 15 restaurantes localizados no Bronx, ordenados por ordem crescente de nome.
SELECT *
FROM restaurants
WHERE localidade = 'Bronx'
ORDER BY nome
LIMIT 15;

--  localidade | nome                                | restaurant_id | building | coord                 | gastronomia                    | rua                | zipcode
-- ------------+-------------------------------------+---------------+----------+-----------------------+--------------------------------+--------------------+---------
--       Bronx |        African Market (Baboon Cafe) |      40368026 |     2300 | [40.85029, -73.87861] |                       American | Southern Boulevard |   10460
--       Bronx |                     African Terrace |      40368021 |     2300 | [40.85029, -73.87861] |                        African | Southern Boulevard |   10460
--       Bronx |                     Al Cholo Bakery |      40424273 |     3825 | [40.88448, -73.86267] |                      Caribbean |  White Plains Road |   10467
--       Bronx |                     Ali'S Roti Shop |      40738028 |     4220 | [40.89399, -73.85672] |                      Caribbean |  White Plains Road |   10466
--       Bronx |                    Ambassador Diner |      40403946 |      730 | [40.81644, -73.89955] |                       American |       Kelly Street |   10455
--       Bronx |                  An Beal Bocht Cafe |      40570634 |      445 | [40.88745, -73.90498] |                       American |   West  238 Street |   10463
--       Bronx |                   Angelica'S Bakery |      40730301 |     4315 |  [40.8992, -73.86765] |                         Bakery |        Katonah Ave |   10470
--       Bronx | Applebee'S Neighborhood Grill & Bar |      40752494 |     2276 | [40.86621, -73.82633] |                       American |      Bartow Avenue |   10475
--       Bronx |                      Aqueduct North |      40379894 |     4277 | [40.89778, -73.86754] |                          Irish |        Katonah Ave |   10470
--       Bronx |                   Archer Sports Bar |      40571081 |     1511 | [40.83817, -73.86363] |                       American |  White Plains Road |   10462
--       Bronx |                             Artie'S |      40515670 |      394 | [40.84964, -73.78707] |                        Italian | City Island Avenue |   10464
--       Bronx |                      Arturo'S Pizza |      40387399 |    5189A |  [40.87455, -73.9104] |                          Pizza |           Broadway |   10463
--       Bronx |                  Artuso Pastry Shop |      40423571 |      670 |   [40.8542, -73.8851] |                        Italian |   East  187 Street |   10458
--       Bronx |           Astral Fitness & Wellness |      40760469 |     5500 | [40.87661, -73.90567] | Juice, Smoothies, Fruit Salads |           Broadway |   10463
--       Bronx |                          Bagel Cafe |      40389011 |     2214 | [40.86894, -73.82328] |                   Delicatessen |         Bartow Ave |   10475

-- 7. Encontre os restaurantes que obtiveram uma ou mais pontuações (score) entre [80 e 100].
SELECT nome
FROM restaurants_grades
WHERE score IN (80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100);

-- 8. Indique os restaurantes com latitude inferior a -95,7.
-- Não é possível fazer uma range query sem nenhuma restrição de partition key.
-- Mas uma solução seria usar allow filtering, mas não é recomendado para grandes datasets.

-- 12. Liste o restaurant_id, o nome, a localidade e a gastronomia dos restaurantes localizados em "Staten Island", "Queens", ou "Brooklyn".
SELECT restaurant_id, nome, localidade, gastronomia
FROM restaurants
WHERE localidade IN ('Staten Island', 'Queens', 'Brooklyn');

--  restaurant_id | nome                                   | localidade | gastronomia
-- ---------------+----------------------------------------+------------+-----------------
--       40804423 | (Lewis Drug Store) Locanda Vini E Olii |   Brooklyn |         Italian
--       40560108 |                 101 Restaurant And Bar |   Brooklyn |         Italian
--       40639261 |  104-01 Foster Avenue Coffee Shop(Ups) |   Brooklyn | Café/Coffee/Tea
-- (1580 rows)

-- 14. Liste o nome e as avaliações dos restaurantes que obtiveram uma avaliação com um grade "A", um score 10 na data "2014-08-11T00: 00: 00Z" (ISODATE).
SELECT nome, grade, score, data
FROM restaurants_grades
WHERE score = 10 AND grade = 'A' AND data = '2014-08-11T00:00:00Z';

--  nome                  | grade | score | data
-- -----------------------+-------+-------+---------------------------------
--     Gene'S Coffee Shop |     A |    10 | 2014-08-11 00:00:00.000000+0000
--           Jojo'S Pizza |     A |    10 | 2014-08-11 00:00:00.000000+0000
--      Mutual Of America |     A |    10 | 2014-08-11 00:00:00.000000+0000
--          Serendipity 3 |     A |    10 | 2014-08-11 00:00:00.000000+0000
--              Udon West |     A |    10 | 2014-08-11 00:00:00.000000+0000
--  Union Cafe Restaurant |     A |    10 | 2014-08-11 00:00:00.000000+0000

-- 15. Liste o restaurant_id, o nome e os score dos restaurantes nos quais a segunda avaliação foi grade "A" e ocorreu em ISODATE "2014-08-11T00: 00: 00Z".
SELECT restaurant_id, nome, score
FROM restaurants_grades_date
WHERE data = '2014-08-11T00:00:00Z' AND grade = 'A'
AND evaluations_number = 2;

--  restaurant_id | nome                      | score
-- ---------------+---------------------------+-------
--       40526406 | Club Macanudo (Cigar Bar) |     9
--       40614916 |        Gene'S Coffee Shop |    10

-- 17. Liste nome, gastronomia e localidade de todos os restaurantes ordenando por ordem crescente da gastronomia e, em segundo, por ordem decrescente de localidade.
-- Não é possível fazer uma range de sorting sem nenhuma restrição de partition key.
-- Mas uma solução seria usar allow filtering, mas não é recomendado para grandes datasets.


-- 19. Indique o número total de avaliações (numGrades) na coleção.
SELECT COUNT(*) AS numGrades
FROM restaurants_grades;


--  numgrades
-- -----------
--      18113

-- 27. Liste o `nome` e o `restaurant_id` de todos os restaurantes que têm exatamente 4 avaliações (`numGrades`).
-- Não é possível fazer uma range query sem nenhuma restrição de partition key.
-- Mas uma solução seria usar allow filtering, mas não é recomendado para grandes datasets.

-- 28. Apresente o número total de restaurantes existentes em cada `localidade` e `gastronomia`.
SELECT localidade, gastronomia, COUNT(*) AS total_restaurantes
FROM restaurants_gastronomia
GROUP BY localidade, gastronomia;

--  localidade    | gastronomia                   | total_restaurantes
-- ---------------+-------------------------------+--------------------
--       Brooklyn |                       English |                  1
--          Bronx |                 Pizza/Italian |                  8
--         Queens | Vietnamese/Cambodian/Malaysia |                  1
--       Brooklyn |                       Seafood |                  3
--  Staten Island |                 Jewish/Kosher |                  1
-- (1185 rows)

-- 29. Apresente o `nome` dos restaurantes que têm um score médio (`avgScore`) superior a 33 e que têm pelo menos 3 avaliações (`numGrades`).
-- Não é possível fazer uma range query sem nenhuma restrição de partition key.
-- Mas uma solução seria usar allow filtering, mas não é recomendado para grandes datasets.

-- 30. Retorne o numero de restaurantes com avaliações que diferem mais de `2 anos` da data da `avaliação mais recente`.
SELECT MAX(data) FROM restaurants_grades_date; -- output: 2010-12-08 00:00:00.000000+0000
-- Não é possível fazer uma range query sem nenhuma restrição de partition key.
-- Mas uma solução seria usar allow filtering, mas não é recomendado para grandes datasets.
