"""Data loading for schedule marshalling."""

from __future__ import annotations

from dataclasses import dataclass

from django.db.models import Prefetch
from django.urls import reverse
from pydantic import HttpUrl
from rest_framework import request

from jolpica.formula_one import models as f1
from jolpica_schemas.f1_api.alpha import shared
from jolpica_schemas.f1_api.alpha.schedule_v2 import ScheduleSummary


class NoSeasonFoundError(Exception):
    """Raised when a season is not found for a given year."""


@dataclass
class ScheduleRoundData:
    """Intermediate data for a single round in the schedule."""

    round: shared.Round
    circuit: shared.Circuit
    sessions: list[shared.Session]


@dataclass
class ScheduleData:
    """Complete schedule data for a season."""

    season: shared.Season
    rounds: list[ScheduleRoundData]


class ScheduleDataLoader:
    @classmethod
    def load_list(cls, req: request.Request) -> list[ScheduleSummary]:
        """Load all seasons as ScheduleSummary objects."""
        seasons = f1.Season.objects.order_by("-year")
        return [
            ScheduleSummary(
                id=s.api_id,
                url=HttpUrl(req.build_absolute_uri(reverse("v2-schedules-detail", args=[s.year]))),
                year=s.year,
                wikipedia=HttpUrl(s.wikipedia) if s.wikipedia else None,
            )
            for s in seasons
        ]

    @classmethod
    def load_detail(cls, req: request.Request, year: int) -> ScheduleData:
        """Load a single season with prefetched rounds, sessions, and circuits."""
        season = (
            f1.Season.objects.filter(year=year)
            .prefetch_related(
                Prefetch(
                    "rounds",
                    queryset=f1.Round.objects.prefetch_related(
                        Prefetch(
                            "sessions",
                            queryset=f1.Session.objects.order_by("number", "timestamp"),
                            to_attr="prefetched_sessions",
                        ),
                    )
                    .select_related("circuit")
                    .order_by("number"),
                    to_attr="prefetched_rounds_ordered",
                )
            )
            .first()
        )

        if season is None:
            raise NoSeasonFoundError("No season found for year", year)

        rounds_data: list[ScheduleRoundData] = []
        for _round_obj in season.prefetched_rounds_ordered:  # type: ignore[attr-defined]
            round_obj: f1.Round = _round_obj  # To get type hints
            circuit = round_obj.circuit
            sessions_list: list[shared.Session] = []

            for _session in round_obj.prefetched_sessions:  # type: ignore[attr-defined]
                session: f1.Session = _session
                local_ts = session.local_timestamp
                sessions_list.append(
                    shared.Session(
                        id=session.api_id,
                        url=HttpUrl(req.build_absolute_uri(reverse("sessions-detail", args=[session.api_id]))),
                        number=session.number,
                        type=session.type,
                        type_display=str(f1.SessionType(session.type).label),
                        timestamp=session.timestamp,
                        missing_time_data=None if session.has_time_data else True,  # Omit for modern sessions
                        local_timestamp=str(local_ts) if local_ts else None,
                        timezone=str(session.timezone) if session.timezone else None,
                        scheduled_laps=session.scheduled_laps,
                        is_cancelled=session.is_cancelled,
                    )
                )

            rounds_data.append(
                ScheduleRoundData(
                    round=shared.Round(
                        id=round_obj.api_id,
                        url=HttpUrl(req.build_absolute_uri(reverse("rounds-detail", args=[round_obj.api_id]))),
                        name=round_obj.name,
                        number=round_obj.number,
                        race_number=round_obj.race_number,
                        wikipedia=HttpUrl(round_obj.wikipedia) if round_obj.wikipedia else None,
                        is_cancelled=round_obj.is_cancelled,
                    ),
                    circuit=shared.Circuit(
                        id=circuit.api_id,
                        url=HttpUrl(req.build_absolute_uri(reverse("circuits-detail", args=[circuit.api_id]))),
                        name=circuit.name,
                        locality=circuit.locality,
                        country_code=circuit.country_code,
                        country=circuit.country,
                        latitude=circuit.latitude,
                        longitude=circuit.longitude,
                        altitude=circuit.altitude,
                        wikipedia=HttpUrl(circuit.wikipedia) if circuit.wikipedia else None,
                    ),
                    sessions=sessions_list,
                )
            )

        return ScheduleData(
            season=shared.Season(
                id=season.api_id,
                url=HttpUrl(req.build_absolute_uri(reverse("v2-schedules-detail", args=[season.year]))),
                year=season.year,
                wikipedia=HttpUrl(season.wikipedia) if season.wikipedia else None,
            ),
            rounds=rounds_data,
        )
