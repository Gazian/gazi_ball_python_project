from flask import Flask, render_template, request, redirect
from flask import Blueprint
from repositories import team_repository
from repositories import stadium_repository
from repositories import league_repository
import repositories.team_repository as team_repository
import repositories.league_repository as league_repository
import repositories.stadium_repository as stadium_repository
from models.team import Team
from models.stadium import Stadium
from models.league import League

teams_blueprint = Blueprint("teams", __name__)

# @leagues_blueprint.route("/index")
# def index():
#     leagues = team_repository.select_all()
#     return render_template("/base.html")



@teams_blueprint.route("/index/teams")
def teams():
    teams = team_repository.select_all()
    return render_template("/teams/list.html",all_teams=teams)

@teams_blueprint.route("/index/teams/create",methods = ['GET'])
def new_team():
    stadiums = stadium_repository.select_all()
    leagues = league_repository.select_all()
    return render_template("/teams/create.html", all_stadiums=stadiums,all_leagues=leagues)

@teams_blueprint.route("/index/teams",methods = ['POST'])
def create_team():
    name = request.form['name']
    league_id = request.form['league_id']
    stadium_id = request.form['stadium_id']
    league = league_repository.select(league_id)
    stadium = stadium_repository.select(stadium_id)
    relegated = False
    team = Team(name,league,stadium,relegated)
    team_repository.save(team)
    return redirect('/index/teams')

@teams_blueprint.route("/index/teams/<id>/delete", methods=['POST'])
def delete_team(id):
    team_repository.delete(id)
    return redirect('/index/teams') 

@teams_blueprint.route("/index/teams/<id>", methods=['GET'])
def show_team(id):
    team = team_repository.select(id)
    return render_template('teams/show.html',team=team)

@teams_blueprint.route("/index/teams/<id>/edit", methods=['GET'])
def edit_team(id):
    team = team_repository.select(id)
    leagues = league_repository.select_all()
    stadiums = stadium_repository.select_all()
    return render_template('teams/edit.html', team=team, all_leagues=leagues,all_stadiums=stadiums)

@teams_blueprint.route("/index/teams/<id>",methods = ['POST'])
def update_team(id):
    name = request.form['name']
    league_id = request.form['league_id']
    stadium_id = request.form['stadium_id']
    league = league_repository.select(league_id)
    stadium = stadium_repository.select(stadium_id)
    relegated = request.form.get("relegated")
    team = Team(name,league,stadium,relegated,id)
    team_repository.update(team)
    return redirect('/index/teams')