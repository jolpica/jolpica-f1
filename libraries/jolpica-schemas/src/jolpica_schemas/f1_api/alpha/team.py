from pydantic import BaseModel, ConfigDict, Field, HttpUrl

from .metadata import DetailResponse, PaginatedResponse


class TeamSeason(BaseModel):
    """
    Season information in team context.
    """

    id: str
    url: None = Field(None, description="TODO: URL to season detail endpoint")
    year: int


class TeamSummary(BaseModel):
    """Summary information for Team."""

    id: str
    url: HttpUrl
    name: str
    nationality: str | None = None
    country_code: str | None = Field(None, max_length=3)
    wikipedia: HttpUrl | None = None
    primary_color: str | None = None
    seasons: list[TeamSeason]


PaginatedTeamSummary = PaginatedResponse[list[TeamSummary]]
RetrievedTeamDetail = DetailResponse[TeamSummary]


class TeamQueryParams(BaseModel):
    """Query parameters for filtering teams list"""

    model_config = ConfigDict(extra="forbid")

    year: int | None = Field(None, description="Filter teams that competed in a specific season year")
    country_code: str | None = Field(None, max_length=3, description="Filter by ISO 3166-1 alpha-3 country code")
