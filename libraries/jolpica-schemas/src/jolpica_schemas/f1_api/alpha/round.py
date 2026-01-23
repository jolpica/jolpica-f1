from pydantic import BaseModel, ConfigDict, Field

from .metadata import DetailResponse
from .shared import BasicCircuit, BasicSeason, Round, Session


class RoundCircuit(BasicCircuit):
    pass


class RoundSeason(BasicSeason):
    pass


class RoundSession(Session):
    pass


class RoundSummary(Round):
    circuit: RoundCircuit
    season: RoundSeason
    sessions: list[RoundSession]


RetrievedRoundDetail = DetailResponse[RoundSummary]


class RoundQueryParams(BaseModel):
    """Query parameters for filtering rounds list"""

    model_config = ConfigDict(extra="forbid")

    year: int | None = Field(None, description="Filter by season year")
    round_number: int | None = Field(None, description="Filter by round number within season", ge=1)
    race_number: int | None = Field(None, description="Filter by overall race number", ge=1)
    is_cancelled: bool | None = Field(None, description="Filter by cancellation status")
    driver_id: str | None = Field(None, description="Filter by driver API ID")
    team_id: str | None = Field(None, description="Filter by team API ID")
