from django.conf.urls import url
from predict import views

urlpatterns=[
    url('predict/(?P<idd>\w+)',views.predict),
    url('view/',views.view_result)
]