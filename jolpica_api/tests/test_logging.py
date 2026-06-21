from __future__ import annotations

import logging

from jolpica_api.logging import GunicornMetadataFilter


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
    assert record.gunicorn_metadata == {
        "host": "prod.jolpi.ca",
        "path": "/",
        "query_string": "",
        "method": "GET",
        "user_agent": "Mozilla/5.0",
        "ip": "82.1.59.6",
        "user": "1",
        "duration": "16",
    }


def test_metadata_filter_strips_block_with_populated_query_string() -> None:
    filter_ = GunicornMetadataFilter()
    record = _make_record(
        "82.1.59.6 - 1 'GET /drivers HTTP/1.1' 200 16 - 'curl' "
        "||HOST:prod.jolpi.ca||||PATH:/drivers||||QUERY_STRING:limit=5&offset=10||"
    )

    assert filter_.filter(record) is True
    assert "||" not in record.getMessage()
    assert record.gunicorn_metadata == {
        "host": "prod.jolpi.ca",
        "path": "/drivers",
        "query_string": "limit=5&offset=10",
    }


def test_metadata_filter_only_extracts_trailing_block() -> None:
    filter_ = GunicornMetadataFilter()
    record = _make_record("a stray ||FAKE:value|| in the message ||HOST:prod.jolpi.ca||||PATH:/||")

    assert filter_.filter(record) is True
    assert record.getMessage() == "a stray ||FAKE:value|| in the message "
    assert record.gunicorn_metadata == {"host": "prod.jolpi.ca", "path": "/"}


def test_metadata_filter_leaves_plain_message_unchanged() -> None:
    filter_ = GunicornMetadataFilter()
    record = _make_record("a plain log message with no metadata block")

    assert filter_.filter(record) is True
    assert record.getMessage() == "a plain log message with no metadata block"
    assert not hasattr(record, "gunicorn_metadata")
