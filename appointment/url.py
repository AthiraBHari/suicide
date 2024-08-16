from django.conf.urls import url
from appointment import views

urlpatterns=[
    url('post_appointment/', views.post_appointment),
    url('view_appointment/', views.view_appointment),
    url('accept/(?P<idd>\w+)', views.accept),
    url('reject/(?P<idd>\w+)', views.reject),
    url('student_appoint/',views.student_appoint)
]