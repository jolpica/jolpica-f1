import logging
import logging.config

from gunicorn import glogging
from opentelemetry.exporter.otlp.proto.grpc._log_exporter import OTLPLogExporter
from opentelemetry.sdk._logs import LoggerProvider
from opentelemetry.sdk._logs.export import BatchLogRecordProcessor

# Authenticates with the OTEL_EXPORTER_OTLP_HEADERS environment variable
# With a value of "api-key=<LICENSE KEY>"
logger_provider = LoggerProvider()
exporter = OTLPLogExporter()
logger_provider.add_log_record_processor(BatchLogRecordProcessor(exporter))

LOG_CONFIG = {
    "version": 1,
    "disable_existing_loggers": False,
    "formatters": {
        "standard": {"format": "%(asctime)s %(levelname)s %(name)s %(message)s"},
    },
    "handlers": {
        "console": {"level": "DEBUG", "class": "logging.StreamHandler", "formatter": "standard"},
        "otlp": {
            "class": "opentelemetry.sdk._logs.LoggingHandler",
            "logger_provider": logger_provider,
        },
    },
    "root": {
        "handlers": ["console", "otlp"],
        "level": "INFO",
    },
    "loggers": {
        "uvicorn.access": {
            "propagate": True,
        },
        "gunicorn.error": {
            "propagate": True,
        },
    },
}


class GunicornLogger(glogging.Logger):
    def setup(self, cfg):
        super().setup(cfg)
        logging.config.dictConfig(LOG_CONFIG)
