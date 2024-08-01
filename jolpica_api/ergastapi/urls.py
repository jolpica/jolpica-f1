"""URL configuration for jolpica project.

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


class ErgastRouter(routers.DefaultRouter):
    include_root_view = False


router = ErgastRouter()
router.register("seasons", views.SeasonViewSet, basename="season")
router.register("circuits", views.CircuitViewSet, basename="circuit")
router.register("races", views.RaceViewSet, basename="race")
router.register("status", views.StatusViewSet, basename="status")
router.register("constructors", views.ConstructorViewSet, basename="constructor")
router.register("drivers", views.DriverViewSet, basename="driver")
router.register("results", views.ResultViewSet, basename="result")
router.register("sprint", views.SprintViewSet, basename="sprint")
router.register("qualifying", views.QualifyingViewSet, basename="qualifying")
router.register("pitstops", views.PitStopViewSet, basename="pitstop")
router.register("laps", views.LapViewSet, basename="lap")
router.register("driver[Ss]tandings", views.DriverStandingViewSet, basename="driverstanding")
router.register("constructor[sS]tandings", views.ConstructorStandingViewSet, basename="constructorstanding")


criteria = [
    r"(circuits/(?P<circuit_ref>[a-zA-Z0-9_\-]+)/)",
    r"(constructors/(?P<team_ref>[a-zA-Z0-9_\-]+)/)",
    r"(drivers/(?P<driver_ref>[a-zA-Z0-9_\-]+)/)",
    r"(grid/(?P<grid_position>[0-9]+)/)",
    r"(results/(?P<race_position>[0-9]+)/)",
    r"(fastest/(?P<fastest_lap_rank>[0-9]+)/)",
    r"(status/(?P<ergast_status_id>[0-9]+)/)",
    r"(laps/(?P<lap_number>[0-9]+)/)",
]
season_criteria = r"(?P<season_year>[0-9]{4}|current)"
round_criteria = r"(?P<race_round>[0-9]{1,2}|next|last)"
season_round_criteria = f"({season_criteria}/({round_criteria}/)?)?"
regex_criteria = season_round_criteria + f"({'|'.join(criteria)})*" + r"(?!$)"


class RaceRouter(routers.DefaultRouter):
    """
    Router which will be used when no endpoint is specified.
    Its API root view will just link to the f1 endpoint
    """

    def get_api_root_view(self, api_urls=None):
        return views.api_root_view


race_router = RaceRouter()
race_router.register(f"f1(/{season_criteria}(/{round_criteria})?)?", views.RaceViewSet, basename="race")

urlpatterns = [
    re_path(f"f1/{regex_criteria}/?", include(router.urls)),
    path("", include(race_router.urls)),
]
