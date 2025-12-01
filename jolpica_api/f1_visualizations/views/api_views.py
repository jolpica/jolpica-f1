"""API views for providing chart data in JSON format."""

from django.db.models import Avg, Count, Max, Min, Q, Sum
from django.http import JsonResponse
from django.views import View
from jolpica.formula_one.models import (
    Driver,
    Lap,
    Round,
    Season,
    SessionEntry,
    SessionType,
    Team,
)
from jolpica.formula_one.models.managed_views import DriverChampionship, TeamChampionship


class ChartDataView(View):
    """Generic endpoint for chart data based on query parameters."""

    def get(self, request):
        """Return chart data based on provided parameters."""
        chart_type = request.GET.get("type", "season_standings")

        if chart_type == "season_standings":
            return self._get_season_standings(request)
        elif chart_type == "driver_comparison":
            return self._get_driver_comparison(request)
        elif chart_type == "team_performance":
            return self._get_team_performance(request)
        elif chart_type == "lap_times":
            return self._get_lap_times(request)

        return JsonResponse({"error": "Invalid chart type"}, status=400)

    def _get_season_standings(self, request):
        """Get season standings data."""
        year = request.GET.get("year", 2024)
        championship_type = request.GET.get("championship", "driver")

        if championship_type == "driver":
            standings = (
                DriverChampionship.objects.filter(season__year=year)
                .select_related("driver", "season")
                .order_by("position")[:10]
            )
            data = {
                "labels": [s.driver.full_name for s in standings],
                "datasets": [
                    {
                        "label": f"Points - {year} Championship",
                        "data": [float(s.points) for s in standings],
                        "backgroundColor": "rgba(255, 99, 132, 0.5)",
                        "borderColor": "rgb(255, 99, 132)",
                        "borderWidth": 1,
                    }
                ],
            }
        else:
            standings = (
                TeamChampionship.objects.filter(season__year=year)
                .select_related("team", "season")
                .order_by("position")[:10]
            )
            data = {
                "labels": [s.team.name for s in standings],
                "datasets": [
                    {
                        "label": f"Points - {year} Championship",
                        "data": [float(s.points) for s in standings],
                        "backgroundColor": "rgba(54, 162, 235, 0.5)",
                        "borderColor": "rgb(54, 162, 235)",
                        "borderWidth": 1,
                    }
                ],
            }

        return JsonResponse(data)

    def _get_driver_comparison(self, request):
        """Compare multiple drivers across seasons."""
        driver_ids = request.GET.getlist("drivers[]")
        start_year = int(request.GET.get("start_year", 2020))
        end_year = int(request.GET.get("end_year", 2024))

        if not driver_ids:
            return JsonResponse({"error": "No drivers selected"}, status=400)

        datasets = []
        colors = [
            "rgb(255, 99, 132)",
            "rgb(54, 162, 235)",
            "rgb(255, 206, 86)",
            "rgb(75, 192, 192)",
            "rgb(153, 102, 255)",
        ]

        for idx, driver_id in enumerate(driver_ids[:5]):  # Limit to 5 drivers
            driver = Driver.objects.get(api_id=driver_id)
            standings = DriverChampionship.objects.filter(
                driver=driver, season__year__gte=start_year, season__year__lte=end_year
            ).order_by("season__year")

            datasets.append(
                {
                    "label": driver.full_name,
                    "data": [float(s.points) for s in standings],
                    "borderColor": colors[idx % len(colors)],
                    "backgroundColor": colors[idx % len(colors)].replace("rgb", "rgba").replace(")", ", 0.1)"),
                    "fill": False,
                }
            )

        # Get years for labels
        years = list(range(start_year, end_year + 1))

        data = {"labels": [str(year) for year in years], "datasets": datasets}

        return JsonResponse(data)

    def _get_team_performance(self, request):
        """Get team performance over time."""
        team_id = request.GET.get("team")
        start_year = int(request.GET.get("start_year", 2020))
        end_year = int(request.GET.get("end_year", 2024))

        if not team_id:
            return JsonResponse({"error": "No team selected"}, status=400)

        team = Team.objects.get(api_id=team_id)
        standings = TeamChampionship.objects.filter(
            team=team, season__year__gte=start_year, season__year__lte=end_year
        ).order_by("season__year")

        years = list(range(start_year, end_year + 1))
        points_by_year = {s.season.year: float(s.points) for s in standings}
        positions_by_year = {s.season.year: s.position for s in standings}

        data = {
            "labels": [str(year) for year in years],
            "datasets": [
                {
                    "label": "Points",
                    "data": [points_by_year.get(year, 0) for year in years],
                    "borderColor": "rgb(255, 99, 132)",
                    "backgroundColor": "rgba(255, 99, 132, 0.1)",
                    "yAxisID": "y",
                },
                {
                    "label": "Championship Position",
                    "data": [positions_by_year.get(year, None) for year in years],
                    "borderColor": "rgb(54, 162, 235)",
                    "backgroundColor": "rgba(54, 162, 235, 0.1)",
                    "yAxisID": "y1",
                },
            ],
        }

        return JsonResponse(data)

    def _get_lap_times(self, request):
        """Get lap time comparison."""
        year = int(request.GET.get("year", 2024))
        round_num = int(request.GET.get("round", 1))
        driver_ids = request.GET.getlist("drivers[]")

        if not driver_ids:
            return JsonResponse({"error": "No drivers selected"}, status=400)

        # Get the race session
        race_round = Round.objects.filter(season__year=year, round=round_num).first()
        if not race_round:
            return JsonResponse({"error": "Round not found"}, status=404)

        race_session = race_round.sessions.filter(session_type=SessionType.RACE).first()
        if not race_session:
            return JsonResponse({"error": "Race session not found"}, status=404)

        datasets = []
        colors = [
            "rgb(255, 99, 132)",
            "rgb(54, 162, 235)",
            "rgb(255, 206, 86)",
            "rgb(75, 192, 192)",
            "rgb(153, 102, 255)",
        ]

        max_laps = 0

        for idx, driver_id in enumerate(driver_ids[:5]):
            driver = Driver.objects.get(api_id=driver_id)
            session_entry = SessionEntry.objects.filter(session=race_session, team_driver__driver=driver).first()

            if session_entry:
                laps = Lap.objects.filter(session_entry=session_entry, deleted=False).order_by("number")
                lap_times = [lap.time.total_seconds() if lap.time else None for lap in laps]
                max_laps = max(max_laps, len(lap_times))

                datasets.append(
                    {
                        "label": driver.full_name,
                        "data": lap_times,
                        "borderColor": colors[idx % len(colors)],
                        "backgroundColor": colors[idx % len(colors)].replace("rgb", "rgba").replace(")", ", 0.1)"),
                        "fill": False,
                    }
                )

        data = {"labels": [str(i) for i in range(1, max_laps + 1)], "datasets": datasets}

        return JsonResponse(data)


class SeasonStandingsView(View):
    """Get season championship standings."""

    def get(self, request, year=None):
        """Return driver and team standings for a season."""
        if not year:
            year = request.GET.get("year", 2024)

        # Driver standings
        driver_standings = (
            DriverChampionship.objects.filter(season__year=year)
            .select_related("driver", "season")
            .order_by("position")[:20]
        )

        # Team standings
        team_standings = (
            TeamChampionship.objects.filter(season__year=year)
            .select_related("team", "season")
            .order_by("position")[:10]
        )

        data = {
            "year": year,
            "drivers": [
                {
                    "position": s.position,
                    "driver": s.driver.full_name,
                    "driver_id": s.driver.api_id,
                    "points": float(s.points),
                    "wins": s.wins,
                }
                for s in driver_standings
            ],
            "teams": [
                {
                    "position": s.position,
                    "team": s.team.name,
                    "team_id": s.team.api_id,
                    "points": float(s.points),
                    "wins": s.wins,
                }
                for s in team_standings
            ],
        }

        return JsonResponse(data)


class DriverComparisonView(View):
    """Compare driver statistics."""

    def get(self, request):
        """Return comparison data for selected drivers."""
        driver_ids = request.GET.getlist("drivers[]")

        if not driver_ids:
            return JsonResponse({"error": "No drivers selected"}, status=400)

        drivers_data = []

        for driver_id in driver_ids:
            driver = Driver.objects.get(api_id=driver_id)

            # Calculate statistics
            total_races = SessionEntry.objects.filter(
                team_driver__driver=driver, session__session_type=SessionType.RACE
            ).count()

            wins = SessionEntry.objects.filter(
                team_driver__driver=driver, session__session_type=SessionType.RACE, position=1
            ).count()

            podiums = SessionEntry.objects.filter(
                team_driver__driver=driver, session__session_type=SessionType.RACE, position__lte=3
            ).count()

            total_points = (
                DriverChampionship.objects.filter(driver=driver).aggregate(total=Sum("points"))["total"] or 0
            )

            championships = DriverChampionship.objects.filter(driver=driver, position=1).count()

            drivers_data.append(
                {
                    "driver": driver.full_name,
                    "driver_id": driver.api_id,
                    "total_races": total_races,
                    "wins": wins,
                    "podiums": podiums,
                    "total_points": float(total_points),
                    "championships": championships,
                    "win_rate": round((wins / total_races * 100) if total_races > 0 else 0, 2),
                }
            )

        return JsonResponse({"drivers": drivers_data})


class TeamPerformanceView(View):
    """Get team performance metrics."""

    def get(self, request, team_id=None):
        """Return performance metrics for a team."""
        if not team_id:
            team_id = request.GET.get("team")

        if not team_id:
            return JsonResponse({"error": "No team specified"}, status=400)

        team = Team.objects.get(api_id=team_id)

        # Get all seasons this team competed in
        seasons = (
            TeamChampionship.objects.filter(team=team).select_related("season").order_by("season__year").values_list("season__year", flat=True)
        )

        performance_data = []

        for year in seasons:
            standing = TeamChampionship.objects.filter(team=team, season__year=year).first()

            if standing:
                performance_data.append(
                    {
                        "year": year,
                        "position": standing.position,
                        "points": float(standing.points),
                        "wins": standing.wins,
                    }
                )

        return JsonResponse({"team": team.name, "team_id": team.api_id, "performance": performance_data})


class LapTimeComparisonView(View):
    """Compare lap times between drivers in a specific race."""

    def get(self, request):
        """Return lap time data for comparison."""
        year = int(request.GET.get("year", 2024))
        round_num = int(request.GET.get("round", 1))
        driver_ids = request.GET.getlist("drivers[]")

        if not driver_ids:
            return JsonResponse({"error": "No drivers selected"}, status=400)

        # Get the race
        race_round = Round.objects.filter(season__year=year, round=round_num).first()
        if not race_round:
            return JsonResponse({"error": "Round not found"}, status=404)

        race_session = race_round.sessions.filter(session_type=SessionType.RACE).first()
        if not race_session:
            return JsonResponse({"error": "Race session not found"}, status=404)

        drivers_data = []

        for driver_id in driver_ids:
            driver = Driver.objects.get(api_id=driver_id)
            session_entry = SessionEntry.objects.filter(session=race_session, team_driver__driver=driver).first()

            if session_entry:
                laps = Lap.objects.filter(session_entry=session_entry, deleted=False).order_by("number")

                lap_data = [
                    {
                        "lap": lap.number,
                        "time": lap.time.total_seconds() if lap.time else None,
                        "average_speed": float(lap.average_speed) if lap.average_speed else None,
                    }
                    for lap in laps
                ]

                # Calculate statistics
                valid_times = [lap.time.total_seconds() for lap in laps if lap.time]
                fastest_lap = min(valid_times) if valid_times else None
                average_lap = sum(valid_times) / len(valid_times) if valid_times else None

                drivers_data.append(
                    {
                        "driver": driver.full_name,
                        "driver_id": driver.api_id,
                        "laps": lap_data,
                        "fastest_lap": fastest_lap,
                        "average_lap": average_lap,
                        "total_laps": len(lap_data),
                    }
                )

        return JsonResponse(
            {
                "race": {
                    "year": year,
                    "round": round_num,
                    "name": race_round.official_name,
                    "circuit": race_round.circuit.name,
                },
                "drivers": drivers_data,
            }
        )
