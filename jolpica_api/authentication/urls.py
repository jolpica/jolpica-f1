from django.urls import path
from knox import views as knox_views

from . import views

urlpatterns = [
    path(r"login/", views.LoginView.as_view(), name="knox_login"),
    path(r"logout/", knox_views.LogoutView.as_view(), name="knox_logout"),
    path(r"logoutall/", knox_views.LogoutAllView.as_view(), name="knox_logoutall"),
    path("", views.auth, name="auth_check"),
]
