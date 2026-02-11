from __future__ import annotations

from datetime import timedelta

from pydantic import BaseModel

from . import shared


class ResultComponent(BaseModel):
    key: str
    name: str
    position: int | None = None
    time: str | None = None


class ResultItem(BaseModel):
    position: int | None
    position_text: str | None
    time: str | None
    is_classified: bool | None
    status: str | None
    points: float | None
    laps: int | None
    components: dict[str, ResultComponent]
    driver: shared.BasicDriver
    team: shared.BasicTeam


class Results(BaseModel):
    title: str
    code: str

    component_keys: list[str]
    results: list[ResultItem]

    round: shared.Round
    season: shared.Season
    circuit: shared.Circuit
    sessions: list[shared.BasicSession]
