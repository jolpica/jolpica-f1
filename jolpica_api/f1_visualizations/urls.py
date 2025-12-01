"""URL routing for F1 Visualizations app."""

from django.urls import path

from .views import (
    ChartBuilderView,
    ChartDataView,
    DashboardView,
    DriverComparisonView,
    LapTimeComparisonView,
    SeasonStandingsView,
    TeamPerformanceView,
)

app_name = "f1_visualizations"

urlpatterns = [
    # UI Views
    path("", DashboardView.as_view(), name="dashboard"),
    path("builder/", ChartBuilderView.as_view(), name="chart_builder"),
    # API Views
    path("api/chart-data/", ChartDataView.as_view(), name="chart_data"),
    path("api/standings/", SeasonStandingsView.as_view(), name="standings"),
    path("api/standings/<int:year>/", SeasonStandingsView.as_view(), name="standings_year"),
    path("api/driver-comparison/", DriverComparisonView.as_view(), name="driver_comparison"),
    path("api/team-performance/", TeamPerformanceView.as_view(), name="team_performance"),
    path("api/team-performance/<str:team_id>/", TeamPerformanceView.as_view(), name="team_performance_detail"),
    path("api/lap-times/", LapTimeComparisonView.as_view(), name="lap_times"),
]
