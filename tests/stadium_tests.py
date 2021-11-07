import unittest
from models.stadium import Stadium

class TestStadium(unittest.TestCase):
    
    def setUp(self):
        self.stadium = Stadium("San Siro","Milan",80018)

    def test_stadium_has_name(self):
        self.assertEqual("San Siro",self.stadium.name)
    
    
    def test_stadium_has_city(self):
        self.assertEqual("Milan",self.stadium.city)

    def test_league_has_stadium(self):
        self.assertEqual(80018,self.stadium.capacity)