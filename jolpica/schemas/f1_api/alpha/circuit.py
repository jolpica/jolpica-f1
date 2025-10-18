from pydantic import BaseModel, ConfigDict, Field, HttpUrl

from .metadata import DetailResponse, PaginatedResponse


class CircuitSummary(BaseModel):
    """Summary information for Circuit"""

    id: str
    url: HttpUrl
    name: str
    reference: str | None = None
    locality: str | None = None
    country: str | None = None
    country_code: str | None = Field(None, max_length=3)
    latitude: float | None = None
    longitude: float | None = None
    altitude: float | None = None
    wikipedia: HttpUrl | None = None


PaginatedCircuitSummary = PaginatedResponse[list[CircuitSummary]]
RetrievedCircuitDetail = DetailResponse[CircuitSummary]


class CircuitQueryParams(BaseModel):
    """Query parameters for filtering circuits list"""

    model_config = ConfigDict(extra="forbid")

    year: int | None = Field(None, description="Filter by circuits that appeared in a specific season year")
    country_code: str | None = Field(None, max_length=3, description="Filter by ISO 3166-1 alpha-3 country code")
