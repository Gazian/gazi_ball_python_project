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

@matches_blueprint.route("/index/matches/create", methods=['GET'])
def new_match():
    stadiums = stadium_repository.select_all()
    leagues = league_repository.select_all()
    teams = team_repository.select_all()
    return render_template("/matches/create.html", all_stadiums=stadiums,all_leagues=leagues,all_teams=teams)

@matches_blueprint.route("/index/matches",methods = ['POST'])
def create_match():
    season = request.form['season']
    week = request.form['week']
    date = request.form['date']
    time = request.form['time']
    league_id = request.form['league_id']
    stadium_id = request.form['stadium_id']
    league = league_repository.select(league_id)
    stadium = stadium_repository.select(stadium_id)
    home_id =  request.form['home_id']
    away_id =  request.form['away_id']
    home = team_repository.select(home_id)
    away = team_repository.select(away_id)
    match = Match(season,week,date,time,league,stadium,home,away)
    match_repository.save(match)
    return redirect('/index/matches')