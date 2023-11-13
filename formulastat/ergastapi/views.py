from django.db.models import Q
from django.db.models.query import QuerySet
from rest_framework import permissions, viewsets
from rest_framework.decorators import action
from rest_framework.response import Response

from formulastat.ergast.models import Status
from formulastat.formula_one.models import Circuit, Season, SessionType

from . import pagination, serializers


class SeasonViewSet(viewsets.ModelViewSet):
    serializer_class = serializers.SeasonSerializer
    permission_classes = [permissions.IsAuthenticated]
    pagination_class = pagination.ErgastAPIPagination

    def get_criteria_filters(
        self,
        circuit_ref=None,
        team_ref=None,
        driver_ref=None,
        grid_position=None,
        race_position=None,
        ergast_status_id=None,
        **kwargs,
    ) -> Q:
        filters = Q()
        if circuit_ref:
            # filters = filters & Q(races__circuit__reference=circuit_ref)
            filters = filters & Q(team_drivers__race_entries__race__circuit__reference=circuit_ref)
        if team_ref:
            filters = filters & Q(team_drivers__team__reference=team_ref)
        if driver_ref:
            filters = filters & Q(team_drivers__driver__reference=driver_ref)
        if grid_position or race_position:
            filters = filters & Q(team_drivers__race_entries__session_entries__session__type=SessionType.RACE)
            if grid_position:
                filters = filters & Q(team_drivers__race_entries__session_entries__grid=grid_position)
            if race_position:
                filters = filters & Q(team_drivers__race_entries__session_entries__position=race_position)
        if ergast_status_id:
            filters = filters & Q(
                team_drivers__race_entries__session_entries__detail=Status.objects.get(pk=ergast_status_id)
            )
        return filters

    def get_queryset(self) -> QuerySet:
        filters = self.get_criteria_filters(**self.kwargs)
        return Season.objects.filter(filters).order_by("year").distinct()


class CircuitViewSet(viewsets.ModelViewSet):
    serializer_class = serializers.CircuitSerializer
    permission_classes = [permissions.IsAuthenticated]
    pagination_class = pagination.ErgastAPIPagination

    def get_criteria_filters(
        self,
        circuit_ref=None,
        team_ref=None,
        driver_ref=None,
        grid_position=None,
        race_position=None,
        ergast_status_id=None,
        **kwargs,
    ) -> Q:
        filters = Q()
        if circuit_ref:
            filters = filters & Q(reference=circuit_ref)
        if team_ref:
            filters = filters & Q(races__race_entries__team_driver__team__reference=team_ref)
        if driver_ref:
            filters = filters & Q(races__race_entries__team_driver__driver__reference=driver_ref)
        if grid_position or race_position:
            filters = filters & Q(races__sessions__type=SessionType.RACE)
            if grid_position:
                filters = filters & Q(races__race_entries__session_entries__grid=grid_position)
            if race_position:
                filters = filters & Q(races__race_entries__session_entries__position=race_position)
        if ergast_status_id:
            filters = filters & Q(races__race_entries__session_entries__detail=Status.objects.get(pk=ergast_status_id))
        return filters

    def get_queryset(self) -> QuerySet:
        filters = self.get_criteria_filters(**self.kwargs)
        qs = Circuit.objects.filter(filters).order_by("reference").distinct()
        print(qs.query)
        return qs
