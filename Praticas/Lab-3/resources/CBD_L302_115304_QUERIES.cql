// 7. Permitir a pesquisa de todos os videos de determinado autor;
SELECT JSON *
FROM shares_video
WHERE author = 'maria1987'
ORDER BY share_date DESC;

-- {"author": "maria1987", "share_date": "2017-08-30 17:00:00.000Z", "video_name": "Science Experiments"}
-- {"author": "maria1987", "share_date": "2017-08-25 15:15:00.000Z", "video_name": "Cooking with Chef John"}
-- {"author": "maria1987", "share_date": "2017-08-19 13:45:00.000Z", "video_name": "Funny Cats Compilation"}
-- {"author": "maria1987", "share_date": "2017-08-12 11:30:00.000Z", "video_name": "Yoga for Beginners"}
-- {"author": "maria1987", "share_date": "2017-08-05 10:00:00.000Z", "video_name": "Travel Vlog: Japan"}

// 8. Permitir a pesquisa de comentarios por utilizador, ordenado inversamente pela data;
SELECT JSON *
FROM comments_author
WHERE author = 'dmiller'
ORDER BY comment_date DESC;

-- {"author": "dmiller", "comment_date": "2022-01-09 16:35:00.000Z", "content": "Great workout plan.", "video_name": "Workout Routine"}
-- {"author": "dmiller", "comment_date": "2022-01-04 13:50:00.000Z", "content": "Delicious recipes.", "video_name": "Cooking with Chef John"}

// 9. Permitir a pesquisa de comentarios por videos, ordenado inversamente pela data;
SELECT JSON *
FROM comments_video
WHERE video_name = 'Travel Vlog: Japan'
ORDER BY comment_date DESC;

-- {"video_name": "Travel Vlog: Japan", "comment_date": "2022-01-21 11:30:00.000Z", "author": "asmith", "content": "Love the scenery."}
-- {"video_name": "Travel Vlog: Japan", "comment_date": "2022-01-20 10:00:00.000Z", "author": "jdoe", "content": "Amazing vlog!"}
-- {"video_name": "Travel Vlog: Japan", "comment_date": "2022-01-07 09:30:00.000Z", "author": "cliu", "content": "Makes me want to visit Japan!"}

// 10. Permitir a pesquisa do rating medio de um video e quantas vezes foi votado;
SELECT JSON AVG(rating) AS avg_rating, COUNT(rating) AS votes
FROM video_rating
WHERE video_name = 'Space Exploration';

-- {"avg_rating": 2, "votes": 3}

// 1. Os ultimos 3 comentarios introduzidos para um video;
SELECT JSON content
FROM comments_video
WHERE video_name = 'Travel Vlog: Japan'
ORDER BY comment_date DESC
LIMIT 3;

-- {"content": "Love the scenery."}
-- {"content": "Amazing vlog!"}
-- {"content": "Makes me want to visit Japan!"}

// 2. Lista das tags de determinado video;
SELECT JSON tag
FROM videos
WHERE video_name = 'Travel Vlog: Japan';

-- {"tag": ["Japan", "adventure", "culture", "travel", "vlog"]}

// 3. Todos os videos com a tag Aveiro;
SELECT JSON video_name
FROM tags_video
WHERE tag = 'Aveiro';

-- {"video_name": "Learn Guitar"}
-- {"video_name": "Space Exploration"}

// 4.a. Os últimos 5 eventos de determinado vídeo realizados por um utilizador;
SELECT JSON video_name, event_type
FROM events
WHERE username = 'asmith' AND video_name = 'Cooking with Chef John'
ORDER BY event_date DESC
LIMIT 5;

-- {"video_name": "Cooking with Chef John", "event_type": "play"}
-- {"video_name": "Cooking with Chef John", "event_type": "stop"}
-- {"video_name": "Cooking with Chef John", "event_type": "play"}
-- {"video_name": "Cooking with Chef John", "event_type": "pause"}
-- {"video_name": "Cooking with Chef John", "event_type": "play"}

// 4.b. Todos os eventos de determinado utilizador;
SELECT JSON *
FROM events
WHERE username = 'asmith'

-- {"username": "asmith", "video_name": "Cooking with Chef John", "event_date": "2022-01-10 09:00:00.000Z", "event_type": "play", "video_moment": 0}
-- {"username": "asmith", "video_name": "Cooking with Chef John", "event_date": "2022-01-10 09:05:00.000Z", "event_type": "pause", "video_moment": 100}
-- {"username": "asmith", "video_name": "Cooking with Chef John", "event_date": "2022-01-10 09:10:00.000Z", "event_type": "play", "video_moment": 100}
-- {"username": "asmith", "video_name": "Cooking with Chef John", "event_date": "2022-01-10 09:15:00.000Z", "event_type": "pause", "video_moment": 200}
-- {"username": "asmith", "video_name": "Cooking with Chef John", "event_date": "2022-01-10 09:20:00.000Z", "event_type": "play", "video_moment": 200}
-- {"username": "asmith", "video_name": "Cooking with Chef John", "event_date": "2022-01-10 09:25:00.000Z", "event_type": "stop", "video_moment": 300}
-- {"username": "asmith", "video_name": "Cooking with Chef John", "event_date": "2022-01-11 10:00:00.000Z", "event_type": "play", "video_moment": 0}
-- {"username": "asmith", "video_name": "Yoga for Beginners", "event_date": "2022-01-03 15:00:00.000Z", "event_type": "play", "video_moment": 0}
-- {"username": "asmith", "video_name": "Yoga for Beginners", "event_date": "2022-01-03 15:10:00.000Z", "event_type": "stop", "video_moment": 600}

// 4.c. Todos os eventos de determinado utilizador to tipo "pause"
SELECT JSON * 
FROM events 
WHERE username = 'asmith' 
      AND event_type = 'pause';

-- {"username": "asmith", "video_name": "Cooking with Chef John", "event_date": "2022-01-10 09:05:00.000Z", "event_type": "pause", "video_moment": 100}
-- {"username": "asmith", "video_name": "Cooking with Chef John", "event_date": "2022-01-10 09:15:00.000Z", "event_type": "pause", "video_moment": 200}

// 5. Videos partilhados por determinado utilizador (maria1987, por exemplo) num determinado periodo de tempo (Agosto de 2017, por exemplo);
SELECT JSON *
FROM shares_video
WHERE author = 'maria1987' 
      AND share_date >= '2017-08-01' AND share_date <= '2017-08-20';

-- {"author": "maria1987", "share_date": "2017-08-05 10:00:00.000Z", "video_name": "Travel Vlog: Japan"}
-- {"author": "maria1987", "share_date": "2017-08-12 11:30:00.000Z", "video_name": "Yoga for Beginners"}
-- {"author": "maria1987", "share_date": "2017-08-19 13:45:00.000Z", "video_name": "Funny Cats Compilation"}

// 6. Os ultimos 10 videos, ordenado inversamente pela data da partilhada;

-- No contexto de cassandra esta query não é possível de ser realizada, 
-- na minha tabela tenho como partition key o author, ou seja, 
-- não consigo ordenar por data de partilha sem introduzir um author na query.

-- Sem partition key nunca é possível ordenar por uma coluna.


// 7. Todos os seguidores (followers) de determinado video;
SELECT JSON follower
FROM video_followers
WHERE video_name = 'Space Exploration';

-- {"follower": "nmartin"}
-- {"follower": "qrussell"}

// 8. Todos os comentarios (dos videos) que determinado utilizador esta a seguir (following);

-- Para realizar esta query, foi necessário criar uma tabela auxiliar que armazena
--  os comentários dos vídeos que os utilizadores estão a seguir.
-- A tabela auxiliar evita a necessidade de realizar JOINs, que não são suportados pelo Cassandra.
-- Mas aumenta a complexidade da aplicação, pois é necessário garantir que a tabela auxiliar está sempre atualizada.

-- Isto aumenta o tempo de inserção e atualização de dados, mas diminui o tempo de leitura.
-- Dependendo do modelo de negócio, deve-se ponderar a não utilização de tabelas auxiliares.

SELECT video_name, author, content
FROM comments_following
WHERE follower = 'asmith';

--  video_name             | author | content
-- ------------------------+--------+--------------------------------
--  Funny Cats Compilation | asmith |           Can’t stop laughing.
--  Funny Cats Compilation |   jdoe |               Hilarious video!
--      Yoga for Beginners | asmith |    Great introduction to yoga.
--      Yoga for Beginners | asmith | Feeling more flexible already!

// 9. Os 5 videos com maior rating;

-- No contexto de cassandra esta query não é possível de ser realizada,
-- pois não conseguimos fazer uma query que avalie todas as partições.

-- Temos obrigatoriamente de ter um partition key para fazer uma query.

// 10. Uma query que retorne todos os videos e que mostre claramente a forma pela qual estao ordenados;
SELECT JSON *
FROM shares_video;

-- A tabela shares_video tem como partition key author e dentro
-- de cada partição está ordenada pela data de partilha. 

-- Conseguimos ver isso no user `maria1987` que partilhou 5 videos em Agosto de 2017
-- e estão ordenados pela data de partilha. Os outros como têem apenas 1 video partilhado
-- não conseguimos ver a ordenação dentro da partição.


--  author    | share_date                      | video_name
-- -----------+---------------------------------+-----------------------------------
-- ...
--       cliu | 2022-01-05 09:20:00.000000+0000 |                Travel Vlog: Japan
--     tyoung | 2022-02-06 12:15:00.000000+0000 |                   Stand-up Comedy
--    snguyen | 2022-02-05 10:20:00.000000+0000 |                      Learn Guitar
--     asmith | 2022-01-03 14:00:00.000000+0000 |                Yoga for Beginners
--  pmartinez | 2022-02-03 15:30:00.000000+0000 |             Basketball Highlights
--    gthomas | 2022-01-09 17:50:00.000000+0000 |             Music Video: The Beat
--   qrussell | 2022-02-04 17:45:00.000000+0000 |                 Space Exploration
--  maria1987 | 2017-08-30 17:00:00.000000+0000 |               Science Experiments
--  maria1987 | 2017-08-25 15:15:00.000000+0000 |            Cooking with Chef John
--  maria1987 | 2017-08-19 13:45:00.000000+0000 |            Funny Cats Compilation
--  maria1987 | 2017-08-12 11:30:00.000000+0000 |                Yoga for Beginners
--  maria1987 | 2017-08-05 10:00:00.000000+0000 |                Travel Vlog: Japan
-- ...

// 11. Lista com as Tags existentes e o numero de videos catalogados com cada uma delas;
SELECT JSON tag, COUNT(video_name) AS videos
FROM tags_video
GROUP BY tag;

-- {"tag": "meditation", "videos": 1}
-- {"tag": "history", "videos": 1}
-- {"tag": "movies", "videos": 1}
-- {"tag": "space", "videos": 1}
-- {"tag": "tech", "videos": 1}
-- {"tag": "cats", "videos": 1}
-- {"tag": "Aveiro", "videos": 2}
-- {"tag": "music", "videos": 2}
-- {"tag": "science", "videos": 1}
-- {"tag": "travel", "videos": 1}
-- {"tag": "yoga", "videos": 1}
-- {"tag": "comedy", "videos": 2}
-- {"tag": "gaming", "videos": 1}
-- {"tag": "DIY", "videos": 1}
-- {"tag": "fitness", "videos": 1}
-- {"tag": "sports", "videos": 1}
-- {"tag": "art", "videos": 1}
-- {"tag": "animals", "videos": 1}
-- {"tag": "cooking", "videos": 1}

// 12. Quantas 'views' tem cada video;
SELECT video_name, COUNT(*) AS total_views
FROM video_views
GROUP BY video_name;

--  video_name                  | total_views
-- -----------------------------+-------------
--           Travel Vlog: Japan |           1
--          Science Experiments |           1
--               DIY Home Decor |           1
--  Gaming Highlights: Fortnite |           1
--       Funny Cats Compilation |           3
--         Top 10 Action Movies |           1
--           Yoga for Beginners |           1
--       Cooking with Chef John |           1


// 13. Quantos utilizadores diferentes deram 'dislike' em um ou mais videos;
SELECT disliker, COUNT(*) AS total_dislikes
FROM video_dislikes
GROUP BY disliker;

--  disliker | total_dislikes
-- ----------+----------------
--      Nina |              1
--   Mallory |              1
--     Kevin |              1
--      Paul |              1
--     Laura |              1
--    Rachel |              1
--    Oliver |              1
--    Quincy |              1
--       Sam |              1
--     Tracy |              2

// 14. Todos os videos que um determinado utilizador deu 'dislike', ordenados pela data do 'dislike';
SELECT video_name, dislike_date
FROM video_dislikes
WHERE disliker = 'Tracy'
ORDER BY dislike_date DESC;

--  video_name                  | dislike_date
-- -----------------------------+---------------------------------
--       Funny Cats Compilation | 2024-11-20 08:30:00.000000+0000
--  Gaming Highlights: Fortnite | 2024-11-10 08:30:00.000000+0000

