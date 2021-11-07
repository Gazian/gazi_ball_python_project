import unittest
from models.league import League

class TestLeague(unittest.TestCase):
    
    def setUp(self):
        self.league = League("Serie A","Italy")

    def test_league_has_name(self):
        self.assertEqual("Serie A",self.league.name)

    def test_league_has_country(self):
        self.assertEqual("Italy",self.league.country)