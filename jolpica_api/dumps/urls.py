from __future__ import annotations

from django.urls import include, path
from rest_framework.routers import DefaultRouter

from .views import ConfirmDumpViewSet, UploadDumpViewSet

router = DefaultRouter()
router.register(r"upload", UploadDumpViewSet, basename="dump-upload")
router.register(r"confirm", ConfirmDumpViewSet, basename="dump-confirm")

urlpatterns = [
    path("", include(router.urls)),
]
