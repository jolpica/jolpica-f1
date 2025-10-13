from django.db.models import Prefetch
from django.utils import timezone
from drf_spectacular.utils import extend_schema, extend_schema_view
from rest_framework import permissions, response, viewsets

from jolpica.formula_one import models as f1
from jolpica.formula_one.models import SessionType
from jolpica.schemas.f1_api.alpha import (
    DetailMetadata,
    DetailResponse,
    RetrievedRoundDetail,
    RetrievedScheduleDetail,
    RoundQueryParams,
    RoundSummary,
    ScheduleDetail,
    ScheduleSummary,
)

from .pagination import StandardMetadataPagination
from .serializers import (
    RoundSerializer,
    SeasonScheduleDetailSerializer,
    SeasonScheduleSerializer,
)
from .utils import pydantic_to_open_api_parameters, validate_query_params


@extend_schema_view(
    list=extend_schema(
        summary="List all F1 Season Schedules",
        description="Provides a paginated list of all available F1 seasons with links to their detailed schedule.",
        responses={200: ScheduleSummary},
    ),
    retrieve=extend_schema(
        summary="Get Detailed F1 Season Schedule",
        description="Provides the full schedule for a given season year, "
        + "including rounds, sessions, and circuit details.",
        responses={200: RetrievedScheduleDetail},
    ),
)
class SeasonScheduleViewSet(viewsets.ReadOnlyModelViewSet):
    """
    API endpoint that allows the full schedule for a season to be viewed.
    Detail view includes details for each round and session, plus links to previous/next race.
    Uses standard metadata/data response format. (Alpha Version)
    """

    permission_classes = [permissions.AllowAny]
    lookup_field = "year"
    pagination_class = StandardMetadataPagination

    # Sessions to consolidate into a single entry in the retrieve response
    CONSOLIDATED_SESSIONS = {
        (SessionType.QUALIFYING_ONE, SessionType.QUALIFYING_TWO, SessionType.QUALIFYING_THREE): ("Q", "Qualifying"),
        (
            SessionType.SPRINT_QUALIFYING_ONE,
            SessionType.SPRINT_QUALIFYING_TWO,
            SessionType.SPRINT_QUALIFYING_THREE,
        ): ("SQ", "Sprint Qualifying"),
    }

    def get_queryset(self):
        """
        Prefetch related rounds (ordered by date) and their sessions (ordered by date/time)
        and circuit details for efficiency. Only prefetch rounds/sessions if needed (detail view).
        """
        queryset = f1.Season.objects.order_by("-year")
        year = self.kwargs.get("year")
        if year:
            queryset = queryset.filter(year=year)

        if self.action == "retrieve":  # Apply prefetch for detail view
            rounds_prefetch = Prefetch(
                "rounds",
                queryset=f1.Round.objects.prefetch_related(
                    Prefetch("sessions", queryset=f1.Session.objects.order_by("number"), to_attr="prefetched_sessions"),
                )
                .select_related("circuit")
                .order_by("date"),
                to_attr="prefetched_rounds_ordered",
            )
            queryset = queryset.prefetch_related(rounds_prefetch)

        return queryset.all()

    def get_serializer_class(self):
        """
        Return the appropriate serializer class based on the view action.
        """
        if self.action == "retrieve":
            return SeasonScheduleDetailSerializer
        return SeasonScheduleSerializer

    def retrieve(self, request, *args, **kwargs):
        """
        Override retrieve to handle detail view specifics, including round_info calculation
        and ensuring related data is prepared for the detail serializer.
        """
        instance = self.get_object()

        today = timezone.now().date()
        rounds_list = (
            list(instance.prefetched_rounds_ordered)
            if hasattr(instance, "prefetched_rounds_ordered")
            else list(
                instance.rounds.order_by("date")
                .prefetch_related(
                    Prefetch(
                        "sessions", queryset=f1.Session.objects.order_by("timestamp"), to_attr="prefetched_sessions"
                    )
                )
                # Added select_related here for fallback
                .select_related("circuit")
            )
        )
        last_valid_previous_index = -1
        first_valid_next_index = -1

        for i, round_instance in enumerate(rounds_list):
            has_race_session = False
            sessions_to_check = (
                round_instance.prefetched_sessions
                if hasattr(round_instance, "prefetched_sessions")
                else round_instance.sessions.all()
            )
            has_race_session = any(s.type == f1.SessionType.RACE for s in sessions_to_check)

            if has_race_session and round_instance.date:
                if round_instance.date < today:
                    last_valid_previous_index = i
                elif round_instance.date >= today and first_valid_next_index == -1:
                    first_valid_next_index = i

        previous_round_info = None
        if last_valid_previous_index != -1:
            prev_round = rounds_list[last_valid_previous_index]
            if prev_round.number is not None:
                previous_round_info = {"number": prev_round.number, "index": last_valid_previous_index}

        next_round_info = None
        potential_next_index = last_valid_previous_index + 1
        while potential_next_index < len(rounds_list):
            next_round = rounds_list[potential_next_index]
            sessions_to_check = (
                next_round.prefetched_sessions
                if hasattr(next_round, "prefetched_sessions")
                else next_round.sessions.all()
            )
            has_race_session = any(s.type == f1.SessionType.RACE for s in sessions_to_check)
            if has_race_session and next_round.number is not None:
                next_round_info = {"number": next_round.number, "index": potential_next_index}
                break
            potential_next_index += 1

        context = self.get_serializer_context()
        context["rounds_info"] = {
            "next": next_round_info,
            "previous": previous_round_info,
        }

        instance.rounds_for_serializer = []
        for r in rounds_list:
            has_consolidated = {sessions: False for sessions in self.CONSOLIDATED_SESSIONS.keys()}
            original_sessions = (
                list(r.prefetched_sessions)
                if hasattr(r, "prefetched_sessions")
                else list(r.sessions.order_by("number"))
            )

            processed_sessions = []
            # Collapse consolidated sessions into a single entry
            for s in original_sessions:
                for session_types in has_consolidated.keys():
                    if SessionType(s.type) in session_types:
                        if not has_consolidated[session_types]:
                            s._is_consolidated_session = True
                            s._consolidated_session_type = self.CONSOLIDATED_SESSIONS[session_types]
                            processed_sessions.append(s)
                            has_consolidated[session_types] = True
                        break
                else:
                    processed_sessions.append(s)

            r.sessions_for_serializer = processed_sessions
            instance.rounds_for_serializer.append(r)

        serializer = self.get_serializer(instance, context=context)
        data = ScheduleDetail.model_validate(serializer.data)
        metadata = DetailMetadata(timestamp=timezone.now())
        return response.Response(
            DetailResponse(metadata=metadata, data=data).model_dump(mode="json", exclude_none=True)
        )


@extend_schema_view(
    list=extend_schema(
        summary="List all F1 Rounds",
        description="Provides a paginated list of all F1 rounds with circuit, season, and session information.",
        parameters=pydantic_to_open_api_parameters(RoundQueryParams),
        responses={200: RoundSummary},
    ),
    retrieve=extend_schema(
        summary="Get F1 Round Detail",
        description="Provides detailed information for a specific round, including circuit, season, and all sessions.",
        responses={200: RetrievedRoundDetail},
    ),
)
class RoundViewSet(viewsets.ReadOnlyModelViewSet):
    """
    API endpoint for viewing F1 rounds with circuit, season, and session details.
    Uses standard metadata/data response format. (Alpha Version)
    """

    permission_classes = [permissions.AllowAny]
    serializer_class = RoundSerializer
    pagination_class = StandardMetadataPagination
    lookup_field = "api_id"

    def _get_validated_query_params(self) -> RoundQueryParams:
        """Parse and validate query parameters using Pydantic."""
        return validate_query_params(
            query_params=self.request.query_params,
            model=RoundQueryParams,
            pagination_class=self.pagination_class,
        )

    def get_queryset(self):
        """Optimize database queries with select_related and prefetch_related."""
        queryset = f1.Round.objects.select_related("season", "circuit").prefetch_related("sessions")

        # Get validated query parameters
        params = self._get_validated_query_params()

        # Apply filters
        if params.year is not None:
            queryset = queryset.filter(season__year=params.year)

        if params.round_number is not None:
            queryset = queryset.filter(number=params.round_number)

        if params.race_number is not None:
            queryset = queryset.filter(race_number=params.race_number)

        if params.is_cancelled is not None:
            queryset = queryset.filter(is_cancelled=params.is_cancelled)

        if params.driver_id is not None:
            queryset = queryset.filter(round_entries__team_driver__driver__api_id=params.driver_id)

        if params.team_id is not None:
            queryset = queryset.filter(round_entries__team_driver__team__api_id=params.team_id)

        # Use distinct() when filtering on many-to-many relationships
        if params.driver_id or params.team_id:
            queryset = queryset.distinct()

        return queryset.order_by("season__year", "number")

    def retrieve(self, request, *args, **kwargs):
        """Override retrieve to return DetailResponse format."""
        instance = self.get_object()
        serializer = self.get_serializer(instance)
        data = RoundSummary.model_validate(serializer.data)
        metadata = DetailMetadata(timestamp=timezone.now())
        return response.Response(
            DetailResponse(metadata=metadata, data=data).model_dump(mode="json", exclude_none=True)
        )
