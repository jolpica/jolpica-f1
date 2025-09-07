from __future__ import annotations

from unittest.mock import MagicMock, patch

import pytest
from django.contrib.auth.models import Permission, User
from django.contrib.contenttypes.models import ContentType
from django.utils import timezone
from rest_framework import status
from rest_framework.test import APIClient

from jolpica_api.dumps.models import Dump


@pytest.fixture
def sample_hash():
    return "a1b2c3d4e5f6789012345678901234567890123456789012345678901234abcd"


@pytest.fixture
def authenticated_client():
    client = APIClient()
    user = User.objects.create_user(username="testuser", password="testpass")
    client.force_authenticate(user=user)
    return client, user


@pytest.fixture
def superuser_client():
    client = APIClient()
    user = User.objects.create_superuser(username="admin", password="adminpass")
    client.force_authenticate(user=user)
    return client, user


@pytest.fixture
def user_with_permission():
    user = User.objects.create_user(username="uploader", password="uploaderpass")
    content_type = ContentType.objects.get_for_model(Dump)
    permission = Permission.objects.get(
        codename="can_upload_dumps",
        content_type=content_type,
    )
    user.user_permissions.add(permission)
    return user


@pytest.fixture
def client_with_permission(user_with_permission):
    client = APIClient()
    client.force_authenticate(user=user_with_permission)
    return client, user_with_permission


class BaseViewTestMixin:
    """Base test class for authentication and permission testing."""

    success_status = status.HTTP_200_OK  # Override in subclasses if needed
    http_methods = ["POST"]  # Override in subclasses (e.g., ["GET"], ["POST", "GET"])
    permission_fixture = "client_with_permission"  # Override for specific permission fixtures
    is_public_endpoint = False  # Override to True for public endpoints

    def make_request(self, client, method: str, url: str, data: dict):
        """Make HTTP request with specified method."""
        if method == "GET":
            return client.get(url)
        elif method == "POST":
            return client.post(url, data, format="json")
        else:
            raise ValueError(f"Unsupported HTTP method: {method}")

    @pytest.mark.django_db
    @pytest.mark.parametrize(
        ["client_type", "expected_status_key"],
        [
            ("anonymous", "unauthorized"),
            ("authenticated_no_permission", "forbidden"),
            ("authenticated_with_permission", "success"),
            ("superuser", "success"),
        ],
    )
    def test_authentication_and_permissions(self, request, sample_hash, client_type, expected_status_key):
        """Test authentication and permission requirements for the endpoint."""
        # Override expected status for public endpoints
        if self.is_public_endpoint:
            expected_status_key = "success"

        status_map = {
            "unauthorized": status.HTTP_401_UNAUTHORIZED,
            "forbidden": status.HTTP_403_FORBIDDEN,
            "success": self.success_status,
        }
        expected_status = status_map[expected_status_key]

        if client_type == "anonymous":
            client = APIClient()
        elif client_type == "authenticated_no_permission":
            client, user = request.getfixturevalue("authenticated_client")
        elif client_type == "authenticated_with_permission":
            client, user = request.getfixturevalue(self.permission_fixture)
        elif client_type == "superuser":
            client, user = request.getfixturevalue("superuser_client")

        data = self.get_auth_test_data(sample_hash)

        # Test each HTTP method specified by the subclass
        for method in self.http_methods:
            with self.mock_external_calls():
                response = self.make_request(client, method, self.get_url(), data)

            assert response.status_code == expected_status

    def get_auth_test_data(self, sample_hash: str) -> dict:
        """Override in subclasses to provide test data for authentication tests."""
        raise NotImplementedError

    def get_url(self) -> str:
        """Override in subclasses to provide the endpoint URL."""
        raise NotImplementedError

    def mock_external_calls(self):
        """Override in subclasses to mock external calls if needed."""

        return MagicMock()


class TestDumpUploadStartView(BaseViewTestMixin):
    http_methods = ["POST"]

    def get_auth_test_data(self, sample_hash: str) -> dict:
        return {
            "dump_type": "csv",
            "file_hash": sample_hash,
            "file_size": 1000,
        }

    def get_url(self) -> str:
        return "/data/dumps/upload/start/"

    def mock_external_calls(self):
        return patch("jolpica_api.dumps.views.generate_upload_presigned_url", return_value="https://test-url.com")

    @pytest.mark.django_db
    def test_duplicate_detection_completed_dump(self, client_with_permission, sample_hash):
        client, user = client_with_permission

        # Create completed dump
        Dump.objects.create(
            dump_type="csv",
            file_hash=sample_hash,
            key="test_key.zip",
            file_size=1000,
            upload_status="completed",
        )

        data = {
            "dump_type": "csv",
            "file_hash": sample_hash,
            "file_size": 1000,
        }

        response = client.post("/data/dumps/upload/start/", data)

        assert response.status_code == status.HTTP_200_OK
        assert response.data["exists"]
        assert "dump_id" in response.data

    @pytest.mark.django_db
    def test_pending_dump_type_mismatch(self, client_with_permission, sample_hash):
        client, user = client_with_permission

        # Create pending dump with different type
        Dump.objects.create(
            dump_type="sql",
            file_hash=sample_hash,
            key="test_key.zip",
            file_size=1000,
            upload_status="pending",
        )

        data = {
            "dump_type": "csv",  # Different type
            "file_hash": sample_hash,
            "file_size": 1000,
        }

        response = client.post("/data/dumps/upload/start/", data)

        assert response.status_code == status.HTTP_400_BAD_REQUEST
        assert "mismatch" in response.data["error"]

    @pytest.mark.django_db
    def test_successful_new_upload(self, client_with_permission, sample_hash):
        client, user = client_with_permission

        data = {
            "dump_type": "csv",
            "file_hash": sample_hash,
            "file_size": 1000,
            "metadata": {"source": "test"},
        }

        with patch("jolpica_api.dumps.views.generate_upload_presigned_url") as mock_url:
            mock_url.return_value = "https://test-upload-url.com"
            response = client.post("/data/dumps/upload/start/", data, format="json")

        assert response.status_code == status.HTTP_200_OK
        assert not response.data["exists"]
        assert "upload_url" in response.data
        assert "dump_id" in response.data
        assert "key" in response.data
        assert response.data["upload_url"] == "https://test-upload-url.com"


class TestDumpUploadCompleteView(BaseViewTestMixin):
    http_methods = ["POST"]
    success_status = status.HTTP_404_NOT_FOUND  # No pending dump exists

    def get_auth_test_data(self, sample_hash: str) -> dict:
        return {
            "dump_type": "csv",
            "file_hash": sample_hash,
        }

    def get_url(self) -> str:
        return "/data/dumps/upload/complete/"

    @pytest.mark.django_db
    def test_successful_confirmation(self, client_with_permission, sample_hash):
        client, user = client_with_permission

        # Create pending dump
        dump = Dump.objects.create(
            dump_type="csv",
            file_hash=sample_hash,
            key="test_key.zip",
            file_size=1000,
            upload_status="pending",
        )

        data = {
            "dump_type": "csv",
            "file_hash": sample_hash,
        }

        response = client.post("/data/dumps/upload/complete/", data)

        assert response.status_code == status.HTTP_200_OK
        assert response.data["success"]
        assert "dump_id" in response.data
        assert response.data["dump_id"] == dump.id

        # Verify dump was marked completed
        dump.refresh_from_db()
        assert dump.upload_status == "completed"
        assert dump.uploaded_at is not None

    @pytest.mark.django_db
    def test_no_pending_dump_found(self, client_with_permission, sample_hash):
        client, user = client_with_permission

        data = {
            "dump_type": "csv",
            "file_hash": sample_hash,
        }

        response = client.post("/data/dumps/upload/complete/", data)

        assert response.status_code == status.HTTP_404_NOT_FOUND
        assert not response.data["success"]
        assert "No pending dump found" in response.data["message"]


# New download view tests
@pytest.fixture
def user_with_download_permission():
    user = User.objects.create_user(username="downloader", password="downloaderpass")
    content_type = ContentType.objects.get_for_model(Dump)
    permission = Permission.objects.get(
        codename="can_download_latest_dump",
        content_type=content_type,
    )
    user.user_permissions.add(permission)
    return user


@pytest.fixture
def download_client_with_permission(user_with_download_permission):
    client = APIClient()
    client.force_authenticate(user=user_with_download_permission)
    return client, user_with_download_permission


class TestDumpDownloadDelayedView(BaseViewTestMixin):
    """Test class for delayed dump download view (comprehensive base functionality)."""

    http_methods = ["GET"]
    success_status = status.HTTP_404_NOT_FOUND  # No dumps exist in auth tests
    is_public_endpoint = True

    def get_url(self) -> str:
        return "/data/dumps/download/delayed/"

    def get_auth_test_data(self, sample_hash: str) -> dict:
        return {}  # GET request doesn't require data

    def mock_external_calls(self):
        return patch(
            "jolpica_api.dumps.views.generate_download_presigned_url", return_value="https://test-download-url.com"
        )

    @pytest.mark.django_db
    @pytest.mark.parametrize(
        ["dump_type", "expected_key"],
        [
            ("csv", "old_csv.zip"),
            ("sql", "old_sql.zip"),
        ],
    )
    def test_dump_type_filtering(self, dump_type, expected_key):
        """Test that delayed view correctly filters dumps by type and returns old dumps."""
        from datetime import timedelta

        from jolpica_api.dumps.views import DUMP_DOWNLOAD_DELAY_DAYS

        client = APIClient()

        # Create old dumps of both types (older than delay period)
        old_date = timezone.now() - timedelta(days=DUMP_DOWNLOAD_DELAY_DAYS + 1)

        Dump.objects.create(
            dump_type="csv",
            file_hash="oldcsv123456789012345678901234567890123456789012345abcd",
            key="old_csv.zip",
            file_size=1000,
            upload_status="completed",
            uploaded_at=old_date,
        )

        Dump.objects.create(
            dump_type="sql",
            file_hash="oldsql123456789012345678901234567890123456789012345abcd",
            key="old_sql.zip",
            file_size=2000,
            upload_status="completed",
            uploaded_at=old_date,
        )

        with patch("jolpica_api.dumps.views.generate_download_presigned_url") as mock_url:
            mock_url.return_value = "https://s3-delayed-url.com"

            response = client.get(f"/data/dumps/download/delayed/?dump_type={dump_type}")
            assert response.status_code == status.HTTP_302_FOUND
            mock_url.assert_called_with(expected_key)

    @pytest.mark.django_db
    def test_no_delayed_dumps_available_fallback_to_oldest(self):
        """Test that delayed view returns oldest dump when no delayed dumps exist."""
        client = APIClient()

        # Create only recent dump (not old enough for delayed download)
        Dump.objects.create(
            dump_type="csv",
            file_hash="recent123456789012345678901234567890123456789012345abcd",
            key="recent.zip",
            file_size=1000,
            upload_status="completed",
            uploaded_at=timezone.now(),
        )

        with patch("jolpica_api.dumps.views.generate_download_presigned_url") as mock_url:
            mock_url.return_value = "https://s3-fallback-url.com"

            response = client.get("/data/dumps/download/delayed/?dump_type=csv")

            # Should now succeed by returning the recent dump (fallback behavior)
            assert response.status_code == status.HTTP_302_FOUND
            mock_url.assert_called_with("recent.zip")

    @pytest.mark.django_db
    def test_no_dumps_exist_returns_404(self):
        """Test that delayed view returns 404 when no dumps exist at all."""
        client = APIClient()

        response = client.get("/data/dumps/download/delayed/?dump_type=csv")

        assert response.status_code == status.HTTP_404_NOT_FOUND
        from jolpica_api.dumps.views import DUMP_DOWNLOAD_DELAY_DAYS

        assert f"No dumps found older than {DUMP_DOWNLOAD_DELAY_DAYS} days of type 'csv'" in response.data["error"]

    @pytest.mark.django_db
    def test_delay_logic_verification(self):
        """Test that delayed view only returns dumps older than DUMP_DOWNLOAD_DELAY_DAYS."""
        from datetime import timedelta

        from jolpica_api.dumps.views import DUMP_DOWNLOAD_DELAY_DAYS

        client = APIClient()

        # Create recent dump (should not be returned)
        Dump.objects.create(
            dump_type="csv",
            file_hash="recent123456789012345678901234567890123456789012345abcd",
            key="recent.zip",
            file_size=1000,
            upload_status="completed",
            uploaded_at=timezone.now(),
        )

        # Create old dump (should be returned)
        old_date = timezone.now() - timedelta(days=DUMP_DOWNLOAD_DELAY_DAYS + 1)
        Dump.objects.create(
            dump_type="csv",
            file_hash="old123456789012345678901234567890123456789012345678abcd",
            key="old.zip",
            file_size=2000,
            upload_status="completed",
            uploaded_at=old_date,
        )

        with patch("jolpica_api.dumps.views.generate_download_presigned_url") as mock_url:
            mock_url.return_value = "https://s3-delayed-url.com"

            response = client.get("/data/dumps/download/delayed/?dump_type=csv")
            assert response.status_code == status.HTTP_302_FOUND
            # Verify it returns the old dump, not the recent one
            mock_url.assert_called_with("old.zip")


class TestDumpDownloadLatestView(BaseViewTestMixin):
    """Test class for latest dump download - only tests differences from delayed view."""

    http_methods = ["GET"]
    success_status = status.HTTP_404_NOT_FOUND  # No dumps exist in auth tests
    permission_fixture = "download_client_with_permission"

    def get_url(self) -> str:
        return "/data/dumps/download/latest/"

    def get_auth_test_data(self, sample_hash: str) -> dict:
        return {}  # GET request doesn't require data

    def mock_external_calls(self):
        return patch(
            "jolpica_api.dumps.views.generate_download_presigned_url", return_value="https://test-download-url.com"
        )

    @pytest.mark.django_db
    def test_zero_delay_behavior_difference(self, download_client_with_permission):
        """Test that latest view returns recent dumps (delay_days=0 vs delayed's 14 days)."""
        from datetime import timedelta

        from jolpica_api.dumps.views import DUMP_DOWNLOAD_DELAY_DAYS

        client, user = download_client_with_permission

        # Create old dump (would be returned by delayed view)
        old_date = timezone.now() - timedelta(days=DUMP_DOWNLOAD_DELAY_DAYS + 1)
        Dump.objects.create(
            dump_type="csv",
            file_hash="old123456789012345678901234567890123456789012345678abcd",
            key="old.zip",
            file_size=1000,
            upload_status="completed",
            uploaded_at=old_date,
        )

        # Create recent dump (should be returned by latest view)
        Dump.objects.create(
            dump_type="csv",
            file_hash="recent123456789012345678901234567890123456789012345abcd",
            key="recent.zip",
            file_size=2000,
            upload_status="completed",
            uploaded_at=timezone.now(),
        )

        with patch("jolpica_api.dumps.views.generate_download_presigned_url") as mock_url:
            mock_url.return_value = "https://s3-download-url.com"

            response = client.get("/data/dumps/download/latest/?dump_type=csv")
            assert response.status_code == status.HTTP_302_FOUND
            # Latest view should return the most recent dump, not the old one
            mock_url.assert_called_with("recent.zip")


class TestDumpsOverviewView(BaseViewTestMixin):
    """Test class for dumps overview view (public access)."""

    http_methods = ["GET"]
    success_status = status.HTTP_200_OK  # Overview endpoint returns 200 with empty data
    is_public_endpoint = True

    def get_url(self) -> str:
        return "/data/dumps/download/"

    def get_auth_test_data(self, sample_hash: str) -> dict:
        return {}  # GET request doesn't require data

    def mock_external_calls(self):
        # Overview view doesn't need external mocking for basic auth tests
        return MagicMock()

    @pytest.mark.django_db
    @pytest.mark.parametrize(
        ["dump_setup", "expected_types_count", "expected_latest_count", "expected_delayed_count"],
        [
            # No dumps case
            ("none", 0, 0, 0),
            # Only pending dumps - should return empty
            ("pending_only", 0, 0, 0),
            # Multiple dump types - with fallback, recent dumps are returned as delayed too
            ("multiple_types", 2, 2, 2),
        ],
    )
    def test_overview_scenarios(self, dump_setup, expected_types_count, expected_latest_count, expected_delayed_count):
        client = APIClient()

        # Setup data based on parameter
        if dump_setup == "pending_only":
            Dump.objects.create(
                dump_type="csv",
                file_hash="pending123456789012345678901234567890123456789012345abcd",
                key="pending.zip",
                file_size=1000,
                upload_status="pending",
            )
        elif dump_setup == "multiple_types":
            # Create dumps of different types
            Dump.objects.create(
                dump_type="csv",
                file_hash="csv123456789012345678901234567890123456789012345abcd",
                key="dump.csv.zip",
                file_size=1000,
                upload_status="completed",
                uploaded_at=timezone.now(),
            )
            Dump.objects.create(
                dump_type="sql",
                file_hash="sql123456789012345678901234567890123456789012345abcd",
                key="dump.sql.zip",
                file_size=2000,
                upload_status="completed",
                uploaded_at=timezone.now(),
            )

        response = client.get("/data/dumps/download/")

        assert response.status_code == status.HTTP_200_OK
        assert len(response.data["available_types"]) == expected_types_count
        assert len(response.data["latest_dumps"]) == expected_latest_count
        assert len(response.data["delayed_dumps"]) == expected_delayed_count

    @pytest.mark.django_db
    def test_overview_with_dumps(self):
        from datetime import timedelta

        from jolpica_api.dumps.views import DUMP_DOWNLOAD_DELAY_DAYS

        client = APIClient()

        # Create recent dump
        recent_dump = Dump.objects.create(
            dump_type="csv",
            file_hash="recent123456789012345678901234567890123456789012345abcd",
            key="recent.zip",
            file_size=1000,
            upload_status="completed",
            uploaded_at=timezone.now(),
        )

        # Create old dump
        old_date = timezone.now() - timedelta(days=DUMP_DOWNLOAD_DELAY_DAYS + 1)
        old_dump = Dump.objects.create(
            dump_type="csv",
            file_hash="old123456789012345678901234567890123456789012345678abcd",
            key="old.zip",
            file_size=2000,
            upload_status="completed",
            uploaded_at=old_date,
        )

        response = client.get("/data/dumps/download/")

        assert response.status_code == status.HTTP_200_OK
        assert response.data["available_types"] == ["csv"]

        # Check latest dump info
        latest_csv = response.data["latest_dumps"]["csv"]
        assert latest_csv["file_hash"] == recent_dump.file_hash
        assert latest_csv["download_url"] == "http://testserver/data/dumps/download/latest/?dump_type=csv"

        # Check delayed dump info
        delayed_csv = response.data["delayed_dumps"]["csv"]
        assert delayed_csv["file_hash"] == old_dump.file_hash
        assert delayed_csv["download_url"] == "http://testserver/data/dumps/download/delayed/?dump_type=csv"
