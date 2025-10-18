from django.urls import include, path
from rest_framework import routers

from . import views


class CustomRouter(routers.DefaultRouter):
    include_format_suffixes = False


router = CustomRouter()
router.register(r"schedules", views.SeasonScheduleViewSet, basename="schedules")
router.register(r"rounds", views.RoundViewSet, basename="rounds")
router.register(r"circuits", views.CircuitViewSet, basename="circuits")
router.register(r"drivers", views.DriverViewSet, basename="drivers")
router.register(r"teams", views.TeamViewSet, basename="teams")

urlpatterns = [
    path("alpha/", include(router.urls)),
]
