from django.conf.urls import url
from temp import views

urlpatterns=[
    url('home/',views.home),
    url('admin/',views.admin_home),
    url('counsellor/',views.counsellor_home),
    url('student/',views.student_home),
    url('about/',views.about),
    url('admin_view/', views.admin_view),
    url('student_view/', views.student_view),
    url('counsellor_view/', views.student_view),
    url('login/', views.login),
]