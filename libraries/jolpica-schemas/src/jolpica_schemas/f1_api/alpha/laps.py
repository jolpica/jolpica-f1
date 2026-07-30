from __future__ import annotations

from pydantic import BaseModel

from . import shared
from .metadata import DetailResponse


class Lap(shared.Lap):
    driver_id: str
    team_id: str
    round_id: str
    session_id: str
    session_type: str
    pit_stop: shared.PitStop | None


class LapData(BaseModel):
    season: shared.Season
    round: shared.Round
    circuit: shared.Circuit
    sessions_by_id: dict[str, shared.Session]
    drivers_by_id: dict[str, shared.Driver]
    teams_by_id: dict[str, shared.Team]

    laps: list[Lap]


class LapsResponse(DetailResponse[LapData]):
    """Schema for lap data detail responses"""
