from db.run_sql import run_sql
from models.stadium import Stadium
from models.team import Team
from models.league import League

import repositories.stadium_repository as stadium_repository
import repositories.league_repository as league_repository

def select_all():
    teams = []

    sql = "SELECT * FROM teams ORDER BY  league_id, team_name ASC"
    results = run_sql(sql)

    for row in results:
        stadium = stadium_repository.select(row['stadium_id'])
        league = league_repository.select(row['league_id'])
        team = Team(row['team_name'],league,stadium,row['relegated'],row['id'])
        teams.append(team)
    return teams

def select_all_teams_by_league(league):
    teams = []
    league = league_repository.select(league.id)

    sql = "SELECT * FROM teams WHERE league_id = %s ORDER BY league_id, team_name ASC"
    value = league
    results = run_sql(sql,value)

    for row in results:
        stadium = stadium_repository.select(row['stadium_id'])
        league = league_repository.select(row['league_id'])
        team = Team(row['team_name'],league,stadium,row['relegated'],row['id'])
        teams.append(team)
    return teams

    


def select(id):
    team = None
    sql = "SELECT * FROM teams WHERE id = %s"
    values = [id]
    result = run_sql(sql,values)[0]

    if result is not None:
        stadium = stadium_repository.select(result['stadium_id'])
        league = league_repository.select(result['league_id'])
        team = Team(result['team_name'],league,stadium,result['relegated'],result['id'])
    return team
