from __future__ import annotations

from collections.abc import Iterable, Sequence
from dataclasses import dataclass
from datetime import timedelta

from django.urls import reverse
from pydantic import HttpUrl
from rest_framework import permissions, request, response, viewsets
from rest_framework.decorators import action

from jolpica.formula_one import models as f1
from jolpica.formula_one.utils import format_timedelta
from jolpica_schemas.f1_api.alpha import shared
from jolpica_schemas.f1_api.alpha.results import ResultComponent, ResultItem


@dataclass
class ResultRowSessionEntryData:
    session_order_number: int | None
    session_type: str
    session_api_id: str
    position: int | None
    grid_position: int | None
    is_classified: bool | None
    status: str | None
    points: float | None
    laps_completed: int | None
    time: timedelta | None
    fastest_lap_time: timedelta | None


@dataclass
class ResultRowEntrantData:
    driver_id: str
    driver_given_name: str
    driver_family_name: str
    team_id: str
    team_name: str


@dataclass
class ResultRowData:
    row_key: tuple
    session_entries: list[ResultRowSessionEntryData]
    driver: shared.BasicDriver
    team: shared.BasicTeam

    @classmethod
    def from_orm(
        cls,
        req: request.Request,
        row_key: tuple,
        driver: f1.Driver,
        team: f1.Team,
        session_entries: Iterable[f1.SessionEntry],
    ) -> ResultRowData:
        session_entry_list = []
        for se in session_entries:
            # Get the fastest lap object, if any
            fastest_lap = se.laps.filter(is_entry_fastest_lap=True).first()
            fastest_lap_time = fastest_lap.time if fastest_lap is not None else None

            session_entry_list.append(
                ResultRowSessionEntryData(
                    session_order_number=se.session.number,
                    session_type=se.session.type,
                    session_api_id=se.session.api_id,
                    position=se.position,
                    grid_position=se.grid,
                    is_classified=se.is_classified,
                    status=f1.SessionStatus(se.status).name if se.status is not None else None,
                    points=se.points,
                    laps_completed=se.laps_completed,
                    time=se.time,
                    fastest_lap_time=fastest_lap_time,
                )
            )
        return cls(
            row_key=row_key,
            session_entries=session_entry_list,
            driver=shared.BasicDriver(
                id=driver.api_id,
                given_name=driver.forename,
                family_name=driver.surname,
                url=HttpUrl(req.build_absolute_uri(reverse("drivers-detail", args=[driver.api_id]))),
                abbreviation=driver.abbreviation,
            ),
            team=shared.BasicTeam(
                id=team.api_id,
                name=team.name,
                url=HttpUrl(req.build_absolute_uri(reverse("teams-detail", args=[team.api_id]))),
                primary_color=team.primary_color,
            ),
        )


@dataclass
class ResultData:
    rows: list[ResultRowData]
    sessions: list[shared.BasicSession]


class ResultRenderer:
    def __init__(self, component_renderers: Sequence[ComponentRenderer]):
        self._component_renderers = component_renderers

    def get_component_renderers(self) -> Sequence[ComponentRenderer]:
        return self._component_renderers

    def should_render(self, result_data: ResultRowData) -> bool:
        raise NotImplementedError("Subclasses must implement should_render method")

    def render(self, result_data: ResultRowData) -> ResultItem:
        raise NotImplementedError("Subclasses must implement render method")

    def _render_components(self, result_data: ResultRowData) -> dict[str, ResultComponent]:
        components: dict[str, ResultComponent] = {}
        for renderer in self._component_renderers:
            if not renderer.should_render(result_data):
                continue
            component = renderer.render(result_data)
            components[component.key] = component
        return components

    def _get_result_item_for_session(
        self,
        time: timedelta | None,
        result_data: ResultRowData,
        race_session_entry: ResultRowSessionEntryData,
    ) -> ResultItem:
        components = self._render_components(result_data)

        return ResultItem(
            position=race_session_entry.position,
            position_text=str(race_session_entry.position) if race_session_entry.position is not None else "",
            time=format_timedelta(time) if time else None,
            is_classified=race_session_entry.is_classified,
            status=race_session_entry.status if race_session_entry.status is not None else None,
            points=race_session_entry.points,
            laps=race_session_entry.laps_completed,
            components=components,
            driver=result_data.driver,
            team=result_data.team,
        )


class RaceResultRenderer(ResultRenderer):
    def __init__(self, session_type_startswith: str):
        super().__init__([GridComponentRenderer(session_type_startswith)])
        self._session_type_startswith = session_type_startswith

    def _get_race_session_entry(self, result_data: ResultRowData) -> ResultRowSessionEntryData | None:
        race_session_entry: ResultRowSessionEntryData | None = None
        for se in result_data.session_entries:
            if se.session_type.startswith(self._session_type_startswith):
                if race_session_entry is None:
                    race_session_entry = se
                else:
                    raise ValueError("Multiple session entries matching race session type found")
        return race_session_entry

    def should_render(self, result_data: ResultRowData) -> bool:
        race_session_entry = self._get_race_session_entry(result_data)
        return race_session_entry is not None

    def render(self, result_data: ResultRowData) -> ResultItem:
        race_session_entry = self._get_race_session_entry(result_data)
        if race_session_entry is None:
            raise ValueError("No valid session entry found for rendering result")

        return self._get_result_item_for_session(
            race_session_entry.time,
            result_data,
            race_session_entry,
        )


class KnockoutResultRenderer(ResultRenderer):
    def __init__(self, sessions: Sequence[shared.BasicSession], session_type_startswith: str):
        component_renderers = [SingleSessionComponentRenderer(sess.type, sess.id) for sess in sessions]
        super().__init__(component_renderers)
        self._session_type_startswith = session_type_startswith

    def _get_best_knockout_session_entry(self, result_data: ResultRowData) -> ResultRowSessionEntryData | None:
        best_session_entry: ResultRowSessionEntryData | None = None
        for se in result_data.session_entries:
            if not se.session_type.startswith(self._session_type_startswith):
                continue

            if se.session_order_number is None or se.session_type is None:
                # Session did not occur
                continue

            if best_session_entry is None:
                best_session_entry = se
                continue

            if se.session_order_number > (best_session_entry.session_order_number or 0):
                best_session_entry = se
        return best_session_entry

    def should_render(self, result_data: ResultRowData) -> bool:
        best_session_entry = self._get_best_knockout_session_entry(result_data)
        return best_session_entry is not None

    def render(self, result_data: ResultRowData) -> ResultItem:
        best_session_entry = self._get_best_knockout_session_entry(result_data)
        if best_session_entry is None:
            raise ValueError("No valid session entry found for rendering result")

        return self._get_result_item_for_session(
            best_session_entry.fastest_lap_time,
            result_data,
            best_session_entry,
        )


class PracticeResultRenderer(ResultRenderer):
    def __init__(self, sessions: Sequence[shared.BasicSession], session_type_startswith: str):
        self._number_of_sessions = len(sessions)
        component_renderers = [SingleSessionComponentRenderer(sess.type, sess.id) for sess in sessions]
        if self._number_of_sessions == 1:
            component_renderers = []
        super().__init__(component_renderers)

    def should_render(self, result_data: ResultRowData) -> bool:
        return True

    def render(self, result_data: ResultRowData) -> ResultItem:
        if self._number_of_sessions == 1 and result_data.session_entries:
            session_entry = result_data.session_entries[0]
            return self._get_result_item_for_session(
                session_entry.time if session_entry else None,
                result_data,
                session_entry,
            )
        components = self._render_components(result_data)
        return ResultItem(
            position=None,
            position_text=None,
            time=None,
            is_classified=None,
            status=None,
            points=None,
            laps=None,
            components=components,
            driver=result_data.driver,
            team=result_data.team,
        )


class ComponentRenderer:
    def get_component_key(self) -> str:
        raise NotImplementedError("Subclasses must implement get_component_key method")

    def should_render(self, result_data: ResultRowData) -> bool:
        raise NotImplementedError("Subclasses must implement should_render method")

    def render(self, result_data: ResultRowData) -> ResultComponent:
        raise NotImplementedError("Subclasses must implement render method")


class SingleSessionComponentRenderer(ComponentRenderer):
    def __init__(self, component_key: str, session_api_id: str):
        self._component_key = component_key
        self._session_api_id = session_api_id

    def get_component_key(self) -> str:
        return self._component_key

    def should_render(self, result_data: ResultRowData) -> bool:
        return any(se.session_api_id == self._session_api_id for se in result_data.session_entries)

    NAMES = {
        "FP1": "Practice 1",
        "FP2": "Practice 2",
        "FP3": "Practice 3",
        "Q1": "Qualifying 1",
        "Q2": "Qualifying 2",
        "Q3": "Qualifying 3",
        "SQ1": "Sprint Qualifying 1",
        "SQ2": "Sprint Qualifying 2",
        "SQ3": "Sprint Qualifying 3",
    }

    def render(self, result_data: ResultRowData) -> ResultComponent:
        name = self.NAMES.get(self._component_key)
        if name is None:
            name = self._component_key  # Fallback to using the key as the name if not found in mapping

        session_entry: ResultRowSessionEntryData | None = None
        for se in result_data.session_entries:
            if se.session_api_id == self._session_api_id:
                session_entry = se
                break

        if session_entry is None:
            raise ValueError(f"No session entry found for session API ID {self._session_api_id}")
        if session_entry.session_type == "R":
            time = session_entry.time if session_entry.time else None
        else:
            time = session_entry.fastest_lap_time if session_entry.fastest_lap_time else None

        return ResultComponent(
            key=self._component_key,
            name=name,
            position=session_entry.position,
            time=format_timedelta(time) if time else None,
        )


class GridComponentRenderer(ComponentRenderer):
    def __init__(self, session_type_startswith: str):
        self._session_type_startswith = session_type_startswith

    def get_component_key(self) -> str:
        return "GRID"

    def should_render(self, result_data: ResultRowData) -> bool:
        return any(se.grid_position is not None for se in result_data.session_entries)

    def render(self, result_data: ResultRowData) -> ResultComponent:
        grid_position = None
        sorted_session_entries = sorted(
            result_data.session_entries,
            key=lambda se: se.session_order_number if se.session_order_number is not None else float("-inf"),
            reverse=True,
        )
        for se in sorted_session_entries:
            if se.grid_position is not None:
                grid_position = se.grid_position
                break

        return ResultComponent(
            key=self.get_component_key(),
            name="Grid Position",
            position=grid_position,
        )


class ResultsView(viewsets.ViewSet):
    """
    A simple ViewSet for listing or retrieving results.
    """

    permission_classes = [permissions.AllowAny]

    def retrieve(self, req: request.Request, pk=None):
        return response.Response({at: str(getattr(req, at)) for at in dir(req) if not at.startswith("_")})

    @action(methods=["get"], url_path="(?P<session_filter>[A-Z0-9]+)", detail=True)
    def test(self, req: request.Request, session_filter=None, pk=None):
        if session_filter not in ["Q", "SQ", "R", "SR", "FP", "FP1", "FP2", "FP3"]:
            return response.Response({"error": "Invalid session filter"}, status=400)

        sessions = f1.Session.objects.filter(round__api_id=pk, type__startswith=session_filter).order_by("timestamp")

        # We may need different per X mappings for different seasons, for now per round entry covers most cases
        result_data = get_per_round_entry_mapping(req, sessions)

        result_renderer: ResultRenderer = RaceResultRenderer(session_filter)
        if session_filter in ["Q", "SQ"]:
            result_renderer = KnockoutResultRenderer(result_data.sessions, session_filter)
        elif session_filter in ["FP", "FP1", "FP2", "FP3"]:
            result_renderer = PracticeResultRenderer(result_data.sessions, session_filter)

        results: list[ResultItem] = []
        for result_data_row in result_data.rows:
            if not result_renderer.should_render(result_data_row):
                continue
            results.append(result_renderer.render(result_data_row))

        results = sorted(results, key=lambda r: (r.position if r.position is not None else float("inf")))

        return response.Response(
            {
                "test": "This is a test action",
                "code": session_filter,
                "component_keys": [
                    renderer.get_component_key() for renderer in result_renderer.get_component_renderers()
                ],
                "results": [res.model_dump(exclude_none=False, mode="json") for res in results],
                "sessions": [session.api_id for session in sessions],
            }
        )


def get_per_round_entry_mapping(req: request.Request, sessions: Iterable[f1.Session]) -> ResultData:
    round_entries = f1.RoundEntry.objects.filter(sessions__in=sessions).distinct()

    row_data: list[ResultRowData] = []
    for rentry in round_entries:
        key = (rentry.car_number, rentry.team_driver.driver.forename, rentry.api_id)
        driver = rentry.team_driver.driver
        team = rentry.team_driver.team
        session_entries = rentry.session_entries.filter(session__in=sessions)
        row_data.append(ResultRowData.from_orm(req, key, driver, team, session_entries))
    return ResultData(
        rows=row_data,
        sessions=[
            shared.BasicSession(
                id=s.api_id,
                url=HttpUrl(req.build_absolute_uri(reverse("sessions-detail", args=[s.api_id]))),
                number=s.number,
                type=s.type,
                type_display=f1.SessionType(s.type).name,
            )
            for s in sessions
        ],
    )
