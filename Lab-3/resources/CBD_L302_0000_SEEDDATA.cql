use cbd_videos;

-- Insert in table user
INSERT INTO users (username, name, email, registration_date) VALUES ('jdoe', 'John Doe', 'jdoe@example.com', '2022-01-01 10:00:00');
INSERT INTO users (username, name, email, registration_date) VALUES ('asmith', 'Alice Smith', 'asmith@example.com', '2022-01-02 11:30:00');
INSERT INTO users (username, name, email, registration_date) VALUES ('bjones', 'Bob Jones', 'bjones@example.com', '2022-01-03 14:45:00');
INSERT INTO users (username, name, email, registration_date) VALUES ('cliu', 'Catherine Liu', 'cliu@example.com', '2022-01-04 09:15:00');
INSERT INTO users (username, name, email, registration_date) VALUES ('dmiller', 'David Miller', 'dmiller@example.com', '2022-01-05 12:00:00');
INSERT INTO users (username, name, email, registration_date) VALUES ('eroberts', 'Emily Roberts', 'eroberts@example.com', '2022-01-06 13:20:00');
INSERT INTO users (username, name, email, registration_date) VALUES ('fwilson', 'Frank Wilson', 'fwilson@example.com', '2022-01-07 15:50:00');
INSERT INTO users (username, name, email, registration_date) VALUES ('gthomas', 'Grace Thomas', 'gthomas@example.com', '2022-01-08 08:30:00');
INSERT INTO users (username, name, email, registration_date) VALUES ('hking', 'Henry King', 'hking@example.com', '2022-01-09 10:10:00');
INSERT INTO users (username, name, email, registration_date) VALUES ('ijackson', 'Irene Jackson', 'ijackson@example.com', '2022-01-10 11:40:00');
INSERT INTO users (username, name, email, registration_date) VALUES ('jlewis', 'James Lewis', 'jlewis@example.com', '2022-01-11 13:05:00');
INSERT INTO users (username, name, email, registration_date) VALUES ('kclark', 'Karen Clark', 'kclark@example.com', '2022-01-12 14:30:00');
INSERT INTO users (username, name, email, registration_date) VALUES ('lwalker', 'Larry Walker', 'lwalker@example.com', '2022-01-13 16:20:00');
INSERT INTO users (username, name, email, registration_date) VALUES ('mbrown', 'Maria Brown', 'mbrown@example.com', '2022-01-14 09:55:00');
INSERT INTO users (username, name, email, registration_date) VALUES ('nmartin', 'Nathan Martin', 'nmartin@example.com', '2022-01-15 11:15:00');
INSERT INTO users (username, name, email, registration_date) VALUES ('owhite', 'Olivia White', 'owhite@example.com', '2022-02-01 09:00:00');
INSERT INTO users (username, name, email, registration_date) VALUES ('pmartinez', 'Paul Martinez', 'pmartinez@example.com', '2022-02-02 10:30:00');
INSERT INTO users (username, name, email, registration_date) VALUES ('qrussell', 'Quincy Russell', 'qrussell@example.com', '2022-02-03 12:45:00');
INSERT INTO users (username, name, email, registration_date) VALUES ('snguyen', 'Sophia Nguyen', 'snguyen@example.com', '2022-02-04 08:15:00');
INSERT INTO users (username, name, email, registration_date) VALUES ('tyoung', 'Tyler Young', 'tyoung@example.com', '2022-02-05 11:00:00');
INSERT INTO users (username, name, email, registration_date) VALUES ('maria1987', 'Maria Fernandez', 'maria1987@example.com', '2017-07-20 09:00:00');

-- Insert in table video

INSERT INTO videos (video_name, description, tag) VALUES ('Funny Cats Compilation', 'A compilation of funny cat videos.', {'cats', 'funny', 'animals'});
INSERT INTO videos (video_name, description, tag) VALUES ('Cooking with Chef John', 'Learn to cook delicious meals with Chef John.', {'cooking', 'food', 'tutorial'});
INSERT INTO videos (video_name, description, tag) VALUES ('Travel Vlog: Japan', 'Exploring the sights and sounds of Japan.', {'travel', 'vlog', 'Japan'});
INSERT INTO videos (video_name, description, tag) VALUES ('Top 10 Action Movies', 'A countdown of the top 10 action movies.', {'movies', 'top10', 'action'});
INSERT INTO videos (video_name, description, tag) VALUES ('Yoga for Beginners', 'A gentle introduction to yoga.', {'yoga', 'fitness', 'health'});
INSERT INTO videos (video_name, description, tag) VALUES ('Gaming Highlights: Fortnite', 'Best moments from Fortnite gameplay.', {'gaming', 'Fortnite', 'highlights'});
INSERT INTO videos (video_name, description, tag) VALUES ('DIY Home Decor', 'Create your own home decorations.', {'DIY', 'home', 'decor'});
INSERT INTO videos (video_name, description, tag) VALUES ('Science Experiments', 'Fun and educational science experiments.', {'science', 'education', 'experiments'});
INSERT INTO videos (video_name, description, tag) VALUES ('Music Video: The Beat', 'Official music video for The Beat.', {'music', 'video', 'official'});
INSERT INTO videos (video_name, description, tag) VALUES ('Comedy Skits', 'A collection of hilarious comedy skits.', {'comedy', 'funny', 'skits'});
INSERT INTO videos (video_name, description, tag) VALUES ('Art Tutorial: Painting', 'Learn to paint landscapes.', {'art', 'painting', 'tutorial'});
INSERT INTO videos (video_name, description, tag) VALUES ('History Documentary: Ancient Rome', 'An in-depth look at Ancient Rome.', {'history', 'documentary', 'Rome'});
INSERT INTO videos (video_name, description, tag) VALUES ('Tech Reviews: Smartphones', 'Reviews of the latest smartphones.', {'tech', 'reviews', 'smartphones'});
INSERT INTO videos (video_name, description, tag) VALUES ('Workout Routine', 'Full-body workout routine.', {'fitness', 'workout', 'health'});
INSERT INTO videos (video_name, description, tag) VALUES ('Animal Documentary: Wildlife', 'Exploring wildlife around the world.', {'animals', 'documentary', 'wildlife'});
INSERT INTO videos (video_name, description, tag) VALUES ('Meditation Guide', 'A complete guide to meditation for beginners.', {'meditation', 'mindfulness', 'health'});
INSERT INTO videos (video_name, description, tag) VALUES ('Basketball Highlights', 'Top plays from last nights game.', {'sports', 'basketball', 'highlights'});
INSERT INTO videos (video_name, description, tag) VALUES ('Space Exploration', 'A journey through the cosmos.', {'space', 'science', 'documentary'});
INSERT INTO videos (video_name, description, tag) VALUES ('Learn Guitar', 'Basics of playing the guitar.', {'music', 'guitar', 'tutorial'});
INSERT INTO videos (video_name, description, tag) VALUES ('Stand-up Comedy', 'An hour of stand-up comedy routines.', {'comedy', 'standup', 'entertainment'});
INSERT INTO videos (video_name, description, tag) VALUES ('Travel Vlog: Japan', 'Exploring the sights and sounds of Japan.', {'travel', 'vlog', 'Japan', 'adventure', 'culture'});

-- Insert in shares_video

INSERT INTO shares_video (author, video_name, share_date) VALUES ('jdoe', 'Funny Cats Compilation', '2022-01-02 12:00:00');
INSERT INTO shares_video (author, video_name, share_date) VALUES ('asmith', 'Yoga for Beginners', '2022-01-03 14:00:00');
INSERT INTO shares_video (author, video_name, share_date) VALUES ('bjones', 'Gaming Highlights: Fortnite', '2022-01-04 16:30:00');
INSERT INTO shares_video (author, video_name, share_date) VALUES ('cliu', 'Travel Vlog: Japan', '2022-01-05 09:20:00');
INSERT INTO shares_video (author, video_name, share_date) VALUES ('dmiller', 'Top 10 Action Movies', '2022-01-06 11:45:00');
INSERT INTO shares_video (author, video_name, share_date) VALUES ('eroberts', 'Cooking with Chef John', '2022-01-07 13:10:00');
INSERT INTO shares_video (author, video_name, share_date) VALUES ('fwilson', 'Science Experiments', '2022-01-08 15:35:00');
INSERT INTO shares_video (author, video_name, share_date) VALUES ('gthomas', 'Music Video: The Beat', '2022-01-09 17:50:00');
INSERT INTO shares_video (author, video_name, share_date) VALUES ('hking', 'DIY Home Decor', '2022-01-10 08:25:00');
INSERT INTO shares_video (author, video_name, share_date) VALUES ('ijackson', 'Art Tutorial: Painting', '2022-01-11 10:40:00');
INSERT INTO shares_video (author, video_name, share_date) VALUES ('jlewis', 'Comedy Skits', '2022-01-12 12:55:00');
INSERT INTO shares_video (author, video_name, share_date) VALUES ('kclark', 'History Documentary: Ancient Rome', '2022-01-13 14:10:00');
INSERT INTO shares_video (author, video_name, share_date) VALUES ('lwalker', 'Tech Reviews: Smartphones', '2022-01-14 16:25:00');
INSERT INTO shares_video (author, video_name, share_date) VALUES ('mbrown', 'Workout Routine', '2022-01-15 18:40:00');
INSERT INTO shares_video (author, video_name, share_date) VALUES ('nmartin', 'Animal Documentary: Wildlife', '2022-01-16 09:55:00');
INSERT INTO shares_video (author, video_name, share_date) VALUES ('owhite', 'Meditation Guide', '2022-02-02 13:00:00');
INSERT INTO shares_video (author, video_name, share_date) VALUES ('pmartinez', 'Basketball Highlights', '2022-02-03 15:30:00');
INSERT INTO shares_video (author, video_name, share_date) VALUES ('qrussell', 'Space Exploration', '2022-02-04 17:45:00');
INSERT INTO shares_video (author, video_name, share_date) VALUES ('snguyen', 'Learn Guitar', '2022-02-05 10:20:00');
INSERT INTO shares_video (author, video_name, share_date) VALUES ('tyoung', 'Stand-up Comedy', '2022-02-06 12:15:00');
INSERT INTO shares_video (author, video_name, share_date) VALUES ('maria1987', 'Travel Vlog: Japan', '2017-08-05 10:00:00');
INSERT INTO shares_video (author, video_name, share_date) VALUES ('maria1987', 'Yoga for Beginners', '2017-08-12 11:30:00');
INSERT INTO shares_video (author, video_name, share_date) VALUES ('maria1987', 'Funny Cats Compilation', '2017-08-19 13:45:00');
INSERT INTO shares_video (author, video_name, share_date) VALUES ('maria1987', 'Cooking with Chef John', '2017-08-25 15:15:00');
INSERT INTO shares_video (author, video_name, share_date) VALUES ('maria1987', 'Science Experiments', '2017-08-30 17:00:00');

-- Insert tags_video

INSERT INTO tags_video (tag, video_name) VALUES ('cats', 'Funny Cats Compilation');
INSERT INTO tags_video (tag, video_name) VALUES ('cooking', 'Cooking with Chef John');
INSERT INTO tags_video (tag, video_name) VALUES ('travel', 'Travel Vlog: Japan');
INSERT INTO tags_video (tag, video_name) VALUES ('movies', 'Top 10 Action Movies');
INSERT INTO tags_video (tag, video_name) VALUES ('yoga', 'Yoga for Beginners');
INSERT INTO tags_video (tag, video_name) VALUES ('gaming', 'Gaming Highlights: Fortnite');
INSERT INTO tags_video (tag, video_name) VALUES ('DIY', 'DIY Home Decor');
INSERT INTO tags_video (tag, video_name) VALUES ('science', 'Science Experiments');
INSERT INTO tags_video (tag, video_name) VALUES ('music', 'Music Video: The Beat');
INSERT INTO tags_video (tag, video_name) VALUES ('comedy', 'Comedy Skits');
INSERT INTO tags_video (tag, video_name) VALUES ('art', 'Art Tutorial: Painting');
INSERT INTO tags_video (tag, video_name) VALUES ('history', 'History Documentary: Ancient Rome');
INSERT INTO tags_video (tag, video_name) VALUES ('tech', 'Tech Reviews: Smartphones');
INSERT INTO tags_video (tag, video_name) VALUES ('fitness', 'Workout Routine');
INSERT INTO tags_video (tag, video_name) VALUES ('animals', 'Animal Documentary: Wildlife');
INSERT INTO tags_video (tag, video_name) VALUES ('meditation', 'Meditation Guide');
INSERT INTO tags_video (tag, video_name) VALUES ('sports', 'Basketball Highlights');
INSERT INTO tags_video (tag, video_name) VALUES ('space', 'Space Exploration');
INSERT INTO tags_video (tag, video_name) VALUES ('music', 'Learn Guitar');
INSERT INTO tags_video (tag, video_name) VALUES ('comedy', 'Stand-up Comedy');


-- Insert in table comments_author

INSERT INTO comments_author (author, video_name, content, comment_date) VALUES ('jdoe', 'Funny Cats Compilation', 'Hilarious video!', '2022-01-02 12:30:00');
INSERT INTO comments_author (author, video_name, content, comment_date) VALUES ('jdoe', 'Top 10 Action Movies', 'Great selection of movies.', '2022-01-04 14:00:00');
INSERT INTO comments_author (author, video_name, content, comment_date) VALUES ('asmith', 'Yoga for Beginners', 'This was very helpful.', '2022-01-03 15:20:00');
INSERT INTO comments_author (author, video_name, content, comment_date) VALUES ('asmith', 'DIY Home Decor', 'Loved the ideas!', '2022-01-06 10:15:00');
INSERT INTO comments_author (author, video_name, content, comment_date) VALUES ('bjones', 'Gaming Highlights: Fortnite', 'Epic gameplay!', '2022-01-05 17:45:00');
INSERT INTO comments_author (author, video_name, content, comment_date) VALUES ('bjones', 'Tech Reviews: Smartphones', 'Very informative review.', '2022-01-08 12:05:00');
INSERT INTO comments_author (author, video_name, content, comment_date) VALUES ('cliu', 'Travel Vlog: Japan', 'Makes me want to visit Japan!', '2022-01-07 09:30:00');
INSERT INTO comments_author (author, video_name, content, comment_date) VALUES ('cliu', 'Art Tutorial: Painting', 'Beautiful techniques.', '2022-01-10 11:20:00');
INSERT INTO comments_author (author, video_name, content, comment_date) VALUES ('dmiller', 'Cooking with Chef John', 'Delicious recipes.', '2022-01-04 13:50:00');
INSERT INTO comments_author (author, video_name, content, comment_date) VALUES ('dmiller', 'Workout Routine', 'Great workout plan.', '2022-01-09 16:35:00');
INSERT INTO comments_author (author, video_name, content, comment_date) VALUES ('eroberts', 'Science Experiments', 'My kids loved this.', '2022-01-06 14:25:00');
INSERT INTO comments_author (author, video_name, content, comment_date) VALUES ('eroberts', 'History Documentary: Ancient Rome', 'Very informative.', '2022-01-11 10:50:00');
INSERT INTO comments_author (author, video_name, content, comment_date) VALUES ('fwilson', 'Music Video: The Beat', 'Great song!', '2022-01-05 18:15:00');
INSERT INTO comments_author (author, video_name, content, comment_date) VALUES ('gthomas', 'Comedy Skits', 'I couldnt stop laughing.', '2022-01-07 19:40:00');
INSERT INTO comments_author (author, video_name, content, comment_date) VALUES ('hking', 'Animal Documentary: Wildlife', 'Amazing footage.', '2022-01-08 08:55:00');
INSERT INTO comments_author (author, video_name, content, comment_date) VALUES ('owhite', 'Meditation Guide', 'Very calming and informative.', '2022-02-02 13:30:00');
INSERT INTO comments_author (author, video_name, content, comment_date) VALUES ('pmartinez', 'Basketball Highlights', 'Awesome dunks!', '2022-02-03 16:00:00');
INSERT INTO comments_author (author, video_name, content, comment_date) VALUES ('qrussell', 'Space Exploration', 'Mind-blowing visuals.', '2022-02-04 18:15:00');
INSERT INTO comments_author (author, video_name, content, comment_date) VALUES ('snguyen', 'Learn Guitar', 'Just bought a guitar, this helps!', '2022-02-05 10:50:00');
INSERT INTO comments_author (author, video_name, content, comment_date) VALUES ('tyoung', 'Stand-up Comedy', 'Laughed so hard!', '2022-02-06 12:45:00');

-- Insert in table comments_video

INSERT INTO comments_video (video_name, author, content, comment_date) VALUES ('Funny Cats Compilation', 'jdoe', 'Hilarious video!', '2022-01-02 12:30:00');
INSERT INTO comments_video (video_name, author, content, comment_date) VALUES ('Top 10 Action Movies', 'jdoe', 'Great selection of movies.', '2022-01-04 14:00:00');
INSERT INTO comments_video (video_name, author, content, comment_date) VALUES ('Yoga for Beginners', 'asmith', 'This was very helpful.', '2022-01-03 15:20:00');
INSERT INTO comments_video (video_name, author, content, comment_date) VALUES ('DIY Home Decor', 'asmith', 'Loved the ideas!', '2022-01-06 10:15:00');
INSERT INTO comments_video (video_name, author, content, comment_date) VALUES ('Gaming Highlights: Fortnite', 'bjones', 'Epic gameplay!', '2022-01-05 17:45:00');
INSERT INTO comments_video (video_name, author, content, comment_date) VALUES ('Tech Reviews: Smartphones', 'bjones', 'Very informative review.', '2022-01-08 12:05:00');
INSERT INTO comments_video (video_name, author, content, comment_date) VALUES ('Travel Vlog: Japan', 'cliu', 'Makes me want to visit Japan!', '2022-01-07 09:30:00');
INSERT INTO comments_video (video_name, author, content, comment_date) VALUES ('Art Tutorial: Painting', 'cliu', 'Beautiful techniques.', '2022-01-10 11:20:00');
INSERT INTO comments_video (video_name, author, content, comment_date) VALUES ('Cooking with Chef John', 'dmiller', 'Delicious recipes.', '2022-01-04 13:50:00');
INSERT INTO comments_video (video_name, author, content, comment_date) VALUES ('Workout Routine', 'dmiller', 'Great workout plan.', '2022-01-09 16:35:00');
INSERT INTO comments_video (video_name, author, content, comment_date) VALUES ('Science Experiments', 'eroberts', 'My kids loved this.', '2022-01-06 14:25:00');
INSERT INTO comments_video (video_name, author, content, comment_date) VALUES ('History Documentary: Ancient Rome', 'eroberts', 'Very informative.', '2022-01-11 10:50:00');
INSERT INTO comments_video (video_name, author, content, comment_date) VALUES ('Music Video: The Beat', 'fwilson', 'Great song!', '2022-01-05 18:15:00');
INSERT INTO comments_video (video_name, author, content, comment_date) VALUES ('Comedy Skits', 'gthomas', 'I couldnt stop laughing.', '2022-01-07 19:40:00');
INSERT INTO comments_video (video_name, author, content, comment_date) VALUES ('Animal Documentary: Wildlife', 'hking', 'Amazing footage.', '2022-01-08 08:55:00');
INSERT INTO comments_video (video_name, author, content, comment_date) VALUES ('Meditation Guide', 'owhite', 'Very calming and informative.', '2022-02-02 13:30:00');
INSERT INTO comments_video (video_name, author, content, comment_date) VALUES ('Basketball Highlights', 'pmartinez', 'Awesome dunks!', '2022-02-03 16:00:00');
INSERT INTO comments_video (video_name, author, content, comment_date) VALUES ('Space Exploration', 'qrussell', 'Mind-blowing visuals.', '2022-02-04 18:15:00');
INSERT INTO comments_video (video_name, author, content, comment_date) VALUES ('Learn Guitar', 'snguyen', 'Just bought a guitar, this helps!', '2022-02-05 10:50:00');
INSERT INTO comments_video (video_name, author, content, comment_date) VALUES ('Stand-up Comedy', 'tyoung', 'Laughed so hard!', '2022-02-06 12:45:00');
INSERT INTO comments_video (video_name, author, content, comment_date) VALUES ('Travel Vlog: Japan', 'jdoe', 'Amazing vlog!', '2022-01-20 10:00:00');
INSERT INTO comments_video (video_name, author, content, comment_date) VALUES ('Travel Vlog: Japan', 'asmith', 'Love the scenery.', '2022-01-21 11:30:00');
INSERT INTO comments_video (video_name, author, content, comment_date) VALUES ('bjones', 'Travel Vlog: Japan', 'I want to visit now.', '2022-01-22 12:45:00');
INSERT INTO comments_video (video_name, author, content, comment_date) VALUES ('cliu', 'Travel Vlog: Japan', 'Great editing!', '2022-01-23 13:15:00');
INSERT INTO comments_video (video_name, author, content, comment_date) VALUES ('dmiller', 'Travel Vlog: Japan', 'Beautiful culture.', '2022-01-24 14:50:00');
INSERT INTO comments_video (video_name, author, content, comment_date) VALUES ('eroberts', 'Travel Vlog: Japan', 'Informative and fun!', '2022-01-25 15:25:00');

-- Insert in table video_followers

INSERT INTO video_followers (video_name, follower) VALUES ('Funny Cats Compilation', 'jdoe');
INSERT INTO video_followers (video_name, follower) VALUES ('Cooking with Chef John', 'asmith');
INSERT INTO video_followers (video_name, follower) VALUES ('Travel Vlog: Japan', 'bjones');
INSERT INTO video_followers (video_name, follower) VALUES ('Top 10 Action Movies', 'cliu');
INSERT INTO video_followers (video_name, follower) VALUES ('Yoga for Beginners', 'dmiller');
INSERT INTO video_followers (video_name, follower) VALUES ('Gaming Highlights: Fortnite', 'eroberts');
INSERT INTO video_followers (video_name, follower) VALUES ('DIY Home Decor', 'fwilson');
INSERT INTO video_followers (video_name, follower) VALUES ('Science Experiments', 'gthomas');
INSERT INTO video_followers (video_name, follower) VALUES ('Music Video: The Beat', 'hking');
INSERT INTO video_followers (video_name, follower) VALUES ('Comedy Skits', 'ijackson');
INSERT INTO video_followers (video_name, follower) VALUES ('Art Tutorial: Painting', 'jlewis');
INSERT INTO video_followers (video_name, follower) VALUES ('History Documentary: Ancient Rome', 'kclark');
INSERT INTO video_followers (video_name, follower) VALUES ('Tech Reviews: Smartphones', 'lwalker');
INSERT INTO video_followers (video_name, follower) VALUES ('Workout Routine', 'mbrown');
INSERT INTO video_followers (video_name, follower) VALUES ('Animal Documentary: Wildlife', 'nmartin');
INSERT INTO video_followers (video_name, follower) VALUES ('Meditation Guide', 'owhite');
INSERT INTO video_followers (video_name, follower) VALUES ('Basketball Highlights', 'pmartinez');
INSERT INTO video_followers (video_name, follower) VALUES ('Space Exploration', 'qrussell');
INSERT INTO video_followers (video_name, follower) VALUES ('Learn Guitar', 'snguyen');
INSERT INTO video_followers (video_name, follower) VALUES ('Stand-up Comedy', 'tyoung');

-- Insert in table events

INSERT INTO events (video_name, username, event_type, video_moment, event_date) VALUES ('Funny Cats Compilation', 'jdoe', 'play', 0, '2022-01-02 12:00:00');
INSERT INTO events (video_name, username, event_type, video_moment, event_date) VALUES ('Funny Cats Compilation', 'jdoe', 'pause', 30, '2022-01-02 12:00:30');
INSERT INTO events (video_name, username, event_type, video_moment, event_date) VALUES ('Funny Cats Compilation', 'jdoe', 'play', 30, '2022-01-02 12:01:00');
INSERT INTO events (video_name, username, event_type, video_moment, event_date) VALUES ('Yoga for Beginners', 'asmith', 'play', 0, '2022-01-03 15:00:00');
INSERT INTO events (video_name, username, event_type, video_moment, event_date) VALUES ('Yoga for Beginners', 'asmith', 'stop', 600, '2022-01-03 15:10:00');
INSERT INTO events (video_name, username, event_type, video_moment, event_date) VALUES ('Gaming Highlights: Fortnite', 'bjones', 'play', 0, '2022-01-04 17:00:00');
INSERT INTO events (video_name, username, event_type, video_moment, event_date) VALUES ('Gaming Highlights: Fortnite', 'bjones', 'pause', 120, '2022-01-04 17:02:00');
INSERT INTO events (video_name, username, event_type, video_moment, event_date) VALUES ('Gaming Highlights: Fortnite', 'bjones', 'play', 120, '2022-01-04 17:02:30');
INSERT INTO events (video_name, username, event_type, video_moment, event_date) VALUES ('Travel Vlog: Japan', 'cliu', 'play', 0, '2022-01-05 09:00:00');
INSERT INTO events (video_name, username, event_type, video_moment, event_date) VALUES ('Travel Vlog: Japan', 'cliu', 'stop', 900, '2022-01-05 09:15:00');
INSERT INTO events (video_name, username, event_type, video_moment, event_date) VALUES ('Cooking with Chef John', 'dmiller', 'play', 0, '2022-01-06 12:00:00');
INSERT INTO events (video_name, username, event_type, video_moment, event_date) VALUES ('Cooking with Chef John', 'dmiller', 'pause', 300, '2022-01-06 12:05:00');
INSERT INTO events (video_name, username, event_type, video_moment, event_date) VALUES ('Cooking with Chef John', 'dmiller', 'play', 300, '2022-01-06 12:10:00');
INSERT INTO events (video_name, username, event_type, video_moment, event_date) VALUES ('Music Video: The Beat', 'fwilson', 'play', 0, '2022-01-07 18:00:00');
INSERT INTO events (video_name, username, event_type, video_moment, event_date) VALUES ('Music Video: The Beat', 'fwilson', 'stop', 240, '2022-01-07 18:04:00');
INSERT INTO events (video_name, username, event_type, video_moment, event_date) VALUES ('Meditation Guide', 'owhite', 'play', 0, '2022-02-02 13:00:00');
INSERT INTO events (video_name, username, event_type, video_moment, event_date) VALUES ('Meditation Guide', 'owhite', 'pause', 300, '2022-02-02 13:05:00');
INSERT INTO events (video_name, username, event_type, video_moment, event_date) VALUES ('Basketball Highlights', 'pmartinez', 'play', 0, '2022-02-03 15:30:00');
INSERT INTO events (video_name, username, event_type, video_moment, event_date) VALUES ('Space Exploration', 'qrussell', 'play', 0, '2022-02-04 17:45:00');
INSERT INTO events (video_name, username, event_type, video_moment, event_date) VALUES ('Space Exploration', 'qrussell', 'stop', 1200, '2022-02-04 18:05:00');
INSERT INTO events (video_name, username, event_type, video_moment, event_date) VALUES ('Funny Cats Compilation', 'jdoe', 'pause', 45, '2022-01-02 12:05:00');
INSERT INTO events (video_name, username, event_type, video_moment, event_date) VALUES ('Top 10 Action Movies', 'jdoe', 'pause', 120, '2022-01-04 14:10:00');
INSERT INTO events (video_name, username, event_type, video_moment, event_date) VALUES ('Travel Vlog: Japan', 'jdoe', 'pause', 300, '2022-01-20 10:30:00');
INSERT INTO events (video_name, username, event_type, video_moment, event_date) VALUES ('Yoga for Beginners', 'jdoe', 'pause', 200, '2022-01-06 16:00:00');
INSERT INTO events (video_name, username, event_type, video_moment, event_date) VALUES ('Cooking with Chef John', 'jdoe', 'pause', 150, '2022-01-08 18:15:00');
INSERT INTO events (video_name, username, event_type, video_moment, event_date) VALUES ('Cooking with Chef John', 'asmith', 'play', 0, '2022-01-10 09:00:00');
INSERT INTO events (video_name, username, event_type, video_moment, event_date) VALUES ('Cooking with Chef John', 'asmith', 'pause', 100, '2022-01-10 09:05:00');
INSERT INTO events (video_name, username, event_type, video_moment, event_date) VALUES ('Cooking with Chef John', 'asmith', 'play', 100, '2022-01-10 09:10:00');
INSERT INTO events (video_name, username, event_type, video_moment, event_date) VALUES ('Cooking with Chef John', 'asmith', 'pause', 200, '2022-01-10 09:15:00');
INSERT INTO events (video_name, username, event_type, video_moment, event_date) VALUES ('Cooking with Chef John', 'asmith', 'play', 200, '2022-01-10 09:20:00');
INSERT INTO events (video_name, username, event_type, video_moment, event_date) VALUES ('Cooking with Chef John', 'asmith', 'stop', 300, '2022-01-10 09:25:00');
INSERT INTO events (video_name, username, event_type, video_moment, event_date) VALUES ('Cooking with Chef John', 'asmith', 'play', 0, '2022-01-11 10:00:00');

-- Insert in table video_rating

INSERT INTO video_rating (rating_id, video_name, rating) VALUES (uuid(), 'Funny Cats Compilation', 5);
INSERT INTO video_rating (rating_id, video_name, rating) VALUES (uuid(), 'Space Exploration', 2);
INSERT INTO video_rating (rating_id, video_name, rating) VALUES (uuid(), 'Space Exploration', 5);
INSERT INTO video_rating (rating_id, video_name, rating) VALUES (uuid(), 'Cooking with Chef John', 4);
INSERT INTO video_rating (rating_id, video_name, rating) VALUES (uuid(), 'Travel Vlog: Japan', 5);
INSERT INTO video_rating (rating_id, video_name, rating) VALUES (uuid(), 'Top 10 Action Movies', 3);
INSERT INTO video_rating (rating_id, video_name, rating) VALUES (uuid(), 'Yoga for Beginners', 4);
INSERT INTO video_rating (rating_id, video_name, rating) VALUES (uuid(), 'Space Exploration', 1);
INSERT INTO video_rating (rating_id, video_name, rating) VALUES (uuid(), 'Gaming Highlights: Fortnite', 5);
INSERT INTO video_rating (rating_id, video_name, rating) VALUES (uuid(), 'DIY Home Decor', 4);
INSERT INTO video_rating (rating_id, video_name, rating) VALUES (uuid(), 'Science Experiments', 5);
INSERT INTO video_rating (rating_id, video_name, rating) VALUES (uuid(), 'Music Video: The Beat', 5);
INSERT INTO video_rating (rating_id, video_name, rating) VALUES (uuid(), 'Comedy Skits', 4);
INSERT INTO video_rating (rating_id, video_name, rating) VALUES (uuid(), 'Art Tutorial: Painting', 5);
INSERT INTO video_rating (rating_id, video_name, rating) VALUES (uuid(), 'History Documentary: Ancient Rome', 4);
INSERT INTO video_rating (rating_id, video_name, rating) VALUES (uuid(), 'Tech Reviews: Smartphones', 3);
INSERT INTO video_rating (rating_id, video_name, rating) VALUES (uuid(), 'Space Exploration', 5);
INSERT INTO video_rating (rating_id, video_name, rating) VALUES (uuid(), 'Workout Routine', 5);
INSERT INTO video_rating (rating_id, video_name, rating) VALUES (uuid(), 'Animal Documentary: Wildlife', 5);
INSERT INTO video_rating (rating_id, video_name, rating) VALUES (uuid(), 'Meditation Guide', 5);
INSERT INTO video_rating (rating_id, video_name, rating) VALUES (uuid(), 'Basketball Highlights', 4);
INSERT INTO video_rating (rating_id, video_name, rating) VALUES (uuid(), 'Space Exploration', 5);
INSERT INTO video_rating (rating_id, video_name, rating) VALUES (uuid(), 'Learn Guitar', 4);
INSERT INTO video_rating (rating_id, video_name, rating) VALUES (uuid(), 'Stand-up Comedy', 5);

