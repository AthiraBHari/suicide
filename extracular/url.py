from django.conf.urls import url
from extracular import views

urlpatterns=[
    url('post_extracular/', views.post_extracular),
    url('view_extracular/',views.view_extracular)
]