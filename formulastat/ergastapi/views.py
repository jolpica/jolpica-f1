from django.db.models import Q
from django.db.models.query import QuerySet
from rest_framework import permissions, viewsets
from rest_framework.decorators import action
from rest_framework.response import Response

from formulastat.formula_one.models import Season

from . import pagination, serializers


class SeasonViewSet(viewsets.ModelViewSet):
    serializer_class = serializers.SeasonSerializer
    permission_classes = [permissions.IsAuthenticated]
    pagination_class = pagination.ErgastAPIPagination

    def get_queryset(self) -> QuerySet:
        queryset = Season.objects.all().order_by("year")
        filters = Q()
        if self.kwargs.get("circuit_ref"):
            filters = filters & Q(races__circuit__reference=self.kwargs["circuit_ref"])
        if self.kwargs.get("team_ref"):
            filters = filters & Q(team_drivers__team__reference=self.kwargs["team_ref"])
        if self.kwargs.get("driver_ref"):
            filters = filters & Q(team_drivers__driver__reference=self.kwargs["driver_ref"])
        return queryset.filter(filters).distinct()

    @action(methods=["get"], detail=False)
    def drivers(self, request, circuit_ref=None, constructor_ref=None, driver_ref=None):
        return Response(
            {
                "circuit": circuit_ref,
                "constructor": constructor_ref,
                "driver": driver_ref,
            }
        )
