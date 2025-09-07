from __future__ import annotations

from django.urls import path

from .views import (
    DumpDownloadDelayedView,
    DumpDownloadLatestView,
    DumpsOverviewView,
    DumpUploadCompleteView,
    DumpUploadStartView,
)

urlpatterns = [
    # Upload endpoints (POST)
    path("upload/start/", DumpUploadStartView.as_view(), name="dump-upload-start"),
    path("upload/complete/", DumpUploadCompleteView.as_view(), name="dump-upload-complete"),
    # Download endpoints (GET)
    path("download/", DumpsOverviewView.as_view(), name="dumps-overview"),
    path("download/latest/", DumpDownloadLatestView.as_view(), name="dump-download-latest"),
    path("download/delayed/", DumpDownloadDelayedView.as_view(), name="dump-download-delayed"),
]
