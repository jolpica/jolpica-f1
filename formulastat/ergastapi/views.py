from django.db.models import Count, F, Max, Min, OuterRef, Prefetch, Q, Subquery, Sum, Value, Window, functions
from django.db.models.query import QuerySet
from rest_framework import permissions, viewsets  # noqa: F401
from rest_framework.exceptions import ValidationError

from formulastat.ergast.models import Status
from formulastat.formula_one.models import Driver, RaceEntry, Season, Session, SessionType, Team, TeamDriver

from . import pagination, serializers
from .status_mapping import ERGAST_STATUS_MAPPING


class ErgastModelViewSet(viewsets.ModelViewSet):
    # permission_classes = [permissions.IsAuthenticated]
    pagination_class = pagination.ErgastAPIPagination

    query_session_entries = ""
    query_team = ""
    query_driver = ""
    query_circuit = ""
    query_season = ""
    query_race = ""

    required_params = []
    order_by = []

    def get_criteria_filters(
        self,
        season_year=None,
        race_round=None,
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
        if season_year:
            filters = filters & Q(**{f"{self.query_season}year": season_year})
        if race_round:
            filters = filters & Q(**{f"{self.query_race}round": race_round})
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
                **{f"{self.query_session_entries}detail": ERGAST_STATUS_MAPPING[int(ergast_status_id)]}
            )
        return filters

    def validate_parameters(self):
        for param in self.required_params:
            if param not in self.kwargs.keys():
                raise ValidationError(
                    {"detail": f"Bad Request: Missing one of the required parameters {self.required_params}"}, code=400
                )

    def get_queryset(self) -> QuerySet:
        self.validate_parameters()
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
    query_season = ""
    query_race = "team_drivers__race_entries__race__"
    order_by = ["year"]


class CircuitViewSet(ErgastModelViewSet):
    serializer_class = serializers.CircuitSerializer
    lookup_field = "circuit_ref"

    query_session_entries = "races__race_entries__session_entries__"
    query_team = "races__race_entries__team_driver__team__"
    query_driver = "races__race_entries__team_driver__driver__"
    query_circuit = ""
    query_season = "races__season__"
    query_race = "races__"
    order_by = ["reference"]

    def get_queryset(self) -> QuerySet:
        return super().get_queryset()


# season relation
class RaceViewSet(ErgastModelViewSet):
    serializer_class = serializers.RaceSerializer
    lookup_field = "pk"

    query_session_entries = "race_entries__session_entries__"
    query_team = "race_entries__team_driver__team__"
    query_driver = "race_entries__team_driver__driver__"
    query_circuit = "circuit__"
    query_season = "season__"
    query_race = ""
    order_by = ["season__year", "round"]

    def get_queryset(self) -> QuerySet:
        return super().get_queryset().select_related("season", "circuit").prefetch_related("sessions")


class StatusViewSet(ErgastModelViewSet):
    serializer_class = serializers.StatusSerializer
    lookup_field = "ergast_status_id"

    query_session_entries = ""
    query_team = "race_entry__team_driver__team__"
    query_driver = "race_entry__team_driver__driver__"
    query_circuit = "race_entry__race__circuit__"
    query_season = "race_entry__race__season__"
    query_race = "race_entry__race__"
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
    query_season = "team_drivers__season__"
    query_race = "team_drivers__race_entries__race__"
    order_by = ["reference"]


class DriverViewSet(ErgastModelViewSet):
    serializer_class = serializers.DriverSerializer
    lookup_field = "reference"

    query_session_entries = "team_drivers__race_entries__session_entries__"
    query_team = "team_drivers__team__"
    query_driver = ""
    query_circuit = "team_drivers__race_entries__race__circuit__"
    query_season = "team_drivers__season__"
    query_race = "team_drivers__race_entries__race__"
    order_by = ["surname"]


class ResultViewSet(ErgastModelViewSet):
    serializer_class = serializers.RaceResultsSerializer
    lookup_field = None

    query_session_entries = ""
    query_team = "race_entry__team_driver__team__"
    query_driver = "race_entry__team_driver__driver__"
    query_circuit = "race_entry__race__circuit__"
    query_season = "race_entry__race__season__"
    query_race = "race_entry__race__"
    order_by = ["race_entry__race", "position"]

    result_session_type = SessionType.RACE

    def get_criteria_filters(self, *args, **kwargs) -> Q:
        return super().get_criteria_filters(*args, **kwargs) & Q(session__type=self.result_session_type)

    def get_queryset(self) -> QuerySet:
        return (
            super()
            .get_queryset()
            .select_related(
                "fastest_lap",
                "race_entry__race__season",
                "race_entry__race__circuit",
                "race_entry__team_driver__driver",
                "race_entry__team_driver__team",
            )
        ).prefetch_related("race_entry__race__sessions")


class SprintViewSet(ResultViewSet):
    serializer_class = serializers.SprintResultsSerializer

    result_session_type = SessionType.SPRINT_RACE


class QualifyingViewSet(ErgastModelViewSet):
    serializer_class = serializers.QualifyingResultsSerializer
    lookup_field = None

    query_session_entries = "session_entries__"
    query_team = "team_driver__team__"
    query_driver = "team_driver__driver__"
    query_circuit = "race__circuit__"
    query_season = "race__season__"
    query_race = "race__"
    order_by = ["race"]

    def get_criteria_filters(self, *args, **kwargs) -> Q:
        return super().get_criteria_filters(*args, **kwargs) & Q(session_entries__position__isnull=False)

    def get_queryset(self) -> QuerySet:
        qs = (
            super()
            .get_queryset()
            .annotate(
                driver_sess_count=Count("session_entries", filter=Q(session_entries__session__type__startswith="Q")),
                max_position=Min("session_entries__position", filter=Q(session_entries__session__type__startswith="Q")),
            )
            .filter(driver_sess_count__gt=0)
            .order_by(*self.order_by, "max_position")
            .select_related("race__circuit", "race__season", "team_driver__team", "team_driver__driver")
            .prefetch_related(Prefetch("race__sessions", queryset=Session.objects.filter(type=SessionType.RACE)))
        )
        return qs


class PitStopViewSet(ErgastModelViewSet):
    serializer_class = serializers.PitStopSerializer
    lookup_field = None

    query_session_entries = "session_entry__"
    query_team = "session_entry__race_entry__team_driver__team__"
    query_driver = "session_entry__race_entry__team_driver__driver__"
    query_circuit = "session_entry__race_entry__race__circuit__"
    query_season = "session_entry__race_entry__race__season__"
    query_race = "session_entry__race_entry__race__"

    required_params = ["season_year", "race_round"]
    order_by = ["local_timestamp"]

    def get_criteria_filters(self, *args, **kwargs) -> Q:
        return super().get_criteria_filters(*args, **kwargs) & Q(session_entry__session__type=SessionType.RACE)

    def get_queryset(self) -> QuerySet:
        return (
            super()
            .get_queryset()
            .select_related(
                "lap",
                "session_entry__race_entry__race__circuit",
                "session_entry__race_entry__race__season",
                "session_entry__race_entry__team_driver__driver",
            )
        ).prefetch_related(
            Prefetch(
                "session_entry__race_entry__race__sessions", queryset=Session.objects.filter(type=SessionType.RACE)
            )
        )


class LapViewSet(ErgastModelViewSet):
    serializer_class = serializers.LapSerializer
    lookup_field = None

    query_session_entries = "session_entry__"
    query_team = "session_entry__race_entry__team_driver__team__"
    query_driver = "session_entry__race_entry__team_driver__driver__"
    query_circuit = "session_entry__race_entry__race__circuit__"
    query_season = "session_entry__race_entry__race__season__"
    query_race = "session_entry__race_entry__race__"

    required_params = ["season_year", "race_round"]
    order_by = ["number", "position"]

    def get_criteria_filters(self, *args, **kwargs) -> Q:
        return super().get_criteria_filters(*args, **kwargs) & Q(session_entry__session__type=SessionType.RACE)

    def get_queryset(self) -> QuerySet:
        return (
            super()
            .get_queryset()
            .select_related(
                "session_entry__race_entry__race__circuit",
                "session_entry__race_entry__race__season",
                "session_entry__race_entry__team_driver__driver",
            )
        ).prefetch_related(
            Prefetch(
                "session_entry__race_entry__race__sessions", queryset=Session.objects.filter(type=SessionType.RACE)
            )
        )


class DriverStandingViewSet(ErgastModelViewSet):
    serializer_class = serializers.DriverStandingSerializer
    lookup_field = None

    query_session_entries = "team_drivers__race_entries__session_entries__"
    query_team = "team_drivers__team__"
    query_driver = ""
    query_circuit = "team_drivers__race_entries__race__circuit__"
    query_season = "team_drivers__season__"
    query_race = "team_drivers__race_entries__race__"

    required_params = ["season_year"]
    order_by = []

    def get_criteria_filters(self, season_year=None, race_round=None, format=None, **kwargs) -> Q:
        filters = Q()
        if season_year:
            filters = filters & Q(team_drivers__season__year=season_year)
        if race_round:
            filters = filters & Q(team_drivers__race_entries__race__round__lte=race_round)

        return filters

    def get_queryset(self) -> QuerySet:
        self.validate_parameters()
        season_year = self.kwargs["season_year"]

        if (race_round := self.kwargs.get("race_round")) is None:
            race_round = 99
        season = (
            Season.objects.filter(year=season_year)
            .annotate(
                championship_split=F("championship_scheme__driver_season_split"),
                championship_best_results=F("championship_scheme__driver_best_results"),
                season_rounds=Max("races__round"),
            )
            .first()
        )
        return (
            Driver.objects.filter(self.get_criteria_filters(**self.kwargs))
            .distinct()
            .annotate(
                sum_points=Sum("team_drivers__race_entries__session_entries__points"),
                highest_finish=Min("team_drivers__race_entries__session_entries__position"),
                wins=Count(
                    "team_drivers__race_entries__session_entries__position",
                    filter=Q(
                        team_drivers__race_entries__session_entries__position=1,
                        team_drivers__race_entries__session_entries__session__type=SessionType.RACE,
                    ),
                ),
                position=Window(functions.RowNumber(), order_by=["-sum_points", "highest_finish"]),
                season_year=Value(int(season_year)),
                championship_split=Value(season.championship_split),
                championship_best_results=Value(season.championship_best_results),
                season_rounds=Value(season.season_rounds),
            )
            .order_by("position")
            .prefetch_related(
                Prefetch(
                    "teams",
                    Team.objects.filter(
                        team_drivers__race_entries__race__season__year=season_year,
                        team_drivers__race_entries__race__round__lte=race_round,
                    )
                    .annotate(first_team_entry=Min("team_drivers__race_entries__race__round"))
                    .order_by("first_team_entry")
                    .distinct(),
                    to_attr="season_teams",
                ),
                Prefetch(
                    "team_drivers",
                    TeamDriver.objects.filter(
                        race_entries__race__season__year=season_year, race_entries__race__round__lte=race_round
                    ).distinct(),
                ),
                Prefetch(
                    "team_drivers__race_entries",
                    RaceEntry.objects.filter(race__season__year=season_year, race__round__lte=race_round).annotate(
                        race_round=F("race__round"),
                        race_points=Sum("session_entries__points"),
                        race_position=Min(
                            "session_entries__position", filter=Q(session_entries__session__type=SessionType.RACE)
                        ),
                    ),
                ),
            )
        )


class ConstructorStandingViewSet(ErgastModelViewSet):
    serializer_class = serializers.ConstructorStandingSerializer
    lookup_field = None

    query_session_entries = "team_drivers__race_entries__session_entries__"
    query_team = ""
    query_driver = "team_drivers__driver__"
    query_circuit = "team_drivers__race_entries__race__circuit__"
    query_season = "team_drivers__season__"
    query_race = "team_drivers__race_entries__race__"

    required_params = ["season_year"]
    order_by = []

    def get_criteria_filters(self, season_year=None, race_round=None, format=None, **kwargs) -> Q:
        filters = Q()
        if season_year:
            filters = filters & Q(team_drivers__season__year=season_year)
        if race_round:
            filters = filters & Q(team_drivers__race_entries__race__round__lte=race_round)

        return filters

    def get_queryset(self) -> QuerySet:
        self.validate_parameters()
        season_year = self.kwargs["season_year"]

        if (race_round := self.kwargs.get("race_round")) is None:
            race_round = 99
        season = (
            Season.objects.filter(year=season_year)
            .annotate(
                championship_split=F("championship_scheme__team_season_split"),
                championship_best_results=F("championship_scheme__team_best_results"),
                season_rounds=Max("races__round"),
            )
            .first()
        )
        return (
            Team.objects.filter(self.get_criteria_filters(**self.kwargs))
            .distinct()
            .annotate(
                sum_points=Sum("team_drivers__race_entries__session_entries__points"),
                highest_finish=Min("team_drivers__race_entries__session_entries__position"),
                wins=Count(
                    "team_drivers__race_entries__session_entries__position",
                    filter=Q(
                        team_drivers__race_entries__session_entries__position=1,
                        team_drivers__race_entries__session_entries__session__type=SessionType.RACE,
                    ),
                ),
                position=Window(functions.RowNumber(), order_by=["-sum_points", "highest_finish"]),
                season_year=Value(int(season_year)),
                championship_split=Value(season.championship_split),
                championship_best_results=Value(season.championship_best_results),
                season_rounds=Value(season.season_rounds),
            )
            .order_by("position")
            .prefetch_related(
                Prefetch(
                    "team_drivers",
                    TeamDriver.objects.filter(
                        race_entries__race__season__year=season_year, race_entries__race__round__lte=race_round
                    ).distinct(),
                ),
                Prefetch(
                    "team_drivers__race_entries",
                    RaceEntry.objects.filter(race__season__year=season_year, race__round__lte=race_round).annotate(
                        race_round=F("race__round"),
                        race_points=Sum("session_entries__points"),
                        race_position=Min(
                            "session_entries__position", filter=Q(session_entries__session__type=SessionType.RACE)
                        ),
                    ),
                ),
            )
        )
