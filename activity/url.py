from django.conf.urls import url
from activity import views


urlpatterns=[
    url('post_activity/', views.post_activity),
    url('view/', views.view_activity, name='view_activity'),
    url('view_activity/', views.view_activity),
    url('approve/(?P<idd>\w+)',views.approve),
    url('reject/(?P<idd>\w+)',views.reject)
]