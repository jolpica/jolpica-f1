from django.urls import include, path
from rest_framework import routers

from . import views

router = routers.DefaultRouter()
router.register(r"seasons", views.SeasonViewSet, basename="season")
router.register(r"rounds", views.RoundViewSet, basename="round")
router.register(r"circuits", views.CircuitViewSet, basename="circuit")
router.register(r"teams", views.TeamViewSet, basename="team")
router.register(r"drivers", views.DriverViewSet, basename="driver")
router.register(r"sessions", views.SessionViewSet, basename="session")
router.register(r"results", views.SessionEntryViewSet, basename="result")


urlpatterns = [
    path("", include(router.urls)),
]
