from unittest.mock import MagicMock

from jolpica_api.f1_api.marshalling.results.loader import ResultRowData
from jolpica_api.f1_api.marshalling.results.result_strategies import PracticeResultStrategy
from jolpica_schemas.f1_api.alpha import shared


def test_practice_result_strategy_with_session_without_session_entries():
    strat = PracticeResultStrategy(
        sessions=[shared.BasicSession.model_construct(type="FP1", id="session_1", type_display="Free Practice 1")],
        session_type_startswith="FP1",
    )
    row_data = ResultRowData(
        row_key=("driver_1",),
        session_entries=[],
        car_number=44,
        driver=shared.BasicDriver.model_construct(id="driver_1", name="Driver 1"),
        team=shared.BasicTeam.model_construct(id="team_1", name="Team 1"),
    )

    assert strat.should_render(row_data) is False


def test_practice_result_strategy_with_session_with_session_entries():
    strat = PracticeResultStrategy(
        sessions=[shared.BasicSession.model_construct(type="FP1", id="session_1", type_display="Free Practice 1")],
        session_type_startswith="FP1",
    )
    # setup magic mock so that any undefined attribute works as usual (e.g. if a string, returns "")
    strat._get_result_item_for_session = MagicMock()
    se_mock = MagicMock()
    se_mock.fastest_lap_time = "time"

    row_data = ResultRowData(
        row_key=("driver_1",),
        session_entries=[se_mock],
        car_number=44,
        driver=shared.BasicDriver.model_construct(id="driver_1", name="Driver 1"),
        team=shared.BasicTeam.model_construct(id="team_1", name="Team 1"),
    )

    assert strat.should_render(row_data) is True

    strat.render(row_data)

    assert strat._get_result_item_for_session.call_count == 1
    assert strat._get_result_item_for_session.call_args.args[0] == "time"
    assert strat._get_result_item_for_session.call_args.args[1] is row_data
    assert strat._get_result_item_for_session.call_args.args[2] is se_mock
