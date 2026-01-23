from pydantic import BaseModel, ConfigDict, Field

from .metadata import DetailResponse, PaginatedResponse
from .shared import BasicRound, Session


class SessionRound(BasicRound):
    pass


class SessionSummary(Session):
    round: SessionRound


PaginatedSessionSummary = PaginatedResponse[list[SessionSummary]]
RetrievedSessionDetail = DetailResponse[SessionSummary]


class SessionQueryParams(BaseModel):
    """Query parameters for filtering sessions list"""

    model_config = ConfigDict(extra="forbid")

    year: int | None = Field(None, description="Filter by season year")
    session_type: str | None = Field(None, max_length=3, description="Filter by session type code (e.g., R, Q1, FP1)")
    round_id: str | None = Field(None, description="Filter by round API ID")
    circuit_id: str | None = Field(None, description="Filter by circuit API ID")
