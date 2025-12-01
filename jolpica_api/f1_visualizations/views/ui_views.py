"""UI views for rendering visualization pages."""

from django.shortcuts import render
from django.views import View


class DashboardView(View):
    """Main dashboard with pre-built visualizations."""

    def get(self, request):
        """Render the dashboard page."""
        return render(request, "f1_visualizations/dashboard.html")


class ChartBuilderView(View):
    """Interactive chart builder interface."""

    def get(self, request):
        """Render the chart builder page."""
        return render(request, "f1_visualizations/chart_builder.html")
