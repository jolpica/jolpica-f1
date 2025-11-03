"""Mixin for instrumenting ViewSets with OpenTelemetry metrics."""

from __future__ import annotations

import time
from typing import Any

from django.conf import settings
from rest_framework.request import Request
from rest_framework.response import Response

from jolpica_api.metrics import (
    get_api_request_duration_histogram,
    get_api_requests_counter,
    get_api_response_size_histogram,
)


class MetricsInstrumentationMixin:
    """Mixin to add metrics collection to DRF ViewSets.

    This mixin must be used with ViewSets that implement the ViewSetProtocol interface
    (i.e., have `basename`, `action` attributes and `initial()`, `finalize_response()` methods).

    Usage:
        class MyViewSet(MetricsInstrumentationMixin, viewsets.ReadOnlyModelViewSet):
            ...

    This mixin overrides initial() and finalize_response() to capture
    API request metrics and send them to OpenTelemetry.
    """

    def initial(self, request: Request, *args: Any, **kwargs: Any) -> None:
        """Called before the action method. Store request start time."""
        # Store start time for duration calculation
        request._metrics_start_time = time.perf_counter()  # type: ignore[attr-defined]
        return super().initial(request, *args, **kwargs)  # type: ignore[misc]

    def finalize_response(self, request: Request, response: Response, *args: Any, **kwargs: Any) -> Response:
        """Called after action method. Record metrics before returning response."""
        response = super().finalize_response(request, response, *args, **kwargs)  # type: ignore[misc]

        # Only collect metrics for GET requests
        if request.method != "GET":
            return response

        api_version = self._get_api_version()
        if api_version == "unknown":
            # Don't record metrics for unknown API versions
            return response

        deployment_env = getattr(settings, "DEPLOYMENT_ENV", "LOCAL")
        if deployment_env == "LOCAL":
            return response

        # Determine endpoint name from basename and action
        basename = getattr(self, "basename", "unknown")
        action = getattr(self, "action", "unknown")

        # Get status code
        status_code = response.status_code

        # Common attributes for all metrics
        attributes: dict[str, str] = {
            "api_version": api_version,
            "basename": basename,
            "action": action,
            "status_code": str(status_code),
        }

        requests_counter = get_api_requests_counter()
        duration_histogram = get_api_request_duration_histogram()
        response_size_histogram = get_api_response_size_histogram()

        # Record request counter
        requests_counter.add(1, attributes)

        # Calculate and record request duration
        start_time = getattr(request, "_metrics_start_time", None)
        if start_time is not None:
            duration_ms = (time.perf_counter() - start_time) * 1000
            duration_histogram.record(duration_ms, attributes)

        # Calculate and record response size
        # Only record if response has rendered content
        if hasattr(response, "rendered_content"):
            try:
                response_size = len(response.rendered_content)
                response_size_histogram.record(response_size, attributes)
            except AttributeError:
                # Response may not have rendered_content yet
                pass

        return response

    def _get_api_version(self) -> str:
        """Determine API version from class module path.

        Returns:
            "ergast" if from ergastapi module, "f1_alpha" if from f1_api module
        """
        module = self.__class__.__module__
        if "ergastapi" in module:
            return "ergast"
        elif "f1_api" in module:
            return "f1_alpha"
        else:
            return "unknown"
