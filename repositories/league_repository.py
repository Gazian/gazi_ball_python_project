from db.run_sql import run_sql

from models.league import League

def display_leagues():
    leagues = []

    sql = "SELECT * FROM leagues"
    results = run_sql(sql)

    for row in results:
        league = League(row['league_name'],row['country'],row['id'])
        leagues.append(league)
    return leagues


