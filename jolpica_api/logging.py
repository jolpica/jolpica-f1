import logging
import logging.config

from django.http.request import HttpRequest
from opentelemetry.exporter.otlp.proto.grpc._log_exporter import OTLPLogExporter
from opentelemetry.sdk._logs import LoggerProvider, LoggingHandler
from opentelemetry.sdk._logs.export import BatchLogRecordProcessor

# Authenticates with the OTEL_EXPORTER_OTLP_HEADERS environment variable
# With a value of "api-key=<LICENSE KEY>"
logger_provider = LoggerProvider()
exporter = OTLPLogExporter()
logger_provider.add_log_record_processor(BatchLogRecordProcessor(exporter))


class CustomLoggingHandler(LoggingHandler):
    @staticmethod
    def _get_attributes(record: logging.LogRecord):
        attributes = LoggingHandler._get_attributes(record)
        if isinstance(attributes, dict):
            if isinstance(attributes.get("request"), HttpRequest):
                # opentelemetry.attributes.BoundedAttributes does not support HttpRequest
                # Split request into compatible types if present
                # This occurs when getting "Not Found" error
                request: HttpRequest = attributes.pop("request")
                attributes["request.path"] = request.path
                attributes["request.method"] = request.method

        return attributes


LOG_CONFIG = {
    "version": 1,
    "disable_existing_loggers": False,
    "formatters": {
        "standard": {"format": "%(asctime)s %(levelname)s %(name)s %(message)s"},
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
            "propagate": True,
        },
        "gunicorn.error": {
            "propagate": True,
        },
    },
}
