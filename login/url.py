from django.conf.urls import url
from login import views

urlpatterns=[

    url('login_login/', views.post_login)
]