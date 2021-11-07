import unittest
from models.team import Team

class TestTeam(unittest.TestCase):
    
    def setUp(self):
        self.team = Team("AS Roma","Serie A","Stadio Olimpico")

    def test_team_has_name(self):
        self.assertEqual("AS Roma",self.team.name)
    
    
    def test_team_has_league(self):
        self.assertEqual("Serie A",self.team.league)

    def test_league_has_stadium(self):
        self.assertEqual("Stadio Olimpico",self.team.stadium)