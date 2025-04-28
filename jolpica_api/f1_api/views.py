from django.db.models import Prefetch, Q
from django.utils import timezone
from rest_framework import permissions, response, viewsets

from jolpica.formula_one.models import Round, Season, Session, SessionType

from .pagination import StandardMetadataPagination  # Import the custom pagination class
from .serializers import SeasonScheduleSerializer


class SeasonScheduleViewSet(viewsets.ReadOnlyModelViewSet):
    """
    API endpoint that allows the full schedule for a season to be viewed.
    Includes details for each round and session, plus links to previous/next race.
    Uses standard metadata/data response format.
    """
    serializer_class = SeasonScheduleSerializer
    permission_classes = [permissions.AllowAny]
    lookup_field = 'year'
    # Use the custom pagination class
    pagination_class = StandardMetadataPagination

    def get_queryset(self):
        """
        Prefetch related rounds (ordered by date) and their sessions (ordered by date/time)
        and circuit details for efficiency.
        """
        rounds_prefetch = Prefetch(
            'rounds',
            queryset=Round.objects.prefetch_related(
                Prefetch(
                    'sessions',
                    queryset=Session.objects.order_by('date', 'time'),
                    to_attr='prefetched_sessions'
                ),
                'circuit'
            ).select_related('circuit').order_by('date'),
            to_attr='prefetched_rounds_ordered'
        )
        queryset = Season.objects.prefetch_related(rounds_prefetch).order_by("-year").all()
        year = self.kwargs.get('year')
        if year:
            queryset = queryset.filter(year=year)
        return queryset

    def get_serializer_context(self):
        """ Pass request and pre-calculated next/previous round info to the serializer. """
        context = super().get_serializer_context()
        context['request'] = self.request
        return context

    def retrieve(self, request, *args, **kwargs):
        """
        Override retrieve to wrap the single result in the standard metadata/data format.
        """
        instance = self.get_object()

        # --- Calculate next/previous round number and index ---
        today = timezone.now().date()
        previous_round_info = None
        next_round_info = None
        rounds_list = list(instance.prefetched_rounds_ordered) if hasattr(instance, 'prefetched_rounds_ordered') else list(instance.rounds.order_by('date'))
        last_valid_previous_index = -1
        first_valid_next_index = -1

        for i, round_instance in enumerate(rounds_list):
            has_race_session = False
            if hasattr(round_instance, 'prefetched_sessions'):
                 has_race_session = any(s.type == SessionType.RACE for s in round_instance.prefetched_sessions)

            if has_race_session and round_instance.date:
                if round_instance.date < today:
                    last_valid_previous_index = i
                elif round_instance.date >= today and first_valid_next_index == -1:
                    first_valid_next_index = i
                    break

        if last_valid_previous_index != -1:
            prev_round = rounds_list[last_valid_previous_index]
            if prev_round.number is not None:
                 previous_round_info = {"number": prev_round.number, "index": last_valid_previous_index}

        if first_valid_next_index != -1:
            next_round = rounds_list[first_valid_next_index]
            if next_round.number is not None:
                next_round_info = {"number": next_round.number, "index": first_valid_next_index}
        # --- End calculation ---

        context = self.get_serializer_context()
        context['previous_round_info'] = previous_round_info
        context['next_round_info'] = next_round_info

        # Assign prefetched data to temporary attributes for serializer
        if hasattr(instance, 'prefetched_rounds_ordered'):
            instance.rounds_for_serializer = []
            for r in instance.prefetched_rounds_ordered:
                 if hasattr(r, 'prefetched_sessions'):
                     r.sessions_for_serializer = r.prefetched_sessions
                 else:
                     r.sessions_for_serializer = list(r.sessions.order_by('date', 'time')) # Fallback
                 instance.rounds_for_serializer.append(r)
        else: # Fallback if prefetch name changes or fails
            instance.rounds_for_serializer = list(instance.rounds.order_by('date').prefetch_related('sessions'))
            for r in instance.rounds_for_serializer:
                 r.sessions_for_serializer = list(r.sessions.order_by('date', 'time'))

        serializer = self.get_serializer(instance, context=context)
        data = serializer.data

        # Construct the response structure for detail view
        metadata = {
            'timestamp': timezone.now(),
            # Add other relevant non-pagination metadata if needed
        }
        return response.Response({
            'metadata': metadata,
            'data': data
        })

    # Optional: Override list if you want absolute certainty the structure is
    # always used, even if pagination is somehow disabled. Usually handled by pagination_class.
    # def list(self, request, *args, **kwargs):
    #     queryset = self.filter_queryset(self.get_queryset())
    #     page = self.paginate_queryset(queryset)
    #     if page is not None:
    #         # This uses the custom get_paginated_response from StandardMetadataPagination
    #         serializer = self.get_serializer(page, many=True)
    #         return self.get_paginated_response(serializer.data)

    #     # Fallback if pagination is not used (e.g., page_size=0 or disabled)
    #     serializer = self.get_serializer(queryset, many=True)
    #     metadata = {'timestamp': timezone.now()}
    #     return response.Response({'metadata': metadata, 'data': serializer.data})