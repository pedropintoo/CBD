use football_stats;

-- Insert in table teams
INSERT INTO teams (team_name, players, coach) VALUES ('Manchester United', {'David de Gea', 'Harry Maguire', 'Marcus Rashford'}, 'Ruben Amorim');
INSERT INTO teams (team_name, players, coach) VALUES ('Real Madrid', {'Karim Benzema', 'Sergio Ramos', 'Luka Modrić'}, 'Carlo Ancelotti');
INSERT INTO teams (team_name, players, coach) VALUES ('FC Barcelona', {'Lionel Messi', 'Gerard Piqué', 'Ansu Fati'}, 'Ronald Koeman');
INSERT INTO teams (team_name, players, coach) VALUES ('Liverpool', {'Mohamed Salah', 'Virgil van Dijk', 'Sadio Mané'}, 'Jürgen Klopp');
INSERT INTO teams (team_name, players, coach) VALUES ('Bayern Munich', {'Robert Lewandowski', 'Thomas Müller', 'Manuel Neuer'}, 'Hans-Dieter Flick');
INSERT INTO teams (team_name, players, coach) VALUES ('Juventus', {'Cristiano Ronaldo', 'Paulo Dybala', 'Giorgio Chiellini'}, 'Andrea Pirlo');
INSERT INTO teams (team_name, players, coach) VALUES ('Paris Saint-Germain', {'Kylian Mbappé', 'Neymar Jr.', 'Marco Verratti'}, 'Mauricio Pochettino');
INSERT INTO teams (team_name, players, coach) VALUES ('Chelsea', {'NGolo Kanté', 'Timo Werner', 'Mason Mount'}, 'Thomas Tuchel');
INSERT INTO teams (team_name, players, coach) VALUES ('Manchester City', {'Kevin De Bruyne', 'Sergio Agüero', 'Raheem Sterling'}, 'Pep Guardiola');
INSERT INTO teams (team_name, players, coach) VALUES ('Atlético Madrid', {'Luis Suárez', 'Jan Oblak', 'Koke'}, 'Diego Simeone');
INSERT INTO teams (team_name, players, coach) VALUES ('Borussia Dortmund', {'Erling Haaland', 'Marco Reus', 'Jadon Sancho'}, 'Marco Rose');
INSERT INTO teams (team_name, players, coach) VALUES ('AC Milan', {'Zlatan Ibrahimović', 'Theo Hernández', 'Franck Kessié'}, 'Stefano Pioli');

-- Insert in table players
INSERT INTO players (player_name, team_name, position, stats) VALUES ('Lionel Messi', 'FC Barcelona', 'Forward', {'goals': 30, 'assists': 12, 'matches': 35});
INSERT INTO players (player_name, team_name, position, stats) VALUES ('Cristiano Ronaldo', 'Juventus', 'Forward', {'goals': 29, 'assists': 3, 'matches': 33});
INSERT INTO players (player_name, team_name, position, stats) VALUES ('Robert Lewandowski', 'Bayern Munich', 'Forward', {'goals': 41, 'assists': 7, 'matches': 29});
INSERT INTO players (player_name, team_name, position, stats) VALUES ('Kevin De Bruyne', 'Manchester City', 'Midfielder', {'goals': 6, 'assists': 12, 'matches': 25});
INSERT INTO players (player_name, team_name, position, stats) VALUES ('Kylian Mbappé', 'Paris Saint-Germain', 'Forward', {'goals': 27, 'assists': 7, 'matches': 31});
INSERT INTO players (player_name, team_name, position, stats) VALUES ('Erling Haaland', 'Borussia Dortmund', 'Forward', {'goals': 27, 'assists': 6, 'matches': 28});
INSERT INTO players (player_name, team_name, position, stats) VALUES ('NGolo Kanté', 'Chelsea', 'Midfielder', {'goals': 2, 'assists': 2, 'matches': 30});
INSERT INTO players (player_name, team_name, position, stats) VALUES ('Mohamed Salah', 'Liverpool', 'Forward', {'goals': 22, 'assists': 5, 'matches': 37});
INSERT INTO players (player_name, team_name, position, stats) VALUES ('Sergio Ramos', 'Real Madrid', 'Defender', {'goals': 4, 'assists': 1, 'matches': 21});
INSERT INTO players (player_name, team_name, position, stats) VALUES ('Harry Maguire', 'Manchester United', 'Defender', {'goals': 2, 'assists': 1, 'matches': 34});
INSERT INTO players (player_name, team_name, position, stats) VALUES ('Zlatan Ibrahimović', 'AC Milan', 'Forward', {'goals': 15, 'assists': 2, 'matches': 19});
INSERT INTO players (player_name, team_name, position, stats) VALUES ('Luis Suárez', 'Atlético Madrid', 'Forward', {'goals': 21, 'assists': 3, 'matches': 32});

-- Insert in table matches
INSERT INTO matches (home_team_name, away_team_name, stadium_name, attendance, events) VALUES ('Manchester United', 'Liverpool', 'Old Trafford', 74000, ['Goal by Mohamed Salah at 23', 'Yellow card to Harry Maguire at 45']);
INSERT INTO matches (home_team_name, away_team_name, stadium_name, attendance, events) VALUES ('Real Madrid', 'FC Barcelona', 'Santiago Bernabéu', 81000, ['Goal by Karim Benzema at 12', 'Goal by Lionel Messi at 60', 'Red card to Sergio Ramos at 75', 'Yellow card to Lionel Messi at 80']);
INSERT INTO matches (home_team_name, away_team_name, stadium_name, attendance, events) VALUES ('Bayern Munich', 'Borussia Dortmund', 'Allianz Arena', 75000, ['Goal by Robert Lewandowski at 30', 'Goal by Erling Haaland at 50']);
INSERT INTO matches (home_team_name, away_team_name, stadium_name, attendance, events) VALUES ('Juventus', 'AC Milan', 'Juventus Stadium', 41000, ['Goal by Cristiano Ronaldo at 20', 'Injury to Zlatan Ibrahimović at 65']);
INSERT INTO matches (home_team_name, away_team_name, stadium_name, attendance, events) VALUES ('Paris Saint-Germain', 'Manchester City', 'Parc des Princes', 47000, ['Goal by Kylian Mbappé at 10', 'Goal by Kevin De Bruyne at 80']);
INSERT INTO matches (home_team_name, away_team_name, stadium_name, attendance, events) VALUES ('Chelsea', 'Atlético Madrid', 'Stamford Bridge', 42000, ['Goal by Mason Mount at 34', 'Goal by Luis Suárez at 88']);
INSERT INTO matches (home_team_name, away_team_name, stadium_name, attendance, events) VALUES ('Liverpool', 'Real Madrid', 'Anfield', 53000, ['Goal by Mohamed Salah at 25', 'Goal by Luka Modrić at 55', 'Yellow card to Virgil van Dijk at 70']);
INSERT INTO matches (home_team_name, away_team_name, stadium_name, attendance, events) VALUES ('FC Barcelona', 'Paris Saint-Germain', 'Camp Nou', 99000, ['Goal by Lionel Messi at 45', 'Goal by Neymar Jr. at 70', 'Yellow card to Lionel Messi at 80']);
INSERT INTO matches (home_team_name, away_team_name, stadium_name, attendance, events) VALUES ('Manchester City', 'Bayern Munich', 'Etihad Stadium', 55000, ['Goal by Kevin De Bruyne at 15', 'Goal by Robert Lewandowski at 60']);
INSERT INTO matches (home_team_name, away_team_name, stadium_name, attendance, events) VALUES ('Borussia Dortmund', 'Juventus', 'Signal Iduna Park', 81000, ['Goal by Erling Haaland at 40', 'Goal by Paulo Dybala at 75']);
INSERT INTO matches (home_team_name, away_team_name, stadium_name, attendance, events) VALUES ('AC Milan', 'Chelsea', 'San Siro', 80000, ['Goal by Theo Hernández at 22', 'Penalty saved by Gianluigi Donnarumma at 78']);
INSERT INTO matches (home_team_name, away_team_name, stadium_name, attendance, events) VALUES ('Atlético Madrid', 'Manchester United', 'Wanda Metropolitano', 68000, ['Goal by Marcus Rashford at 50', 'Goal by Koke at 85', 'Yellow card to NGolo Kanté at 90']);
INSERT INTO matches (home_team_name, away_team_name, stadium_name, attendance, events) VALUES ('Manchester United', 'Bayern Munich', 'Old Trafford', 74879, ['Goal by Robert Lewandowski at 10', 'Goal by Marcus Rashford at 30', 'Yellow card to Harry Maguire at 45']);

-- Insert in table stadiums
INSERT INTO stadiums (stadium_name, capacity) VALUES ('Old Trafford', 74879);
INSERT INTO stadiums (stadium_name, capacity) VALUES ('Santiago Bernabéu', 81044);
INSERT INTO stadiums (stadium_name, capacity) VALUES ('Camp Nou', 99354);
INSERT INTO stadiums (stadium_name, capacity) VALUES ('Anfield', 53394);
INSERT INTO stadiums (stadium_name, capacity) VALUES ('Allianz Arena', 75000);
INSERT INTO stadiums (stadium_name, capacity) VALUES ('Juventus Stadium', 41507);
INSERT INTO stadiums (stadium_name, capacity) VALUES ('Parc des Princes', 47929);
INSERT INTO stadiums (stadium_name, capacity) VALUES ('Stamford Bridge', 41631);
INSERT INTO stadiums (stadium_name, capacity) VALUES ('Etihad Stadium', 55017);
INSERT INTO stadiums (stadium_name, capacity) VALUES ('Wanda Metropolitano', 68000);
INSERT INTO stadiums (stadium_name, capacity) VALUES ('Signal Iduna Park', 81365);
INSERT INTO stadiums (stadium_name, capacity) VALUES ('San Siro', 80018);







