from django.db.models import Prefetch
from django.utils import timezone
from rest_framework import permissions, response, viewsets

from jolpica.formula_one.models import Round, Season, Session, SessionType

# Import the updated serializers
from .serializers import SeasonScheduleSerializer


class SeasonScheduleViewSet(viewsets.ReadOnlyModelViewSet):
    """
    API endpoint that allows the full schedule for a season to be viewed.
    Includes details for each round and session, plus links to previous/next race.
    Optimized to reduce database queries.
    """

    serializer_class = SeasonScheduleSerializer
    permission_classes = [permissions.AllowAny]  # Or adjust as needed
    lookup_field = "year"

    def get_queryset(self):
        """
        Prefetch related rounds (ordered by date) and their sessions (ordered by date/time)
        and circuit details for efficiency.
        """
        rounds_prefetch = Prefetch(
            "rounds",
            queryset=Round.objects.prefetch_related(
                Prefetch("sessions", queryset=Session.objects.order_by("date", "time"), to_attr="prefetched_sessions"),
                "circuit",
            )
            .select_related("circuit")
            .order_by("date"),
            to_attr="prefetched_rounds_ordered",
        )

        queryset = Season.objects.prefetch_related(rounds_prefetch).all()

        year = self.kwargs.get("year")
        if year:
            queryset = queryset.filter(year=year)

        return queryset

    def get_serializer_context(self):
        """
        Pass request and pre-calculated next/previous round info to the serializer.
        """
        context = super().get_serializer_context()
        context["request"] = self.request
        # We will add previous_round_info and next_round_info in retrieve
        return context

    def retrieve(self, request, *args, **kwargs):
        """
        Handle single season retrieval, calculating next/previous round number and index efficiently.
        """
        instance = self.get_object()  # Gets the Season instance with prefetched data

        # --- Optimization: Calculate next/previous round number and index here ---
        today = timezone.now().date()
        previous_round_info = None
        next_round_info = None

        rounds_list = (
            list(instance.prefetched_rounds_ordered)
            if hasattr(instance, "prefetched_rounds_ordered")
            else list(instance.rounds.order_by("date"))
        )

        last_valid_previous_index = -1
        first_valid_next_index = -1

        for i, round_instance in enumerate(rounds_list):
            # Check if the round has a Race session
            has_race_session = False
            if hasattr(round_instance, "prefetched_sessions"):
                has_race_session = any(s.type == SessionType.RACE for s in round_instance.prefetched_sessions)

            if has_race_session and round_instance.date:
                if round_instance.date < today:
                    # Store the index of the latest past race found so far
                    last_valid_previous_index = i
                elif round_instance.date >= today and first_valid_next_index == -1:
                    # This is the first upcoming race
                    first_valid_next_index = i
                    # Now we have the next race index, the previous one is the one right before it (if valid)
                    break  # Stop searching once the first upcoming race is found

        # Construct the output dictionaries using the calculated indices
        if last_valid_previous_index != -1:
            prev_round = rounds_list[last_valid_previous_index]
            if prev_round.number is not None:  # Ensure round number exists
                previous_round_info = {"number": prev_round.number, "index": last_valid_previous_index}

        if first_valid_next_index != -1:
            next_round = rounds_list[first_valid_next_index]
            if next_round.number is not None:  # Ensure round number exists
                next_round_info = {"number": next_round.number, "index": first_valid_next_index}

        # --- End Optimization ---

        # Pass the calculated info to the serializer context
        context = self.get_serializer_context()
        context["previous_round_info"] = previous_round_info
        context["next_round_info"] = next_round_info

        # Manually assign prefetched sessions using a temp attribute
        if hasattr(instance, "prefetched_rounds_ordered"):
            instance.rounds_for_serializer = []
            for r in instance.prefetched_rounds_ordered:
                if hasattr(r, "prefetched_sessions"):
                    r.sessions_for_serializer = r.prefetched_sessions
                else:
                    r.sessions_for_serializer = list(r.sessions.order_by("date", "time"))  # Fallback query
                instance.rounds_for_serializer.append(r)
        else:
            instance.rounds_for_serializer = list(instance.rounds.order_by("date").prefetch_related("sessions"))
            for r in instance.rounds_for_serializer:
                r.sessions_for_serializer = list(r.sessions.order_by("date", "time"))

        serializer = self.get_serializer(instance, context=context)
        return response.Response(serializer.data)
