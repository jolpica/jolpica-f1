from __future__ import annotations

from datetime import timedelta
from unittest.mock import patch

import pytest
from django.utils import timezone

from jolpica_api.dumps.models import Dump
from jolpica_api.dumps.services import (
    check_duplicate_dump,
    confirm_dump_upload,
    create_or_update_dump,
    generate_s3_key,
    get_available_dump_types,
    get_latest_delayed_dump,
)
from jolpica_api.dumps.views import DUMP_DOWNLOAD_DELAY_DAYS


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


# New download service tests


@pytest.mark.django_db
@pytest.mark.parametrize(
    ["delay_days", "dump_type", "create_old_dump", "create_recent_dump", "expected_dump_type", "expected_hash"],
    [
        # No dumps case
        (DUMP_DOWNLOAD_DELAY_DAYS, None, False, False, None, None),
        # Zero delay - should return recent dump (used by get_latest_completed_dump)
        (0, None, False, True, "csv", "recent123456789012345678901234567890123456789012345abcd"),
        # CSV type filtering - has old dump
        (
            DUMP_DOWNLOAD_DELAY_DAYS,
            "csv",
            True,
            False,
            "csv",
            "old123456789012345678901234567890123456789012345678abcd",
        ),
        # Fallback case: only recent dump exists, should return oldest (which is the recent one)
        (
            DUMP_DOWNLOAD_DELAY_DAYS,
            "csv",
            False,
            True,
            "csv",
            "recent123456789012345678901234567890123456789012345abcd",
        ),
        # No fallback without dump_type specified
        (DUMP_DOWNLOAD_DELAY_DAYS, None, False, True, None, None),
    ],
)
def test_get_latest_delayed_dump(
    delay_days, dump_type, create_old_dump, create_recent_dump, expected_dump_type, expected_hash
):
    if create_old_dump:
        old_date = timezone.now() - timedelta(days=DUMP_DOWNLOAD_DELAY_DAYS + 1)
        Dump.objects.create(
            dump_type="csv",
            file_hash="old123456789012345678901234567890123456789012345678abcd",
            key="dumps/2024-01-01/csv_old12345/jolpica-f1-csv.zip",
            file_size=1000,
            upload_status="completed",
            uploaded_at=old_date,
        )

    if create_recent_dump:
        Dump.objects.create(
            dump_type="csv",
            file_hash="recent123456789012345678901234567890123456789012345abcd",
            key="dumps/2024-01-15/csv_recent12/jolpica-f1-csv.zip",
            file_size=2000,
            upload_status="completed",
            uploaded_at=timezone.now(),
        )

    result = get_latest_delayed_dump(delay_days, dump_type)

    if expected_dump_type is None:
        assert result is None
    else:
        assert result is not None
        assert result.dump_type == expected_dump_type
        assert result.file_hash == expected_hash


@pytest.mark.django_db
def test_get_latest_delayed_dump_fallback_behavior():
    """Test fallback to oldest dump when no delayed dumps are available."""
    base_time = timezone.now()

    # Oldest dump (5 days ago)
    oldest_dump = Dump.objects.create(
        dump_type="csv",
        file_hash="oldest123456789012345678901234567890123456789012345abcd",
        key="oldest.zip",
        file_size=1000,
        upload_status="completed",
        uploaded_at=base_time - timedelta(days=5),
    )

    # Middle dump (3 days ago)
    Dump.objects.create(
        dump_type="csv",
        file_hash="middle123456789012345678901234567890123456789012345abcd",
        key="middle.zip",
        file_size=1000,
        upload_status="completed",
        uploaded_at=base_time - timedelta(days=3),
    )

    # Most recent dump (1 day ago)
    Dump.objects.create(
        dump_type="csv",
        file_hash="recent123456789012345678901234567890123456789012345abcd",
        key="recent.zip",
        file_size=1000,
        upload_status="completed",
        uploaded_at=base_time - timedelta(days=1),
    )

    # Test with 14 day delay - no dumps are old enough, should return oldest
    result = get_latest_delayed_dump(DUMP_DOWNLOAD_DELAY_DAYS, "csv")

    assert result is not None
    assert result.file_hash == oldest_dump.file_hash
    assert result.key == "oldest.zip"


@pytest.mark.django_db
@pytest.mark.parametrize(
    ["create_recent_csv", "create_sql", "create_pending", "expected_types"],
    [
        # No dumps case
        (False, False, False, []),
        # Completed dumps of different types
        (True, True, False, ["csv", "sql"]),
        # Only pending dumps - should return empty
        (False, False, True, []),
    ],
)
def test_get_available_dump_types(create_recent_csv, create_sql, create_pending, expected_types):
    if create_recent_csv:
        Dump.objects.create(
            dump_type="csv",
            file_hash="recent123456789012345678901234567890123456789012345abcd",
            key="dumps/2024-01-15/csv_recent12/jolpica-f1-csv.zip",
            file_size=2000,
            upload_status="completed",
            uploaded_at=timezone.now(),
        )

    if create_sql:
        Dump.objects.create(
            dump_type="sql",
            file_hash="sql123456789012345678901234567890123456789012345678abcd",
            key="dumps/2024-01-10/sql_sql12345/jolpica-f1-sql.zip",
            file_size=3000,
            upload_status="completed",
            uploaded_at=timezone.now(),
        )

    if create_pending:
        Dump.objects.create(
            dump_type="csv",
            file_hash="pending12345678901234567890123456789012345678abcd",
            key="dumps/2024-01-01/csv_pending/jolpica-f1-csv.zip",
            file_size=1000,
            upload_status="pending",
        )

    result = get_available_dump_types()
    assert set(result) == set(expected_types)
    assert result == sorted(result)  # Should be sorted
