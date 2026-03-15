from __future__ import annotations

from pydantic import BaseModel, HttpUrl

from . import shared
from .metadata import DetailResponse


class ResultComponent(BaseModel):
    key: str
    name: str
    position: int | None = None
    time: str | None = None


class ResultItem(BaseModel):
    driver: shared.BasicDriver
    team: shared.BasicTeam
    position: int | None
    position_text: str | None
    time: str | None
    is_classified: bool | None
    status: str | None
    points: float | None
    laps: int | None
    car_number: int | None = None
    components: dict[str, ResultComponent]


class AvailableResultsItem(BaseModel):
    url: HttpUrl
    type: str
    title: str


class AvailableResultsForRound(BaseModel):
    year: int
    round_number: int | None
    round_name: str | None
    available_results: list[AvailableResultsItem]


class Results(shared.FullSession):
    season: shared.Season
    round: shared.Round
    circuit: shared.Circuit

    component_keys: list[str]
    results: list[ResultItem]


class ResultsResponse(DetailResponse[Results]):
    """Schema for season schedule detail responses"""


class AvailableResultsForRoundResponse(DetailResponse[AvailableResultsForRound]):
    """Schema for available results types for a round response"""
