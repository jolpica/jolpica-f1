from __future__ import annotations

import pytest
from rest_framework.test import APIClient

from jolpica.formula_one import models as f1


@pytest.fixture
def api_client():
    """Provides an API client for making requests."""
    return APIClient()


@pytest.fixture
def sample_season_data():
    """Provides a sample season for testing."""
    return f1.Season.objects.get(year=2023)
