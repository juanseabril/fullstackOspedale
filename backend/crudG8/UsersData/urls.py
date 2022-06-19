from django.conf.urls import url
from UsersData import views

urlpatterns = [
    url(r'^user$',views.userApi),
    url(r'^user/([0-9]+)$',views.userApi),
    url(r'^listusers$',views.listUsersApi),
    url(r'^userbyname/(?P<string>[\w\-]+)/$', views.userByName),
    url(r'^eps$',views.epsApi),
    url(r'^eps/([0-9]+)$',views.epsApi),
    url(r'^role$',views.roleApi),
    url(r'^role/([0-9]+)$',views.roleApi),
]