from flask import Flask, render_template, request, redirect
from flask import Blueprint
from repositories import team_repository
from repositories import stadium_repository
import repositories.team_repository as team_repository
from models.team import Team
from models.stadium import Stadium

stadium_blueprint = Blueprint("stadium", __name__)


@stadium_blueprint.route("/index/stadium")
def stadiums():
    stadiums = stadium_repository.select_all()
    return render_template("/stadium/list.html",all_stadiums=stadiums)

@stadium_blueprint.route("/index/stadium/create",methods = ['GET'])
def new_stadium():
    return render_template("/stadium/create.html")

@stadium_blueprint.route("/index/stadium",methods = ['POST'])
def create_stadium():
    name = request.form['name']
    city = request.form['city']
    capacity = request.form['capacity']
    stadium = Stadium(name,city,capacity)
    stadium_repository.save(stadium)
    return redirect('/index/stadium')

@stadium_blueprint.route("/index/stadium/<id>/delete", methods=['POST'])
def delete_stadium(id):
    stadium_repository.delete(id)
    return redirect('/index/stadium') 

@stadium_blueprint.route("/index/stadium/<id>", methods=['GET'])
def show_stadium(id):
    stadium = stadium_repository.select(id)
    return render_template('stadium/show.html',stadium=stadium)

@stadium_blueprint.route("/index/stadium/<id>/edit", methods=['GET'])
def edit_stadium(id):
    stadium = stadium_repository.select(id)
    return render_template('stadium/edit.html', stadium = stadium)

@stadium_blueprint.route("/index/stadium/<id>",methods = ['POST'])
def update_stadium(id):
    name = request.form['name']
    city = request.form['city']
    capacity = request.form['capacity']
    stadium = Stadium(name,city,capacity,id)
    stadium_repository.update(stadium)
    return redirect('/index/stadium')

# @stadium_blueprint.route("/index/stadia/<stadium>")
# def teams(stadium):
#     stadium = stadium('name','country','id')
#     teams = league_repository.all_teams_from_league(stadium)
#     return render_template("/stadia/league_teams.html",all_teams=teams)



    