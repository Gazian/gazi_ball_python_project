from db.run_sql import run_sql

from models.stadium import Stadium
from models.team import Team

def select_all():
    stadiums = []

    sql = "SELECT * FROM stadiums"
    results = run_sql(sql)

    for row in results:
        stadium = Stadium(row['stadium_name'],row['city'],row['capacity'],row['id'])
        stadiums.append(stadium)
    return stadiums


def select(id):
    stadium = None
    sql = "SELECT * FROM stadiums WHERE id = %s"
    values = [id]
    result = run_sql(sql, values)[0]

    if result is not None:
        stadium = Stadium(result['stadium_name'],result['city'],result['capacity'],result['id'])
    return stadium

