from collections.abc import Callable

import requests
from django.http import HttpResponseForbidden
from django.http.request import HttpRequest


def get_ec2_token() -> str:
    """Set the autorization token to live for 6 hours (maximum)"""
    headers = {
        "X-aws-ec2-metadata-token-ttl-seconds": "21600",
    }
    response = requests.put("http://169.254.169.254/latest/api/token", headers=headers, timeout=2)
    return response.text


def get_linux_ec2_private_ip() -> None | str:
    """Get the private IP Address of the machine if running on an EC2 linux server.
    See https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instancedata-data-retrieval.html
    """

    try:
        token = get_ec2_token()
    except Exception:
        return

    headers = {"X-aws-ec2-metadata-token": f"{token}"}

    try:
        response = requests.get("http://169.254.169.254/latest/meta-data/local-ipv4", headers=headers, timeout=2)
        return response.text
    except Exception as ex:
        ex.add_note("while getting private IP address from EC2 metadata")
        raise ex


def client_ip_middleware(
    get_response,
):
    """Set the client ip (REMOTE_ADDR) value to the ip sent to the load balancer.

    If developing locally and there is no HTTP_X_FORWARDED_FOR, default to existing value.
    """

    def process_request(
        request,
    ):
        ips = request.META.get(
            "HTTP_X_FORWARDED_FOR",
            request.META["REMOTE_ADDR"],
        )
        request.META["REMOTE_ADDR"] = ips.rsplit(", ", maxsplit=1)[-1]
        return get_response(request)

    return process_request


def ip_blocks_middleware(
    get_response,
):
    """Block IP addresses from accessing the API."""

    def process_request(
        request: HttpRequest,
    ):
        if request.META["REMOTE_ADDR"] in {"45.61.185.154"}:
            # IP of http://allorigins.win
            return HttpResponseForbidden("Too many requests from this IP. Please avoid proxy services.")
        return get_response(request)

    return process_request


def queryparam_blocks_middleware(
    get_response,
):
    """Block IP addresses from accessing the API."""

    def process_request(
        request: HttpRequest,
    ):
        for key in request.GET.keys():
            if "cache" in key.lower():
                return HttpResponseForbidden("Please be considerate of other API users and do not avoid caches.")
        return get_response(request)

    return process_request


def drf_spectacular_filter_preprocess(
    endpoints: list[tuple[str, str, str, Callable]],
) -> list[tuple[str, str, str, Callable]]:
    """Filter the OpenAPI schema to remove unwanted endpoints."""
    filtered = []
    for path, path_regex, method, callback in endpoints:
        if path.startswith("/f1"):
            filtered.append((path, path_regex, method, callback))
    return filtered
