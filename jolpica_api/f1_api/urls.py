from django.urls import include, path
from rest_framework import routers

from . import views

router = routers.DefaultRouter()
router.register(r"schedule", views.SeasonScheduleViewSet, basename="season-schedule")

urlpatterns = [
    path("alpha/", include(router.urls)),
]
