from django.db.models import Q
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import filters, viewsets
from rest_framework.pagination import PageNumberPagination

from jolpica.formula_one.models import (
    Circuit,
    Driver,
    Round,
    Season,
    Session,
    SessionEntry,
    Team,
)

from .serializers import (
    CircuitSerializer,
    DriverSerializer,
    RoundSerializer,
    SeasonSerializer,
    SessionEntrySerializer,
    SessionSerializer,
    TeamSerializer,
)


class CustomPageNumberPagination(PageNumberPagination):
    page_size = 100


class SeasonViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Season.objects.all()
    serializer_class = SeasonSerializer
    pagination_class = CustomPageNumberPagination
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ["year"]
    search_fields = ["year"]
    lookup_field = "year"


class RoundViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Round.objects.all()
    serializer_class = RoundSerializer
    pagination_class = CustomPageNumberPagination
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ["season__year", "number"]
    search_fields = ["season__year", "number"]

    def get_queryset(self):
        """
        Optionally filter rounds by year.
        """
        queryset = self.queryset
        year = self.kwargs.get("year")
        if year is not None:
            queryset = queryset.filter(season__year=year)
        return queryset


class CircuitViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Circuit.objects.all()
    serializer_class = CircuitSerializer
    pagination_class = CustomPageNumberPagination
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ["location", "country"]
    search_fields = ["name", "location", "country"]

    def get_queryset(self):
        """
        Optionally filter circuits by year.
        """
        queryset = self.queryset
        year = self.request.query_params.get("year")
        if year is not None:
            queryset = queryset.filter(Q(sessions__round__season__year=year)).distinct()
        return queryset


class TeamViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Team.objects.all()
    serializer_class = TeamSerializer
    pagination_class = CustomPageNumberPagination
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ["nationality"]
    search_fields = ["name", "nationality"]

    def get_queryset(self):
        """
        Optionally filter teams by year.
        """
        queryset = self.queryset
        year = self.request.query_params.get("year")
        if year is not None:
            queryset = queryset.filter(Q(session_entries__session__round__season__year=year)).distinct()
        return queryset


class DriverViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Driver.objects.all()
    serializer_class = DriverSerializer
    pagination_class = CustomPageNumberPagination
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ["nationality"]
    search_fields = ["forename", "surname", "nationality"]

    def get_queryset(self):
        """
        Optionally filter drivers by year.
        """
        queryset = self.queryset
        year = self.request.query_params.get("year")
        if year is not None:
            queryset = queryset.filter(Q(session_entries__session__round__season__year=year)).distinct()
        return queryset


class SessionViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Session.objects.all()
    serializer_class = SessionSerializer
    pagination_class = CustomPageNumberPagination
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ["round__season__year", "round", "session_type"]
    search_fields = ["round__season__year", "round__round_number", "session_type"]

    def get_queryset(self):
        """
        Optionally filter sessions by year and round.
        """
        queryset = self.queryset
        year = self.request.query_params.get("year")
        round = self.request.query_params.get("round")
        if year is not None:
            queryset = queryset.filter(round__season__year=year)
        if round is not None:
            queryset = queryset.filter(round=round)
        return queryset


class SessionEntryViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = SessionEntry.objects.all()
    serializer_class = SessionEntrySerializer
    pagination_class = CustomPageNumberPagination
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ["session__round__season__year", "session"]
    search_fields = [
        "session__round__season__year",
        "session__round__round_number",
    ]

    def get_queryset(self):
        """
        Optionally filter session entries by year and session.
        """
        queryset = self.queryset
        year = self.request.query_params.get("year")
        session = self.request.query_params.get("session")
        if year is not None:
            queryset = queryset.filter(session__round__season__year=year).distinct()
        if session is not None:
            queryset = queryset.filter(session=session)
        return queryset
