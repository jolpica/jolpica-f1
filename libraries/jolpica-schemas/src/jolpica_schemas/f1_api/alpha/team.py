from pydantic import BaseModel, ConfigDict, Field

from .metadata import DetailResponse, PaginatedResponse
from .shared import BasicSeason, Team


class TeamSeason(BasicSeason):
    pass


class TeamSummary(Team):
    seasons: list[TeamSeason]


PaginatedTeamSummary = PaginatedResponse[list[TeamSummary]]
RetrievedTeamDetail = DetailResponse[TeamSummary]


class TeamQueryParams(BaseModel):
    """Query parameters for filtering teams list"""

    model_config = ConfigDict(extra="forbid")

    year: int | None = Field(None, description="Filter teams that competed in a specific season year")
    country_code: str | None = Field(None, max_length=3, description="Filter by ISO 3166-1 alpha-3 country code")
