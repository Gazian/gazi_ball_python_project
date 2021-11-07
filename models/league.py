# from controllers.league_controller import leagues
# from db.run_sql import run_sql
class League:

    def __init__(self,name,country,id = None):
        self.name = name
        self.country = country
        self.id = id

    # def display_leagues(self):
    #     leagues = []

    #     sql = "SELECT * FROM leagues"
    #     results = run_sql(sql)

    #     for row in results:
    #         league = League(row['name'],row['country'],row['id'])
    #         leagues.append(league)
    #     print (leagues)

    # print (display_leagues())