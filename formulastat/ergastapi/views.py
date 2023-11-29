from django.db.models import Count, OuterRef, Q, Subquery
from django.db.models.query import QuerySet
from rest_framework import permissions, viewsets

from formulastat.ergast.models import Status
from formulastat.formula_one.models import SessionType

from . import pagination, serializers


class ErgastModelViewSet(viewsets.ModelViewSet):
    permission_classes = [permissions.IsAuthenticated]
    pagination_class = pagination.ErgastAPIPagination

    query_session_entries = ""
    query_team = ""
    query_driver = ""
    query_circuit = ""

    order_by = []

    def get_criteria_filters(
        self,
        circuit_ref=None,
        team_ref=None,
        driver_ref=None,
        grid_position=None,
        race_position=None,
        fastest_lap_rank=None,
        ergast_status_id=None,
        **kwargs,
    ) -> Q:
        if fastest_lap_rank == "0":
            fastest_lap_rank = None
        filters = Q()
        if circuit_ref:
            filters = filters & Q(**{f"{self.query_circuit}reference": circuit_ref})
        if team_ref:
            filters = filters & Q(**{f"{self.query_team}reference": team_ref})
        if driver_ref:
            filters = filters & Q(**{f"{self.query_driver}reference": driver_ref})
        if grid_position or race_position or fastest_lap_rank:
            filters = filters & Q(**{f"{self.query_session_entries}session__type": SessionType.RACE})
            if grid_position:
                filters = filters & Q(**{f"{self.query_session_entries}grid": grid_position})
            if race_position:
                filters = filters & Q(**{f"{self.query_session_entries}position": race_position})
            if fastest_lap_rank:
                filters = filters & Q(**{f"{self.query_session_entries}fastest_lap_rank": fastest_lap_rank})
        if ergast_status_id:
            filters = filters & Q(
                **{f"{self.query_session_entries}detail": Status.objects.filter(pk=ergast_status_id).first()}
            )
        return filters

    def get_queryset(self) -> QuerySet:
        model = self.serializer_class.Meta.model
        filters = self.get_criteria_filters(**self.kwargs)
        return model.objects.filter(filters).order_by(*self.order_by).distinct()

    def retrieve(self, request, **kwargs):
        # lookup_field should be the first listed criteria when using retrieve
        self.kwargs = {self.lookup_field: kwargs[self.lookup_field], **self.kwargs}
        return self.list(request)


class SeasonViewSet(ErgastModelViewSet):
    serializer_class = serializers.SeasonSerializer

    query_session_entries = "team_drivers__race_entries__session_entries__"
    query_team = "team_drivers__team__"
    query_driver = "team_drivers__driver__"
    query_circuit = "team_drivers__race_entries__race__circuit__"
    order_by = ["year"]


class CircuitViewSet(ErgastModelViewSet):
    serializer_class = serializers.CircuitSerializer
    lookup_field = "circuit_ref"

    query_session_entries = "races__race_entries__session_entries__"
    query_team = "races__race_entries__team_driver__team__"
    query_driver = "races__race_entries__team_driver__driver__"
    query_circuit = ""
    order_by = ["reference"]


# season relation
class RaceViewSet(ErgastModelViewSet):
    serializer_class = serializers.RaceSerializer
    lookup_field = "pk"

    query_session_entries = "race_entries__session_entries__"
    query_team = "race_entries__team_driver__team__"
    query_driver = "race_entries__team_driver__driver__"
    query_circuit = "circuit__"
    order_by = ["season__year", "round"]


class StatusViewSet(ErgastModelViewSet):
    serializer_class = serializers.StatusSerializer
    lookup_field = "ergast_status_id"

    query_session_entries = ""
    query_team = "race_entry__team_driver__team__"
    query_driver = "race_entry__team_driver__driver__"
    query_circuit = "race_entry__race__circuit__"
    order_by = ["pk"]

    def get_queryset(self) -> QuerySet:
        model = self.serializer_class.Meta.model
        filters = self.get_criteria_filters(**self.kwargs)
        status_id_subquery = Status.objects.filter(status=OuterRef("detail"))
        return (
            model.objects.filter(Q(session__type=SessionType.RACE) & filters)
            .values("detail")
            .annotate(
                count=Count("detail"),
                statusId=Subquery(status_id_subquery.values("pk")[:1]),
            )
            .order_by("statusId")
            .distinct()
        )


class ConstructorViewSet(ErgastModelViewSet):
    serializer_class = serializers.ConstructorSerializer
    lookup_field = "reference"

    query_session_entries = "team_drivers__race_entries__session_entries__"
    query_team = ""
    query_driver = "team_drivers__driver__"
    query_circuit = "team_drivers__race_entries__race__circuit__"
    order_by = ["reference"]


class DriverViewSet(ErgastModelViewSet):
    serializer_class = serializers.DriverSerializer
    lookup_field = "reference"

    query_session_entries = "team_drivers__race_entries__session_entries__"
    query_team = "team_drivers__team__"
    query_driver = ""
    query_circuit = "team_drivers__race_entries__race__circuit__"
    order_by = ["reference"]


class ResultViewSet(ErgastModelViewSet):
    serializer_class = serializers.RaceResultsSerializer
    lookup_field = None

    query_session_entries = ""
    query_team = "race_entry__team_driver__team__"
    query_driver = "race_entry__team_driver__driver__"
    query_circuit = "race_entry__race__circuit__"
    order_by = ["race_entry__race", "position"]

    result_session_type = SessionType.RACE

    def get_queryset(self) -> QuerySet:
        model = self.serializer_class.Meta.model
        filters = self.get_criteria_filters(**self.kwargs) & Q(session__type=self.result_session_type)
        return model.objects.filter(filters).order_by(*self.order_by).select_related("race_entry__race").distinct()


class SprintViewSet(ResultViewSet):
    serializer_class = serializers.SprintResultsSerializer

    result_session_type = SessionType.SPRINT_RACE

class QualifyingViewSet(ResultViewSet):
    serializer_class = serializers.QualifyingResultsSerializer

    def get_queryset(self) -> QuerySet:
        model = self.serializer_class.Meta.model
        filters = self.get_criteria_filters(**self.kwargs) & Q(session__type__startswith="Q")
        return model.objects.filter(filters).order_by(*self.order_by).select_related("race_entry__race").distinct()