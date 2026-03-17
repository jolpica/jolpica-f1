"""Data loading for schedule marshalling."""

from __future__ import annotations

import datetime
from dataclasses import dataclass

from django.db.models import F, Prefetch
from django.urls import reverse
from pydantic import HttpUrl
from rest_framework import request

from jolpica.formula_one import models as f1
from jolpica_schemas.f1_api.alpha import shared
from jolpica_schemas.f1_api.alpha.schedule_v2 import ScheduleSummary


@dataclass
class ScheduleRoundData:
    """Intermediate data for a single round in the schedule."""

    round: shared.Round
    circuit: shared.Circuit
    date: datetime.date | None
    sessions: list[shared.Session]


@dataclass
class ScheduleData:
    """Complete schedule data for a season."""

    season: shared.Season
    rounds: list[ScheduleRoundData]


class ScheduleDataLoader:
    @staticmethod
    def load_list(req: request.Request) -> list[ScheduleSummary]:
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

    @staticmethod
    def load_detail(req: request.Request, year: int) -> ScheduleData | None:
        """Load a single season with prefetched rounds, sessions, and circuits.

        Returns None if the season does not exist.
        """
        season = (
            f1.Season.objects.filter(year=year)
            .prefetch_related(
                Prefetch(
                    "rounds",
                    queryset=f1.Round.objects.prefetch_related(
                        Prefetch(
                            "sessions",
                            queryset=f1.Session.objects.order_by("number"),
                            to_attr="prefetched_sessions",
                        ),
                    )
                    .select_related("circuit")
                    .order_by(F("number").asc(nulls_last=True), "date"),
                    to_attr="prefetched_rounds_ordered",
                )
            )
            .first()
        )

        if season is None:
            return None

        rounds_data: list[ScheduleRoundData] = []
        for round_obj in season.prefetched_rounds_ordered:  # type: ignore[attr-defined]
            circuit = round_obj.circuit
            sessions_list: list[shared.Session] = []

            for s in round_obj.prefetched_sessions:
                local_ts = s.local_timestamp
                sessions_list.append(
                    shared.Session(
                        id=s.api_id,
                        url=HttpUrl(req.build_absolute_uri(reverse("sessions-detail", args=[s.api_id]))),
                        number=s.number,
                        type=s.type,
                        type_display=f1.SessionType(s.type).label,
                        timestamp=s.timestamp,
                        missing_time_data=None if s.has_time_data else True,
                        local_timestamp=str(local_ts) if local_ts else None,
                        timezone=str(s.timezone) if s.timezone else None,
                        scheduled_laps=s.scheduled_laps,
                        is_cancelled=s.is_cancelled,
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
                    date=round_obj.date,
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
