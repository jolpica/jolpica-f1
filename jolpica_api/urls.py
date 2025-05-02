# jolpica_api/urls.py

from django.contrib import admin
from django.urls import include, path
from drf_spectacular.views import (
    SpectacularAPIView,
    SpectacularRedocView,
    SpectacularSwaggerView,
)

from . import views
from .settings import DEPLOYMENT_ENV

# Define the spectacular patterns for the F1 API docs
open_api_docs_urlpatterns = [
    path("", SpectacularSwaggerView.as_view(url_name="f1-api-schema"), name="f1-api-docs"),
    path("schema/", SpectacularAPIView.as_view(), name="f1-api-schema"),
    path("redoc/", SpectacularRedocView.as_view(url_name="f1-api-schema"), name="f1-api-redoc"),
]

urlpatterns = [
    path("admin/", admin.site.urls),
    path("ergast/", include("jolpica_api.ergastapi.urls")),
    path("data/", include("jolpica_api.data_import.urls")),
    path("auth/", include("jolpica_api.authentication.urls")),
    path("f1/", include("jolpica_api.f1_api.urls")),
    path("docs/", include(open_api_docs_urlpatterns)),
    path("", views.healthcheck),
    path("test/", views.test),
]

if DEPLOYMENT_ENV in ("LOCAL", "SANDBOX"):
    urlpatterns += [
        path("__debug__/", include("debug_toolbar.urls")),
    ]
