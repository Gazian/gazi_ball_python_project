from db.run_sql import run_sql

from models.stadium import Stadium
from models.team import Team

import repositories.stadium_repository as stadium_repository

def select_all():
    stadiums = []

    sql = "SELECT * FROM stadiums ORDER BY stadium_name ASC"
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

def save(stadium):
    sql = "INSERT INTO stadiums(stadium_name,city,capacity) VALUES (%s,%s,%s) RETURNING id"
    values = [stadium.name, stadium.city,stadium.capacity]
    results = run_sql (sql,values)
    stadium.id = results[0]['id']
    return stadium

def delete(id):
    sql = "DELETE FROM stadiums WHERE id = %s"
    values = [id]
    run_sql(sql, values)

def update(stadium):
    sql = "UPDATE stadiums SET(stadium_name,city,capacity) = (%s,%s,%s) WHERE id = %s"
    values = [stadium.name, stadium.city,stadium.capacity,stadium.id]
    run_sql(sql,values)