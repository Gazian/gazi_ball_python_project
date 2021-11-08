import pdb

from models.league import League
from models.team import Team
from models.stadium import Stadium

import repositories.league_repository as league_repository
import repositories.team_repository as team_repository
import repositories.stadium_repository as stadium_repository


print(stadium_repository.select(7).name)

print(team_repository.select(8).name)

teams = team_repository.select_all()
for team in teams:
    print (team.name,team.stadium.name)


# league = League('Serie A','Italy')
# teams = team_repository.select_all_teams_by_league(league)
# for team in teams:
#     print (team.name,team.stadium.name)



# teams = team_repository.select_all()
# for team in teams:
#     print (team)



 



