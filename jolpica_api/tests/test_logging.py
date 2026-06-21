from __future__ import annotations

import logging

from jolpica_api.logging import CustomLoggingHandler, GunicornMetadataFilter


def _make_record(message: str) -> logging.LogRecord:
    return logging.LogRecord(
        name="gunicorn.access",
        level=logging.INFO,
        pathname=__file__,
        lineno=0,
        msg=message,
        args=None,
        exc_info=None,
    )


def _request_attrs(record: logging.LogRecord) -> dict[str, object]:
    return {key: value for key, value in vars(record).items() if key.startswith("request.")}


def test_metadata_filter_strips_block_with_empty_query_string() -> None:
    filter_ = GunicornMetadataFilter()
    record = _make_record(
        "82.1.59.6 - 1 'GET / HTTP/1.1' 200 16 - 'Mozilla/5.0' "
        "||HOST:prod.jolpi.ca||||PATH:/||||QUERY_STRING:||||METHOD:GET||"
        "||USER_AGENT:Mozilla/5.0||||IP:82.1.59.6||||USER:1||||DURATION:16||"
    )

    assert filter_.filter(record) is True
    assert "||" not in record.getMessage()
    assert record.getMessage() == "82.1.59.6 - 1 'GET / HTTP/1.1' 200 16 - 'Mozilla/5.0' "
    assert _request_attrs(record) == {
        "request.host": "prod.jolpi.ca",
        "request.path": "/",
        "request.query_string": "",
        "request.method": "GET",
        "request.user_agent": "Mozilla/5.0",
        "request.ip": "82.1.59.6",
        "request.user": "1",
        "request.duration": "16",
    }


def test_metadata_filter_strips_block_with_populated_query_string() -> None:
    filter_ = GunicornMetadataFilter()
    record = _make_record(
        "82.1.59.6 - 1 'GET /drivers HTTP/1.1' 200 16 - 'curl' "
        "||HOST:prod.jolpi.ca||||PATH:/drivers||||QUERY_STRING:limit=5&offset=10||"
    )

    assert filter_.filter(record) is True
    assert "||" not in record.getMessage()
    assert _request_attrs(record) == {
        "request.host": "prod.jolpi.ca",
        "request.path": "/drivers",
        "request.query_string": "limit=5&offset=10",
    }


def test_metadata_filter_only_extracts_trailing_block() -> None:
    filter_ = GunicornMetadataFilter()
    record = _make_record("a stray ||FAKE:value|| in the message ||HOST:prod.jolpi.ca||||PATH:/||")

    assert filter_.filter(record) is True
    assert record.getMessage() == "a stray ||FAKE:value|| in the message "
    assert _request_attrs(record) == {"request.host": "prod.jolpi.ca", "request.path": "/"}


def test_metadata_filter_leaves_plain_message_unchanged() -> None:
    filter_ = GunicornMetadataFilter()
    record = _make_record("a plain log message with no metadata block")

    assert filter_.filter(record) is True
    assert record.getMessage() == "a plain log message with no metadata block"
    assert _request_attrs(record) == {}


def test_get_attributes_emits_request_keys() -> None:
    filter_ = GunicornMetadataFilter()
    record = _make_record(
        "82.1.59.6 - 1 'GET / HTTP/1.1' 200 16 - 'Mozilla/5.0' ||HOST:prod.jolpi.ca||||PATH:/||||QUERY_STRING:||"
    )
    filter_.filter(record)

    attributes = CustomLoggingHandler._get_attributes(record)

    assert attributes["request.host"] == "prod.jolpi.ca"
    assert attributes["request.path"] == "/"
    assert attributes["request.query_string"] == ""
