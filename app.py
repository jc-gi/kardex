#app.py System of kardex
"""
Author: Juan Carlos Gonzalez Ibarra
Date: 04/05/2021
Language: Python
Framework; Flask
Database: MySql
Editor: VS Code
"""
from flask import Flask
from flask import render_template, request, redirect, url_for, flash, session
from flaskext.mysql import MySQL
from datetime import date, datetime, timedelta
import pymysql
import re
#from datetime import datetime

app = Flask(__name__, template_folder='students')  # still relative to module

app.secret_key="jc-gi"
##cONNECTION OF DATABASES#
mysql=MySQL()
app.config['MYSQL_DATABASE_HOST']='localhost'
app.config['MYSQL_DATABASE_USER']='phpmyadmin'
app.config['MYSQL_DATABASE_PASSWORD']='mxlinux'
app.config['MYSQL_DATABASE_DB']='school'
mysql.init_app(app)

###MODULE OF INDEX OH THE WEB
@app.route('/')
def index():
    sql="SELECT * FROM student"
    conn=mysql.connect()
    cursor=conn.cursor()
    cursor.execute(sql)
    student=cursor.fetchone()            
    conn.commit()
    # Check if user is loggedin
    if 'loggedin' in session:
        
        # User is loggedin show them the home page
        return render_template('home.html', student = student, username=session['username'], )
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))
    ###LOGIN###
    #return render_template('home.html',student=student)

@app.route('/login', methods=['GET', 'POST'])
def login():
 # connect
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    # Output message if something goes wrong...
    msg = ''
    # Check if "username" and "password" POST requests exist (user submitted form)
    if request.method == 'POST' and 'username' in request.form and 'password' in request.form:
        # Create variables for easy access
        username = request.form['username']
        password = request.form['password']
        # Check if account exists using MySQL
        cursor.execute('SELECT * FROM accounts WHERE username = %s AND password = %s', (username, password))
        # Fetch one record and return result
        account = cursor.fetchone()
   
    # If account exists in accounts table in out database
        if account:
            # Create session data, we can access this data in other routes
            session['loggedin'] = True
            session['id'] = account['id']
            session['username'] = account['username']
            # Redirect to home page
            #return 'Logged in successfully!'
            return redirect(url_for('index'))
        else:
            # Account doesnt exist or username/password incorrect
            msg = 'Incorrect username/password!'
    
    return render_template('index.html', msg=msg)

##this will be the registration page
@app.route('/register', methods=['GET', 'POST'])
def register():
     return render_template('register.html', msg=msg)

##LOGOUT OF THE SYSTEM
@app.route('/logout')
def logout():
    # Remove session data, this will log the user out
   session.pop('loggedin', None)
   session.pop('id', None)
   session.pop('username', None)
   # Redirect to login page
   return redirect(url_for('login'))

##DELETE THE REGISTER OF TABLE STUDENTS
@app.route('/destroy/<int:id>')
def destroy(id):

    conn=mysql.connect()
    cursor=conn.cursor()
    cursor.execute("DELETE from student WHERE student_id=%s",(id));
    conn.commit()

    return redirect('/')


##MODULE TO EDIT THE DATA OF STUDENT
@app.route('/edit/<int:id>')
def edit(id):

    #declarated conexion with differents tables   
    conn=mysql.connect()
    cursor=conn.cursor()
    cursor2=conn.cursor()
    cursor3=conn.cursor()
    cursor4=conn.cursor()
    #execute the query for obtain data of all tables
    cursor.execute("SELECT * FROM student WHERE student_id=%s",(id))
    cursor2.execute("SELECT * FROM addres WHERE student_id=%s",(id))
    cursor3.execute("SELECT * FROM email WHERE student_id=%s",(id))
    cursor4.execute("SELECT * FROM phone WHERE student_id=%s",(id))
    student=cursor.fetchall()
    addres=cursor2.fetchall()
    email=cursor3.fetchall()
    phone=cursor4.fetchall()
    #send the information
    conn.commit()
    
    
    return render_template('edit.html', student=student, addres=addres, email = email, phone= phone)

@app.route('/update', methods=['POST'])
def update():
    
    #use this declaration for assign the date to updated_on
    date_id = datetime.now().date() + timedelta(days=1)
    
    #_student_id=request.form['txtStudent_id']
    #.............STUDENT TABLE..............#
    _student_id=request.form['txtStudent_id']
    _first_name=request.form['txtFirst_name']
    _middle_name=request.form['txtMiddle_name']
    _last_name=request.form['txtLast_name']
    _gender=request.form['txtGender']
    
    
    #...Table Addres.........................#
    _address_line=request.form['txtAddress_line']
    _city=request.form['txtCity']
    _zip=request.form['txtZip']
    _state=request.form['txtState']
    
    #...Table Email.........................#
    _email=request.form['txtEmail']
    _email_type=request.form['txtEmail_type']
    
    #...Table Phone.........................#
    _phone=request.form['txtPhone']
    _phone_type=request.form['txtPhone_type']
    _country_code=request.form['txtCountry_code']
    _area_code=request.form['txtArea_code']
   
  
    
    #sql = "UPDATE student SET last_name=%s, middle_name=%s, first_name=%s, gender= %s, updated_on = %s  WHERE student_id = %s;"
    #sql = "UPDATE student SET last_name=%s, middle_name=%s, first_name=%s, gender= %s, created_on= %s, updated_on = %s  WHERE student_id = %s;"
    
    update_student = "UPDATE student SET last_name=%s, middle_name=%s, first_name=%s, gender= %s, updated_on=%s  WHERE student_id = %s;"
               
        
    update_address = "UPDATE addres SET address_line=%s, city=%s, zip=%s, states=%s WHERE student_id = %s;"
              
    update_email = "UPDATE email SET email=%s, email_type=%s, updated_on=%s WHERE student_id = %s;"
    
    update_phone = "UPDATE phone SET phone=%s, phone_type=%s, country_code=%s, area_code=%s, updated_on=%s WHERE student_id = %s;"

    data1=(_last_name,_middle_name,_first_name,_gender,date_id,_student_id)
        
    data2=(_address_line, _city, _zip , _state, _student_id)
        
    data3 = ( _email, _email_type, date_id, _student_id)
        
    data4 =(_phone, _phone_type, _country_code, _area_code, date_id, _student_id)
       
    conn=mysql.connect()
    cursor=conn.cursor()
    cursor.execute(update_student, data1)
    cursor.execute(update_address, data2)
    cursor.execute(update_email,data3)
    cursor.execute(update_phone, data4)
    conn.commit()
    
    return redirect('/')


@app.route('/create')
def create():
    return render_template('create.html')

@app.route('/store', methods=['POST'])
def store():
    
    
    conn=mysql.connect()
    cursor=conn.cursor()
    
    date_id = datetime.now().date() + timedelta(days=1)
    
    #_student_id=request.form['txtStudent_id']
    
    #...Table Student..........................#
    _first_name=request.form['txtFirst_name']
    _middle_name=request.form['txtMiddle_name']
    _last_name=request.form['txtLast_name']
    _gender=request.form['txtGender']
    #_created_on=request.form['txtCreated_on']
    #_updated_on=request.form['txtUpdated_on']
    
    #_address_id=request.form['txtAddress_id']# variable se le asigna automaticamente la clave
    #...Table Addres.........................#
    _address_line=request.form['txtAddress_line']
    _city=request.form['txtCity']
    _zip=request.form['txtZip']
    _state=request.form['txtState']
    
    #...Table Email.........................#
    _email=request.form['txtEmail']
    _email_type=request.form['txtEmail_type']
    
    #...Table Phone.........................#
    _phone=request.form['txtPhone']
    _phone_type=request.form['txtPhone_type']
    _country_code=request.form['txtCountry_code']
    _area_code=request.form['txtArea_code']
    
    if (_first_name=='' or _middle_name=='' or _last_name=='' 
    or _gender=='' or _address_line=='' or _city=='' or _zip=='' or _state==''
    or _email== '' or _email_type==0 
    or _phone=='' or _phone_type=='' or _country_code=='' or _area_code==''):
        flash('Remember complete data in the fields')
        return redirect(url_for('create'))

    add_student = ("INSERT INTO student "
               "( last_name, middle_name, first_name,  gender, created_on, updated_on) "
               "VALUES (%s, %s, %s, %s, %s, %s)")
        
    add_address = ("INSERT INTO addres "
              "(student_id, address_id, address_line , city, zip, states) "
              "VALUES (%s, %s, %s, %s, %s, %s)")
    
    add_email = ("INSERT INTO email "
                 "( email, student_id, email_type , created_on, updated_on)"
                 "VALUES (%s, %s, %s, %s, %s)")
    
    add_phone = ("INSERT INTO phone "
                 "( phone_id, student_id, phone, phone_type, country_code, area_code, created_on, updated_on)"
                 "VALUES (%s, %s, %s, %s, %s, %s, %s, %s)")
    
    
    data1=(_last_name,_middle_name,_first_name,_gender,date_id,date_id)
    cursor.execute(add_student, data1)
    student_id = cursor.lastrowid
    address_id = cursor.lastrowid
    phone_id = cursor.lastrowid

    data2=( address_id, student_id, _address_line, _city, _zip , _state)
    cursor.execute(add_address, data2)
    #try to check string with regular expression
    data3 = ( _email, student_id, _email_type, date_id, date_id)
    cursor.execute(add_email,data3)
    """
    if not re.match(r'[^@]+@[^@]+\.[^@]+', _email):
            msg = 'Invalid email address!'
    else:
    """ 
        
    data4 =(phone_id, student_id, _phone, _phone_type, _country_code, _area_code, date_id, date_id)
    cursor.execute(add_phone, data4)
    conn.commit()
    
    return redirect('/')

@app.route('/', methods=['GET', 'POST'])
def search():
 # connect
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    cursor2 = conn.cursor(pymysql.cursors.DictCursor)
    cursor3 = conn.cursor(pymysql.cursors.DictCursor)
    cursor4 = conn.cursor(pymysql.cursors.DictCursor)
    print("El valor de id en edit es: ", id)

    # Output message if something goes wrong...
    msg = ''
    # Check if "username" and "password" POST requests exist (user submitted form)
    if request.method == 'POST' and 'student_id' in request.form:# and 'password' in request.form:
        # Create variables for easy access
        student_id = request.form['student_id']
        #password = request.form['password']
        # Check if account exists using MySQL
        cursor.execute("SELECT * FROM student WHERE student_id=%s",(student_id))
        cursor2.execute("SELECT * FROM addres WHERE student_id=%s",(student_id))
        cursor3.execute("SELECT * FROM email WHERE student_id=%s",(student_id))
        cursor4.execute("SELECT * FROM phone WHERE student_id=%s",(student_id))
        #cursor.execute('SELECT * FROM accounts WHERE username = %s AND password = %s', (username, password))
        # Fetch one record and return result
        student = cursor.fetchone()
        addres = cursor2.fetchone()
        email = cursor3.fetchone()
        phone = cursor4.fetchone()
        

    # If account exists in accounts table in out database
        if student:
            # Create session data, we can access this data in other routes
            session['loggedin'] = True
            session['student_id'] = student['student_id']
            session['first_name'] = student['first_name']
            # Redirect to home page
            #return 'Logged in successfully!'
            print('\n')
            print(id)
            print('\n')
            #return redirect(url_for('index'))
            return render_template('profile.html', student=student, addres=addres, email=email, phone=phone)
            
        else:
            # Account doesnt exist or username/password incorrect
            msg = 'Incorrect ID Student'

    return render_template('home.html', msg=msg)

@app.route('/list')
def lists():

    sql="SELECT * FROM student"
    conn=mysql.connect()
    cursor=conn.cursor()
    cursor.execute(sql)
    
    student=cursor.fetchall()
    print(student)
    
    conn.commit()

    return render_template('lists.html',student=student)

if __name__== '__main__':
    app.run('0.0.0.0', '5000',debug=True)
    