from __future__ import annotations

from opentelemetry.exporter.otlp.proto.grpc.metric_exporter import OTLPMetricExporter
from opentelemetry.metrics import Counter, Histogram
from opentelemetry.sdk.metrics import MeterProvider
from opentelemetry.sdk.metrics.export import PeriodicExportingMetricReader

# Global variables for lazy initialization
_meter_provider: MeterProvider | None = None
_request_counter: Counter | None = None
_duration_histogram: Histogram | None = None


def _initialize_metrics() -> None:
    """Initialize OpenTelemetry metrics provider and instruments.

    Authenticates with the OTEL_EXPORTER_OTLP_HEADERS environment variable
    with a value of "api-key=<LICENSE KEY>"
    """
    global _meter_provider, _request_counter, _duration_histogram

    if _meter_provider is not None:
        return

    # Create OTLP exporter (uses environment variables for configuration)
    exporter = OTLPMetricExporter()

    # Create periodic exporting reader with 60-second interval
    reader = PeriodicExportingMetricReader(exporter, export_interval_millis=60000)

    # Create meter provider
    _meter_provider = MeterProvider(metric_readers=[reader])

    # Get meter for creating instruments
    meter = _meter_provider.get_meter("jolpica.api")

    # Create instruments
    _request_counter = meter.create_counter(
        name="api.requests",
        description="Total number of API requests",
        unit="1",
    )

    _duration_histogram = meter.create_histogram(
        name="api.request.duration",
        description="API request processing time",
        unit="ms",
    )


def get_request_counter() -> Counter:
    """Get the API request counter instrument."""
    if _request_counter is None:
        _initialize_metrics()
    return _request_counter  # type: ignore[return-value]


def get_duration_histogram() -> Histogram:
    """Get the API request duration histogram instrument."""
    if _duration_histogram is None:
        _initialize_metrics()
    return _duration_histogram  # type: ignore[return-value]
