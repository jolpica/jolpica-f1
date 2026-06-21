import logging
import logging.config
import re

from django.core.exceptions import SuspiciousOperation
from django.http.request import HttpRequest
from opentelemetry.exporter.otlp.proto.grpc._log_exporter import OTLPLogExporter
from opentelemetry.sdk._logs import LoggerProvider, LoggingHandler
from opentelemetry.sdk._logs.export import BatchLogRecordProcessor

# Authenticates with the OTEL_EXPORTER_OTLP_HEADERS environment variable
# With a value of "api-key=<LICENSE KEY>"
logger_provider = LoggerProvider()
exporter = OTLPLogExporter()
logger_provider.add_log_record_processor(BatchLogRecordProcessor(exporter))


class GunicornMetadataFilter(logging.Filter):
    """Extract metadata from gunicorn logs using delimiters.

    Expected format: <log message> ||KEY1:value1||KEY2:value2||
    Each pair is set on the record as a ``request.<key>`` attribute, which
    LoggingHandler emits directly as an OTel attribute, and removed from the
    message for clean output.
    """

    # Matches the trailing run of ||KEY:value|| pairs (value may be empty).
    METADATA_PATTERN = re.compile(r"(?:\|\|\w+:[^|]*\|\|)+$")
    PAIR_PATTERN = re.compile(r"\|\|(\w+):([^|]*)\|\|")

    def filter(self, record: logging.LogRecord) -> bool:
        message = record.getMessage()
        match = self.METADATA_PATTERN.search(message)
        if match:
            for key, value in self.PAIR_PATTERN.findall(match.group()):
                setattr(record, f"request.{key.lower()}", value)
            # record.msg now holds the already-formatted line; clear args so a later
            # getMessage() does not attempt %-formatting against stale args.
            record.msg = message[: match.start()]
            record.args = None
        return True


class CustomLoggingHandler(LoggingHandler):
    def filter(self, record: logging.LogRecord) -> bool:
        if record.exc_info:
            exc_value = record.exc_info[1]
            if isinstance(exc_value, SuspiciousOperation):
                return False
        return True

    @staticmethod
    def _get_attributes(record: logging.LogRecord):
        attributes = LoggingHandler._get_attributes(record)
        if isinstance(attributes, dict):
            if isinstance(attributes.get("request"), HttpRequest):
                # opentelemetry.attributes.BoundedAttributes does not support HttpRequest
                # Split request into compatible types if present
                # This occurs when getting "Not Found" error
                request: HttpRequest = attributes.pop("request")
                attributes["request.host"] = request.headers.get("Host", "")
                attributes["request.path"] = request.path
                attributes["request.query_string"] = request.META.get("QUERY_STRING", "")
                attributes["request.method"] = request.method
                attributes["request.user_agent"] = request.headers.get("User-Agent", "")
                attributes["request.ip"] = request.META.get("X-Forwarded-For", request.META.get("REMOTE_ADDR", ""))

        return attributes


LOG_CONFIG = {
    "version": 1,
    "disable_existing_loggers": False,
    "formatters": {
        "standard": {"format": "%(asctime)s %(levelname)s %(name)s %(message)s"},
    },
    "filters": {
        "gunicorn_metadata": {
            "()": "jolpica_api.logging.GunicornMetadataFilter",
        },
    },
    "handlers": {
        "console": {"level": "DEBUG", "class": "logging.StreamHandler", "formatter": "standard"},
        "otlp": {
            "class": "jolpica_api.logging.CustomLoggingHandler",
            "logger_provider": logger_provider,
        },
    },
    "root": {
        "handlers": ["console", "otlp"],
        "level": "INFO",
    },
    "loggers": {
        "gunicorn.access": {
            "filters": ["gunicorn_metadata"],
            "propagate": True,
        },
        "gunicorn.error": {
            "propagate": True,
        },
    },
}
