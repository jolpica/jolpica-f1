from django.db.models import QuerySet
from rest_framework import pagination
from rest_framework.request import Request
from rest_framework.response import Response
from rest_framework.views import APIView


class ErgastAPIPagination(pagination.LimitOffsetPagination):
    def paginate_queryset(self, queryset: QuerySet, request: Request, view: APIView | None = ...) -> list | None:
        self.model: str = queryset.model.__name__
        return super().paginate_queryset(queryset, request, view)

    def get_paginated_response(self, data):
        data_name = self.model.capitalize() + "s"
        table_name = self.model.capitalize() + "Table"

        url = self.request.build_absolute_uri(self.request.path)
        # url = replace_query_param(url, self.limit_query_param, self.limit)

        # offset = self.offset + self.limit
        # url = replace_query_param(url, self.offset_query_param, offset)
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
                        data_name: data,
                    },
                }
            }
        )
