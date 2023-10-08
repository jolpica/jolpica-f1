from django.urls import path
from django.urls.conf import include

from formulastat.ergast.views import RaceView, CircuitView

app_name = "ergast"

f1patterns = [
    path("", RaceView.as_view()),
    path("<year>/", RaceView.as_view()),
    path("<year>/<round>/", RaceView.as_view()),
    path("circuits/", CircuitView.as_view())
]

urlpatterns = [
    path("f1/", include(f1patterns)),
]
