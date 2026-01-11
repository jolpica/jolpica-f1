from pydantic import BaseModel, ConfigDict, Field, HttpUrl

from .metadata import DetailResponse, PaginatedResponse


class SeasonSummary(BaseModel):
    """Summary information for Season"""

    id: str
    url: HttpUrl
    year: int
    wikipedia: HttpUrl | None = None


PaginatedSeasonSummary = PaginatedResponse[list[SeasonSummary]]
RetrievedSeasonDetail = DetailResponse[SeasonSummary]


class SeasonQueryParams(BaseModel):
    """Query parameters for filtering seasons list"""

    model_config = ConfigDict(extra="forbid")

    country_code: str | None = Field(None, max_length=3, description="Filter by ISO 3166-1 alpha-3 country code")
    circuit_id: str | None = Field(None, description="Filter by circuit ID")
    driver_id: str | None = Field(None, description="Filter by driver ID")
    team_id: str | None = Field(None, description="Filter by team ID")
