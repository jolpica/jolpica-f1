from django.urls import include, path
from rest_framework import routers

from .views import results, schedules
from .views.core import circuits, drivers, laps, pit_stops, rounds, seasons, session_entries, sessions, teams


class CustomRouter(routers.DefaultRouter):
    include_format_suffixes = False


router = CustomRouter()
router.register(r"schedules", schedules.SeasonScheduleViewSet, basename="schedules")
router.register(r"results", results.ResultsView, basename="results")

# Core table-mapped endpoints
router.register(r"core/seasons", seasons.SeasonViewSet, basename="core-seasons")
router.register(r"core/rounds", rounds.RoundViewSet, basename="core-rounds")
router.register(r"core/circuits", circuits.CircuitViewSet, basename="core-circuits")
router.register(r"core/drivers", drivers.DriverViewSet, basename="core-drivers")
router.register(r"core/teams", teams.TeamViewSet, basename="core-teams")
router.register(r"core/sessions", sessions.SessionViewSet, basename="core-sessions")
router.register(r"core/session-entries", session_entries.SessionEntryViewSet, basename="core-session-entries")
router.register(r"core/laps", laps.LapViewSet, basename="core-laps")
router.register(r"core/pit-stops", pit_stops.PitStopViewSet, basename="core-pit-stops")

urlpatterns = [
    path("alpha/", include(router.urls)),
]
