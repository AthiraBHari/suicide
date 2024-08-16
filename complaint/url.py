from django.conf.urls import url
from complaint import views

urlpatterns=[
    url('post_complaint/', views.post_complaints),
    url('view_compalint/', views.view_complaint),
    url('addreplay/(?P<idd>\w+)',views.add_repaly),
    url('viewreplay/', views.view_replay)
]