from pydantic import BaseModel, ConfigDict, Field

from .metadata import DetailResponse, PaginatedResponse
from .shared import BasicDriver, BasicRound, BasicSession, BasicTeam, SessionEntry


class SessionEntrySession(BasicSession):
    pass


class SessionEntryRound(BasicRound):
    pass


class SessionEntryDriver(BasicDriver):
    pass


class SessionEntryTeam(BasicTeam):
    pass


class SessionEntrySummary(SessionEntry):
    session: SessionEntrySession
    round: SessionEntryRound
    driver: SessionEntryDriver
    team: SessionEntryTeam


PaginatedSessionEntrySummary = PaginatedResponse[list[SessionEntrySummary]]
RetrievedSessionEntryDetail = DetailResponse[SessionEntrySummary]


class SessionEntryQueryParams(BaseModel):
    """Query parameters for filtering session entries list"""

    model_config = ConfigDict(extra="forbid")

    year: int | None = Field(None, description="Filter by season year")
    session_id: str | None = Field(None, description="Filter by session API ID")
    driver_id: str | None = Field(None, description="Filter by driver API ID")
    team_id: str | None = Field(None, description="Filter by team API ID")
    position: int | None = Field(None, description="Filter by finishing position", ge=1)
    round_id: str | None = Field(None, description="Filter by round API ID")
    session_type: list[str] | None = Field(
        None, description="Filter by session type codes (e.g., R, Q1, FP1). Can specify multiple values."
    )
    has_session_points: bool | None = Field(None, description="Filter for session entries in point scoring sessions")
