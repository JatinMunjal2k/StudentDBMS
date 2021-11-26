# Dependencies - Python, Flask, psycopg2

from flask import Flask, render_template, request, redirect
import psycopg2
import datetime
app = Flask(__name__, template_folder='pages')
db = psycopg2.connect(
    host="localhost",
    database="my_database",
    user="projectuser",
    password="Password")

admin_password = 'root'

@app.route('/')
def home_function():
    return render_template('main.html')
@app.route('/student_login', methods=['GET', 'POST'])
def student_login_function():

    if request.method=='POST':
        details = request.form

        if 'back' in details:
            return redirect('/')

        status = q_student_login(details)
        if status:
            return redirect('/student_home')
        else:
            return redirect('/student_404')

    return render_template('student_login.html')
@app.route('/student_home', methods=['GET', 'POST'])
def student_home_function():

    if request.method == 'POST':
        details = request.form
        global TABLE, TITLE, GRAPH
        TABLE = TITLE = []
        GRAPH = False
        start_time = datetime.datetime.now()
        if 'q1_submit' in details:
            q_2a(details)
        elif 'q2_submit' in details:
            q_2b(details)
        elif 'q3_submit' in details:
            q_2c(details)
        elif 'q4_submit' in details:
            q_2d(details)
            #global id_student
            #id_student = 0
            #return redirect('/student_login')            
            #return render_template('withdrawn.html')
        elif 'q6_submit' in details:
            q_2f(details)
        elif 'q7_submit' in details:
            q_2g(details)
        elif 'q9_submit' in details:
            q_4i(details)
        elif 'back' in details:
            global id_student
            id_student = 0
            return redirect('/student_login')
        #end_time = datetime.datetime.now()
        #time_diff = (end_time-start_time)
        #print("time - ",time_diff.total_seconds(),"rows : ",len(TABLE))
        return redirect('/student_result')

    return render_template('student_home.html')
@app.route('/student_result', methods=['GET', 'POST'])
def student_result_function():

    if request.method == 'POST':
        details = request.form

        if 'back' in details:
            return redirect('/student_home')

    return render_template('display.html', title=TITLE, table=TABLE, num_col=len(TABLE[0]) if len(TABLE) else 0)
@app.route('/student_404', methods=['GET', 'POST'])
def student_404_function():

    if request.method=='POST':
        return redirect('/student_login')

    return render_template('student_404.html')

@app.route('/professor_login', methods=['GET', 'POST'])
def professor_login_function():

    if request.method=='POST':
        details = request.form

        if 'back' in details:
            return redirect('/')

        status = q_professor_login(details)
        if status:
            return redirect('/professor_home')
        else:
            return redirect('/professor_404')

    return render_template('professor_login.html')
@app.route('/professor_home', methods=['GET', 'POST'])
def professor_home_function():

    if request.method == 'POST':
        details = request.form
        #print(details)
        global TABLE, TITLE, TABLE2, TITLE2,GRAPH,GRAPHTITLE,code_module, code_presentation
        TABLE = TITLE = TABLE2 = TITLE2 = []
        GRAPH = False
        GRAPHTITLE = ""
        if 'q1_submit' in details:
            q_3a(details)
        elif 'q2_submit' in details:
            q_3b(details)
        elif 'q3_submit' in details:
            q_3c(details)
        elif 'q4_submit' in details:
            #print(details)
            q_3d(details)
            GRAPH = True
            GRAPHTITLE = details['q4_category']
        elif 'q5_submit' in details:
            print("execute 3e")
            q_3e(details)
        elif 'q7_submit' in details:
            q_3g(details)
        elif 'q6_submit' in details:
            q_3f(details)
        elif 'q8_submit' in details:
            q_3h(details)
        elif 'q9_submit' in details:
            q_3i(details)
        elif 'q11_submit' in details:
            q_3k(details)
        elif 'q13_submit' in details:
            q_3m(details)
        elif 'q14_submit' in details:
            q_3n(details)
        elif 'q15_submit' in details:
            q_3o(details)
            #global code_module, code_presentation
            code_module = code_presentation = ""
            return redirect('/professor_login')
        elif 'back' in details:
            #global code_module, code_presentation
            code_module = code_presentation = ""
            return redirect('/professor_login')
        #end_time = datetime.datetime.now()
        #time_diff = (end_time-start_time)
        #print("time - ",time_diff.total_seconds(),"rows : ",len(TABLE), "table2", len(TABLE2))
        return redirect('/professor_result')

    return render_template('professor_home.html',code_module = code_module,code_presentation = code_presentation )
@app.route('/professor_result', methods=['GET', 'POST'])
def professor_result_function():

    if request.method == 'POST':
        details = request.form

        if 'back' in details:
            return redirect('/professor_home')
    if len(TABLE2):
        return render_template('display2.html', title=TITLE, table=TABLE, num_col=len(TABLE[0]) if len(TABLE) else 0, title2=TITLE2, table2=TABLE2, num_col2=len(TABLE2[0]) if len(TABLE2) else 0)
    elif(GRAPH):
        #print(TABLE)
        #GRAPH = False
        return render_template('display_chart2.html', title=TITLE, table=TABLE, num_col=len(TABLE[0]) if len(TABLE) else 0,graph_title = GRAPHTITLE)
    else:
        print("display display.html")
        return render_template('display.html', title=TITLE, table=TABLE, num_col=len(TABLE[0]) if len(TABLE) else 0)
@app.route('/professor_404', methods=['GET', 'POST'])
def professor_404_function():

    if request.method=='POST':
        return redirect('/professor_login')

    return render_template('professor_404.html')

@app.route('/admin_login', methods=['GET', 'POST'])
def admin_login_function():

    if request.method=='POST':
        details = request.form

        if 'back' in details:
            return redirect('/')

        status = q_admin_login(details)
        if status:
            return redirect('/admin_home')
        else:
            return redirect('/admin_404')

    return render_template('admin_login.html')
@app.route('/admin_home',methods=['GET', 'POST'])
def admin_home_function():

    if request.method == 'POST':
        details = request.form
        global TABLE, TITLE, TABLE2, TITLE2
        TABLE = TITLE = TABLE2 = TITLE2 = []
        start_time = datetime.datetime.now()
    
        if 'q1_submit' in details:
            q_4a(details)
        elif 'q2_submit' in details:
            q_4b(details)
        elif 'q3_submit' in details:
            q_4c(details)
        elif 'q5_submit' in details:
            q_4e(details)
        elif 'q6_submit' in details:
            q_4f(details)
        elif 'q6i_submit' in details:
            q_4fi(details)
        elif 'q9_submit' in details:
            q_4i(details)
        elif 'q10_submit' in details:
            q_4j(details)
        elif 'back' in details:
            return redirect('/admin_login')
        end_time = datetime.datetime.now()
        time_diff = (end_time-start_time)
        print("time - ",time_diff.total_seconds(),"rows : ",len(TABLE))
        return redirect('/admin_result')

    return render_template('admin_home.html',enroll_args=['code_module','code_presentation','id_student','gender','region','highest_education','imd_band','age_band','num_of_prev_attempts','studied_credits','disability'])
@app.route('/admin_result', methods=['GET', 'POST'])
def admin_result_function():

    if request.method == 'POST':
        details = request.form

        if 'back' in details:
            return redirect('/admin_home')

    if len(TABLE2):
        return render_template('display2.html', title=TITLE, table=TABLE, num_col=len(TABLE[0]) if len(TABLE) else 0, title2=TITLE2, table2=TABLE2, num_col2=len(TABLE2[0]) if len(TABLE2) else 0)
    else:
        return render_template('display.html', title=TITLE, table=TABLE, num_col=len(TABLE[0]) if len(TABLE) else 0)
@app.route('/admin_404', methods=['GET', 'POST'])
def admin_404_function():

    if request.method=='POST':
        return redirect('/admin_login')

    return render_template('admin_404.html')


def q_student_login(details):
    global id_student
    id_student = ""
    id_student = details['id_student']
    crs = db.cursor()
    query = open("./queries/student_login.sql").read().replace('argv[1]', id_student)
    crs.execute(query)
    table = crs.fetchall()
    crs.close()
    if len(table):
        return True
    else:
        return False
def q_professor_login(details):
    global code_module, code_presentation
    code_module = code_presentation = ""
    code_module = details['code_module']
    code_presentation = details['code_presentation']
    crs = db.cursor()
    query = open("./queries/professor_login.sql").read().replace('argv[1]', code_module).replace('argv[2]', code_presentation)
    crs.execute(query)
    table = crs.fetchall()
    crs.close()
    if len(table):
        return True
    else:
        return False
def q_admin_login(details):
    password = details['password']
    if password==admin_password:
        return True
    else:
        return False

def q_2a(details):
    crs = db.cursor()
    query = open("./queries/query_2a.sql").read().replace('argv[1]', id_student)
    crs.execute(query)
    global TABLE, TITLE
    TITLE = ['code_module','code_presentation','date_registration','date_unregistration']
    TABLE = crs.fetchall()
    crs.close()
def q_2b(details):
    crs = db.cursor()
    query = open("./queries/query_2b.sql").read().replace('argv[1]', id_student)
    crs.execute(query)
    global TABLE, TITLE
    TITLE = ['code_module','code_presentation','Total_assignment_marks','Grade']
    TABLE = crs.fetchall()
    crs.close()
def q_2c(details):
    code_module = details['q3_code_module']
    code_presentation = details['q3_code_presentation']
    crs = db.cursor()
    query = open("./queries/query_2c.sql").read().replace('argv[1]', id_student).replace('argv[2]', code_module).replace('argv[3]', code_presentation)
    #query = open("./queries/query_2c.sql").read().replace('argv[1]', code_module).replace('argv[2]', code_presentation)
    crs.execute(query)
    global TABLE, TITLE
    TITLE = ['assessment_type','id_assessment','score','date_submitted','deadline']
    TABLE = crs.fetchall()
    crs.close()
def q_2d(details):
    code_module = details['q4_code_module']
    code_presentation = details['q4_code_presentation']
    date_unregistration = details['q4_date_unregistration']
    crs = db.cursor()
    query = open("./queries/query_2d.sql").read().replace('argv[1]', id_student).replace('argv[2]', code_module).replace('argv[3]', code_presentation).replace('argv[4]', date_unregistration)
    crs.execute(query)
    global TABLE, TITLE
    TITLE = ['withdrawn successfully']
    #TABLE = crs.fetchall()
    db.commit()
    crs.close()
def q_2f(details):
    crs = db.cursor()
    query = open("./queries/query_2f.sql").read().replace('argv[1]', id_student)
    crs.execute(query)
    global TABLE, TITLE
    TITLE = ['gpa']
    TABLE = crs.fetchall()
    crs.close()
def q_2g(details):
    code_module = details['q7_code_module']
    code_presentation = details['q7_code_presentation']
    crs = db.cursor()
    query = open("./queries/query_2g.sql").read().replace('argv[1]', id_student).replace('argv[2]', code_module).replace('argv[3]', code_presentation)
    crs.execute(query)
    global TABLE, TITLE
    TITLE = ['rank']
    TABLE = crs.fetchall()
    crs.close()

def q_3a(details):
    category = details['q1_category']
    crs = db.cursor()
    query = open("./queries/query_3a.sql").read().replace('argv[1]', code_module).replace('argv[2]', code_presentation).replace('argv[3]', category)
    crs.execute(query)
    global TABLE, TITLE
    TITLE = ['id_student','gender','region','highest_education','imd_band','age_band','num_of_prev_attempts','studied_credits','disability','final_result']
    TABLE = crs.fetchall()
    crs.close()
def q_3b(details):
    category = details['q2_category']
    crs = db.cursor()
    query = open("./queries/query_3b.sql").read().replace('argv[1]', code_module).replace('argv[2]', code_presentation).replace('argv[3]', category)
    crs.execute(query)
    global TABLE, TITLE
    TITLE = ['id_student','gender','region','highest_education','imd_band','age_band','num_of_prev_attempts','studied_credits','disability','final_result']
    TABLE = crs.fetchall()
    crs.close()
def q_3c(details):
    category = details['q3_category1']
    value = details['q3_category2']
    order = details['q3_category3']
    crs = db.cursor()
    query = open("./queries/query_3c.sql").read().replace('argv[1]', code_module).replace('argv[2]', code_presentation).replace('argv[3]', category).replace('argv[4]', value).replace('argv[5]', order)
    crs.execute(query)
    global TABLE, TITLE
    TITLE = ['id_student','gender','region','highest_education','imd_band','age_band','num_of_prev_attempts','studied_credits','disability','final_result']
    TABLE = crs.fetchall()
    crs.close()
def q_3d(details):
    category = details['q4_category']
    crs = db.cursor()
    query = open("./queries/query_3d.sql").read().replace('argv[1]', code_module).replace('argv[2]', code_presentation).replace('argv[3]', category)
    crs.execute(query)
    global TABLE, TITLE
    TITLE = [f"{category}",'count']
    TABLE = crs.fetchall()
    crs.close()
def q_3e(details):
    id_assessment = details['q5_id_assessment']
    crs = db.cursor()
    query = open("./queries/query_3e.sql").read().replace('argv[1]', code_module).replace('argv[2]', code_presentation).replace('argv[3]', id_assessment)
    crs.execute(query)
    global TABLE, TITLE
    TITLE = ['id_student','is_banked','date_submitted','days_late','score']
    TABLE = crs.fetchall()
    crs.close()
def q_3f(details):
    id_student = details['q6_id_student']
    crs = db.cursor()
    query = open("./queries/query_3f.sql").read().replace('argv[1]', code_module).replace('argv[2]', code_presentation).replace('argv[3]', id_student)
    crs.execute(query)
    global TABLE, TITLE
    TITLE = ['id_assessment','id_student','date_submitted','is_banked','score','last_date','weightage','assessment_type']
    TABLE = crs.fetchall()
    crs.close()
def q_3g(details):
    crs = db.cursor()
    query = open("./queries/query_3g.sql").read().replace('argv[1]', code_module).replace('argv[2]', code_presentation)
    crs.execute(query)
    global TABLE, TITLE
    TITLE = ['id_student','total_marks']
    TABLE = crs.fetchall()
    crs.close()
def q_3h(details):
    id_site = details['q8_id_site']
    crs = db.cursor()
    query = open("./queries/query_3h.sql").read().replace('argv[1]', code_module).replace('argv[2]', code_presentation)
    crs.execute(query)
    global TABLE, TITLE
    TITLE = ['id_assessment','date','assessment_type']
    TABLE = crs.fetchall()
    crs.close()

    crs = db.cursor()
    query = open("./queries/query_3h2.sql").read().replace('argv[1]', code_module).replace('argv[2]', code_presentation).replace('argv[3]', id_site)
    crs.execute(query)
    global TABLE2, TITLE2
    TITLE2 = ['id_site','date','avg_sum_clicks','date','avg_sum_clicks']
    TABLE2 = crs.fetchall()
    crs.close()
def q_3i(details):
    crs = db.cursor()
    query = open("./queries/query_3i.sql").read().replace('argv[1]', code_module).replace('argv[2]', code_presentation)
    crs.execute(query)
    global TABLE, TITLE
    TITLE = ['id_assessment','student id','date_submitted','late by','score']
    TABLE = crs.fetchall()
    crs.close()
def q_3k(details):
    tma = details['q11_tma']
    cma = details['q11_cma']
    exam = details['q11_exam']
    crs = db.cursor()
    query = open("./queries/query_3k.sql").read().replace('argv[1]', code_module).replace('argv[2]', code_presentation).replace('argv[3]', tma).replace('argv[4]', cma).replace('argv[5]', exam)
    crs.execute(query)
    global TABLE, TITLE
    TITLE = ['id_student']
    TABLE = crs.fetchall()
    crs.close()

def q_3m(details):
    code_module_new = details['q13_code_module']
    code_presentation_new = details['q13_code_presentation']
    duration_new = details['q13_duration']
    crs = db.cursor()
    query = open("./queries/query_3m.sql").read().replace('argv[1]', code_module_new).replace('argv[2]', code_presentation_new).replace('argv[3]', duration_new)
    crs.execute(query)
    # global TABLE, TITLE
    #print(details)
    #print("in 3m  course added")
    #TITLE = ['id_student','total_marks']
    # TABLE = crs.fetchall()
    db.commit()
    crs.close()
def q_3n(details):
    id_assessment = details['q14_id_assessment']
    assessment_type = details['q14_assessment_type']
    date = details['q14_date']
    weight = details['q14_weight']
    crs = db.cursor()
    query = open("./queries/query_3n.sql").read().replace('argv[1]', code_module).replace('argv[2]', code_presentation).replace('argv[3]', id_assessment).replace('argv[4]', assessment_type).replace('argv[5]', date).replace('argv[6]', weight)
    crs.execute(query)
    # global TABLE, TITLE
    # TITLE = ['id_student','total_marks']
    # TABLE = crs.fetchall()
    db.commit()
    crs.close()
def q_3o(details):
    crs = db.cursor()
    query = open("./queries/query_3o.sql").read().replace('argv[1]', code_module).replace('argv[2]', code_presentation)
    crs.execute(query)
    # global TABLE, TITLE
    # TITLE = ['id_student','total_marks']
    # TABLE = crs.fetchall()
    db.commit()
    crs.close()

def q_4a(details):
    crs = db.cursor()
    query = open("./queries/query_4a.sql").read()
    crs.execute(query)
    global TABLE, TITLE
    TITLE = ['code_module','code_presentation','count']
    TABLE = crs.fetchall()
    crs.close()
def q_4b(details):
    category = details['q2_category']
    crs = db.cursor()
    query = open("./queries/query_4b.sql").read().replace('argv[1]', category)
    crs.execute(query)
    global TABLE, TITLE
    TITLE = ['code_module', 'code_presentation',f"{category}",'count']
    TABLE = crs.fetchall()
    crs.close()
def q_4c(details):
    crs = db.cursor()
    query = open("./queries/query_4c.sql").read()
    crs.execute(query)
    global TABLE, TITLE
    TITLE = ['id_student','credits_registered','studied_credits']
    TABLE = crs.fetchall()
    crs.close()
def q_4e(details):
    final_result = details['q5_final_result']
    crs = db.cursor()
    query = open("./queries/query_4e.sql").read().replace('argv[1]', final_result)
    crs.execute(query)
    global TABLE, TITLE
    TITLE = ['code_module','code_presentation','percentage']
    TABLE = crs.fetchall()
    crs.close()
def q_4f(details):
    crs = db.cursor()
    query = open("./queries/query_4f.sql").read()
    crs.execute(query)
    global TABLE, TITLE
    TITLE = ['code_module','code_presentation','pass percentage']
    TABLE = crs.fetchall()
    crs.close()
def q_4fi(details):
    cutoff = details['q6i_cutoff']
    crs = db.cursor()
    query = open("./queries/query_4fi.sql").read().replace('argv[1]', cutoff)
    crs.execute(query)
    global TABLE, TITLE
    TITLE = ['code_module','code_presentation','Num of students']
    TABLE = crs.fetchall()
    crs.close()
def q_4i(details):
    crs1 = db.cursor()
    query = open("./queries/query_4i_check.sql").read().replace('argv[1]',details["q9_1"]).replace('argv[2]',details["q9_2"]).replace('argv[3]',details["q9_3"])
    crs1.execute(query)
    table = crs1.fetchall()
    #print(table)
    if(len(table)):
        global TITLE
        TITLE = ['Student already enrolled']
        return
    crs1.close()
    crs = db.cursor()
    query = open("./queries/query_4i.sql").read()
    #query = query.replace(f"argv[1]", details[f"q9_1"])
    #query = query.replace(f"argv[2]", details[f"q9_2"])
    #query = query.replace(f"argv[3]", id_student)

    for i in range(1,13):
        query = query.replace(f"argv[{i}]", details[f"q9_{i}"])
    crs.execute(query)
    #global TABLE, TITLE
    #TITLE = ['code_module','code_presentation','count']
    #TABLE = crs.fetchall()
    db.commit()
    crs.close()
def q_4j(details):
    crs = db.cursor()
    query = open("./queries/query_4j.sql").read()
    crs.execute(query)
    global TABLE, TITLE
    TITLE = ['Operation','Date and time','Code-module','code_presentation','Duration']
    TABLE = crs.fetchall()
    db.commit()
    crs.close()
if (__name__ == '__main__'):
	app.run(port=5031, debug=False)
