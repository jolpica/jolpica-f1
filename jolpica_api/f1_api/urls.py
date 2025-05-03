from django.urls import include, path
from rest_framework import routers

from . import views

router = routers.DefaultRouter()
router.include_format_suffixes = False
router.register(r"schedules", views.SeasonScheduleViewSet, basename="schedules")

urlpatterns = [
    path("alpha/", include(router.urls)),
]
