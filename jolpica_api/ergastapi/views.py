from django.db.models import Count, F, Max, Min, OuterRef, Prefetch, Q, Subquery, Sum, Value, Window, functions
from django.db.models.query import QuerySet
from jolpica.ergast.models import Status
from jolpica.formula_one.models import Driver, RoundEntry, Season, Session, SessionType, Team, TeamDriver
from rest_framework import permissions, viewsets  # noqa: F401
from rest_framework.exceptions import ValidationError

from . import pagination, serializers
from .status_mapping import ERGAST_STATUS_MAPPING


class ErgastModelViewSet(viewsets.ModelViewSet):
    # permission_classes = [permissions.IsAuthenticated]
    pagination_class = pagination.ErgastAPIPagination
    lookup_field: str | None = None  # type: ignore

    query_session_entries = None
    query_team = None
    query_driver = None
    query_circuit = None
    query_season = None
    query_race = None
    query_lap = None
    query_pitstop = None

    required_params: list[str] = []
    order_by: list[str] = []

    def get_criteria_filters(
        self,
        season_year=None,
        race_round=None,
        circuit_ref=None,
        team_ref=None,
        driver_ref=None,
        grid_position=None,
        race_position=None,
        sprint_race_position=None,
        fastest_lap_rank=None,
        ergast_status_id=None,
        lap_number=None,
        pitstop_number=None,
        **kwargs,
    ) -> Q:
        if fastest_lap_rank == "0":
            fastest_lap_rank = None
        filters = Q()
        if season_year:
            filters = filters & Q(**{f"{self.query_season}year": season_year})
        if race_round:
            filters = filters & Q(**{f"{self.query_race}number": race_round})
        if circuit_ref:
            filters = filters & Q(**{f"{self.query_circuit}reference": circuit_ref})
        if team_ref:
            filters = filters & Q(**{f"{self.query_team}reference": team_ref})
        if driver_ref:
            filters = filters & Q(**{f"{self.query_driver}reference": driver_ref})
        if lap_number:
            filters = filters & Q(**{f"{self.query_lap}number": lap_number})
        if pitstop_number:
            filters = filters & Q(**{f"{self.query_pitstop}number": pitstop_number})
        if grid_position or race_position or fastest_lap_rank or sprint_race_position:
            if sprint_race_position:
                filters = filters & Q(**{f"{self.query_session_entries}session__type": SessionType.SPRINT_RACE})
                race_position = sprint_race_position
            else:
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
                    {"detail": f"Bad Request: Missing one of the required parameters {self.required_params}."}, code=400
                )
        if (
            (self.query_season is None and self.kwargs.get("season_year"))
            or (self.query_race is None and self.kwargs.get("race_round"))
            or (self.query_circuit is None and self.kwargs.get("circuit_ref"))
            or (self.query_team is None and self.kwargs.get("team_ref"))
            or (self.query_driver is None and self.kwargs.get("driver_ref"))
            or (self.query_lap is None and self.kwargs.get("lap_number"))
            or (self.query_pitstop is None and self.kwargs.get("pitstop_number"))
            or (
                self.query_session_entries is None
                and (
                    self.kwargs.get("grid_position")
                    or self.kwargs.get("race_position")
                    or self.kwargs.get("sprint_race_position")
                    or self.kwargs.get("fastest_lap_rank")
                    or self.kwargs.get("ergast_status_id")
                )
            )
        ):
            raise ValidationError({"detail": "Bad Request: Unsupported filter for endpoint."})

    def get_queryset(self) -> QuerySet:
        self.validate_parameters()
        model = self.serializer_class.Meta.model  # type: ignore
        filters = self.get_criteria_filters(**self.kwargs)
        return model.objects.filter(filters).order_by(*self.order_by).distinct()

    def retrieve(self, request, **kwargs):
        if self.lookup_field is None:
            raise ValidationError({"detail": "Bad Request: Endpoint does not support final filter."})
        # lookup_field should be the first listed criteria when using retrieve
        self.kwargs = {self.lookup_field: kwargs[self.lookup_field], **self.kwargs}
        return self.list(request)


class SeasonViewSet(ErgastModelViewSet):
    serializer_class = serializers.SeasonSerializer
    lookup_field = None

    query_session_entries = "team_drivers__round_entries__session_entries__"
    query_team = "team_drivers__team__"
    query_driver = "team_drivers__driver__"
    query_circuit = "team_drivers__round_entries__race__circuit__"
    query_season = ""
    query_race = "team_drivers__round_entries__race__"
    order_by = ["year"]


class CircuitViewSet(ErgastModelViewSet):
    serializer_class = serializers.CircuitSerializer
    lookup_field = "circuit_ref"

    query_session_entries = "races__round_entries__session_entries__"
    query_team = "races__round_entries__team_driver__team__"
    query_driver = "races__round_entries__team_driver__driver__"
    query_circuit = ""
    query_season = "races__season__"
    query_race = "races__"
    order_by = ["reference"]

    def get_queryset(self) -> QuerySet:
        return super().get_queryset()


class RaceViewSet(ErgastModelViewSet):
    serializer_class = serializers.RaceSerializer
    lookup_field = None

    query_session_entries = "round_entries__session_entries__"
    query_team = "round_entries__team_driver__team__"
    query_driver = "round_entries__team_driver__driver__"
    query_circuit = "circuit__"
    query_season = "season__"
    query_race = ""
    order_by = ["season__year", "number"]

    def get_queryset(self) -> QuerySet:
        return super().get_queryset().select_related("season", "circuit").prefetch_related("sessions")


class StatusViewSet(ErgastModelViewSet):
    serializer_class = serializers.StatusSerializer
    lookup_field = "ergast_status_id"

    query_session_entries = ""
    query_team = "round_entry__team_driver__team__"
    query_driver = "round_entry__team_driver__driver__"
    query_circuit = "round_entry__race__circuit__"
    query_season = "round_entry__race__season__"
    query_race = "round_entry__race__"
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
    lookup_field = "team_ref"

    query_session_entries = "team_drivers__round_entries__session_entries__"
    query_team = ""
    query_driver = "team_drivers__driver__"
    query_circuit = "team_drivers__round_entries__race__circuit__"
    query_season = "team_drivers__season__"
    query_race = "team_drivers__round_entries__race__"
    order_by = ["reference"]


class DriverViewSet(ErgastModelViewSet):
    serializer_class = serializers.DriverSerializer
    lookup_field = "driver_ref"

    query_session_entries = "team_drivers__round_entries__session_entries__"
    query_team = "team_drivers__team__"
    query_driver = ""
    query_circuit = "team_drivers__round_entries__race__circuit__"
    query_season = "team_drivers__season__"
    query_race = "team_drivers__round_entries__race__"
    order_by = ["surname"]


class ResultViewSet(ErgastModelViewSet):
    serializer_class = serializers.RaceResultsSerializer
    lookup_field = "race_position"

    query_session_entries = ""
    query_team = "round_entry__team_driver__team__"
    query_driver = "round_entry__team_driver__driver__"
    query_circuit = "round_entry__race__circuit__"
    query_season = "round_entry__race__season__"
    query_race = "round_entry__race__"
    order_by = ["round_entry__race", "position"]

    result_session_type = SessionType.RACE

    def get_criteria_filters(self, *args, **kwargs) -> Q:
        filters = Q(session__type=self.result_session_type)
        if kwargs.get(self.lookup_field):
            filters = filters & Q(is_classified=True)
        return super().get_criteria_filters(*args, **kwargs) & filters

    def get_queryset(self) -> QuerySet:
        return (
            super()
            .get_queryset()
            .select_related(
                "fastest_lap",
                "round_entry__race__season",
                "round_entry__race__circuit",
                "round_entry__team_driver__driver",
                "round_entry__team_driver__team",
            )
        ).prefetch_related("round_entry__race__sessions")


class SprintViewSet(ResultViewSet):
    serializer_class = serializers.SprintResultsSerializer
    lookup_field = "sprint_race_position"

    result_session_type = SessionType.SPRINT_RACE


class QualifyingViewSet(ErgastModelViewSet):
    serializer_class = serializers.QualifyingResultsSerializer
    lookup_field = "grid_position"

    query_session_entries = "session_entries__"
    query_team = "team_driver__team__"
    query_driver = "team_driver__driver__"
    query_circuit = "race__circuit__"
    query_season = "race__season__"
    query_race = "race__"
    order_by = ["race"]

    def get_criteria_filters(self, *args, grid_position=None, **kwargs) -> Q:
        # Grid position is handled in get_queryset
        filters = Q(session_entries__position__isnull=False)
        return super().get_criteria_filters(*args, **kwargs) & filters

    def get_queryset(self) -> QuerySet:
        if grid_position := self.kwargs.get("grid_position", None):
            grid_filters = Q(session_entries__session__type=SessionType.RACE) & Q(session_entries__grid=grid_position)
        else:
            grid_filters = Q()
        qs = (
            super()
            .get_queryset()
            .annotate(
                driver_sess_count=Count("session_entries", filter=Q(session_entries__session__type__startswith="Q")),
                max_position=Min("session_entries__position", filter=Q(session_entries__session__type__startswith="Q")),
            )
            .filter(grid_filters, driver_sess_count__gt=0)
            .order_by(*self.order_by, "max_position")
            .select_related("race__circuit", "race__season", "team_driver__team", "team_driver__driver")
            .prefetch_related(Prefetch("race__sessions", queryset=Session.objects.filter(type=SessionType.RACE)))
        )
        return qs


class PitStopViewSet(ErgastModelViewSet):
    serializer_class = serializers.PitStopSerializer
    lookup_field = "pitstop_number"

    query_session_entries = "session_entry__"
    query_team = "session_entry__round_entry__team_driver__team__"
    query_driver = "session_entry__round_entry__team_driver__driver__"
    query_circuit = "session_entry__round_entry__race__circuit__"
    query_season = "session_entry__round_entry__race__season__"
    query_race = "session_entry__round_entry__race__"
    query_lap = "lap__"
    query_pitstop = ""

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
                "session_entry__round_entry__race__circuit",
                "session_entry__round_entry__race__season",
                "session_entry__round_entry__team_driver__driver",
            )
        ).prefetch_related(
            Prefetch(
                "session_entry__round_entry__race__sessions", queryset=Session.objects.filter(type=SessionType.RACE)
            )
        )


class LapViewSet(ErgastModelViewSet):
    serializer_class = serializers.LapSerializer
    lookup_field = "lap_number"

    query_session_entries = "session_entry__"
    query_team = "session_entry__round_entry__team_driver__team__"
    query_driver = "session_entry__round_entry__team_driver__driver__"
    query_circuit = "session_entry__round_entry__race__circuit__"
    query_season = "session_entry__round_entry__race__season__"
    query_race = "session_entry__round_entry__race__"
    query_lap = ""

    required_params = ["season_year", "race_round"]
    order_by = ["number", "position"]

    def get_criteria_filters(self, *args, **kwargs) -> Q:
        return super().get_criteria_filters(*args, **kwargs) & Q(session_entry__session__type=SessionType.RACE)

    def get_queryset(self) -> QuerySet:
        return (
            super()
            .get_queryset()
            .select_related(
                "session_entry__round_entry__race__circuit",
                "session_entry__round_entry__race__season",
                "session_entry__round_entry__team_driver__driver",
            )
        ).prefetch_related(
            Prefetch(
                "session_entry__round_entry__race__sessions", queryset=Session.objects.filter(type=SessionType.RACE)
            )
        )


class DriverStandingViewSet(ErgastModelViewSet):
    serializer_class = serializers.DriverStandingSerializer
    lookup_field = "driver_standings_position"

    query_session_entries = "team_drivers__round_entries__session_entries__"
    query_team = "team_drivers__team__"
    query_driver = ""
    query_circuit = "team_drivers__round_entries__race__circuit__"
    query_season = "team_drivers__season__"
    query_race = "team_drivers__round_entries__race__"

    required_params = ["season_year"]
    order_by = []

    def get_criteria_filters(self, season_year=None, race_round=None, format=None, **kwargs) -> Q:  # type: ignore
        filters = Q()
        if season_year:
            filters = filters & Q(team_drivers__season__year=season_year)
        if race_round:
            filters = filters & Q(team_drivers__round_entries__race__number__lte=race_round)

        return filters

    def get_queryset(self) -> QuerySet:
        self.validate_parameters()
        season_year = self.kwargs["season_year"]

        if position := self.kwargs.get("driver_standings_position", None):
            position_filter = Q(position=position)
        else:
            position_filter = Q()

        season = (
            Season.objects.filter(year=season_year)
            .annotate(
                championship_split=F("championship_system__driver_season_split"),
                championship_best_results=F("championship_system__driver_best_results"),
                season_rounds=Max("races__number"),
            )
            .first()
        )
        if season is None:
            raise ValidationError("Season not found")
        if (race_round := self.kwargs.get("race_round")) is None:
            race_round = season.season_rounds
            self.kwargs["race_round"] = str(race_round)

        return (
            Driver.objects.filter(self.get_criteria_filters(**self.kwargs))
            .distinct()
            .annotate(
                sum_points=Sum("team_drivers__round_entries__session_entries__points"),
                highest_finish=Min("team_drivers__round_entries__session_entries__position"),
                wins=Count(
                    "team_drivers__round_entries__session_entries__position",
                    filter=Q(
                        team_drivers__round_entries__session_entries__position=1,
                        team_drivers__round_entries__session_entries__session__type=SessionType.RACE,
                    ),
                ),
                position=Window(functions.RowNumber(), order_by=["-sum_points", "highest_finish"]),
                season_year=Value(int(season_year)),
                championship_split=Value(season.championship_split),
                championship_best_results=Value(season.championship_best_results),
                season_rounds=Value(season.season_rounds),
            )
            .filter(position_filter)
            .order_by("position")
            .prefetch_related(
                Prefetch(
                    "teams",
                    Team.objects.filter(
                        team_drivers__round_entries__race__season__year=season_year,
                        team_drivers__round_entries__race__number__lte=race_round,
                    )
                    .annotate(first_team_entry=Min("team_drivers__round_entries__race__number"))
                    .order_by("first_team_entry")
                    .distinct(),
                    to_attr="season_teams",
                ),
                Prefetch(
                    "team_drivers",
                    TeamDriver.objects.filter(
                        round_entries__race__season__year=season_year, round_entries__race__number__lte=race_round
                    ).distinct(),
                ),
                Prefetch(
                    "team_drivers__round_entries",
                    RoundEntry.objects.filter(race__season__year=season_year, race__number__lte=race_round).annotate(
                        race_round=F("race__number"),
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
    lookup_field = "constructor_standings_position"

    query_session_entries = "team_drivers__round_entries__session_entries__"
    query_team = ""
    query_driver = "team_drivers__driver__"
    query_circuit = "team_drivers__round_entries__race__circuit__"
    query_season = "team_drivers__season__"
    query_race = "team_drivers__round_entries__race__"

    required_params = ["season_year"]
    order_by = []

    def get_criteria_filters(self, season_year=None, race_round=None, format=None, **kwargs) -> Q:  # type: ignore
        filters = Q()
        if season_year:
            filters = filters & Q(team_drivers__season__year=season_year)
        if race_round:
            filters = filters & Q(team_drivers__round_entries__race__number__lte=race_round)

        return filters

    def get_queryset(self) -> QuerySet:
        self.validate_parameters()
        season_year = self.kwargs["season_year"]

        if position := self.kwargs.get("constructor_standings_position", None):
            position_filter = Q(position=position)
        else:
            position_filter = Q()

        season = (
            Season.objects.filter(year=season_year)
            .annotate(
                championship_split=F("championship_system__team_season_split"),
                championship_best_results=F("championship_system__team_best_results"),
                season_rounds=Max("races__number"),
            )
            .first()
        )
        if season is None:
            raise ValidationError("Season not found")
        if (race_round := self.kwargs.get("race_round")) is None:
            race_round = season.season_rounds
            self.kwargs["race_round"] = str(race_round)

        return (
            Team.objects.filter(self.get_criteria_filters(**self.kwargs))
            .distinct()
            .annotate(
                sum_points=Sum("team_drivers__round_entries__session_entries__points"),
                highest_finish=Min("team_drivers__round_entries__session_entries__position"),
                wins=Count(
                    "team_drivers__round_entries__session_entries__position",
                    filter=Q(
                        team_drivers__round_entries__session_entries__position=1,
                        team_drivers__round_entries__session_entries__session__type=SessionType.RACE,
                    ),
                ),
                position=Window(functions.RowNumber(), order_by=["-sum_points", "highest_finish"]),
                season_year=Value(int(season_year)),
                championship_split=Value(season.championship_split),
                championship_best_results=Value(season.championship_best_results),
                season_rounds=Value(season.season_rounds),
            )
            .filter(position_filter)
            .order_by("position")
            .prefetch_related(
                Prefetch(
                    "team_drivers",
                    TeamDriver.objects.filter(
                        round_entries__race__season__year=season_year, round_entries__race__number__lte=race_round
                    ).distinct(),
                ),
                Prefetch(
                    "team_drivers__round_entries",
                    RoundEntry.objects.filter(race__season__year=season_year, race__number__lte=race_round).annotate(
                        race_round=F("race__number"),
                        race_points=Sum("session_entries__points"),
                        race_position=Min(
                            "session_entries__position", filter=Q(session_entries__session__type=SessionType.RACE)
                        ),
                    ),
                ),
            )
        )
