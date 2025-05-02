# jolpica_api/f1_api/views.py

from django.db.models import Prefetch
from django.utils import timezone

# Import drf-spectacular utils and your Pydantic schemas
from drf_spectacular.utils import extend_schema, extend_schema_view
from rest_framework import permissions, response, viewsets

from jolpica.formula_one import models as f1

# Import your Pydantic schemas from the specific alpha file
from jolpica.schemas.f1_api.alpha import (
    DetailResponseSchema,
    PaginatedSeasonScheduleListSchema,
)

from .pagination import StandardMetadataPagination
from .serializers import SeasonScheduleDetailSerializer, SeasonScheduleSerializer


# Use extend_schema_view for class-level schema definitions and tags
@extend_schema_view(
    list=extend_schema(
        summary="List all F1 Season Schedules",
        description="Provides a paginated list of all available F1 seasons with links to their detailed schedule.",
        responses={200: PaginatedSeasonScheduleListSchema},  # Reference the Pydantic schema
    ),
    retrieve=extend_schema(
        summary="Get Detailed F1 Season Schedule",
        description="Provides the full schedule for a given season year, including rounds, sessions, and circuit details.",
        responses={200: DetailResponseSchema},  # Reference the Pydantic schema
    ),
)
class SeasonScheduleViewSet(viewsets.ReadOnlyModelViewSet):
    """
    API endpoint that allows the full schedule for a season to be viewed.
    Detail view includes details for each round and session, plus links to previous/next race.
    Uses standard metadata/data response format. (Alpha Version)
    """

    # Add tags for better organization in Swagger UI
    tags = ["Alpha", "Schedule"]  # Group this endpoint under 'Alpha' and 'Schedule' tags

    permission_classes = [permissions.AllowAny]
    lookup_field = "year"
    pagination_class = StandardMetadataPagination  # Pagination applies to 'list' view

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
                    Prefetch(
                        "sessions", queryset=f1.Session.objects.order_by("date", "time"), to_attr="prefetched_sessions"
                    ),
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

    # The retrieve method itself doesn't need extend_schema again if defined in extend_schema_view
    # The existing implementation already structures the response correctly for DetailResponseSchema
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
                .select_related("circuit")  # Added select_related here for fallback
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
                    # Corrected logic: find the *first* upcoming race, don't break early if looking for last past race
                    first_valid_next_index = i
                    # No need to break if we want the *last* valid previous index

        # Logic to find the actual previous and next based on last_valid_previous_index
        previous_round_info = None
        if last_valid_previous_index != -1:
            prev_round = rounds_list[last_valid_previous_index]
            if prev_round.number is not None:
                previous_round_info = {"number": prev_round.number, "index": last_valid_previous_index}

        next_round_info = None
        # Find the actual next round *after* the last past round
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
                break  # Found the first valid next round
            potential_next_index += 1

        context = self.get_serializer_context()
        context["rounds_info"] = {
            "next": next_round_info,
            "previous": previous_round_info,
        }

        instance.rounds_for_serializer = []
        for r in rounds_list:
            r.sessions_for_serializer = (
                r.prefetched_sessions
                if hasattr(r, "prefetched_sessions")
                else list(r.sessions.order_by("date", "time"))
            )
            instance.rounds_for_serializer.append(r)

        serializer = self.get_serializer(instance, context=context)
        data = serializer.data

        # Structure the response according to DetailResponseSchema
        metadata = {
            "timestamp": timezone.now(),
        }
        return response.Response({"metadata": metadata, "data": data})
