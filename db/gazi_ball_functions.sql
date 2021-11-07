--check that teams, stadium and league are valid
    SELECT  t.team_name,
            s.stadium_name,
            s.city,
            l.league_name
    FROM    teams t
    JOIN    leagues l
    ON      t.league_id = l.id
    JOIN    stadiums s
    ON      t.stadium_id = s.id;
--check that matches view - with teams, stadium and league are valid
    SELECT  m.season,
            m.match_week,
            m.match_date,
            m.match_time,
            l.league_name,
            s.stadium_name,
            home_team.team_name,
            away_team.team_name,
            m.home_score,
            m.away_score
    FROM    matches m         
    JOIN    leagues l
    ON      m.league_id = l.id
    JOIN    teams home_team
    ON      m.home_id = home_team.id
    JOIN    teams away_team
    ON      m.away_id = away_team.id
    JOIN    stadiums s
    ON      m.stadium_id = s.id;

--league_repository - display leagues
SELECT * FROM leagues;
