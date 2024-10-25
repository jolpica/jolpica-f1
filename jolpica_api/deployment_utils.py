from django.http import HttpResponseForbidden
import requests


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
        return None

    headers = {"X-aws-ec2-metadata-token": f"{token}"}

    try:
        response = requests.get("http://169.254.169.254/latest/meta-data/local-ipv4", headers=headers, timeout=2)
        return response.text
    except Exception:
        return None


def client_ip_middleware(get_response):
    """Set the client ip (REMOTE_ADDR) value to the ip sent to the load balancer.

    If developing locally and there is no HTTP_X_FORWARDED_FOR, default to existing value.
    """

    def process_request(request):
        ips = request.META.get(
            "HTTP_X_FORWARDED_FOR",
            request.META["REMOTE_ADDR"],
        )
        request.META["REMOTE_ADDR"] = ips.rsplit(", ", maxsplit=1)[-1]
        return get_response(request)

    return process_request

def ip_blocks_middleware(get_response):
    """Block IP addresses from accessing the API."""

    def process_request(request):
        if request.META["REMOTE_ADDR"] in {"45.61.185.154"}:
            # IP of http://allorigins.win
            return HttpResponseForbidden("Too many requests from this IP. Please avoid proxy services.")
        return get_response(request)

    return process_request
