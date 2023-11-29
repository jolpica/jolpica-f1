"""URL configuration for formulastat project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/

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
from django.urls import include, path, re_path
from rest_framework import routers

from . import views

router = routers.DefaultRouter()
router.register("seasons", views.SeasonViewSet, basename="season")
router.register("circuits", views.CircuitViewSet, basename="circuit")
router.register("races", views.RaceViewSet, basename="race")
router.register("status", views.StatusViewSet, basename="status")
router.register("constructors", views.ConstructorViewSet, basename="constructor")
router.register("drivers", views.DriverViewSet, basename="driver")
router.register("results", views.ResultViewSet, basename="result")
router.register("sprint", views.SprintViewSet, basename="sprint")
router.register("qualifying", views.QualifyingViewSet, basename="sprint")

criteria = [
    r"(circuits/(?P<circuit_ref>[a-zA-Z0-9_]+)/)",
    r"(constructors/(?P<team_ref>[a-zA-Z0-9_]+)/)",
    r"(drivers/(?P<driver_ref>[a-zA-Z0-9_]+)/)",
    r"(grid/(?P<grid_position>[a-zA-Z0-9_]+)/)",
    r"(results/(?P<race_position>[a-zA-Z0-9_]+)/)",
    r"(fastest/(?P<fastest_lap_rank>[a-zA-Z0-9_]+)/)",
    r"(status/(?P<ergast_status_id>[a-zA-Z0-9_]+)/)",
]
regex_criteria = f"({'|'.join(criteria)})*"

urlpatterns = [
    re_path(f"{regex_criteria}/?", include(router.urls)),
    path("api-auth/", include("rest_framework.urls", namespace="rest_framework")),
]
