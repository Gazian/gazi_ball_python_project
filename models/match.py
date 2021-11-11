class Match:

    def __init__(self,season,week,date,time,league,stadium,home,away,home_score = None,away_score = None,id = None):
        self.season = season
        self.week = week
        self.date = date
        self.time = time
        self.league = league
        self.stadium = stadium
        self.home = home
        self.away = away
        self.home_score = home_score
        self.away_score = away_score
        self.id = id
