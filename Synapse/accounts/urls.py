from django.urls import path
from. import views

urlpatterns=[
    path("login/",views.login_view,name="login"),
    path("logout/",views.login_view,name="logout"),
    path("register/",views.register_view,name="register"),
    path("dashboard/",views.dashboard_view,name="dashboard"),
    path("deals/",views.deals,name="deals"),
    path('profile/', views.profile_view, name='profile'),
    path('profile/edit/', views.edit_profile_view, name='edit_profile'),
]