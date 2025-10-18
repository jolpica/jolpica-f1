from django.urls import include, path
from rest_framework import routers

from .views import circuits, drivers, rounds, schedules, teams


class CustomRouter(routers.DefaultRouter):
    include_format_suffixes = False


router = CustomRouter()
router.register(r"schedules", schedules.SeasonScheduleViewSet, basename="schedules")
router.register(r"rounds", rounds.RoundViewSet, basename="rounds")
router.register(r"circuits", circuits.CircuitViewSet, basename="circuits")
router.register(r"drivers", drivers.DriverViewSet, basename="drivers")
router.register(r"teams", teams.TeamViewSet, basename="teams")

urlpatterns = [
    path("alpha/", include(router.urls)),
]
