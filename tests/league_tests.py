import unittest
from models.league import League
# from db.run_sql import run_sql
# from repositories.league_repository import display_leagues

class TestLeague(unittest.TestCase):
    
    def setUp(self):
        self.league = League("Serie A","Italy")

    def test_league_has_name(self):
        self.assertEqual("Serie A",self.league.name)

    def test_league_has_country(self):
        self.assertEqual("Italy",self.league.country)

    # def test_display_leagues(self):

    #     self.assertEqual(len(display_leagues()),self.league.name)