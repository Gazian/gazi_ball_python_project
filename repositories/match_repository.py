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