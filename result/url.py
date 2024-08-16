
from django.conf.urls import url
from result import views

urlpatterns=[
    url('result/',views.post_result),
    url('view/',views.view_result)
    ]