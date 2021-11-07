DROP TABLE IF EXISTS matches;
DROP TABLE IF EXISTS teams;
DROP TABLE IF EXISTS leagues;
DROP TABLE IF EXISTS stadiums;

CREATE TABLE leagues (
  id SERIAL PRIMARY KEY,
  league_name VARCHAR(255),
  country VARCHAR(255)
);

CREATE TABLE stadiums (
  id SERIAL PRIMARY KEY,
  stadium_name VARCHAR(255),
  city VARCHAR(255),
  capacity INT
);

CREATE TABLE teams (
  id SERIAL PRIMARY KEY,
  team_name VARCHAR(255),
  league_id INT REFERENCES leagues(id),
  stadium_id INT REFERENCES stadiums(id),
  relegated BOOLEAN
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    season VARCHAR(255),
    match_week INT,
    match_date DATE,
    match_time TIME,
    league_id INT REFERENCES leagues(id),
    stadium_id INT REFERENCES stadiums(id),
    home_id INT REFERENCES teams(id),
    away_id INT REFERENCES teams(id),
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
    



