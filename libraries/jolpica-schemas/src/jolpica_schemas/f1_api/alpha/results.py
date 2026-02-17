from __future__ import annotations

from pydantic import BaseModel

from . import shared


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


class Results(BaseModel):
    season: shared.Season
    round: shared.Round
    circuit: shared.Circuit
    sessions: list[shared.BasicSession]

    title: str
    code: str
    component_keys: list[str]
    results: list[ResultItem]
