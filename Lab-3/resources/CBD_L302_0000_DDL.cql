CREATE KEYSPACE IF NOT EXISTS cbd_videos WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };

use cbd_videos;

// drop all
-- DROP TABLE IF EXISTS users;
-- DROP TABLE IF EXISTS videos;
-- DROP TABLE IF EXISTS shares_video;
-- DROP TABLE IF EXISTS tags_video;
-- DROP TABLE IF EXISTS comments_author;
-- DROP TABLE IF EXISTS comments_video;
-- DROP TABLE IF EXISTS video_followers;
-- DROP TABLE IF EXISTS events;
-- DROP TABLE IF EXISTS video_rating;


CREATE TABLE IF NOT EXISTS users (
    username text,
    name text,
    email text,
    registration_date timestamp,
    PRIMARY KEY (username, registration_date)
);

CREATE TABLE IF NOT EXISTS videos (
    video_name text,
    description text,
    tag set<text>,
    PRIMARY KEY (video_name, description)
) WITH CLUSTERING ORDER BY (description ASC);

CREATE TABLE IF NOT EXISTS shares_video (
    author text,
    video_name text,
    share_date timestamp,
    PRIMARY KEY (author, share_date)
);

CREATE TABLE IF NOT EXISTS tags_video (
    tag text,
    video_name text,
    PRIMARY KEY (tag)
);

CREATE TABLE IF NOT EXISTS comments_author (
    author text,
    video_name text,
    content text,
    comment_date timestamp,
    PRIMARY KEY (author, comment_date)
) WITH CLUSTERING ORDER BY (comment_date DESC);

CREATE TABLE IF NOT EXISTS comments_video (
    video_name text,
    author text,
    content text,
    comment_date timestamp,
    PRIMARY KEY (video_name, comment_date)
) WITH CLUSTERING ORDER BY (comment_date DESC);

CREATE TABLE IF NOT EXISTS video_followers (
    video_name text,
    follower text,
    PRIMARY KEY (video_name)
);

CREATE TABLE IF NOT EXISTS events (
    video_name text,
    username text,
    event_type text,
    video_moment int,
    event_date timestamp,
    PRIMARY KEY (username, video_name, event_date)
);

CREATE TABLE IF NOT EXISTS video_rating (
    rating_id uuid,
    video_name text,
    rating int,
    PRIMARY KEY (video_name, rating)
);




