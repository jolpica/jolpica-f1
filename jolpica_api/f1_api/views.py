from django.db.models import Prefetch
from django.utils import timezone
from rest_framework import permissions, response, viewsets

from jolpica.formula_one import models as f1

from .pagination import StandardMetadataPagination
from .serializers import SeasonScheduleDetailSerializer, SeasonScheduleSerializer


class SeasonScheduleViewSet(viewsets.ReadOnlyModelViewSet):
    """
    API endpoint that allows the full schedule for a season to be viewed.
    Detail view includes details for each round and session, plus links to previous/next race.
    Uses standard metadata/data response format.
    """

    permission_classes = [permissions.AllowAny]
    lookup_field = "year"
    pagination_class = StandardMetadataPagination

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


    def retrieve(self, request, *args, **kwargs):
        """
        Override retrieve to handle detail view specifics, including round_info calculation
        and ensuring related data is prepared for the detail serializer.
        """
        instance = self.get_object()  # self.get_object applies get_queryset logic including prefetch

        today = timezone.now().date()
        # Use the prefetched attribute if available, otherwise query
        rounds_list = (
            list(instance.prefetched_rounds_ordered)
            if hasattr(instance, "prefetched_rounds_ordered")
            else list(
                instance.rounds.order_by("date").prefetch_related(
                    Prefetch(
                        "sessions", queryset=f1.Session.objects.order_by("date", "time"), to_attr="prefetched_sessions"
                    )
                )
            )  
        )
        last_valid_previous_index = -1
        first_valid_next_index = -1

        for i, round_instance in enumerate(rounds_list):
            # Check for Race session using prefetched sessions if available
            has_race_session = False
            sessions_to_check = (
                round_instance.prefetched_sessions
                if hasattr(round_instance, "prefetched_sessions")
                else round_instance.sessions.all()  # Fallback query if not prefetched
            )
            has_race_session = any(s.type == f1.SessionType.RACE for s in sessions_to_check)

            if has_race_session and round_instance.date:
                if round_instance.date < today:
                    last_valid_previous_index = i
                elif round_instance.date >= today and first_valid_next_index == -1:
                    first_valid_next_index = i
                    break

        previous_round_info = None
        next_round_info = None
        # Assign previous round info if found
        if last_valid_previous_index != -1 and last_valid_previous_index < len(rounds_list):
            prev_round = rounds_list[last_valid_previous_index]
            if prev_round.number is not None:
                previous_round_info = {"number": prev_round.number, "index": last_valid_previous_index}

        # Assign next round info if found
        if first_valid_next_index != -1 and first_valid_next_index < len(rounds_list):
            next_round = rounds_list[first_valid_next_index]
            if next_round.number is not None:
                next_round_info = {"number": next_round.number, "index": first_valid_next_index}

        # Prepare context specifically for the detail serializer
        context = self.get_serializer_context()
        context["rounds_info"] = {
            "next": next_round_info,
            "previous": previous_round_info,
        }

        # Ensure 'rounds_for_serializer' attribute exists for the detail serializer
        instance.rounds_for_serializer = []
        for r in rounds_list:
            # Ensure 'sessions_for_serializer' attribute exists for the RoundsScheduleSerializer
            r.sessions_for_serializer = (
                r.prefetched_sessions
                if hasattr(r, "prefetched_sessions")
                else list(r.sessions.order_by("date", "time"))  # Fallback
            )
            instance.rounds_for_serializer.append(r)

        serializer = self.get_serializer(instance, context=context)
        data = serializer.data

        metadata = {
            "timestamp": timezone.now(),
        }
        return response.Response({"metadata": metadata, "data": data})
