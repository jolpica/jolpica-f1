import pytest
from formulastat.ergast.models import Drivers


@pytest.mark.django_db
def test_fixture():
    assert Drivers.objects.all().count() >= 20
