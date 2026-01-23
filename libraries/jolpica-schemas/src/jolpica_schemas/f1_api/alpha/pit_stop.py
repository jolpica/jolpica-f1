from __future__ import annotations

from pydantic import BaseModel, ConfigDict, Field

from .metadata import DetailResponse, PaginatedResponse
from .shared import BasicDriver, BasicLap, BasicRound, BasicSeason, BasicSession, BasicTeam, PitStop


class PitStopDriver(BasicDriver):
    pass


class PitStopTeam(BasicTeam):
    pass


class PitStopSession(BasicSession):
    pass


class PitStopSeason(BasicSeason):
    pass


class PitStopRound(BasicRound):
    pass


class PitStopLap(BasicLap):
    pass


class PitStopSummary(PitStop):
    driver: PitStopDriver
    team: PitStopTeam
    session: PitStopSession
    round: PitStopRound
    season: PitStopSeason
    lap: PitStopLap | None = None


PaginatedPitStopSummary = PaginatedResponse[list[PitStopSummary]]
RetrievedPitStopDetail = DetailResponse[PitStopSummary]


class PitStopQueryParams(BaseModel):
    """Query parameters for filtering pit stops list"""

    model_config = ConfigDict(extra="forbid")

    year: int | None = Field(None, description="Filter by season year")
    session_id: str | None = Field(None, description="Filter by session API ID")
    driver_id: str | None = Field(None, description="Filter by driver API ID")
    team_id: str | None = Field(None, description="Filter by team API ID")
    round_id: str | None = Field(None, description="Filter by round API ID")
    lap_number: int | None = Field(None, description="Filter by lap number", ge=1)
    stop_number: int | None = Field(None, description="Filter by pit stop number", ge=1)
