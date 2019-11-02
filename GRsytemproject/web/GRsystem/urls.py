"""web URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf.urls import url
from . import views
from django.conf import settings
from django.contrib.auth import views as auth_views

urlpatterns=[
    url(r'^$',views.index,name='index'),
    url(r'^register/$', views.register, name='register'),
    url(r'^signin/$',auth_views.LoginView.as_view(template_name='GRsystem/signin.html'), name='signin'),
    url('logout/', auth_views.LogoutView.as_view(template_name='Grsystem/logout.html'), name='logout'),
    url(r'^password/$', views.change_password, name='change_password'),
    url(r'^passwords/$', views.change_password_g, name='change_password_g'),
    url(r'^counter/$', views.counter, name='counter'),
    url(r'^solved/$', views.solved, name='solved'),



    url(r'^login/$',views.login,name='login'),
    url(r'^list/$',views.list,name='list'),
    url(r'^pdf/$',views.pdf_view,name='view'),
    url(r'^pdf_g/$',views.pdf_viewer,name='view'),
    url(r'^aboutus/$',views.aboutus,name='aboutus'),

    url(r'^login_redirect/$',views.login_redirect,name='login_redirect'),
    url(r'^slist/$',views.slist,),




    #url(r'^login2/$',views.login2,name='login2'),

    url(r'^dashboard/$', views.dashboard, name='dashboard'),
    url(r'^complaints/$', views.complaints, name='complaints'),
    url(r'^allcomplaints/$', views.allcomplaints, name='allcomplaints'),


       url('password-reset/',
         auth_views.PasswordResetView.as_view(
             template_name='GRsystem/password_reset.html'
         ),
         name='password_reset'),
    url(r'^password-reset-done/$',
         auth_views.PasswordResetDoneView.as_view(
             template_name='GRsystem/password_reset_done.html'
         ),
         name='password_reset_done'),
    url(r'^password-reset-confirm/(?P<uidb64>[0-9A-Za-z_\-]+)/(?P<token>[0-9A-Za-z]{1,13}-[0-9A-Za-z]{1,20})/$',
         auth_views.PasswordResetConfirmView.as_view(
             template_name='GRsystem/password_reset_confirm.html'
         ),
         name='password_reset_confirm'),
    url(r'^password-reset-complete/$',
         auth_views.PasswordResetCompleteView.as_view(
             template_name='GRsystem/password_reset_complete.html'
         ),
         name='password_reset_complete'),
    
   ]
