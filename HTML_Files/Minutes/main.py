from flask import Flask, render_template, redirect, url_for, request










app = Flask(__name__)


app.config['debug']=True
logon=False
usrnm=''


# Landing Page Route
@app.route('/home', methods=['POST', 'GET'])
@app.route('/', methods=['POST', 'GET'])
def home():
    return render_template('base.html')

# Minutes Page Route
@app.route('/minutes', methods=['POST', 'GET'])
@app.route('/minutes/logistics', methods=['POST', 'GET'])
def minutes():
    return render_template('min_logistics.html')

#Minutes/Logistics/Detail route
@app.route('/minutes/logistics/details', methods=['POST', 'GET'])
def minutesLogisticsDetails():
    return render_template('min_logistics_details2.html')

#Minutes/Logistics/Welcome route
@app.route('/minutes/logistics/welcome', methods=['POST', 'GET'])
def minutesLogisticsWelcome():
    return render_template('min_logistics_welcome.html')

#Minutes/Logistics/Welcome route
@app.route('/minutes/logistics/topics', methods=['POST', 'GET'])
def minutesLogisticsTopics():
    return render_template('min_logistics_topics.html')

#Minutes Topic Page route
@app.route('/minutes/topics', methods=['POST', 'GET'])
def minutesTopics():
    return render_template('min_topics.html')

app.run(port='5001', debug=True)