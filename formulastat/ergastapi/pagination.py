from django.db.models import QuerySet
from rest_framework import pagination
from rest_framework.request import Request
from rest_framework.response import Response
from rest_framework.views import APIView


class ErgastAPIPagination(pagination.LimitOffsetPagination):
    def paginate_queryset(self, queryset: QuerySet, request: Request, view: APIView | None = ...) -> list | None:
        self.model: str = queryset.model.__name__
        self.kwargs = view.kwargs
        return super().paginate_queryset(queryset, request, view)

    def get_criteria_dict(self):
        name_map = {
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
        if self.model == "SessionEntry":
            self.model = "Status"
        data_name = self.model.capitalize().rstrip("s") + "s"
        table_name = self.model.capitalize() + "Table"

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
