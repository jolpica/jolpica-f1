from datetime import date

import knox.auth
from django.db.models import Count, Max, Min, Prefetch, Q
from django.db.models.query import QuerySet
from django.utils.decorators import method_decorator
from django.views.decorators.cache import cache_page
from rest_framework import permissions, viewsets  # noqa: F401
from rest_framework.decorators import api_view
from rest_framework.exceptions import ValidationError
from rest_framework.request import Request
from rest_framework.response import Response

from jolpica.formula_one.models import Lap, Season, Session, SessionEntry, SessionType, Team
from jolpica.formula_one.models.managed_views import DriverChampionship, TeamChampionship
from jolpica_api.settings import DEPLOYMENT_ENV

from ..authentication.throttles import ErgastLongThrottle, ErgastShortThrottle
from . import pagination, serializers
from .status_mapping import ERGAST_STATUS_MAPPING

CACHE_TIME_SECONDS = 60 * 60 if DEPLOYMENT_ENV == "PROD" else 15


@cache_page(CACHE_TIME_SECONDS)
@api_view()
def api_root_view(request: Request) -> Response:
    example_season = "2024"
    return Response(
        {
            "season": request.build_absolute_uri("f1/seasons"),
            "circuit": request.build_absolute_uri("f1/circuits"),
            "race": request.build_absolute_uri(f"f1/{example_season}/races"),
            "constructor": request.build_absolute_uri(f"f1/{example_season}/constructors"),
            "driver": request.build_absolute_uri(f"f1/{example_season}/drivers"),
            "result": request.build_absolute_uri(f"f1/{example_season}/results"),
            "sprint": request.build_absolute_uri(f"f1/{example_season}/sprint"),
            "qualifying": request.build_absolute_uri(f"f1/{example_season}/qualifying"),
            "pitstop": request.build_absolute_uri(f"f1/{example_season}/1/pitstops"),
            "lap": request.build_absolute_uri(f"f1/{example_season}/1/laps"),
            "driverstanding": request.build_absolute_uri(f"f1/{example_season}/driverstandings"),
            "constructorstanding": request.build_absolute_uri(f"f1/{example_season}/constructorstandings"),
            "status": request.build_absolute_uri("f1/status"),
        }
    )


@method_decorator(
    [
        cache_page(CACHE_TIME_SECONDS),
    ],
    name="dispatch",
)
class ErgastModelViewSet(viewsets.ReadOnlyModelViewSet):
    authentication_classes = [knox.auth.TokenAuthentication]
    throttle_classes = [ErgastLongThrottle, ErgastShortThrottle]
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
        **kwargs,  # quali_position
    ) -> Q:
        season_year, race_round = self.resolve_relative_filters(season_year, race_round)

        if fastest_lap_rank == "0":
            fastest_lap_rank = None
        filters = Q()
        if season_year:
            filters &= Q(**{f"{self.query_season}year": season_year})
        if race_round:
            filters &= Q(**{f"{self.query_round}number": race_round})
        if circuit_ref:
            filters &= Q(**{f"{self.query_circuit}reference": circuit_ref})
        if team_ref:
            filters &= Q(**{f"{self.query_team}reference": team_ref})
        if driver_ref:
            filters &= Q(**{f"{self.query_driver}reference": driver_ref})
        if lap_number:
            filters &= Q(**{f"{self.query_lap}number": lap_number})
        if pitstop_number:
            filters &= Q(**{f"{self.query_pitstop}number": pitstop_number})
        if grid_position or race_position or fastest_lap_rank or sprint_race_position or ergast_status_id:
            if sprint_race_position:
                filters &= Q(**{f"{self.query_session_entries}session__type": SessionType.SPRINT_RACE})
                race_position = sprint_race_position
            else:
                filters &= Q(**{f"{self.query_session_entries}session__type": SessionType.RACE})
            if grid_position:
                filters &= Q(**{f"{self.query_session_entries}grid": grid_position})
            if race_position:
                filters &= Q(**{f"{self.query_session_entries}position": race_position}) & Q(
                    **{f"{self.query_session_entries}is_classified": True}
                )
            if fastest_lap_rank:
                filters &= Q(**{f"{self.query_session_entries}fastest_lap_rank": fastest_lap_rank})
            if ergast_status_id:
                filters &= Q(**{f"{self.query_session_entries}detail": ERGAST_STATUS_MAPPING[int(ergast_status_id)]})
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
    lookup_value_regex = r"[0-9]+"

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
        return (
            model.objects.filter(Q(session__type=SessionType.RACE) & filters)
            .values("detail")
            .annotate(
                count=Count("detail"),
            )
            .filter(count__gt=0)
            .order_by("-count", "detail")
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
    lookup_value_regex = r"[0-9]+"

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
            filters &= Q(is_classified=True)
        return super().get_criteria_filters(*args, **kwargs) & filters

    def get_queryset(self) -> QuerySet:
        return (
            super()
            .get_queryset()
            .select_related(
                "round_entry__round__season",
                "round_entry__round__circuit",
                "round_entry__team_driver__driver",
                "round_entry__team_driver__team",
            )
        ).prefetch_related(
            "round_entry__round__sessions",
            Prefetch("laps", queryset=Lap.objects.filter(is_entry_fastest_lap=True), to_attr="fastest_lap_list"),
        )


class SprintViewSet(ResultViewSet):
    serializer_class = serializers.SprintResultsSerializer
    lookup_field = "sprint_race_position"
    lookup_value_regex = r"[0-9]+"

    result_session_type = SessionType.SPRINT_RACE

    def get_criteria_filters(self, *args, **kwargs) -> Q:
        kwargs.pop("ergast_status_id", None)  # Filter status separately
        kwargs.pop("grid_position", None)  # Filter status separately
        return super().get_criteria_filters(*args, **kwargs)

    def get_queryset(self) -> QuerySet:
        qs = super().get_queryset()

        filters = Q()
        if ergast_status_id := self.kwargs.get("ergast_status_id", None):
            filters &= Q(round_entry__session_entries__detail=ERGAST_STATUS_MAPPING[int(ergast_status_id)])
        if grid_position := self.kwargs.get("grid_position", None):
            filters &= Q(round_entry__session_entries__grid=grid_position)
        if filters:
            filters &= Q(round_entry__session_entries__session__type=SessionType.SPRINT_RACE)
            qs = qs.filter(filters)
        return qs


class QualifyingViewSet(ErgastModelViewSet):
    serializer_class = serializers.QualifyingResultsSerializer
    lookup_field = "quali_position"
    lookup_value_regex = r"[0-9]+"

    query_session_entries = "session_entries__"
    query_team = "team_driver__team__"
    query_driver = "team_driver__driver__"
    query_circuit = "round__circuit__"
    query_season = "round__season__"
    query_round = "round__"
    order_by = ["round"]

    def get_criteria_filters(self, **kwargs) -> Q:
        # fastest_lap_rank and grid_position is handled in get_queryset
        kwargs.pop("grid_position", None)
        kwargs.pop("fastest_lap_rank", None)
        quali_position = kwargs.pop("quali_position", None)
        filters = Q(session_entries__position__isnull=False)
        if quali_position:
            filters &= Q(session_entries__session__type__startswith="Q") & Q(session_entries__position=quali_position)
        return super().get_criteria_filters(**kwargs) & filters

    def get_queryset(self) -> QuerySet:
        ann_filters = Q()
        if fastest_lap_rank := self.kwargs.get("fastest_lap_rank", None):
            ann_filters = ann_filters & Q(fastest_lap_rank=fastest_lap_rank)
        if grid_position := self.kwargs.get("grid_position", None):
            ann_filters &= Q(session_entries__session__type__startswith="R") & Q(session_entries__grid=grid_position)

        if ergast_status_id := self.kwargs.get("ergast_status_id", None):
            ann_filters &= Q(session_entries__session__type__startswith="R") & Q(
                session_entries__detail=ERGAST_STATUS_MAPPING[int(ergast_status_id)]
            )
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
            .prefetch_related(
                Prefetch("round__sessions", queryset=Session.objects.filter(type=SessionType.RACE)),
                Prefetch(
                    "session_entries",
                    queryset=SessionEntry.objects.filter(session__type__startswith="Q")
                    .order_by("session__number")
                    .select_related("session")
                    .prefetch_related(
                        Prefetch(
                            "laps",
                            queryset=Lap.objects.filter(is_entry_fastest_lap=True, is_deleted=False),
                            to_attr="fastest_lap_list",
                        )
                    ),
                    to_attr="quali_session_entries",
                ),
            )
        )
        return qs


class PitStopViewSet(ErgastModelViewSet):
    serializer_class = serializers.PitStopSerializer
    lookup_field = "pitstop_number"
    lookup_value_regex = r"[0-9]+"

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
    lookup_value_regex = r"[0-9]+"

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


class StandingsErgastModelViewSet(ErgastModelViewSet):
    lookup_value_regex = r"[0-9]+"
    required_params = ["season_year"]
    order_by = ["position"]
    standings_model: TeamChampionship | DriverChampionship

    def get_criteria_filters(
        self,
        season_year=None,
        race_round=None,
        constructor_standings_position=None,
        driver_standings_position=None,
        format=None,
        **kwargs,
    ) -> Q:  # type: ignore
        filters = super().get_criteria_filters(**kwargs)
        season_year, race_round = self.resolve_relative_filters(season_year, race_round)

        if constructor_standings_position:
            filters &= Q(position=constructor_standings_position)
        elif driver_standings_position:
            filters &= Q(position=driver_standings_position)

        if race_round is None:
            # Set race round for paginator
            standings_model: TeamChampionship | DriverChampionship = self.serializer_class.Meta.model

            latest_standing = (
                standings_model.objects.filter(season__year=self.kwargs.get("season_year"))
                .order_by("round_number")
                .first()
            )
            self.kwargs["race_round"] = str(latest_standing.round_number) if latest_standing else None

        if season_year and race_round:
            filters &= Q(year=season_year) & Q(round__number=race_round)
        elif season_year:
            filters &= Q(season__year=season_year)
        elif season_year is None:
            filters &= Q(season__isnull=False)
        return filters


class DriverStandingViewSet(StandingsErgastModelViewSet):
    serializer_class = serializers.DriverStandingSerializer
    lookup_field = "driver_standings_position"

    query_session_entries = None
    query_team = None
    query_driver = "driver__"
    query_circuit = None
    query_season = "season__"
    query_round = "round__"

    def get_queryset(self) -> QuerySet:
        queryset = super().get_queryset()
        # Filter teams based on season and round
        teams_filter = Q()
        if season_year := self.kwargs.get("season_year", None):
            teams_filter &= Q(team_drivers__season__year=season_year)
        if race_round := self.kwargs.get("race_round", None):
            teams_filter &= Q(team_drivers__round_entries__round__number__lte=race_round)
        return queryset.prefetch_related(
            Prefetch(
                "driver__teams",
                queryset=Team.objects.all()
                .filter(teams_filter)
                .annotate(first_round=Min("team_drivers__round_entries__round__number"))
                .order_by("first_round")
                .distinct(),
                to_attr="fetched_teams",
            )
        )


class ConstructorStandingViewSet(StandingsErgastModelViewSet):
    serializer_class = serializers.ConstructorStandingSerializer
    lookup_field = "constructor_standings_position"

    query_session_entries = None
    query_team = "team__"
    query_driver = None
    query_circuit = None
    query_season = "season__"
    query_round = "round__"

    def get_queryset(self) -> QuerySet:
        return super().get_queryset().prefetch_related("team")
