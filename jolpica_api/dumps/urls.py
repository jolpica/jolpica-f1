from __future__ import annotations

from django.urls import path

from .views import DumpUploadCompleteView, DumpUploadStartView

urlpatterns = [
    path("upload/start/", DumpUploadStartView.as_view(), name="dump-upload-start"),
    path("upload/complete/", DumpUploadCompleteView.as_view(), name="dump-upload-complete"),
]
