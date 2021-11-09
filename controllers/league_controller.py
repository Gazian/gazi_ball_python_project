from flask import Flask, render_template, request, redirect
from flask import Blueprint
from repositories import league_repository
from repositories import team_repository
import repositories.league_repository as league_repository
import repositories.team_repository as team_repository
from models.league import League
from models.team import Team

leagues_blueprint = Blueprint("leagues", __name__)

@leagues_blueprint.route("/index")
def index():
    leagues = league_repository.select_all()
    return render_template("/base.html")

@leagues_blueprint.route("/index/leagues")
def leagues():
    leagues = league_repository.select_all()
    return render_template("/leagues/list.html",all_leagues=leagues)

@leagues_blueprint.route("/index/leagues/new",methods = ['GET'])
def new_league():
    return render_template("/leagues/new.html")

@leagues_blueprint.route("/index/leagues",methods = ['POST'])
def create_league():
    name = request.form['name']
    country = request.form['country']
    league = League(name,country)
    league_repository.save(league)
    return redirect('/index/leagues')

@leagues_blueprint.route("/index/leagues/<id>/delete", methods=['POST'])
def delete_league(id):
    league_repository.delete_league(id)
    return redirect('/index/leagues') 





# @leagues_blueprint.route("/index/leagues/<league>")
# def teams(league):
#     league = League('name','country','id')
#     teams = league_repository.all_teams_from_league(league)
#     return render_template("/leagues/league_teams.html",all_teams=teams)



    