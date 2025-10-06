from __future__ import annotations

import pytest
from django.urls import reverse
from rest_framework.test import APIClient

from jolpica.formula_one import models as f1


@pytest.fixture
def api_client():
    """Provides an API client for making requests."""
    return APIClient()


@pytest.mark.django_db
def test_rounds_list_query_optimization(api_client, django_assert_max_num_queries):
    """Verify the rounds list endpoint makes fewer than 10 database queries."""
    url = reverse("rounds-list")

    with django_assert_max_num_queries(10):
        response = api_client.get(url)

    assert response.status_code == 200
    rsp = response.json()
    assert rsp["metadata"]["count"] == f1.Round.objects.count()
    assert 0 < len(rsp["data"]) >= 100
