"""OpenTelemetry metrics configuration for jolpica-f1 API.

Uses lazy initialization pattern to ensure metrics are only created when needed
and only once per process.
"""

from __future__ import annotations

from opentelemetry.exporter.otlp.proto.grpc.metric_exporter import OTLPMetricExporter
from opentelemetry.metrics import Counter, Histogram, Meter
from opentelemetry.sdk.metrics import MeterProvider
from opentelemetry.sdk.metrics.export import PeriodicExportingMetricReader

_meter: Meter | None = None
_api_requests_counter: Counter | None = None
_api_request_duration_histogram: Histogram | None = None
_api_response_size_histogram: Histogram | None = None


def _get_meter() -> Meter:
    """Get or create the OpenTelemetry meter.

    Uses lazy initialization to ensure the meter is only created once.
    Authenticates with OTEL_EXPORTER_OTLP_HEADERS environment variable.
    Endpoint from OTEL_EXPORTER_OTLP_ENDPOINT environment variable.

    Returns:
        OpenTelemetry Meter instance for jolpica-f1 service
    """
    global _meter
    if _meter is None:
        exporter = OTLPMetricExporter()

        # Exports metrics every 60 seconds
        reader = PeriodicExportingMetricReader(exporter, export_interval_millis=60000)
        meter_provider = MeterProvider(metric_readers=[reader])
        _meter = meter_provider.get_meter("jolpica-f1")

    return _meter


def get_api_requests_counter() -> Counter:
    """Get or create the API requests counter metric.

    Returns:
        Counter for tracking total number of API requests
    """
    global _api_requests_counter
    if _api_requests_counter is None:
        meter = _get_meter()
        _api_requests_counter = meter.create_counter(
            name="api.requests",
            description="Total number of API requests",
            unit="1",
        )
    return _api_requests_counter


def get_api_request_duration_histogram() -> Histogram:
    """Get or create the API request duration histogram metric.

    Returns:
        Histogram for tracking API request duration in milliseconds
    """
    global _api_request_duration_histogram
    if _api_request_duration_histogram is None:
        meter = _get_meter()
        _api_request_duration_histogram = meter.create_histogram(
            name="api.request.duration",
            description="API request duration in milliseconds",
            unit="ms",
        )
    return _api_request_duration_histogram


def get_api_response_size_histogram() -> Histogram:
    """Get or create the API response size histogram metric.

    Returns:
        Histogram for tracking API response size in bytes
    """
    global _api_response_size_histogram
    if _api_response_size_histogram is None:
        meter = _get_meter()
        _api_response_size_histogram = meter.create_histogram(
            name="api.response.size",
            description="API response size in bytes",
            unit="By",
        )
    return _api_response_size_histogram
