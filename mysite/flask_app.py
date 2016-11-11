
# A very simple Flask Hello World app for you to get started with...

from flask import Flask, render_template, request, json, redirect, url_for, jsonify, session
from flask.ext.sqlalchemy import SQLAlchemy
from flask.ext.github import GitHub
from sqlalchemy.sql import text
import os


app = Flask(__name__)

app.config['GITHUB_CLIENT_ID'] = os.environ['GH_BASIC_CLIENT_ID']
app.config['GITHUB_CLIENT_SECRET'] = os.environ['GH_BASIC_SECRET_ID']
app.secret_key = os.environ['SECRET_KEY']

SQLALCHEMY_DATABASE_URI = "mysql+mysqlconnector://{username}:{password}@{hostname}/{databasename}".format(
    username="francisjohn",
    password="unholydivinity",
    hostname="francisjohn.mysql.pythonanywhere-services.com",
    databasename="francisjohn$default",
)

app.config["SQLALCHEMY_DATABASE_URI"] = SQLALCHEMY_DATABASE_URI
app.config["SQLALCHEMY_POOL_RECYCLE"] = 299

db = SQLAlchemy(app)
github = GitHub(app)

def get_events(user):
	events = []
	command="SELECT * FROM UEdataVer3 WHERE UEdataVer3.githubuser=\'{0}\' ORDER BY timestamp DESC;".format(user)
	sql = text(command)
	result = db.engine.execute(sql)
	for row in result:
		events.append({ 'id' :row["id"], 'user' : row["user"][1:], 'project' : row["project"][1:], 'outliertype' : row["outliertype"], 'type' : row["type"][:-1], 'url' : row["url"], 'timestamp' : row["timestamp"], 'comment' : row["comments"], 'q1' : row["q1"], 'median' : row["median"], 'q3' : row["q3"], 'value' : row["value"], 'githubuser' : row["githubuser"], 'thumb' : row["thumbs"], 'email' : row["email"] })
	result.close()
	return events

def get_projects(user):
    projects = []
    command = "SELECT DISTINCT project FROM UEdataVer3 WHERE UEdataVer3.githubuser=\'{0}\';".format(user)
    sql = text(command)
    result = db.engine.execute(sql)
    for row in result:
        projects.append({ 'project' : row["project"][1:] })
    result.close()
    return projects

def get_users(user):
    users = []
    command = "SELECT DISTINCT user FROM UEdataVer3 WHERE UEdataVer3.githubuser=\'{0}\';".format(user)
    sql = text(command)
    result = db.engine.execute(sql)
    for row in result:
        users.append({ 'user' : row["user"][1:] })
    result.close()
    return users

def get_types(user):
    types = []
    command = "SELECT DISTINCT type FROM UEdataVer3 WHERE UEdataVer3.githubuser=\'{0}\';".format(user)
    sql = text(command)
    result = db.engine.execute(sql)
    for row in result:
        types.append({ 'type' : row["type"][1:-1] })
    result.close()
    return types


def get_years(user):
    years = []
    command = "SELECT DISTINCT EXTRACT(YEAR FROM timestamp) AS years FROM UEdataVer3 WHERE UEdataVer3.githubuser=\'{0}\'ORDER BY timestamp ASC;".format(user)
    sql = text(command)
    result = db.engine.execute(sql)
    for row in result:
        years.append({ 'year' : row["years"] })
    result.close()
    return years

def convert_month(month):

    if month == "All":
        return 0
    if month == "January":
        return 1
    if month == "February":
        return 2
    if month == "March":
        return 3
    if month == "April":
        return 4
    if month == "May":
        return 5
    if month == "June":
        return 6
    if month == "July":
        return 7
    if month == "August":
        return 8
    if month == "September":
        return 9
    if month == "October":
        return 10
    if month == "November":
        return 11
    if month == "December":
        return 12


def notvalid(Input):
    try:
        int(Input)
        return False
    except ValueError:
        if Input == "All":
            return False
        return True


@app.route('/login')
def login():
    if 'username' in session:
        return redirect(url_for('index'))
    return github.authorize()

@app.route('/callback',methods = ['POST', 'GET'])
@github.authorized_handler
def authorized(oauth_token):
    if oauth_token is None:
        return redirect(url_for('login'))

    json_data=github.raw_request('get',"https://api.github.com/user" , access_token=oauth_token)

    if(json_data.ok):
        data=json.loads(json_data.content)
        username=' '+data['login']
        session['username']=username
        return redirect(url_for('index'))

    return "Request Failed"

@app.route('/', methods = ['POST', 'GET'])
def index():

    if 'username' not in session:
        return redirect(url_for('login'))
    username=session['username']
    events = get_events(username)
    projects = get_projects(username)
    users = get_users(username)
    types = get_types(username)

    years = get_years(username)
    return render_template('base1.html', events=events, user=username, projects=projects, users=users, types=types, years=years, p="All", u="All", t="All", d="All", m="All", y="All", th="All")

@app.route('/comment/<int:id>', methods=['POST'])
def comment(id):

    comment=request.json["comment"]
    command = "UPDATE UEdataVer3 SET UEdataVer3.comments=\"{0}\" WHERE UEdataVer3.id={1};".format(comment,id)
    sql=text(command)
    db.engine.execute(sql)
    return comment

@app.route('/thumbs/<int:id>/<int:thumb>', methods=['POST'])
def thumbs(id,thumb):

    if thumb == 0:
        thumbs= False
    else:
        thumbs= True

    command = "UPDATE UEdataVer3 SET UEdataVer3.thumbs={0} WHERE UEdataVer3.id={1};".format(thumbs,id)
    sql=text(command)
    db.engine.execute(sql)
    return thumbs

@app.route('/values/<int:id>', methods=['GET'])
def get_values(id):

	values = []
	command="SELECT type, min, max, q1, median, q3, value FROM UEdataVer3 WHERE UEdataVer3.id={0};".format(id)
	sql = text(command)
	result = db.engine.execute(sql)
	for row in result:
	    values.append({ 'type' : row["type"][:-1], 'min' : row["min"], 'q1' : row["q1"], 'median' : row["median"], 'q3' : row["q3"], 'max' : row["max"], 'value' : row["value"] })
	result.close()
	return jsonify(values=values)

@app.route('/<project>/<user>/<otype>/<day>/<month>/<year>/<thumb>', methods=['GET','POST'])
def filter(project,user,otype,day,month,year,thumb):

    if 'username' not in session:
        return redirect(url_for('login'))

    monthNum = convert_month(month)

    if notvalid(day) or notvalid(year) or notvalid(monthNum):

        return redirect(url_for('index'))

    events = []

    username=session['username']

    command="SELECT * FROM UEdataVer3 WHERE UEdataVer3.githubuser=\'{0}\' ".format(username)

    if project != "All":
        command +="AND UEdataVer3.project=\' {0}\' ".format(project)

    if user != "All":
        command +="AND UEdataVer3.user=\' {0}\' ".format(user)

    if otype != "All":
        otype += "s"
        command +="AND UEdataVer3.type=\' {0}\' ".format(otype)
        otype = otype[:-1]

    if day != "All":
        command +="AND DAY(timestamp)={0} ".format(day)

    if monthNum != 0:
        command +="AND MONTH(timestamp)={0} ".format(monthNum)

    if year != "All":
        command +="AND YEAR(timestamp)={0} ".format(year)

    if thumb != "All":

        if thumb == "Down":
            thumbs= False
            command +="AND UEdataVer3.thumbs={0} ".format(thumbs)
        elif thumb == "Up":
            thumbs= True
            command +="AND UEdataVer3.thumbs={0} ".format(thumbs)
        else:
            command +="AND UEdataVer3.thumbs is Null "


    command += "ORDER BY timestamp DESC;"
    sql = text(command)

    result = db.engine.execute(sql)
    for row in result:
	    events.append({ 'id':row["id"], 'user' : row["user"][1:], 'project' : row["project"][1:], 'outliertype' : row["outliertype"], 'type' : row["type"][:-1], 'url' : row["url"], 'timestamp' : row["timestamp"], 'comment' : row["comments"], 'q1' : row["q1"], 'median' : row["median"], 'q3' : row["q3"], 'value' : row["value"], 'githubuser' : row["githubuser"], 'thumb' : row["thumbs"], 'email' : row["email"] })
    result.close()

    projects = get_projects(username)
    users = get_users(username)
    types = get_types(username)

    years = get_years(username)
    return render_template('base1.html', events=events, user=username, projects=projects, users=users, types=types, years=years, p=project, u=user, t=otype, d=day, m=month, y=year, th=thumb)

@app.route('/logout')
def logout():

    session.pop('username', None)
    return "Successfully Logged Out. If you want to change user, log out of Github first before going back"


@app.route('/results', methods=['GET'])
def results():
    events = []
    command="SELECT * FROM UEdataVer3 WHERE thumbs is not null or comments is not null"
    sql = text(command)
    result = db.engine.execute(sql)
    for row in result:
        events.append({ 'email' : row["email"], 'githubuser' : row["githubuser"], 'user' : row["user"][1:], 'project' : row["project"][1:], 'outliertype' : row["outliertype"], 'type' : row["type"][:-1], 'url' : row["url"], 'timestamp' : row["timestamp"], 'comment' : row["comments"], 'min' : row["min"], 'q1' : row["q1"], 'median' : row["median"], 'q3' : row["q3"], 'max' : row["max"], 'value' : row["value"], 'thumb' : row["thumbs"], 'email' : row["email"], 'owner' : row["owner"], })
    result.close()
    return jsonify(events=events)


