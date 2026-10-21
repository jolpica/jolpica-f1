from django.urls import include, path
from rest_framework import routers

from .views import core as core_views
from .views import laps, results, schedules


class CustomRouter(routers.DefaultRouter):
    include_format_suffixes = False


router = CustomRouter()
router.register(r"schedules", schedules.SeasonScheduleViewSet, basename="schedules")
router.register(r"results", results.ResultsView, basename="results")
router.register(r"laps", laps.LapsView, basename="laps")


# Core table-mapped endpoints
router.register(r"core/seasons", core_views.SeasonViewSet, basename="core-seasons")
router.register(r"core/rounds", core_views.RoundViewSet, basename="core-rounds")
router.register(r"core/circuits", core_views.CircuitViewSet, basename="core-circuits")
router.register(r"core/drivers", core_views.DriverViewSet, basename="core-drivers")
router.register(r"core/teams", core_views.TeamViewSet, basename="core-teams")
router.register(r"core/sessions", core_views.SessionViewSet, basename="core-sessions")
router.register(r"core/session-entries", core_views.SessionEntryViewSet, basename="core-session-entries")
router.register(r"core/laps", core_views.LapViewSet, basename="core-laps")
router.register(r"core/pit-stops", core_views.PitStopViewSet, basename="core-pit-stops")

urlpatterns = [
    path("alpha/", include(router.urls)),
]
