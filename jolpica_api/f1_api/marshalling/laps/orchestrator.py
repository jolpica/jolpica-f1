"""Orchestrator for laps marshalling."""

from __future__ import annotations

from jolpica_schemas.f1_api.alpha import laps as laps_schema

from .loader import LapData


class LapDataOrchestrator:
    def __init__(self, lap_data: LapData):
        self._lap_data = lap_data

    def render(self) -> laps_schema.LapData:
        if not self._lap_data.sessions:
            raise ValueError("No sessions found in lap data")

        drivers_by_id = {d.id: d for d in self._lap_data.drivers}
        teams_by_id = {t.id: t for t in self._lap_data.teams}
        sessions_by_id = {s.id: s for s in self._lap_data.sessions}

        laps = sorted(
            (
                laps_schema.Lap(
                    id=row.lap.id,
                    url=row.lap.url,
                    number=row.lap.number,
                    position=row.lap.position,
                    time=row.lap.time,
                    time_display=row.lap.time_display,
                    time_milliseconds=row.lap.time_milliseconds,
                    average_speed=row.lap.average_speed,
                    is_entry_fastest_lap=row.lap.is_entry_fastest_lap,
                    driver_id=row.driver_id,
                    team_id=row.team_id,
                    round_id=self._lap_data.round.id,
                    session_id=row.session_id,
                    session_type=row.session_type,
                    pit_stop=row.pit_stop,
                )
                for row in self._lap_data.rows
            ),
            key=lambda lap: (
                lap.number if lap.number is not None else float("inf"),
                lap.position if lap.position is not None else float("inf"),
            ),
        )

        return laps_schema.LapData(
            drivers_by_id=drivers_by_id,
            teams_by_id=teams_by_id,
            sessions_by_id=sessions_by_id,
            season=self._lap_data.season,
            round=self._lap_data.round,
            circuit=self._lap_data.circuit,
            laps=laps,
        )
