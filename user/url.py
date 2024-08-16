from django.conf.urls import url
from user import views

urlpatterns=[

    url('post_user/', views.post_user),
    url('view_user/', views.view_user),
    url('pred/',views.predict),
    url('admin_view/', views.adminview_user)

]