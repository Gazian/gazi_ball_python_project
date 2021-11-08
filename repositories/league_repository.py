from db.run_sql import run_sql

from models.league import League
from models.team import Team
from models.stadium import Stadium

def display_leagues():
    leagues = []

    sql = "SELECT * FROM leagues"
    results = run_sql(sql)

    for row in results:
        league = League(row['league_name'],row['country'],row['id'])
        leagues.append(league)
    return leagues

def display_teams_by_league_serie_a():
    teams = []

    sql = "SELECT t.team_name, s.stadium_name, s.capacity FROM teams t JOIN leagues l ON t.league_id = l.id JOIN stadiums s ON t.stadium_id = s.id WHERE l.league_id = 1"
    results = run_sql(sql)

    for row in results:
        team = Team(row['team_name']),Stadium(row['stadium_name'],row['capacity'])
        teams.append(team)
    return teams


