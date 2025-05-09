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

        # Find and update the results-detail URL pattern
        for url in urls:
            if url.name == "results-detail":
                # Replace the default pattern with our custom one
                url.pattern = path(
                    "results/<int:year>/<int:round_number>/<str:session_type>/",
                    views.SessionResultViewSet.as_view({"get": "retrieve"}),
                ).pattern
                break

        return urls


router = CustomRouter()
router.register(r"schedules", views.SeasonScheduleViewSet, basename="schedules")
router.register(r"results", views.SessionResultViewSet, basename="results")

urlpatterns = [
    path("alpha/", include(router.urls)),
]
