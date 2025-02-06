use football_stats;

-- 5 UPDATE queries

UPDATE teams
SET players = players + {'Cristiano Ronaldo'}
WHERE team_name = 'Real Madrid';

UPDATE teams
SET players = players - {'Cristiano Ronaldo'}
WHERE team_name = 'Juventus';

UPDATE teams
SET players = players - {'Mohamed Salah'}
WHERE team_name = 'Liverpool';

UPDATE players
SET stats = stats + {'goals': 0}
WHERE player_name = 'Lionel Messi';

UPDATE players
SET team_name = 'Real Madrid'
WHERE player_name = 'Cristiano Ronaldo';

UPDATE matches
SET events = events + ['Goal by Lionel Messi at 90']
WHERE home_team_name = 'FC Barcelona' AND away_team_name = 'Real Madrid';

-- 5 DELETE queries

DELETE players['Harry Maguire']
FROM teams
WHERE team_name = 'Manchester United';

DELETE players['Marcus Rashford']
FROM teams
WHERE team_name = 'Manchester United';

DELETE stats['assists']
FROM players
WHERE player_name = 'Lionel Messi';

DELETE FROM matches
WHERE home_team_name = 'Paris Saint-Germain' 
      AND away_team_name = 'Manchester City';

DELETE FROM stadiums
WHERE stadium_name = 'Old Trafford';


-- Criação de 10 queries expressivas do seu domínio de conhecimento da cláusula 
-- SELECT:  
-- • use WHERE, ORDER BY, LIMIT, etc.

-- 10 SELECT queries

-- 1. Listar o número de cartões amarelos recebidos por um jogador
SELECT total_yellow_cards_received(yellow_cards_received(events, 'Lionel Messi')) AS total_yellow_cards 
FROM matches ;

--  total_yellow_cards
-- --------------------
--                   2

--- 2. Num conjunto des estadios, listar os que tem capacidade maior que 80000
SELECT stadium_name, capacity
FROM stadiums
WHERE stadium_name IN ('Old Trafford', 'Santiago Bernabéu', 'Camp Nou', 'Anfield', 'Allianz Arena', 'Signal Iduna Park', 'San Siro')
  AND capacity > 80000;



--- 3. Golos de todos os jogadores
SELECT player_name, stats['goals']
FROM players;

--  player_name        | stats['goals']
-- --------------------+----------------
--       Kylian Mbappé |             27
--       Mohamed Salah |             22
--       Harry Maguire |              2
--  Robert Lewandowski |             41
--         Luis Suárez |             21
--  Zlatan Ibrahimović |             15
--      Erling Haaland |             27
--   Cristiano Ronaldo |             29
--     Kevin De Bruyne |              6
--        Sergio Ramos |              4
--         NGolo Kanté |              2
--        Lionel Messi |              0

--- 4. Eventos ocorridos em jogos fora de casa
SELECT home_team_name, away_team_name, stadium_name, events
FROM matches
WHERE away_team_name = 'Bayern Munich';

--  home_team_name    | away_team_name | stadium_name   | events
-- -------------------+----------------+----------------+-------------------------------------------------------------------------------------------------------------
--    Manchester City |  Bayern Munich | Etihad Stadium |                                       ['Goal by Kevin De Bruyne at 15', 'Goal by Robert Lewandowski at 60']
--  Manchester United |  Bayern Munich |   Old Trafford | ['Goal by Robert Lewandowski at 10', 'Goal by Marcus Rashford at 30', 'Yellow card to Harry Maguire at 45']

--- 5. Um jogo em casa
SELECT home_team_name, away_team_name, stadium_name, events
FROM matches
WHERE home_team_name = 'Manchester United'
LIMIT 1;

--  home_team_name    | away_team_name | stadium_name | events
-- -------------------+----------------+--------------+-----------------------------------------------------------------------
--  Manchester United |      Liverpool | Old Trafford | ['Goal by Mohamed Salah at 23', 'Yellow card to Harry Maguire at 45']


--- 6. Jogos acontecidos num determinado estádio
SELECT home_team_name, away_team_name
FROM matches
WHERE stadium_name = 'Old Trafford';

--  home_team_name    | away_team_name
-- -------------------+----------------
--  Manchester United |      Liverpool
--  Manchester United |  Bayern Munich

--̣- 7. Posicoes dos jogadores de uma equipe
SELECT player_name, stats, position
FROM players
WHERE team_name = 'Real Madrid';

--  player_name       | stats                                      | position
-- -------------------+--------------------------------------------+----------
--  Cristiano Ronaldo | {'assists': 3, 'goals': 29, 'matches': 33} |  Forward
--       Sergio Ramos |  {'assists': 1, 'goals': 4, 'matches': 21} | Defender

--- 8. Número de `attendance` em jogos que ocorreram no estádio `Old Trafford` 
SELECT attendance FROM matches WHERE stadium_name='Old Trafford';

--  attendance
-- ------------
--       74000
--       74879

--- 9. Estatisticas de jogadores de uma equipe
SELECT player_name, stats 
FROM players 
WHERE team_name='Real Madrid';

--  player_name       | stats
-- -------------------+--------------------------------------------
--  Cristiano Ronaldo | {'assists': 3, 'goals': 29, 'matches': 33}
--       Sergio Ramos |  {'assists': 1, 'goals': 4, 'matches': 21}

--- 10. Assistências de jogadores  de uma equipe
SELECT player_name, stats['assists'] AS assists
FROM players
WHERE team_name = 'Real Madrid';

--  player_name       | assists
-- -------------------+---------
--  Cristiano Ronaldo |       3
--       Sergio Ramos |       1

