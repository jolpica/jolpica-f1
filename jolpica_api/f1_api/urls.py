from django.urls import include, path
from rest_framework import routers

from .views import circuits, drivers, laps, pit_stops, rounds, schedules, session_entries, sessions, teams


class CustomRouter(routers.DefaultRouter):
    include_format_suffixes = False


router = CustomRouter()
router.register(r"schedules", schedules.SeasonScheduleViewSet, basename="schedules")

# Core table-mapped endpoints
router.register(r"core/rounds", rounds.RoundViewSet, basename="rounds")
router.register(r"core/circuits", circuits.CircuitViewSet, basename="circuits")
router.register(r"core/drivers", drivers.DriverViewSet, basename="drivers")
router.register(r"core/teams", teams.TeamViewSet, basename="teams")
router.register(r"core/sessions", sessions.SessionViewSet, basename="sessions")
router.register(r"core/session-entries", session_entries.SessionEntryViewSet, basename="session-entries")
router.register(r"core/laps", laps.LapViewSet, basename="laps")
router.register(r"core/pit-stops", pit_stops.PitStopViewSet, basename="pit-stops")

urlpatterns = [
    path("alpha/", include(router.urls)),
]
