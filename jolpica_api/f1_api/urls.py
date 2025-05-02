# jolpica_api/f1_api/urls.py

from django.urls import include, path
from rest_framework import routers

# Removed spectacular imports as they are now in the main urls.py
from . import views

# Define the router as before
router = routers.DefaultRouter()
router.register(r"schedule", views.SeasonScheduleViewSet, basename="season-schedule")

# Define the list of patterns for the actual API endpoints
# No spectacular patterns needed here anymore
api_urlpatterns = [
    path("alpha/", include(router.urls)),
    # Add any other f1/alpha specific non-router paths here if needed in the future
]

urlpatterns = api_urlpatterns  # Directly assign the API patterns
