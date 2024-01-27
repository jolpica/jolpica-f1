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
