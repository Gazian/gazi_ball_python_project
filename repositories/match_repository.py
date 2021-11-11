from db.run_sql import run_sql
from models.stadium import Stadium
from models.team import Team
from models.league import League
from models.match import Match

import repositories.stadium_repository as stadium_repository
import repositories.league_repository as league_repository
import repositories.team_repository as team_repository

def select_all():
    matches = []

    sql = "SELECT * FROM matches ORDER BY match_date, match_time ASC"
    results = run_sql(sql)

    for row in results:
        stadium = stadium_repository.select(row['stadium_id'])
        league = league_repository.select(row['league_id'])
        home_team = team_repository.select(row['home_id'])
        away_team = team_repository.select(row['away_id'])
        match = Match(row["season"],row["match_week"],row["match_date"],row["match_time"],league,stadium,home_team,away_team,row["home_score"],row["away_score"],row['id'])
        matches.append(match)
    return matches

def select(id):
    match = None
    sql = "SELECT * FROM matches WHERE id = %s"
    values = [id]
    result = run_sql(sql,values)[0]

    if result is not None:
        stadium = stadium_repository.select(result['stadium_id'])
        league = league_repository.select(result['league_id'])
        home = team_repository.select(result['home_id'])
        away = team_repository.select(result['away_id'])
        match = Match(result['season'],result['match_week'],result['match_date'],result['match_time'],league,stadium,home,away,result['home_score'],result['away_score'],result['id'])
    return match

def save(match):
    sql = "INSERT INTO matches(season,match_week,match_date,match_time,league_id,stadium_id,home_id,away_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s) RETURNING id"
    values = [match.season,match.week,match.date,match.time,match.league.id,match.stadium.id,match.home.id,match.away.id]
    results = run_sql (sql,values)
    match.id = results[0]['id']
    return match

def delete(id):
    sql = "DELETE FROM matches WHERE id = %s"
    values = [id]
    run_sql(sql, values)

def update(match):
    sql = "UPDATE matches SET(season,match_week,match_date,match_time,league_id,stadium_id,home_id,away_id,home_score,away_score) = (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s) where id = %s"
    values = [match.season,match.week,match.date,match.time,match.league.id,match.stadium.id,match.home.id,match.away.id,match.home_score,match.away_score,match.id]
    run_sql(sql,values)