from django.conf.urls import url
from task import views

urlpatterns=[

    url('post_task/', views.post_task),
    url('view_task/', views.view_task),


]