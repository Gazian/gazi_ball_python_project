import unittest
from models.match import Match
# --  do I need to import this??  import datetime

class TestMatch(unittest.TestCase):
    
    def setUp(self):
        self.match = Match("20/21",12,"2021-11-07","19:45","Serie A","San Siro","AC Milan","Inter",1,1)

    def test_match_has_season(self):
        self.assertEqual("20/21",self.match.season)

    def test_match_has_week(self):
        self.assertEqual(12,self.match.week)

    def test_match_has_date(self):
        self.assertEqual("2021-11-07",self.match.date)

    def test_match_has_time(self):
        self.assertEqual("19:45",self.match.time)

    def test_match_has_league(self):
        self.assertEqual("Serie A",self.match.league)

    def test_match_has_stadium(self):
        self.assertEqual("San Siro",self.match.stadium)

    def test_match_has_home(self):
        self.assertEqual("AC Milan",self.match.home)

    def test_match_has_away(self):
        self.assertEqual("Inter",self.match.away)

    def test_match_has_home_score(self):
        self.assertEqual(1,self.match.home_score)

    def test_match_has_away_score(self):
        self.assertEqual(1,self.match.away_score)

