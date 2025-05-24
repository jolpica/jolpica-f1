from django.urls import include, path
from rest_framework import routers

from . import views


class CustomRouter(routers.DefaultRouter):
    include_format_suffixes = False

    def get_urls(self):
        """
        Override to add custom URL patterns for session results
        """
        urls = super().get_urls()

        # Find and update the sessions-detail URL pattern
        for url in urls:
            if url.name == "sessions-detail":
                # Replace the default pattern with our custom one
                url.pattern = path(
                    "sessions/<int:year>/<int:round_number>/<str:session_type>/",
                    views.SessionViewSet.as_view({"get": "retrieve"}),
                ).pattern
                break

        return urls


router = CustomRouter()
router.register(r"schedules", views.SeasonScheduleViewSet, basename="schedules")
router.register(r"sessions", views.SessionViewSet, basename="sessions")

urlpatterns = [
    path("alpha/", include(router.urls)),
]
