from django.db.models import QuerySet
from rest_framework import pagination
from rest_framework.request import Request
from rest_framework.response import Response
from rest_framework.views import APIView


class ErgastAPIPagination(pagination.LimitOffsetPagination):
    def paginate_queryset(self, queryset: QuerySet, request: Request, view: APIView | None = ...) -> list | None:
        self.model: str = queryset.model.__name__
        self.viewset: str = view.__class__.__name__
        self.kwargs = view.kwargs
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
            "ergast_status_id": "status",
            "fastest_lap_rank": "fastest",
        }
        return {name_map[key]: val for key, val in self.kwargs.items() if key != "format"}

    def get_paginated_response(self, data):
        match self.viewset:
            case "StatusViewSet":
                self.model = "Status"
            case "ConstructorViewSet":
                self.model = "Constructor"
            case "ResultViewSet" | "SprintViewSet" | "QualifyingViewSet" | "PitStopViewSet" | "LapViewSet":
                self.model = "Race"

        if self.viewset == "DriverStandingViewSet":
            table_name = "StandingsTable"
            data_name = "StandingsLists"
            data = [{**self.get_criteria_dict(), "DriverStandings": data}]
        elif self.viewset == "ConstructorStandingViewSet":
            table_name = "StandingsTable"
            data_name = "StandingsLists"
            data = [{**self.get_criteria_dict(), "ConstructorStandings": data}]
        else:
            table_name = self.model.capitalize() + "Table"
            data_name = self.model.capitalize().rstrip("s") + "s"

        url = self.request.build_absolute_uri(self.request.path)
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
