from django.urls import include, path
from rest_framework import routers

from . import views


class CustomRouter(routers.DefaultRouter):
    include_format_suffixes = False


router = CustomRouter()
router.register(r"schedules", views.SeasonScheduleViewSet, basename="schedules")

urlpatterns = [
    path("alpha/", include(router.urls)),
]
