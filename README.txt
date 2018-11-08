Department Management Portal (Department of English, BHU)


Department Management Portal is a management portal for Department of English, BHU. It gives you access to the informations related to Department of English and also permits you to have an account on the portal so that you can access all the informations related to you as well as the Department aside.

=========================================================================
CONTENTS
=========================================================================

*Requirements
*Quick start
*Documentation
*Package contents


=========================================================================
REQUIREMENTS
=========================================================================

Operating systems:	Linux
			Fedora
			Windows

Tested compilers:	 GCC 4.8.2 [python 2.7.6  on linux]

 For browsers, Google Chrome,Mozilla Firefox and Opera are preferrable

=========================================================================
QUICK START
=========================================================================

*For Linux, at the top-level directory,type the commands:
	
	mysql -u {user} -p {password}
	mysql> create database BHU;
	mysql> source db_dump.sql;
	mysql>exit;	
	python manage.py runserver

Go to browser and type "127.0.0.1:8080/" in the address bar.

Please read Documentation before going ahead.
 	-Try visiting the static pages of the portal by going to Important Notices link.

	-Try logging in with your username or password.
	
	-If not user, go to Sign Up.

	-And if forgot password, go to Forgot password.

	-For getting out of the session, you can click the Logout button.
 
 -For closing server, just quit the server with Ctrl+C.

=========================================================================
DOCUMENTATION
=========================================================================

Documentation can be found in the directory "doc". See PACKAGE CONTENTS for a detailed listing.


=========================================================================
PACKAGE CONTENTS
=========================================================================

README.txt					This file
manage.py					main file
templates/					templates(.html)
static/						static files(.css,.jpg)
res/						db dump
doc/Documentation.pdf				Formal Documentation 
Django Project/					source codes
department_management/				app source codes and migrations	

