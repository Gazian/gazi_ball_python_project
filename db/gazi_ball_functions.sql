    SELECT  t.team_name,
            s.stadium_name,
            s.city,
            l.league_name
    FROM    teams t
    JOIN    leagues l
    ON      t.league_id = l.id
    JOIN    stadiums s
    ON      t.stadium_id = s.id;