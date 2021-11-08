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
  stadium_id INT NOT NULL REFERENCES stadiums(id),
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
    ('21/22',4,'2021-09-20','19:45',1,13,16,10),
    ('21/22',5,'2021-09-21','17:30',1,2,2,5),
    ('21/22',5,'2021-09-21','19:45',1,1,1,11),
    ('21/22',5,'2021-09-21','19:45',1,4,4,9),
    ('21/22',5,'2021-09-22','17:30',1,17,20,17),
    ('21/22',5,'2021-09-22','17:30',1,6,7,14),
    ('21/22',5,'2021-09-22','19:45',1,7,8,19),
    ('21/22',5,'2021-09-22','19:45',1,3,3,18),
    ('21/22',5,'2021-09-23','17:30',1,5,6,10),
    ('21/22',5,'2021-09-23','17:30',1,12,15,13),
    ('21/22',5,'2021-09-23','19:45',1,10,12,16),
    ('21/22',6,'2021-09-25','14:00',1,6,7,8),
    ('21/22',6,'2021-09-25','17:00',1,7,9,1),
    ('21/22',6,'2021-09-25','19:45',1,5,5,17),
    ('21/22',6,'2021-09-26','11:30',1,11,14,6),
    ('21/22',6,'2021-09-26','14:00',1,15,18,2),
    ('21/22',6,'2021-09-26','14:00',1,9,11,20),
    ('21/22',6,'2021-09-26','14:00',1,13,16,4),
    ('21/22',6,'2021-09-26','17:00',1,10,13,12),
    ('21/22',6,'2021-09-26','19:45',1,8,10,3),
    ('21/22',6,'2021-09-27','19:45',1,16,19,15),
    ('21/22',7,'2021-10-01','19:45',1,3,3,19),
    ('21/22',7,'2021-10-02','14:00',1,17,20,5),
    ('21/22',7,'2021-10-02','17:00',1,12,15,14),
    ('21/22',7,'2021-10-03','11:30',1,2,2,13),
    ('21/22',7,'2021-10-03','14:00',1,5,6,16),
    ('21/22',7,'2021-10-03','14:00',1,14,16,7),
    ('21/22',7,'2021-10-03','17:00',1,10,12,18),
    ('21/22',7,'2021-10-03','17:00',1,4,4,10),
    ('21/22',7,'2021-10-03','19:45',1,1,1,8),
    ('21/22',7,'2021-10-02','19:45',1,9,11,9),
    ('21/22',8,'2021-10-16','14:00',1,6,7,20),
    ('21/22',8,'2021-10-16','17:00',1,10,13,9),
    ('21/22',8,'2021-10-16','19:45',1,7,8,17),
    ('21/22',8,'2021-10-17','11:30',1,3,3,6),
    ('21/22',8,'2021-10-17','14:00',1,15,18,1),
    ('21/22',8,'2021-10-17','14:00',1,5,5,11),
    ('21/22',8,'2021-10-17','14:00',1,13,16,2),
    ('21/22',8,'2021-10-17','17:00',1,8,10,15),
    ('21/22',8,'2021-10-17','19:45',1,11,14,12),
    ('21/22',8,'2021-10-18','19:45',1,16,19,4),
    ('21/22',9,'2021-10-22','17:30',1,12,15,5),
    ('21/22',9,'2021-10-22','19:45',1,5,6,7),
    ('21/22',9,'2021-10-24','14:00',1,10,12,10),
    ('21/22',9,'2021-10-24','14:00',1,1,1,16),
    ('21/22',9,'2021-10-23','19:45',1,2,2,8),
    ('21/22',9,'2021-10-24','14:00',1,4,4,3),
    ('21/22',9,'2021-10-24','19:45',1,7,9,14),
    ('21/22',9,'2021-10-23','14:00',1,17,20,18),
    ('21/22',9,'2021-10-23','17:00',1,9,11,19),
    ('21/22',9,'2021-10-24','14:00',1,14,17,13),
    ('21/22',10,'2021-10-26','17:30',1,6,7,5),
    ('21/22',10,'2021-10-26','17:30',1,16,19,20),
    ('21/22',10,'2021-10-26','19:45',1,7,8,15),
    ('21/22',10,'2021-10-27','17:30',1,11,14,11),
    ('21/22',10,'2021-10-27','17:30',1,5,6,1),
    ('21/22',10,'2021-10-27','17:30',1,13,16,17),
    ('21/22',10,'2021-10-27','19:45',1,3,3,12),
    ('21/22',10,'2021-10-27','19:45',1,15,18,9),
    ('21/22',10,'2021-10-27','19:45',1,10,13,4),
    ('21/22',10,'2021-10-28','19:45',1,8,10,2),
    ('21/22',11,'2021-10-30','14:00',1,1,1,13),
    ('21/22',11,'2021-10-30','17:00',1,14,17,14),
    ('21/22',11,'2021-10-30','19:45',1,12,15,6),
    ('21/22',11,'2021-10-31','11:30',1,7,9,16),
    ('21/22',11,'2021-10-31','14:00',1,4,4,7),
    ('21/22',11,'2021-10-31','14:00',1,5,5,19),
    ('21/22',11,'2021-10-31','14:00',1,9,11,18),
    ('21/22',11,'2021-10-31','17:00',1,17,20,10),
    ('21/22',11,'2021-10-31','19:45',1,10,12,8),
    ('21/22',11,'2021-11-01','19:45',1,2,2,3),
    ('21/22',12,'2021-11-05','19:45',1,15,18,5),
    ('21/22',12,'2021-11-06','14:00',1,6,7,15),
    ('21/22',12,'2021-11-06','17:00',1,11,14,4),
    ('21/22',12,'2021-11-06','19:45',1,3,3,1),
    ('21/22',12,'2021-11-07','11:30',1,16,19,12),
    ('21/22',12,'2021-11-07','14:00',1,5,6,2),
    ('21/22',12,'2021-11-07','14:00',1,13,16,11),
    ('21/22',12,'2021-11-07','17:00',1,10,13,20),
    ('21/22',12,'2021-11-07','17:00',1,8,10,17),
    ('21/22',12,'2021-11-07','19:45',1,7,8,9),
    ('21/22',13,'2021-11-21','14:00',1,1,1,7),
    ('21/22',13,'2021-11-21','14:00',1,2,2,19),
    ('21/22',13,'2021-11-21','14:00',1,4,4,8),
    ('21/22',13,'2021-11-21','14:00',1,5,5,12),
    ('21/22',13,'2021-11-21','14:00',1,7,9,10),
    ('21/22',13,'2021-11-21','14:00',1,10,13,14),
    ('21/22',13,'2021-11-21','14:00',1,17,20,6),
    ('21/22',13,'2021-11-21','14:00',1,9,11,3),
    ('21/22',13,'2021-11-21','14:00',1,12,15,16),
    ('21/22',13,'2021-11-21','14:00',1,14,17,18),
    ('21/22',14,'2021-11-28','14:00',1,7,8,11),
    ('21/22',14,'2021-11-28','14:00',1,10,12,15),
    ('21/22',14,'2021-11-28','14:00',1,3,3,20),
    ('21/22',14,'2021-11-28','14:00',1,15,18,4),
    ('21/22',14,'2021-11-28','14:00',1,11,14,1),
    ('21/22',14,'2021-11-28','14:00',1,8,10,13),
    ('21/22',14,'2021-11-28','14:00',1,5,6,17),
    ('21/22',14,'2021-11-28','14:00',1,6,7,2),
    ('21/22',14,'2021-11-28','14:00',1,13,16,5),
    ('21/22',14,'2021-11-28','14:00',1,16,17,9),
    ('21/22',15,'2021-12-01','19:45',1,1,1,19),
    ('21/22',15,'2021-12-01','19:45',1,2,2,12),
    ('21/22',15,'2021-12-01','19:45',1,4,4,6),
    ('21/22',15,'2021-12-01','19:45',1,5,5,8),
    ('21/22',15,'2021-12-01','19:45',1,7,9,7),
    ('21/22',15,'2021-12-01','19:45',1,10,13,16),
    ('21/22',15,'2021-12-01','19:45',1,17,20,14),
    ('21/22',15,'2021-12-01','19:45',1,9,11,10),
    ('21/22',15,'2021-12-01','19:45',1,12,15,18),
    ('21/22',15,'2021-12-01','19:45',1,14,17,3),
    ('21/22',16,'2021-12-05','14:00',1,7,8,20),
    ('21/22',16,'2021-12-05','14:00',1,10,12,9),
    ('21/22',16,'2021-12-05','14:00',1,2,2,4),
    ('21/22',16,'2021-12-05','14:00',1,3,3,15),
    ('21/22',16,'2021-12-05','14:00',1,15,18,16),
    ('21/22',16,'2021-12-05','14:00',1,11,14,5),
    ('21/22',16,'2021-12-05','14:00',1,8,10,1),
    ('21/22',16,'2021-12-05','14:00',1,5,6,13),
    ('21/22',16,'2021-12-05','14:00',1,6,7,11),
    ('21/22',16,'2021-12-05','14:00',1,16,19,17),
    ('21/22',17,'2021-12-12','14:00',1,10,12,7),
    ('21/22',17,'2021-12-12','14:00',1,4,4,20),
    ('21/22',17,'2021-12-12','14:00',1,5,5,6),
    ('21/22',17,'2021-12-12','14:00',1,7,9,3),
    ('21/22',17,'2021-12-12','14:00',1,8,10,18),
    ('21/22',17,'2021-12-12','14:00',1,9,11,13),
    ('21/22',17,'2021-12-12','14:00',1,12,15,2),
    ('21/22',17,'2021-12-12','14:00',1,13,16,8),
    ('21/22',17,'2021-12-12','14:00',1,16,19,14),
    ('21/22',17,'2021-12-12','14:00',1,14,17,1),
    ('21/22',18,'2021-12-19','14:00',1,7,8,10),
    ('21/22',18,'2021-12-19','14:00',1,1,1,12),
    ('21/22',18,'2021-12-19','14:00',1,2,2,14),
    ('21/22',18,'2021-12-19','14:00',1,3,3,16),
    ('21/22',18,'2021-12-19','14:00',1,4,4,11),
    ('21/22',18,'2021-12-19','14:00',1,10,13,5),
    ('21/22',18,'2021-12-19','14:00',1,17,20,9),
    ('21/22',18,'2021-12-19','14:00',1,5,6,19),
    ('21/22',18,'2021-12-19','14:00',1,6,7,18),
    ('21/22',18,'2021-12-19','14:00',1,12,15,17),
    ('21/22',19,'2021-12-22','19:45',1,10,12,6),
    ('21/22',19,'2021-12-22','19:45',1,15,17,8),
    ('21/22',19,'2021-12-22','19:45',1,5,5,1),
    ('21/22',19,'2021-12-22','19:45',1,7,9,15),
    ('21/22',19,'2021-12-22','19:45',1,11,14,3),
    ('21/22',19,'2021-12-22','19:45',1,8,10,7),
    ('21/22',19,'2021-12-22','19:45',1,9,11,2),
    ('21/22',19,'2021-12-22','19:45',1,13,16,20),
    ('21/22',19,'2021-12-22','19:45',1,16,19,13),
    ('21/22',19,'2021-12-22','19:45',1,14,17,4),
    ('21/22',20,'2022-01-06','19:45',1,7,8,12),
    ('21/22',20,'2022-01-06','19:45',1,1,1,15),
    ('21/22',20,'2022-01-06','19:45',1,2,2,9),
    ('21/22',20,'2022-01-06','19:45',1,4,4,16),
    ('21/22',20,'2022-01-06','19:45',1,11,14,10),
    ('21/22',20,'2022-01-06','19:45',1,10,13,18),
    ('21/22',20,'2022-01-06','19:45',1,17,20,19),
    ('21/22',20,'2022-01-06','19:45',1,5,6,3),
    ('21/22',20,'2022-01-06','19:45',1,9,11,5),
    ('21/22',20,'2022-01-06','19:45',1,6,7,17),
    ('21/22',21,'2022-01-09','14:00',1,10,12,14),
    ('21/22',21,'2022-01-09','14:00',1,3,3,2),
    ('21/22',21,'2022-01-09','14:00',1,15,18,11),
    ('21/22',21,'2022-01-09','14:00',1,5,5,7),
    ('21/22',21,'2022-01-09','14:00',1,7,9,13),
    ('21/22',21,'2022-01-09','14:00',1,8,10,6),
    ('21/22',21,'2022-01-09','14:00',1,12,15,4),
    ('21/22',21,'2022-01-09','14:00',1,13,16,1),
    ('21/22',21,'2022-01-09','14:00',1,16,19,8),
    ('21/22',21,'2022-01-09','14:00',1,14,17,20),
    ('21/22',22,'2022-01-16','14:00',1,7,8,7),
    ('21/22',22,'2022-01-16','14:00',1,10,12,3),
    ('21/22',22,'2022-01-16','14:00',1,1,1,9),
    ('21/22',22,'2022-01-16','14:00',1,2,2,10),
    ('21/22',22,'2022-01-16','14:00',1,4,4,5),
    ('21/22',22,'2022-01-16','14:00',1,11,14,16),
    ('21/22',22,'2022-01-16','14:00',1,17,20,13),
    ('21/22',22,'2022-01-16','14:00',1,5,6,15),
    ('21/22',22,'2022-01-16','14:00',1,9,11,17),
    ('21/22',22,'2022-01-16','14:00',1,16,19,18),
    ('21/22',23,'2022-01-23','14:00',1,7,8,14),
    ('21/22',23,'2022-01-23','14:00',1,3,3,4),
    ('21/22',23,'2022-01-23','14:00',1,15,18,12),
    ('21/22',23,'2022-01-23','14:00',1,5,5,16),
    ('21/22',23,'2022-01-23','14:00',1,7,9,19),
    ('21/22',23,'2022-01-23','14:00',1,10,13,1),
    ('21/22',23,'2022-01-23','14:00',1,8,10,20),
    ('21/22',23,'2022-01-23','14:00',1,6,7,6),
    ('21/22',23,'2022-01-23','14:00',1,12,15,11),
    ('21/22',23,'2022-01-23','14:00',1,14,17,2),
    ('21/22',24,'2022-02-06','14:00',1,10,12,5),
    ('21/22',24,'2022-02-06','14:00',1,1,1,3),
    ('21/22',24,'2022-02-06','14:00',1,2,2,18),
    ('21/22',24,'2022-02-06','14:00',1,4,4,13),
    ('21/22',24,'2022-02-06','14:00',1,7,9,8),
    ('21/22',24,'2022-02-06','14:00',1,11,14,17),
    ('21/22',24,'2022-02-06','14:00',1,17,20,7),
    ('21/22',24,'2022-02-06','14:00',1,5,6,11),
    ('21/22',24,'2022-02-06','14:00',1,13,16,15),
    ('21/22',24,'2022-02-06','14:00',1,16,19,10),
    ('21/22',25,'2022-02-13','14:00',1,7,8,6),
    ('21/22',25,'2022-02-13','14:00',1,1,1,14),
    ('21/22',25,'2022-02-13','14:00',1,15,18,3),
    ('21/22',25,'2022-02-13','14:00',1,5,5,20),
    ('21/22',25,'2022-02-13','14:00',1,10,13,2),
    ('21/22',25,'2022-02-13','14:00',1,8,10,9),
    ('21/22',25,'2022-02-13','14:00',1,9,11,12),
    ('21/22',25,'2022-02-13','14:00',1,6,7,4),
    ('21/22',25,'2022-02-13','14:00',1,12,15,19),
    ('21/22',25,'2022-02-13','14:00',1,14,17,16),
    ('21/22',26,'2022-02-20','14:00',1,10,12,17),
    ('21/22',26,'2022-02-20','14:00',1,2,2,7),
    ('21/22',26,'2022-02-20','14:00',1,3,3,10),
    ('21/22',26,'2022-02-20','14:00',1,4,4,1),
    ('21/22',26,'2022-02-20','14:00',1,7,9,11),
    ('21/22',26,'2022-02-20','14:00',1,11,14,15),
    ('21/22',26,'2022-02-20','14:00',1,17,20,8),
    ('21/22',26,'2022-02-20','14:00',1,5,6,18),
    ('21/22',26,'2022-02-20','14:00',1,13,16,13),
    ('21/22',26,'2022-02-20','14:00',1,16,19,5),
    ('21/22',27,'2022-02-27','14:00',1,7,8,16),
    ('21/22',27,'2022-02-27','14:00',1,1,1,6),
    ('21/22',27,'2022-02-27','14:00',1,15,18,14),
    ('21/22',27,'2022-02-27','14:00',1,5,5,9),
    ('21/22',27,'2022-02-27','14:00',1,10,13,10),
    ('21/22',27,'2022-02-27','14:00',1,17,20,2),
    ('21/22',27,'2022-02-27','14:00',1,9,11,4),
    ('21/22',27,'2022-02-27','14:00',1,6,7,12),
    ('21/22',27,'2022-02-27','14:00',1,12,15,3),
    ('21/22',27,'2022-02-27','14:00',1,14,17,19),
    ('21/22',28,'2022-03-06','14:00',1,10,12,1),
    ('21/22',28,'2022-03-06','14:00',1,2,2,15),
    ('21/22',28,'2022-03-06','14:00',1,3,3,13),
    ('21/22',28,'2022-03-06','14:00',1,4,4,17),
    ('21/22',28,'2022-03-06','14:00',1,5,5,18),
    ('21/22',28,'2022-03-06','14:00',1,7,9,20),
    ('21/22',28,'2022-03-06','14:00',1,11,14,7),
    ('21/22',28,'2022-03-06','14:00',1,8,10,8),
    ('21/22',28,'2022-03-06','14:00',1,13,15,6),
    ('21/22',28,'2022-03-06','14:00',1,16,19,11),
    ('21/22',29,'2022-03-13','14:00',1,7,8,18),
    ('21/22',29,'2022-03-13','14:00',1,1,1,5),
    ('21/22',29,'2022-03-13','14:00',1,4,4,2),
    ('21/22',29,'2022-03-13','14:00',1,10,13,19),
    ('21/22',29,'2022-03-13','14:00',1,17,20,11),
    ('21/22',29,'2022-03-13','14:00',1,5,6,14),
    ('21/22',29,'2022-03-13','14:00',1,6,7,3),
    ('21/22',29,'2022-03-13','14:00',1,12,15,9),
    ('21/22',29,'2022-03-13','14:00',1,13,16,12),
    ('21/22',29,'2022-03-13','14:00',1,14,17,10),
    ('21/22',30,'2022-03-20','14:00',1,10,12,13),
    ('21/22',30,'2022-03-20','14:00',1,2,2,1),
    ('21/22',30,'2022-03-20','14:00',1,3,3,8),
    ('21/22',30,'2022-03-20','14:00',1,15,18,17),
    ('21/22',30,'2022-03-20','14:00',1,5,5,15),
    ('21/22',30,'2022-03-20','14:00',1,7,9,4),
    ('21/22',30,'2022-03-20','14:00',1,11,14,20),
    ('21/22',30,'2022-03-20','14:00',1,8,10,16),
    ('21/22',30,'2022-03-20','14:00',1,9,11,7),
    ('21/22',30,'2022-03-20','14:00',1,16,19,6),
    ('21/22',31,'2022-04-03','14:00',1,7,8,2),
    ('21/22',31,'2022-04-03','14:00',1,1,1,10),
    ('21/22',31,'2022-04-03','14:00',1,4,4,18),
    ('21/22',31,'2022-04-03','14:00',1,11,14,9),
    ('21/22',31,'2022-04-03','14:00',1,10,13,11),
    ('21/22',31,'2022-04-03','14:00',1,17,20,15),
    ('21/22',31,'2022-04-03','14:00',1,5,6,12),
    ('21/22',31,'2022-04-03','14:00',1,6,7,19),
    ('21/22',31,'2022-04-03','14:00',1,13,16,3),
    ('21/22',31,'2022-04-03','14:00',1,14,17,5),
    ('21/22',32,'2022-04-10','14:00',1,10,12,20),
    ('21/22',32,'2022-04-10','14:00',1,2,2,6),
    ('21/22',32,'2022-04-10','14:00',1,3,3,14),
    ('21/22',32,'2022-04-10','14:00',1,15,18,7),
    ('21/22',32,'2022-04-10','14:00',1,5,5,13),
    ('21/22',32,'2022-04-10','14:00',1,7,9,17),
    ('21/22',32,'2022-04-10','14:00',1,8,10,4),
    ('21/22',32,'2022-04-10','14:00',1,9,11,1),
    ('21/22',32,'2022-04-10','14:00',1,12,15,8),
    ('21/22',32,'2022-04-10','14:00',1,16,19,16),
    ('21/22',33,'2022-04-16','14:00',1,7,8,5),
    ('21/22',33,'2022-04-16','14:00',1,1,1,17),
    ('21/22',33,'2022-04-16','14:00',1,3,3,11),
    ('21/22',33,'2022-04-16','14:00',1,4,4,19),
    ('21/22',33,'2022-04-16','14:00',1,11,14,2),
    ('21/22',33,'2022-04-16','14:00',1,10,13,15),
    ('21/22',33,'2022-04-16','14:00',1,8,10,12),
    ('21/22',33,'2022-04-16','14:00',1,5,6,20),
    ('21/22',33,'2022-04-16','14:00',1,6,7,9),
    ('21/22',33,'2022-04-16','14:00',1,13,16,18),
    ('21/22',34,'2022-04-24','14:00',1,2,2,16),
    ('21/22',34,'2022-04-24','14:00',1,15,18,10),
    ('21/22',34,'2022-04-24','14:00',1,5,5,3),
    ('21/22',34,'2022-04-24','14:00',1,7,9,12),
    ('21/22',34,'2022-04-24','14:00',1,10,13,8),
    ('21/22',34,'2022-04-24','14:00',1,17,20,4),
    ('21/22',34,'2022-04-24','14:00',1,9,11,14),
    ('21/22',34,'2022-04-24','14:00',1,12,15,7),
    ('21/22',34,'2022-04-24','14:00',1,16,19,1),
    ('21/22',34,'2022-04-24','14:00',1,14,17,6),
    ('21/22',35,'2022-05-01','14:00',1,7,8,4),
    ('21/22',35,'2022-05-01','14:00',1,10,12,2),
    ('21/22',35,'2022-05-01','14:00',1,1,1,20),
    ('21/22',35,'2022-05-01','14:00',1,3,3,17),
    ('21/22',35,'2022-05-01','14:00',1,15,18,15),
    ('21/22',35,'2022-05-01','14:00',1,11,14,19),
    ('21/22',35,'2022-05-01','14:00',1,8,10,11),
    ('21/22',35,'2022-05-01','14:00',1,5,6,5),
    ('21/22',35,'2022-05-01','14:00',1,6,7,13),
    ('21/22',35,'2022-05-01','14:00',1,13,16,9),
    ('21/22',36,'2022-05-08','14:00',1,4,4,12),
    ('21/22',36,'2022-05-08','14:00',1,5,5,14),
    ('21/22',36,'2022-05-08','14:00',1,7,9,18),
    ('21/22',36,'2022-05-08','14:00',1,10,13,6),
    ('21/22',36,'2022-05-08','14:00',1,17,20,3),
    ('21/22',36,'2022-05-08','14:00',1,9,11,16),
    ('21/22',36,'2022-05-08','14:00',1,6,7,1),
    ('21/22',36,'2022-05-08','14:00',1,12,15,10),
    ('21/22',36,'2022-05-08','14:00',1,16,19,2),
    ('21/22',36,'2022-05-08','14:00',1,14,17,8),
    ('21/22',37,'2022-05-15','14:00',1,7,8,1),
    ('21/22',37,'2022-05-15','14:00',1,10,12,19),
    ('21/22',37,'2022-05-15','14:00',1,2,2,11),
    ('21/22',37,'2022-05-15','14:00',1,3,3,9),
    ('21/22',37,'2022-05-15','14:00',1,15,18,20),
    ('21/22',37,'2022-05-15','14:00',1,11,14,13),
    ('21/22',37,'2022-05-15','14:00',1,8,10,5),
    ('21/22',37,'2022-05-15','14:00',1,5,6,4),
    ('21/22',37,'2022-05-15','14:00',1,13,16,7),
    ('21/22',37,'2022-05-15','14:00',1,14,17,15),
    ('21/22',38,'2022-05-22','14:00',1,1,1,18),
    ('21/22',38,'2022-05-22','14:00',1,4,4,14),
    ('21/22',38,'2022-05-22','14:00',1,5,5,2),
    ('21/22',38,'2022-05-22','14:00',1,7,9,6),
    ('21/22',38,'2022-05-22','14:00',1,10,13,17),
    ('21/22',38,'2022-05-22','14:00',1,17,20,16),
    ('21/22',38,'2022-05-22','14:00',1,9,11,8),
    ('21/22',38,'2022-05-22','14:00',1,6,7,10),
    ('21/22',38,'2022-05-22','14:00',1,12,15,12),
    ('21/22',38,'2022-05-22','14:00',1,16,19,3);

    



