from __future__ import annotations

from dataclasses import dataclass

from django.db.models import Prefetch
from django.urls import reverse
from pydantic import HttpUrl
from rest_framework import request

from jolpica.formula_one import models as f1
from jolpica.formula_one.utils import format_timedelta, normalize_pit_stop_timestamp
from jolpica_schemas.f1_api.alpha import shared


@dataclass
class LapRowData:
    """Data for a single lap row."""

    car_number: int | None
    driver_id: str
    team_id: str
    session_id: str
    session_type: str
    pit_stop: shared.PitStop | None
    lap: shared.Lap


@dataclass
class LapData:
    """Complete result data for a set of sessions."""

    rows: list[LapRowData]
    round: shared.Round
    season: shared.Season
    circuit: shared.Circuit
    sessions: list[shared.Session]
    drivers: list[shared.Driver]
    teams: list[shared.Team]


class LapDataLoader:
    @classmethod
    def load(cls, req: request.Request, round_api_id: str, session_filter: str) -> LapData:
        round = f1.Round.objects.filter(api_id=round_api_id).select_related("season", "circuit").first()

        if round is None:
            raise ValueError(f"Round not found: {round_api_id}")

        sessions = f1.Session.objects.filter(round=round, type__startswith=session_filter).order_by("timestamp")

        # Prefetch session entries filtered to relevant sessions, with all laps and their pit stops
        laps_prefetch = Prefetch(
            "laps",
            queryset=f1.Lap.objects.select_related("pit_stop").order_by("number"),
            to_attr="prefetched_laps",
        )

        session_entries_prefetch = Prefetch(
            "session_entries",
            queryset=f1.SessionEntry.objects.filter(session__in=sessions)
            .prefetch_related(laps_prefetch)
            .select_related("session"),
            to_attr="prefetched_session_entries",
        )

        round_entries = (
            f1.RoundEntry.objects.filter(sessions__in=sessions)
            .select_related("team_driver__driver", "team_driver__team")
            .prefetch_related(session_entries_prefetch)
            .distinct()
        )

        row_data: list[LapRowData] = []
        drivers: dict[str, shared.Driver] = {}
        teams: dict[str, shared.Team] = {}

        for rentry in round_entries:
            driver = rentry.team_driver.driver
            team = rentry.team_driver.team

            if driver.api_id not in drivers:
                drivers[driver.api_id] = shared.Driver(
                    id=driver.api_id,
                    url=HttpUrl(req.build_absolute_uri(reverse("core-drivers-detail", args=[driver.api_id]))),
                    abbreviation=driver.abbreviation,
                    given_name=driver.forename,
                    family_name=driver.surname,
                    nationality=driver.nationality,
                    country_code=driver.country_code,
                    permanent_car_number=driver.permanent_car_number,
                    date_of_birth=driver.date_of_birth,
                    wikipedia=HttpUrl(driver.wikipedia) if driver.wikipedia else None,
                )

            if team.api_id not in teams:
                teams[team.api_id] = shared.Team(
                    id=team.api_id,
                    url=HttpUrl(req.build_absolute_uri(reverse("core-teams-detail", args=[team.api_id]))),
                    name=team.name,
                    primary_color=team.primary_color,
                    nationality=team.nationality,
                    country_code=team.country_code,
                    wikipedia=HttpUrl(team.wikipedia) if team.wikipedia else None,
                )

            for se in rentry.prefetched_session_entries:  # type:ignore
                for lap in se.prefetched_laps:  # type:ignore
                    pit_stop: shared.PitStop | None = None
                    try:
                        ps = lap.pit_stop
                    except f1.PitStop.DoesNotExist:
                        ps = None
                    if ps is not None:
                        pit_stop = shared.PitStop(
                            id=ps.api_id,
                            url=HttpUrl(req.build_absolute_uri(reverse("core-pit-stops-detail", args=[ps.api_id]))),
                            number=ps.number,
                            duration=ps.duration,
                            duration_display=format_timedelta(ps.duration) if ps.duration else None,
                            duration_milliseconds=int(ps.duration.total_seconds() * 1000) if ps.duration else None,
                            timestamp=normalize_pit_stop_timestamp(ps.local_timestamp, se.session),
                        )

                    row_data.append(
                        LapRowData(
                            car_number=rentry.car_number,
                            driver_id=driver.api_id,
                            team_id=team.api_id,
                            session_id=se.session.api_id,
                            session_type=se.session.type,
                            pit_stop=pit_stop,
                            lap=shared.Lap(
                                id=lap.api_id,
                                url=HttpUrl(req.build_absolute_uri(reverse("core-laps-detail", args=[lap.api_id]))),
                                number=lap.number,
                                position=lap.position,
                                time=lap.time,
                                time_display=format_timedelta(lap.time) if lap.time else None,
                                time_milliseconds=int(lap.time.total_seconds() * 1000) if lap.time else None,
                                average_speed=lap.average_speed,
                                is_entry_fastest_lap=lap.is_entry_fastest_lap,
                            ),
                        )
                    )

        return LapData(
            rows=row_data,
            round=shared.Round(
                id=round.api_id,
                url=HttpUrl(req.build_absolute_uri(reverse("core-rounds-detail", args=[round.api_id]))),
                name=round.name,
                number=round.number,
                race_number=round.race_number,
                wikipedia=HttpUrl(round.wikipedia) if round.wikipedia else None,
                is_cancelled=round.is_cancelled,
            ),
            season=shared.Season(
                id=round.season.api_id,
                url=HttpUrl(req.build_absolute_uri(reverse("core-seasons-detail", args=[round.season.api_id]))),
                year=round.season.year,
                wikipedia=HttpUrl(round.season.wikipedia) if round.season.wikipedia else None,
            ),
            circuit=shared.Circuit(
                id=round.circuit.api_id,
                url=HttpUrl(req.build_absolute_uri(reverse("core-circuits-detail", args=[round.circuit.api_id]))),
                name=round.circuit.name,
                locality=round.circuit.locality,
                country_code=round.circuit.country_code,
                latitude=round.circuit.latitude,
                longitude=round.circuit.longitude,
                altitude=round.circuit.altitude,
                wikipedia=HttpUrl(round.circuit.wikipedia) if round.circuit.wikipedia else None,
            ),
            sessions=[
                shared.Session(
                    id=s.api_id,
                    url=HttpUrl(req.build_absolute_uri(reverse("core-sessions-detail", args=[s.api_id]))),
                    number=s.number,
                    type=s.type,
                    type_display=str(f1.SessionType(s.type).label),
                    timestamp=s.timestamp,
                    missing_time_data=None if s.has_time_data else True,
                    local_timestamp=str(s.local_timestamp) if s.local_timestamp else None,
                    timezone=str(s.timezone) if s.timezone else None,
                    scheduled_laps=s.scheduled_laps,
                    is_cancelled=s.is_cancelled,
                )
                for s in sessions
            ],
            drivers=list(drivers.values()),
            teams=list(teams.values()),
        )
