from django.shortcuts import render,redirect
from django.http import HttpResponse
import MySQLdb as mdb
import hashlib

db=mdb.connect('localhost','root','babkr1744','BHU')
cur=db.cursor()

#Function to render to respective home pages
def index(request):
    if 'student' in request.session:
        cur.execute('select * from Student where (Username=%s);',(request.session['student']))
        details=list(cur.fetchall())
        name=details[1]
        return render(request,'stud_home.html',{'stud_name':name})

    if 'faculty' in request.session:
        cur.execute('select * from Faculty where (Username=%s);',(request.session['faculty'], ))
        details=list(cur.fetchall())
        name=details[1]
        return render(request,'fac_home.html',{'fac_name':name})

    return render(request,'home.html')

#Function to verify credentials and render to respective home pages
def signin(request):
    if 'student' in request.session:
        cur.execute('select * from Student where (Username=%s);',(request.session['student'],))
        details=list(cur.fetchall())
        name=details[1]
        return render(request,'stud_home.html',{'stud_name':name})

    if 'faculty' in request.session:
        cur.execute('select * from Faculty where (Username=%s);',(request.session['faculty'], ))
        details=list(cur.fetchall())
        name=details[1]
        return render(request,'fac_home.html',{'fac_name':name})

    name = request.POST['username']
    pw=request.POST['password']
    pw=hashlib.sha1(pw.encode('utf8')).hexdigest()
    cur.execute('select * from Login_details where Username=%s',(name,))
    password=list(cur.fetchall())
    if len(password)==0 :
        return HttpResponse("Invalid User")
    password=str(password[0][1])
    if(pw!=password):
        return HttpResponse("Wrong Password")

    cur.execute('select * from Faculty;')
    details=cur.fetchall()
    fac_users=[facs[1] for facs in details]
    if name in fac_users:
        request.session['faculty']=name
        cur.execute('select * from Faculty where Username=%s',(name,))
        fac_details=list(cur.fetchall())
        fac_details=fac_details[0]
        id=str(fac_details[0])
        fac_name=str(fac_details[2])
        cur.execute('select distinct Name from teaches INNER JOIN Course on teaches.Course_id=Course.Course_id where (ID=%s)',(id,))
        courses=list(cur.fetchall())
        courses=[course[0] for course in courses]
        return  render(request,'fac_home.html',{'fac_name':fac_name,'courses':courses})

    cur.execute('select * from Student;')
    details=cur.fetchall()
    stud_users=[studs[1] for studs in details]
    if name in stud_users:
        request.session['student']=name
        cur.execute('select * from Student where Username=%s',(name,))
        stud_details=list(cur.fetchall())
        stud_details=stud_details[0]
        roll=str(stud_details[0])
        gender=str(stud_details[2])
        email=str(stud_details[3])
        cur.execute('select distinct Name from attends INNER JOIN Course on attends.Course_id=Course.Course_id where (Roll=%s)',(roll,))
        courses=list(cur.fetchall())
        courses=[course[0] for course in courses]
        return  render(request,'stud_home.html',{'stud_name':name,'courses':courses,'gender':gender,'email':email})

    return HttpResponse("Invalid user")

#Function to logout and redirect to home pages
def signout(request):
    if 'student' in request.session:
        del request.session['student']
    if 'faculty' in request.session:
        del request.session['faculty']
    return redirect(index)

#Function to go to respective pages of courses enrolled/teaching
def showcourse(request,name):
    if 'student' in request.session:
        cur.execute('select * from Course where Name=%s',(name,))
        courses=cur.fetchall()[0]
        course_id=str(courses[0])
        return render(request,'course_enrolled.html',{'cname':name,'id':course_id})

    if 'faculty' in request.session:
        cur.execute('select * from Course where Name=%s',(name,))
        courses=cur.fetchall()[0]
        course_id=courses[0]
        return render(request,'course_teaching.html',{'cname':name,'id':course_id})

#Function to help login if forgot password
def loginhelp(request):
    if request.method=='POST':
        username=request.POST['username']
        oldpass=request.POST['opassword']
        newpass=request.POST['npassword']
        conpass=request.POST['cpassword']
        oldpass=hashlib.sha1(oldpass.encode('utf8')).hexdigest()
        newpass=hashlib.sha1(newpass.encode('utf8')).hexdigest()
        conpass=hashlib.sha1(conpass.encode('utf8')).hexdigest()
        cur.execute('select * from Login_details where Username=%s',(username,))
        password=list(cur.fetchall())
        password=password[0][1]
        if password==oldpass and newpass==conpass:
            with db:
                cur.execute('update Login_details set Paswsword=%s where Username=%s',(newpass,username,))
        return redirect(index)
    return render(request,'forgot_password.html')

#Function to sign up for faculty
def sup_fac(request):
    if request.method=='POST':
        name=request.POST['name']
        username=request.POST['username']
        password=request.POST['password']
        password=hashlib.sha1(password.encode('utf8')).hexdigest()
        fac_id=request.POST['fac_id']
        with db:
            cur.execute('insert into Login_details values(%s,%s)',(username,password,))
            cur.execute('insert into Faculty values(%s,%s,%s)',(fac_id,username,name,))
    return render(request,'signup_fac.html')

#Function to sign up for student
def sup_stud(request):
     if request.method=='POST':
        firstname=request.POST['firstname']
        midname=request.POST['midname']
        lastname=request.POST['lastname']
        username=request.POST['username']
        gender=request.POST['gender']
        roll=request.POST['roll']
        email=request.POST['email']
        password=request.POST['password']
        password=hashlib.sha1(password.encode('utf8')).hexdigest()
        roll=request.POST['roll']
        with db:
            cur.execute('insert into Login_details values(%s,%s)',(username,password,))
            cur.execute('insert into Student values(%s,%s,%s,%s,%s,%s,%s,%s)',(roll,username,gender,email,firstname,midname,lastname,))
     return render(request,'signup_stud.html')

#Function to render to Notice page
def notice(request):
    cur.execute('select * from Notice')
    notices=list(cur.fetchall())
    return render(request,'notices.html',{'notices':notices})

#Function to add new course by faculty
def add_new_course(request):
    if 'faculty' in request.session and request.method=='POST':
        courseid=request.POST['courseid']
        semester=request.POST['semester']
        c=request.POST['class']
        cur.execute('select * from Faculty where Username=%s',(request.session['faculty'],))
        ids=list(cur.fetchall())
        id=str(ids[0][0])
        with db:
            cur.execute('insert into Class values(%s,%s,%s)',(c,courseid,semester,))
            query='insert into teaches values(%s,%s,%s,%s)'%(id,c,courseid,semester)
            cur.execute(query)
    return render(request,'add_new_course.html')

#Function to show marks of student
def show(request):
    if request.method=='POST' and 'student' in request.session:
        courseid=request.POST['courseid']
        classid=request.POST['classid']
        semester=request.POST['semester']
        cur.execute('select * from Student where Username=%s',(request.session['student']))
        rolls=list(cur.fetchall())
        roll=str(rolls[0][0])
        cur.execute('select * from attends where Roll=%s and Class_id=%s and Course_id=%s and Semester=%s',(roll,classid,courseid,semester,))
        det=list(cur.fetchall())
        att=str(det[0][4])
        pt1m=str(det[0][5])
        pt2m=str(det[0][6])
        esm=str(det[0][7])
        return render(request,'display.html',{'att':att,'pt1m':pt1m,'pt2m':pt2m,'esm':esm})

#Function to update profile of student
def stud_profile_update(request):
    if request.method=='POST' and 'student' in request.session:
        username=request.POST['username']
        oldpass=request.POST['opassword']
        newpass=request.POST['npassword']
        conpass=request.POST['cpassword']
        oldpass=hashlib.sha1(oldpass.encode('utf8')).hexdigest()
        newpass=hashlib.sha1(newpass.encode('utf8')).hexdigest()
        conpass=hashlib.sha1(conpass.encode('utf8')).hexdigest()
        cur.execute('select * from Login_details where Username=%s',(username,))
        password=list(cur.fetchall())
        password=password[0][1]
        if password==oldpass and newpass==conpass:
            with db:
                cur.execute('update Login_details set Paswsword=%s where Username=%s',(newpass,username,))
        return redirect(index)
    return render(request,'stud_profile_update.html')

#Function to update profile of faculty
def fac_profile_update(request):
    if request.method=='POST' and 'faculty' in request.session:
        username=request.POST['username']
        oldpass=request.POST['opassword']
        newpass=request.POST['npassword']
        conpass=request.POST['cpassword']
        oldpass=hashlib.sha1(oldpass.encode('utf8')).hexdigest()
        newpass=hashlib.sha1(newpass.encode('utf8')).hexdigest()
        conpass=hashlib.sha1(conpass.encode('utf8')).hexdigest()
        cur.execute('select * from Login_details where Username=%s',(username,))
        password=list(cur.fetchall())
        password=password[0][1]
        if password==oldpass and newpass==conpass:
            with db:
                cur.execute('update Login_details set Paswsword=%s where Username=%s',(newpass,username,))
        return redirect(index)
    return render(request,'fac_profile_update.html')

#Function to render to faculties page
def show_faculties(request):
    cur.execute('select * from Faculty')
    faculties=list(cur.fetchall())
    faculties=[faculty[2] for faculty in faculties]
    return render(request,'faculty.html',{'faculties':faculties})

#Function to render to courses page
def show_courses(request):
    cur.execute('select * from Course')
    courses=list(cur.fetchall())
    courses=[course[1] for course in courses]
    return render(request,'course.html',{'courses':courses})

#Function to render to research page
def research(request):
    return render(request,'research.html')

#Function to render to publications page
def publications(request):
    return render(request,'publications.html')

#Functions to event page
def events(request):
    return render(request,'events.html')

#Functions to contactus page
def contactus(request):
    return render(request,'contactus.html')

#Function to render to update attendance/marks page
def update(request):
    if request.method=='POST' and 'faculty' in request.session:
        opt=request.POST['opt']
        course_id=request.POST['courseid']
        classid=request.POST['classid']
        semester=request.POST['semester']
        cur.execute('select * from attends where Class_id=%s and Course_id=%s and Semester=%s',(classid,course_id,semester,))
        studs=list(cur.fetchall())
        studs=[stud[0] for stud in studs]

        if opt=='Attendance':
            return render(request,'update_attendance.html',{'studs':studs,'classid':classid,'course_id':course_id,'semester':semester})

        if opt=='Marks':
            return render(request,'update_marks.html',{'studs':studs,'classid':classid,'course_id':course_id,'semester':semester})

    return render(request,'update.html')

#Function to update attendance
def update_attendance(request):
    if request.method=='POST' and 'faculty' in request.session:
        course_id=request.POST['courseid']
        classid=request.POST['classid']
        semester=request.POST['semester']
        cur.execute('select * from attends where Class_id=%s and Course_id=%s and Semester=%s',(classid,course_id,semester,))
        studs=list(cur.fetchall())
        studs=[stud[0] for stud in studs]
        inputs=[request.POST['stud'+str(i)] for i in range(1,len(studs)+1)]
        with db:
            for i in range(len(studs)):
                cur.execute('update attends set Attendance=%s where Roll=%s and Class_id=%s and Course_id=%s and Semester=%s',(inputs[i],studs[i],classid,course_id,semester,))
        return HttpResponse('Updated')
    return render(request,'update_attendance.html')

#Function to update marks
def update_marks(request):
    if request.method=='POST' and 'faculty' in request.session:
        course_id=request.POST['courseid']
        classid=request.POST['classid']
        semester=request.POST['semester']
        cur.execute('select * from attends where Class_id=%s and Course_id=%s and Semester=%s',(classid,course_id,semester,))
        studs=list(cur.fetchall())
        studs=[stud[0] for stud in studs]
        inputs1=[request.POST['stud'+str(i)] for i in range(1,len(studs)+1)]
        inputs2=[request.POST['tuds'+str(i)] for i in range(1,len(studs)+1)]
        inputs3=[request.POST['udst'+str(i)] for i in range(1,len(studs)+1)]
        with db:
            for i in range(len(studs)):
                cur.execute('update attends set PT1_marks=%s,PT2_marks=%s,EndSem_marks=%s where Roll=%s and Class_id=%s and Course_id=%s and Semester=%s',(inputs1[i],inputs2[i],inputs3[i],studs[i],classid,course_id,semester,))
        return HttpResponse('Updated')
    return render(request,'update_marks.html')