from flask import Flask, render_template, request, redirect
from flask import Blueprint
from repositories import team_repository
from repositories import stadium_repository
from repositories import league_repository
from repositories import match_repository
import repositories.team_repository as team_repository
import repositories.league_repository as league_repository
import repositories.stadium_repository as stadium_repository
import repositories.match_repository as match_repository
from models.match import Match
from models.team import Team
from models.stadium import Stadium
from models.league import League

matches_blueprint = Blueprint("matches", __name__)

@matches_blueprint.route("/index/matches")
def matches():
    matches = match_repository.select_all()
    return render_template("matches/list.html", all_matches = matches)
