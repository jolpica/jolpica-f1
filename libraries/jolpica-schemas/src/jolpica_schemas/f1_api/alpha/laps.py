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


class LapData(BaseModel):
    driver_id_map: dict[str, shared.Driver]
    team_id_map: dict[str, shared.Team]
    session_id_map: dict[str, shared.Session]
    round_id_map: dict[str, shared.Round]

    laps: list[Lap]


class LapsResponse(DetailResponse[LapData]):
    """Schema for lap data detail responses"""
