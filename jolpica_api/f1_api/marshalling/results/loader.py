from __future__ import annotations

from dataclasses import dataclass
from datetime import timedelta

from django.db.models import Prefetch
from django.urls import reverse
from pydantic import HttpUrl
from rest_framework import request

from jolpica.formula_one import models as f1
from jolpica_schemas.f1_api.alpha import shared


@dataclass
class ResultRowSessionEntryData:
    """Data for a single session entry within a result row."""

    session_order_number: int | None
    session_type: str
    session_api_id: str
    position: int | None
    grid_position: int | None
    is_classified: bool | None
    is_eligible_for_points: bool | None
    status: str | None
    points: float | None
    laps_completed: int | None
    time: timedelta | None
    fastest_lap_time: timedelta | None


@dataclass
class ResultRowData:
    """Data for a single row in the results table."""

    row_key: tuple
    session_entries: list[ResultRowSessionEntryData]
    car_number: int | None
    driver: shared.BasicDriver
    team: shared.BasicTeam


@dataclass
class ResultData:
    """Complete result data for a set of sessions."""

    rows: list[ResultRowData]
    round: shared.Round
    season: shared.Season
    circuit: shared.Circuit
    sessions: list[shared.BasicSession]


class ResultDataLoader:
    def __init__(self, round_api_id: str):
        self._round_id = round_api_id

    def load(self, req: request.Request, session_filter: str) -> ResultData:
        round = f1.Round.objects.filter(api_id=self._round_id).select_related("season", "circuit").first()

        if round is None:
            raise ValueError(f"Round not found: {self._round_id}")

        sessions = f1.Session.objects.filter(round=round, type__startswith=session_filter).order_by("timestamp")

        # Prefetch session entries filtered to relevant sessions, with fastest laps
        session_entries_prefetch = Prefetch(
            "session_entries",
            queryset=f1.SessionEntry.objects.filter(session__in=sessions)
            .prefetch_related(
                Prefetch(
                    "laps",
                    queryset=f1.Lap.objects.filter(is_entry_fastest_lap=True),
                    to_attr="fastest_laps",
                )
            )
            .select_related("session"),
            to_attr="prefetched_session_entries",
        )

        round_entries = (
            f1.RoundEntry.objects.filter(sessions__in=sessions)
            .select_related("team_driver__driver", "team_driver__team")
            .prefetch_related(session_entries_prefetch)
            .distinct()
        )

        if len(round_entries) == 0:
            raise ValueError("No round entries found for sessions")

        row_data: list[ResultRowData] = []
        for rentry in round_entries:
            driver = rentry.team_driver.driver
            team = rentry.team_driver.team
            key = (rentry.car_number, driver.forename, rentry.api_id)

            session_entry_list = []
            for se in rentry.prefetched_session_entries:  # type:ignore
                fastest_lap_time: timedelta | None = None
                if se.fastest_laps:
                    fastest_lap_time = se.fastest_laps[0].time

                session_entry_list.append(
                    ResultRowSessionEntryData(
                        session_order_number=se.session.number,
                        session_type=se.session.type,
                        session_api_id=se.session.api_id,
                        position=se.position,
                        grid_position=se.grid,
                        is_classified=se.is_classified,
                        is_eligible_for_points=se.is_eligible_for_points,
                        status=f1.SessionStatus(se.status).name if se.status is not None else None,
                        points=se.points,
                        laps_completed=se.laps_completed,
                        time=se.time,
                        fastest_lap_time=fastest_lap_time,
                    )
                )

            row_data.append(
                ResultRowData(
                    row_key=key,
                    session_entries=session_entry_list,
                    car_number=rentry.car_number,
                    driver=shared.BasicDriver(
                        id=driver.api_id,
                        given_name=driver.forename,
                        family_name=driver.surname,
                        url=HttpUrl(req.build_absolute_uri(reverse("drivers-detail", args=[driver.api_id]))),
                        abbreviation=driver.abbreviation,
                    ),
                    team=shared.BasicTeam(
                        id=team.api_id,
                        name=team.name,
                        url=HttpUrl(req.build_absolute_uri(reverse("teams-detail", args=[team.api_id]))),
                        primary_color=team.primary_color,
                    ),
                )
            )

        return ResultData(
            rows=row_data,
            round=shared.Round(
                id=round.api_id,
                url=HttpUrl(req.build_absolute_uri(reverse("rounds-detail", args=[round.api_id]))),
                name=round.name,
                number=round.number,
                race_number=round.race_number,
                wikipedia=HttpUrl(round.wikipedia) if round.wikipedia else None,
                is_cancelled=round.is_cancelled,
            ),
            season=shared.Season(
                id=round.season.api_id,
                url=HttpUrl(req.build_absolute_uri(reverse("seasons-detail", args=[round.season.api_id]))),
                year=round.season.year,
                wikipedia=HttpUrl(round.season.wikipedia) if round.season.wikipedia else None,
            ),
            circuit=shared.Circuit(
                id=round.circuit.api_id,
                url=HttpUrl(req.build_absolute_uri(reverse("circuits-detail", args=[round.circuit.api_id]))),
                name=round.circuit.name,
                locality=round.circuit.locality,
                country_code=round.circuit.country_code,
                latitude=round.circuit.latitude,
                longitude=round.circuit.longitude,
                altitude=round.circuit.altitude,
                wikipedia=HttpUrl(round.circuit.wikipedia) if round.circuit.wikipedia else None,
            ),
            sessions=[
                shared.BasicSession(
                    id=s.api_id,
                    url=HttpUrl(req.build_absolute_uri(reverse("sessions-detail", args=[s.api_id]))),
                    number=s.number,
                    type=s.type,
                    type_display=f1.SessionType(s.type).name,
                )
                for s in sessions
            ],
        )
