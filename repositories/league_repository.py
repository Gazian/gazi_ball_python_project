from db.run_sql import run_sql

from models.league import League
from models.team import Team
import repositories.team_repository as team_repository
import repositories.stadium_repository as stadium_repository

def select_all():
    leagues = []

    sql = "SELECT * FROM leagues"
    results = run_sql(sql)

    for row in results:
        league = League(row['league_name'],row['country'],row['id'])
        leagues.append(league)
    return leagues

def select(id):
    league = None
    sql = "SELECT * FROM leagues WHERE id = %s"
    values = [id]
    result = run_sql(sql, values)[0]

    if result is not None:
        league = League(result['league_name'],result['country'],result['id'])
    return league

def save(league):
    sql = "INSERT INTO leagues(league_name,country) VALUES (%s,%s) RETURNING id"
    values = [league.name, league.country]
    results = run_sql (sql,values)
    league.id = results[0]['id']
    return league

def delete_league(id):
    sql = "DELETE FROM leagues WHERE id = %s"
    values = [id]
    run_sql(sql, values)

def all_teams_from_league(league):
    teams = []

    sql = "SELECT * FROM teams WHERE league_id = %s"
    values = [league.id]
    results = run_sql(sql, values)

    for row in results:
        stadium = stadium_repository.select(row['stadium_id'])
        team = Team(row['team_name'],league,stadium,row['relegated'],row['id'])
        teams.append(team)
    return teams


