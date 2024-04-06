from datetime import date

from django.db.models import Count, Max, Min, OuterRef, Prefetch, Q, Subquery
from django.db.models.query import QuerySet
from jolpica.ergast.models import Status
from jolpica.formula_one.models import Season, Session, SessionType, Team
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
    query_round = None
    query_lap = None
    query_pitstop = None

    required_params: list[str] = []
    order_by: list[str] = []

    def resolve_relative_filters(self, season_year=None, race_round=None):
        current_date = date.today()
        if season_year == "current":
            season_year = str(current_date.year)
            self.kwargs["season_year"] = season_year
        if race_round in {"next", "last"}:
            round_info = Season.objects.filter(year=season_year).aggregate(
                next=Min("rounds__number", filter=Q(rounds__date__gte=current_date)),
                final=Max("rounds__number"),
            )
            if race_round == "next" and round_info["next"] is not None:
                # Next Round of ongoing championship to take place
                race_round = str(round_info["next"])
            elif race_round == "next":
                # First round of next season
                race_round = str(1)
                season_year = str(int(season_year) + 1)
            elif race_round == "last" and round_info["next"] is not None:
                # Last completed race of ongoing season
                race_round = str(max(1, round_info["next"] - 1))
            elif race_round == "last":
                # Final round of completed season
                race_round = str(round_info["final"])
            self.kwargs["race_round"] = race_round
            self.kwargs["season_year"] = season_year
        return season_year, race_round

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
        **kwargs, # quali_position
    ) -> Q:
        season_year, race_round = self.resolve_relative_filters(season_year, race_round)

        if fastest_lap_rank == "0":
            fastest_lap_rank = None
        filters = Q()
        if season_year:
            filters = filters & Q(**{f"{self.query_season}year": season_year})
        if race_round:
            filters = filters & Q(**{f"{self.query_round}number": race_round})
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
        if grid_position or race_position or fastest_lap_rank or sprint_race_position or ergast_status_id:
            if sprint_race_position:
                filters = filters & Q(**{f"{self.query_session_entries}session__type": SessionType.SPRINT_RACE})
                race_position = sprint_race_position
            else:
                filters = filters & Q(**{f"{self.query_session_entries}session__type": SessionType.RACE})
            if grid_position:
                filters = filters & Q(**{f"{self.query_session_entries}grid": grid_position})
            if race_position:
                filters = (
                    filters
                    & Q(**{f"{self.query_session_entries}position": race_position})
                    & Q(**{f"{self.query_session_entries}is_classified": True})
                )
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
            or (self.query_round is None and self.kwargs.get("race_round"))
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
    query_circuit = "team_drivers__round_entries__round__circuit__"
    query_season = ""
    query_round = "team_drivers__round_entries__round__"
    order_by = ["year"]


class CircuitViewSet(ErgastModelViewSet):
    serializer_class = serializers.CircuitSerializer
    lookup_field = "circuit_ref"

    query_session_entries = "rounds__round_entries__session_entries__"
    query_team = "rounds__round_entries__team_driver__team__"
    query_driver = "rounds__round_entries__team_driver__driver__"
    query_circuit = ""
    query_season = "rounds__season__"
    query_round = "rounds__"
    order_by = ["reference"]


class RaceViewSet(ErgastModelViewSet):
    serializer_class = serializers.RaceSerializer
    lookup_field = None

    query_session_entries = "round_entries__session_entries__"
    query_team = "round_entries__team_driver__team__"
    query_driver = "round_entries__team_driver__driver__"
    query_circuit = "circuit__"
    query_season = "season__"
    query_round = ""
    order_by = ["season__year", "number"]

    def get_queryset(self) -> QuerySet:
        return super().get_queryset().select_related("season", "circuit").prefetch_related("sessions")


class StatusViewSet(ErgastModelViewSet):
    serializer_class = serializers.StatusSerializer
    lookup_field = "ergast_status_id"

    query_session_entries = ""
    query_team = "round_entry__team_driver__team__"
    query_driver = "round_entry__team_driver__driver__"
    query_circuit = "round_entry__round__circuit__"
    query_season = "round_entry__round__season__"
    query_round = "round_entry__round__"
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
    query_circuit = "team_drivers__round_entries__round__circuit__"
    query_season = "team_drivers__season__"
    query_round = "team_drivers__round_entries__round__"
    order_by = ["reference"]


class DriverViewSet(ErgastModelViewSet):
    serializer_class = serializers.DriverSerializer
    lookup_field = "driver_ref"

    query_session_entries = "team_drivers__round_entries__session_entries__"
    query_team = "team_drivers__team__"
    query_driver = ""
    query_circuit = "team_drivers__round_entries__round__circuit__"
    query_season = "team_drivers__season__"
    query_round = "team_drivers__round_entries__round__"
    order_by = ["surname"]


class ResultViewSet(ErgastModelViewSet):
    serializer_class = serializers.RaceResultsSerializer
    lookup_field = "race_position"

    query_session_entries = ""
    query_team = "round_entry__team_driver__team__"
    query_driver = "round_entry__team_driver__driver__"
    query_circuit = "round_entry__round__circuit__"
    query_season = "round_entry__round__season__"
    query_round = "round_entry__round__"
    order_by = ["round_entry__round", "position"]

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
                "round_entry__round__season",
                "round_entry__round__circuit",
                "round_entry__team_driver__driver",
                "round_entry__team_driver__team",
            )
        ).prefetch_related("round_entry__round__sessions")


class SprintViewSet(ResultViewSet):
    serializer_class = serializers.SprintResultsSerializer
    lookup_field = "sprint_race_position"

    result_session_type = SessionType.SPRINT_RACE


class QualifyingViewSet(ErgastModelViewSet):
    serializer_class = serializers.QualifyingResultsSerializer
    lookup_field = "quali_position"

    query_session_entries = "session_entries__"
    query_team = "team_driver__team__"
    query_driver = "team_driver__driver__"
    query_circuit = "round__circuit__"
    query_season = "round__season__"
    query_round = "round__"
    order_by = ["round"]

    def get_criteria_filters(self, *args, grid_position=None, fastest_lap_rank=None, quali_position=None, **kwargs) -> Q:
        # fastest_lap_rank and grid_position is handled in get_queryset
        filters = Q(session_entries__position__isnull=False)
        if quali_position:
            filters = (
                filters
                & Q(session_entries__session__type__startswith="Q")
                & Q(session_entries__position=quali_position)
            )
        return super().get_criteria_filters(*args, **kwargs) & filters

    def get_queryset(self) -> QuerySet:
        ann_filters = Q()
        if fastest_lap_rank := self.kwargs.get("fastest_lap_rank", None):
            ann_filters = ann_filters & Q(fastest_lap_rank=fastest_lap_rank)
        if grid_position := self.kwargs.get("grid_position", None):
            ann_filters = ann_filters & Q(session_entries__session__type__startswith="R") & Q(session_entries__grid=grid_position)

        if ergast_status_id := self.kwargs.get("ergast_status_id", None):
            ann_filters = ann_filters & Q(session_entries__session__type__startswith="R") & Q(session_entries__detail=ERGAST_STATUS_MAPPING[int(ergast_status_id)]) 
        else:
            ann_filters = ann_filters & Q(driver_sess_count__gt=0)

        qs = (
            super()
            .get_queryset()
            .annotate(
                driver_sess_count=Count("session_entries", filter=Q(session_entries__session__type__startswith="Q")),
                max_position=Min("session_entries__position", filter=Q(session_entries__session__type__startswith="Q")),
                fastest_lap_rank=Min("session_entries__fastest_lap_rank", filter=Q(session_entries__session__type="R")),
            )
            .filter(ann_filters)
            .order_by(*self.order_by, "max_position")
            .select_related("round__circuit", "round__season", "team_driver__team", "team_driver__driver")
            .prefetch_related(Prefetch("round__sessions", queryset=Session.objects.filter(type=SessionType.RACE)))
        )
        return qs


class PitStopViewSet(ErgastModelViewSet):
    serializer_class = serializers.PitStopSerializer
    lookup_field = "pitstop_number"

    query_session_entries = "session_entry__"
    query_team = "session_entry__round_entry__team_driver__team__"
    query_driver = "session_entry__round_entry__team_driver__driver__"
    query_circuit = "session_entry__round_entry__round__circuit__"
    query_season = "session_entry__round_entry__round__season__"
    query_round = "session_entry__round_entry__round__"
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
                "session_entry__round_entry__round__circuit",
                "session_entry__round_entry__round__season",
                "session_entry__round_entry__team_driver__driver",
            )
        ).prefetch_related(
            Prefetch(
                "session_entry__round_entry__round__sessions", queryset=Session.objects.filter(type=SessionType.RACE)
            )
        )


class LapViewSet(ErgastModelViewSet):
    serializer_class = serializers.LapSerializer
    lookup_field = "lap_number"

    query_session_entries = "session_entry__"
    query_team = "session_entry__round_entry__team_driver__team__"
    query_driver = "session_entry__round_entry__team_driver__driver__"
    query_circuit = "session_entry__round_entry__round__circuit__"
    query_season = "session_entry__round_entry__round__season__"
    query_round = "session_entry__round_entry__round__"
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
                "session_entry__round_entry__round__circuit",
                "session_entry__round_entry__round__season",
                "session_entry__round_entry__team_driver__driver",
            )
        ).prefetch_related(
            Prefetch(
                "session_entry__round_entry__round__sessions", queryset=Session.objects.filter(type=SessionType.RACE)
            )
        )


class DriverStandingViewSet(ErgastModelViewSet):
    serializer_class = serializers.DriverStandingSerializer
    lookup_field = "driver_standings_position"

    query_session_entries = None
    query_team = None
    query_driver = "driver__"
    query_circuit = None
    query_season = "season__"
    query_round = "round__"

    required_params = ["season_year"]
    order_by = ["position"]

    def get_criteria_filters(
        self, season_year=None, race_round=None, driver_standings_position=None, format=None, **kwargs
    ) -> Q:  # type: ignore
        filters = super().get_criteria_filters(**kwargs)
        season_year, race_round = self.resolve_relative_filters(season_year, race_round)

        if driver_standings_position:
            filters = filters & Q(position=driver_standings_position)

        if season_year and race_round:
            filters = filters & Q(year=season_year) & Q(round__number=race_round)
        elif season_year:
            filters = filters & Q(season__year=season_year)
        return filters

    def get_queryset(self) -> QuerySet:
        if self.kwargs.get("race_round") is None:
            self.kwargs["race_round"] = str(
                Season.objects.get(year=self.kwargs.get("season_year")).rounds.aggregate(Max("number"))["number__max"]
            )
        return (
            super()
            .get_queryset()
            .prefetch_related(
                Prefetch(
                    "driver__teams",
                    queryset=Team.objects.all()
                    .filter(
                        team_drivers__season__year=self.kwargs.get("season_year"),
                        team_drivers__round_entries__round__number__lte=self.kwargs.get("race_round"),
                    )
                    .annotate(first_round=Min("team_drivers__round_entries__round__number"))
                    .order_by("first_round")
                    .distinct(),
                    to_attr="fetched_teams",
                )
            )
        )


class ConstructorStandingViewSet(ErgastModelViewSet):
    serializer_class = serializers.ConstructorStandingSerializer
    lookup_field = "constructor_standings_position"

    query_session_entries = None
    query_team = "team__"
    query_driver = None
    query_circuit = None
    query_season = "season__"
    query_round = "round__"

    required_params = ["season_year"]
    order_by = ["position"]

    def get_criteria_filters(
        self, season_year=None, race_round=None, constructor_standings_position=None, format=None, **kwargs
    ) -> Q:  # type: ignore
        filters = super().get_criteria_filters(**kwargs)
        season_year, race_round = self.resolve_relative_filters(season_year, race_round)

        if constructor_standings_position:
            filters = filters & Q(position=constructor_standings_position)

        if season_year and race_round:
            filters = filters & Q(year=season_year) & Q(round__number=race_round)
        elif season_year:
            filters = filters & Q(season__year=season_year)
        return filters

    def get_queryset(self) -> QuerySet:
        if self.kwargs.get("race_round") is None:
            self.kwargs["race_round"] = str(
                Season.objects.get(year=self.kwargs.get("season_year")).rounds.aggregate(Max("number"))["number__max"]
            )
        return super().get_queryset().prefetch_related("team")
