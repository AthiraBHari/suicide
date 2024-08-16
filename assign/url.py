from django.conf.urls import url
from assign import views


urlpatterns=[

    url('post_assign/(?P<idd>\w+)',views.assign_task),
    url('view_taskstatus/', views.view_taskstatus),
    url('completed/(?P<idd>\w+)',views.complete),
    url('not/(?P<idd>\w+)',views.not_com),
    url('view/',views.view),
    url('upload/(?P<idd>\w+)',views.upload),
    url(r'^assign/download/(?P<filename>.+)$', views.download_file, name='download_file'),
]