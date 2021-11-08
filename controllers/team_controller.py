from flask import Flask, render_template
from flask import Blueprint
from repositories import team_repository
import repositories.team_repository as team_repository
from models.team import Team

teams_blueprint = Blueprint("teams", __name__)

# @leagues_blueprint.route("/index")
# def index():
#     leagues = team_repository.select_all()
#     return render_template("/base.html")



@teams_blueprint.route("/index/teams")
def teams():
    teams = team_repository.select_all()
    return render_template("/teams/team.html",all_teams=teams)