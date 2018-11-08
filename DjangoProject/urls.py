"""DjangoProject URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from department_management.views import *

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^$',index,name='index'),
    url(r'^signin',signin,name='signin'),
    url(r'^signout',signout,name='signout'),
    url(r'^showcourse/(?P<name>.+)$',showcourse,name='showcourse'),
    url(r'^loginhelp',loginhelp,name='loginhelp'),
    url(r'^sup_fac',sup_fac,name='sup_fac'),
    url(r'^sup_stud',sup_stud,name='sup_stud'),
    url(r'^notice',notice,name='notice'),
    url(r'^add_new_courses',add_new_course,name='add_new_course'),
    url(r'^update',update,name='update'),
    url(r'^loginhelp',loginhelp,name='loginhelp'),
    url(r'^attendance',update_attendance,name='update_attendance'),
    url(r'^marks',update_marks,name='update_marks'),
    url(r'^show',show,name='show'),
    url(r'^stud_profile_update',stud_profile_update,name="stud_profile_upadte"),
    url(r'^fac_profile_update',fac_profile_update,name="fac_profile_upadte"),
    url(r'^faculties',show_faculties,name='show_faculties'),
    url(r'^courses',show_courses,name='show_courses'),
    url(r'^research',research,name='research'),
    url(r'^publications',publications,name='publications'),
    url(r'^events',events,name='events'),
    url(r'^contactus',contactus,name='contactus'),
]
