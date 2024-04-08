from flask import Flask, render_template, request
import mysql.connector

app = Flask(__name__)

# MySQL database connection
db = mysql.connector.connect(
    host="localhost",
    user="username",
    password="password",
    database="app_database"
)

cursor = db.cursor()

# Routes
@app.route('/')
def login():
    return render_template('login.html')

@app.route('/login', methods=['POST'])
def login_post():
    username = request.form['username']
    email = request.form['email']
    age = request.form['age']
    user_id = request.form['id']

    # Insert login data into MySQL database
    sql = "INSERT INTO logins (username, email, age, user_id) VALUES (%s, %s, %s, %s)"
    val = (username, email, age, user_id)
    cursor.execute(sql, val)
    db.commit()

    return "Login successful! Data recorded in database."

if __name__ == '__main__':
    app.run(debug=True)
