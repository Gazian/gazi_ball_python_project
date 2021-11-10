from flask import Flask, render_template
from controllers.league_controller import leagues_blueprint
from controllers.team_controller import teams_blueprint
from controllers.stadium_controller import stadium_blueprint
from controllers.match_controller import matches_blueprint

app = Flask(__name__)\

app.register_blueprint(leagues_blueprint)
app.register_blueprint(teams_blueprint)
app.register_blueprint(stadium_blueprint)
app.register_blueprint(matches_blueprint)
\

@app.route('/')
def home():
    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True)