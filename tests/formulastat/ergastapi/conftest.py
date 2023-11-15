import pytest
from django.contrib.auth.models import User
from rest_framework.test import APIClient


@pytest.fixture(scope="function")
def client() -> APIClient:
    client = APIClient()
    client.force_login(User.objects.get(username="test_user"))
    return client
