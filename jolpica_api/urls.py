"""URL configuration for jolpica project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/

Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

from django.contrib import admin
from django.urls import include, path

from . import views
from .settings import DEPLOYMENT_ENV

urlpatterns = [
    path("admin/", admin.site.urls),
    path("ergast/", include("jolpica_api.ergastapi.urls")),
    path("data/", include("jolpica_api.data_import.urls")),
    path("auth/", include("jolpica_api.authentication.urls")),
    path("f1/alpha/", include("jolpica_api.f1_api.urls")),
    path("", views.healthcheck),
    path("test/", views.test),
]

if DEPLOYMENT_ENV in ("LOCAL", "SANDBOX"):
    urlpatterns += [
        path("__debug__/", include("debug_toolbar.urls")),
    ]
