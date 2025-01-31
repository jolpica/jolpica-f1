from django.urls import path

from . import views

urlpatterns = [
    path(r"import/", views.ImportData.as_view(), name="data_import"),
]
