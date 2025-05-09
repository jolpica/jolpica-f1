from django.db.models import Prefetch
from django.http import Http404
from django.utils import timezone
from drf_spectacular.utils import extend_schema, extend_schema_view
from rest_framework import permissions, response, viewsets

from jolpica.formula_one import models as f1
from jolpica.formula_one.models import SessionType
from jolpica.schemas.f1_api.alpha import (
    DetailMetadata,
    DetailResponse,
    RetrievedScheduleDetail,
    RetrievedSessionDetail,
    ScheduleDetail,
    ScheduleSummary,
    SessionSummary,
)

from .pagination import StandardMetadataPagination
from .serializers import (
    SeasonScheduleDetailSerializer,
    SeasonScheduleSerializer,
    SessionDetailSerializer,
    SessionListSerializer,
)


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
                        "sessions", queryset=f1.Session.objects.order_by("date", "time"), to_attr="prefetched_sessions"
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
        return response.Response(DetailResponse(metadata=metadata, data=data).model_dump(mode="json"))


@extend_schema_view(
    list=extend_schema(
        summary="List all F1 Session Results",
        description="Provides a paginated list of all available F1 sessions with links to their detailed results.",
        responses={200: SessionSummary},
    ),
    retrieve=extend_schema(
        summary="Get F1 Session Results",
        description=(
            "Provides detailed results for a specific F1 session, including position, timing, "
            "and driver/team information."
        ),
        responses={200: RetrievedSessionDetail},
    ),
)
class SessionResultViewSet(viewsets.ReadOnlyModelViewSet):
    """
    API endpoint that allows viewing F1 session results.
    List view provides basic session information with links to details.
    Detail view includes full results with timing and classification data.
    Uses standard metadata/data response format. (Alpha Version)
    """

    permission_classes = [permissions.AllowAny]
    pagination_class = StandardMetadataPagination
    lookup_url_kwarg = None  # We'll handle the URL kwargs manually in get_object

    CONSOLIDATED_SESSIONS = {"Q": ["Q1", "Q2", "Q3"], "SQ": ["SQ1", "SQ2", "SQ3"]}

    def get_object(self):
        """
        Retrieve session by year, round number, and session type.
        For 'Q' and 'SQ', consolidates multiple qualifying sessions.
        """
        year = self.kwargs.get("year")
        round_number = self.kwargs.get("round_number")
        session_type = self.kwargs.get("session_type")

        if not all([year, round_number, session_type]):
            raise Http404("Missing required path parameters")

        queryset = self.get_queryset()

        # Handle consolidated qualifying sessions
        if session_type in self.CONSOLIDATED_SESSIONS:
            sessions = list(
                queryset.filter(
                    round__season__year=year,
                    round__number=round_number,
                    type__in=self.CONSOLIDATED_SESSIONS[session_type],
                ).order_by("type")
            )

            if not sessions:
                raise Http404

            # Use the first session as base but collect all entries
            base_session = sessions[0]
            base_session._is_consolidated_session = True
            session_name = "Qualifying" if session_type == "Q" else "Sprint Qualifying"
            base_session._consolidated_session_type = (session_type, session_name)

            # Create a dictionary to track best results and all times per driver
            best_results = {}
            all_times = {}
            for session in reversed(sessions):  # Reverse to prioritize later sessions (Q3 over Q2 over Q1)
                for entry in (
                    session.session_entries.all().prefetch_related("laps").filter(laps__is_entry_fastest_lap=True)
                ):
                    driver_id = entry.round_entry.team_driver.driver_id
                    fastest_lap = next((lap for lap in entry.laps.all() if lap.is_entry_fastest_lap), None)

                    # Track all qualifying times for this driver
                    if driver_id not in all_times:
                        all_times[driver_id] = []
                    all_times[driver_id].append((session.type, fastest_lap.time if fastest_lap else None))

                    # Track best result for this driver
                    if driver_id not in best_results:
                        best_results[driver_id] = entry
                    elif entry.is_classified and not best_results[driver_id].is_classified:
                        best_results[driver_id] = entry

            # Add consolidated times to each entry
            consolidated_entries = []
            for driver_id, entry in best_results.items():
                entry._consolidated_times = sorted(all_times[driver_id], key=lambda x: x[0])
                consolidated_entries.append(entry)

            # Sort consolidated entries by position
            consolidated_entries.sort(key=lambda x: (x.position if x.position is not None else float("inf")))
            base_session._consolidated_entries = consolidated_entries
            return base_session
        else:
            obj = queryset.filter(round__season__year=year, round__number=round_number, type=session_type).first()

            if obj is None:
                raise Http404

        self.check_object_permissions(self.request, obj)
        return obj

    def get_queryset(self):
        queryset = f1.Session.objects.filter(session_entries__isnull=False).distinct()

        if self.action == "retrieve":
            # Full prefetch for detail view
            return (
                queryset.select_related("round__circuit", "round__season")
                .prefetch_related(
                    Prefetch(
                        "session_entries",
                        queryset=(
                            f1.SessionEntry.objects.select_related(
                                "round_entry__team_driver__driver",
                                "round_entry__team_driver__team",
                            )
                            .prefetch_related(
                                Prefetch(
                                    "laps",
                                    queryset=f1.Lap.objects.filter(is_entry_fastest_lap=True),
                                    to_attr="fastest_lap_list",
                                )
                            )
                            .order_by("position", "-points")
                        ),
                    )
                )
                .order_by("-date", "-time")
            )

        # Simplified queryset for list view
        return queryset.select_related("round__circuit", "round__season").order_by("-date", "-time")

    def get_serializer_class(self):
        if self.action == "retrieve":
            return SessionDetailSerializer
        return SessionListSerializer

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        serializer = self.get_serializer(instance)
        metadata = DetailMetadata(timestamp=timezone.now())
        return response.Response(DetailResponse(metadata=metadata, data=serializer.data).model_dump(mode="json"))
