"""Data Transfer Objects (DTOs) for results marshalling."""

from __future__ import annotations

from collections.abc import Iterable
from dataclasses import dataclass
from datetime import timedelta

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
    car_number: int | None
    fastest_lap_time: timedelta | None


@dataclass
class ResultRowData:
    """Data for a single row in the results table."""

    row_key: tuple
    session_entries: list[ResultRowSessionEntryData]
    driver: shared.BasicDriver
    team: shared.BasicTeam

    @classmethod
    def from_orm(
        cls,
        req: request.Request,
        row_key: tuple,
        driver: f1.Driver,
        team: f1.Team,
        session_entries: Iterable[f1.SessionEntry],
    ) -> ResultRowData:
        session_entry_list = []
        for se in session_entries:
            # Get the fastest lap object, if any
            fastest_lap = se.laps.filter(is_entry_fastest_lap=True).first()
            fastest_lap_time = fastest_lap.time if fastest_lap is not None else None

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
                    car_number=se.round_entry.car_number,
                )
            )
        return cls(
            row_key=row_key,
            session_entries=session_entry_list,
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


@dataclass
class ResultData:
    """Complete result data for a set of sessions."""

    rows: list[ResultRowData]
    round: shared.Round
    season: shared.Season
    circuit: shared.Circuit
    sessions: list[shared.BasicSession]
