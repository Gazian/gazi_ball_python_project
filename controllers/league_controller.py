from flask import Flask, render_template
from flask import Blueprint
from repositories import league_repository
import repositories.league_repository as league_repository
from models.league import League

leagues_blueprint = Blueprint("leagues", __name__)

@leagues_blueprint.route("/leagues")
def leagues():
    leagues = league_repository.display_leagues()
    return render_template("/league.html",all_leagues=leagues)