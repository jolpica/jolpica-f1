from django.db.models import QuerySet
from rest_framework import pagination
from rest_framework.request import Request
from rest_framework.response import Response
from rest_framework.views import APIView


class ErgastAPIPagination(pagination.LimitOffsetPagination):
    def paginate_queryset(self, queryset: QuerySet, request: Request, view: APIView | None = None) -> list | None:
        self.model: str = queryset.model.__name__
        self.viewset: str = view.__class__.__name__
        self.kwargs = view.kwargs if isinstance(view, APIView) else {}
        return super().paginate_queryset(queryset, request, view)

    def get_criteria_dict(self):
        name_map = {
            "season_year": "season",
            "race_round": "round",
            "circuit_ref": "circuitId",
            "team_ref": "constructorId",
            "driver_ref": "driverId",
            "grid_position": "grid",
            "race_position": "position",
            "sprint_race_position": None,
            "ergast_status_id": "status",
            "fastest_lap_rank": "fastest",
            "lap_number": "lap",
            "pitstop_number": "stop",
            "driver_standings_position": "driverStandings",
            "constructor_standings_position": "constructorStandings",
        }
        criteria_dict = {
            name_map[key]: val for key, val in self.kwargs.items() if key != "format" and name_map[key] is not None
        }
        if self.viewset == "QualifyingViewSet" and "grid" not in self.request.get_full_path():
            criteria_dict.pop("grid", None)
        if self.viewset == "LapViewSet":
            criteria_dict.pop("lap", None)
        return criteria_dict

    def get_paginated_response(self, data):
        match self.viewset:
            case "StatusViewSet":
                self.model = "Status"
            case "ConstructorViewSet":
                self.model = "Constructor"
            case (
                "ResultViewSet"
                | "SprintViewSet"
                | "QualifyingViewSet"
                | "PitStopViewSet"
                | "LapViewSet"
                | "RaceViewSet"
            ):
                self.model = "Race"

        if self.viewset in {"DriverStandingViewSet", "ConstructorStandingViewSet"}:
            table_name = "StandingsTable"
            data_name = "StandingsLists"
            if self.viewset == "DriverStandingViewSet":
                criteria_key, data_key = "driverStandings", "DriverStandings"
            else:
                criteria_key, data_key = "constructorStandings", "ConstructorStandings"
            criteria = self.get_criteria_dict()
            criteria.pop(criteria_key, None)
            data = [{**criteria, data_key: data}]
        else:
            table_name = self.model.capitalize() + "Table"
            data_name = self.model.capitalize().rstrip("s") + "s"

        url = self.request.build_absolute_uri(self.request.path).lower()
        return Response(
            {
                "MRData": {
                    "xmlns": "",
                    "series": "f1",
                    "url": url,
                    "limit": str(self.limit),
                    "offset": str(self.offset),
                    "total": str(self.count),
                    table_name: {
                        **self.get_criteria_dict(),
                        data_name: data,
                    },
                }
            }
        )
