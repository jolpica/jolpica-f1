from __future__ import annotations

from unittest.mock import patch

import pytest
from django.utils import timezone

from jolpica_api.dumps.models import Dump
from jolpica_api.dumps.services import (
    check_duplicate_dump,
    confirm_dump_upload,
    create_or_update_dump,
    generate_s3_key,
)


@pytest.fixture
def sample_hash():
    return "a1b2c3d4e5f6789012345678901234567890123456789012345678901234abcd"


@pytest.fixture
def completed_dump(sample_hash):
    return Dump.objects.create(
        dump_type="csv",
        file_hash=sample_hash,
        key="dumps/2024-01-01/csv_a1b2c3d4/jolpica-f1-csv.zip",
        file_size=1000,
        upload_status="completed",
        uploaded_at=timezone.now(),
    )


@pytest.fixture
def pending_dump(sample_hash):
    return Dump.objects.create(
        dump_type="csv",
        file_hash=sample_hash,
        key="dumps/2024-01-01/csv_a1b2c3d4/jolpica-f1-csv.zip",
        file_size=1000,
        upload_status="pending",
    )


@pytest.mark.django_db
@pytest.mark.parametrize(
    ["dump_fixture", "expected_is_duplicate", "expected_existing"],
    [
        ("completed_dump", True, True),
        ("pending_dump", False, True),
        (None, False, False),
    ],
)
def test_check_duplicate_dump(request, sample_hash, dump_fixture, expected_is_duplicate, expected_existing):
    if dump_fixture:
        request.getfixturevalue(dump_fixture)

    is_duplicate, existing_dump = check_duplicate_dump(sample_hash)

    assert is_duplicate == expected_is_duplicate
    if expected_existing:
        assert existing_dump is not None
        assert existing_dump.file_hash == sample_hash
    else:
        assert existing_dump is None


def test_generate_s3_key():
    with patch("jolpica_api.dumps.services.datetime") as mock_datetime:
        mock_datetime.now.return_value.strftime.return_value = "2024-01-15"

        result = generate_s3_key("csv", "a1b2c3d4e5f6789012345678901234567890")

        assert result == "dumps/2024-01-15/csv_a1b2c3d4/jolpica-f1-csv.zip"


@pytest.mark.django_db
@pytest.mark.parametrize(
    ["has_existing_dump"],
    [(True,), (False,)],
)
def test_create_or_update_dump(sample_hash, has_existing_dump):
    existing_dump = None
    if has_existing_dump:
        existing_dump = Dump.objects.create(
            dump_type="csv",
            file_hash=sample_hash,
            key="old_key.zip",
            file_size=500,
            upload_status="pending",
        )

    result = create_or_update_dump(
        dump_type="csv",
        file_hash=sample_hash,
        file_size=1000,
        s3_key="new_key.zip",
        metadata={"test": "value"},
        existing_dump=existing_dump,
    )

    assert result.dump_type == "csv"
    assert result.file_hash == sample_hash
    assert result.file_size == 1000
    assert result.key == "new_key.zip"
    assert result.metadata == {"test": "value"}
    assert result.upload_status == "pending"

    if has_existing_dump:
        assert result.id == existing_dump.id
        assert Dump.objects.count() == 1
    else:
        assert Dump.objects.count() == 1


@pytest.mark.django_db
@pytest.mark.parametrize(
    ["has_pending_dump", "expected_success"],
    [
        (True, True),
        (False, False),
    ],
)
def test_confirm_dump_upload(sample_hash, has_pending_dump, expected_success):
    if has_pending_dump:
        Dump.objects.create(
            dump_type="csv",
            file_hash=sample_hash,
            key="test_key.zip",
            file_size=1000,
            upload_status="pending",
        )

    success, message, dump = confirm_dump_upload("csv", sample_hash)

    assert success == expected_success
    if expected_success:
        assert "successfully" in message
        assert dump is not None
        assert dump.upload_status == "completed"
        assert dump.uploaded_at is not None
    else:
        assert "No pending dump found" in message
        assert dump is None
