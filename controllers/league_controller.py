from flask import Flask, render_template
from flask import Blueprint
from repositories import league_repository
import repositories.league_repository as league_repository
from models.league import League

leagues_blueprint = Blueprint("leagues", __name__)

@leagues_blueprint.route("/index")
def index():
    leagues = league_repository.display_leagues()
    return render_template("/base.html")



@leagues_blueprint.route("/index/leagues")
def leagues():
    leagues = league_repository.display_leagues()
    return render_template("/leagues/league.html",all_leagues=leagues)

@leagues_blueprint.route("/index/leagues/Serie A")
def serie_a_teams():
    teams = league_repository.display_teams_by_league_serie_a()
    return render_template("/leagues/league.html",all_teams=teams)



    