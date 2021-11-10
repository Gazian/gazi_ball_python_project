DROP TABLE IF EXISTS matches;
DROP TABLE IF EXISTS teams;
DROP TABLE IF EXISTS leagues;
DROP TABLE IF EXISTS stadiums;

CREATE TABLE leagues (
  id SERIAL PRIMARY KEY,
  league_name VARCHAR(255) NOT NULL,
  country VARCHAR(255) NOT NULL
);

CREATE TABLE stadiums (
  id SERIAL PRIMARY KEY,
  stadium_name VARCHAR(255) NOT NULL,
  city VARCHAR(255) NOT NULL,
  capacity INT NOT NULL
);

CREATE TABLE teams (
  id SERIAL PRIMARY KEY,
  team_name VARCHAR(255) NOT NULL,
  league_id INT NOT NULL REFERENCES leagues(id),
  stadium_id INT REFERENCES stadiums(id),
  relegated BOOLEAN DEFAULT False
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    season VARCHAR(255),
    match_week INT NOT NULL,
    match_date DATE NOT NULL,
    match_time TIME NOT NULL,
    league_id INT NOT NULL REFERENCES leagues(id),
    stadium_id INT NOT NULL REFERENCES stadiums(id),
    home_id INT NOT NULL REFERENCES teams(id),
    away_id INT NOT NULL REFERENCES teams(id),
    home_score INT,
    away_score INT,
    home_result INT,
    away_result INT
);


INSERT INTO leagues (league_name,country) VALUES
    ('Serie A','Italy');

INSERT INTO stadiums (city,stadium_name,capacity) VALUES
    ('Bergamo','Gewiss Stadium',21300),
    ('Bologna','Stadio Renato Dall''Ara',38279),
    ('Cagliari','Unipol Domus',16416),
    ('Florence','Stadio Artemio Franchi',43147),
    ('Genova','Stadio Luigi Ferraris',36600),
    ('La Spezia','Stadio Alberto Picco',10446),
    ('Milan','San Siro',80018),
    ('Naples','Diego Armando Maradona Stadium',54726),
    ('Reggio Emilia','MAPEI Stadium - Citta del Tricolore',20084),
    ('Rome','Stadio Olimpico',70634),
    ('Turin','Allianz Stadium',41000),
    ('Turin','Stadio Olimpico di Torino',27958),
    ('Udine','Stadio Friuli',25144),
    ('Verona','Stadio Marcantonio Bentegodi',39221),
    ('Empoli','Stadio Carlo Castellani',20000),
    ('Venice','Stadio Pierluigi Penzo',7450),
    ('Salerno','Arechi Stadium',37180);

INSERT INTO teams (team_name,league_id,stadium_id) VALUES
    ('Atalanta',1,1),
    ('Bologna',1,2),
    ('Cagliari',1,3),
    ('Fiorentina',1,4),
    ('Genoa',1,5),
    ('Sampdoria',1,5),
    ('Spezia',1,6),
    ('AC Milan',1,7),
    ('Inter',1,7),
    ('Napoli',1,8),
    ('Sassuolo',1,9),
    ('AS Roma',1,10),
    ('Lazio',1,10),
    ('Juventus',1,11),
    ('Torino',1,12),
    ('Udinese',1,13),
    ('Verona',1,14),
    ('Empoli',1,15),
    ('Venezia',1,16),
    ('Salernitana',1,17);

INSERT INTO matches (season,match_week,match_date,match_time,league_id,stadium_id,home_id,away_id) VALUES
    ('21/22',1,'2021-08-21','17:30',1,7,9,5),
    ('21/22',1,'2021-08-21','17:30',1,14,17,11),
    ('21/22',1,'2021-08-21','19:45',1,15,18,13),
    ('21/22',1,'2021-08-21','19:45',1,12,15,1),
    ('21/22',1,'2021-08-22','17:30',1,2,2,20),
    ('21/22',1,'2021-08-22','17:30',1,13,16,14),
    ('21/22',1,'2021-08-22','19:45',1,10,12,4),
    ('21/22',1,'2021-08-22','19:45',1,8,10,19),
    ('21/22',1,'2021-08-23','17:30',1,3,3,7),
    ('21/22',1,'2021-08-23','19:45',1,5,6,8),
    ('21/22',2,'2021-08-27','17:30',1,13,16,19),
    ('21/22',2,'2021-08-27','19:45',1,14,17,9),
    ('21/22',2,'2021-08-28','17:30',1,1,1,2),
    ('21/22',2,'2021-08-28','17:30',1,10,13,7),
    ('21/22',2,'2021-08-28','19:45',1,4,4,15),
    ('21/22',2,'2021-08-28','19:45',1,11,14,18),
    ('21/22',2,'2021-08-29','17:30',1,5,5,10),
    ('21/22',2,'2021-08-29','17:30',1,9,11,6),
    ('21/22',2,'2021-08-29','19:45',1,7,8,3),
    ('21/22',2,'2021-08-29','19:45',1,17,20,12),
    ('21/22',3,'2021-09-11','14:00',1,15,18,19),
    ('21/22',3,'2021-09-11','17:00',1,8,10,14),
    ('21/22',3,'2021-09-11','19:45',1,1,1,4),
    ('21/22',3,'2021-09-12','11:30',1,5,6,9),
    ('21/22',3,'2021-09-12','14:00',1,3,3,5),
    ('21/22',3,'2021-09-12','14:00',1,6,7,16),
    ('21/22',3,'2021-09-12','14:00',1,12,15,20),
    ('21/22',3,'2021-09-12','17:00',1,7,8,13),
    ('21/22',3,'2021-09-12','19:45',1,10,12,11),
    ('21/22',3,'2021-09-13','19:45',1,2,2,17),
    ('21/22',4,'2021-09-17','19:45',1,9,11,15),
    ('21/22',4,'2021-09-18','14:00',1,5,5,4),
    ('21/22',4,'2021-09-18','17:00',1,7,9,2),
    ('21/22',4,'2021-09-18','19:45',1,17,20,1),
    ('21/22',4,'2021-09-19','11:30',1,15,18,6),
    ('21/22',4,'2021-09-19','14:00',1,16,19,7),
    ('21/22',4,'2021-09-19','17:00',1,10,13,3),
    ('21/22',4,'2021-09-19','17:00',1,14,17,12),
    ('21/22',4,'2021-09-19','19:45',1,11,14,8),
    ('21/22',4,'2021-09-20','19:45',1,13,16,10);



