from __future__ import annotations

from unittest.mock import MagicMock, patch

import pytest
from django.contrib.auth.models import Permission, User
from django.contrib.contenttypes.models import ContentType
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
            client, user = request.getfixturevalue("client_with_permission")
        elif client_type == "superuser":
            client, user = request.getfixturevalue("superuser_client")

        data = self.get_auth_test_data(sample_hash)

        with self.mock_external_calls():
            response = client.post(self.get_url(), data, format="json")

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
    def get_auth_test_data(self, sample_hash: str) -> dict:
        return {
            "dump_type": "csv",
            "file_hash": sample_hash,
            "file_size": 1000,
        }

    def get_url(self) -> str:
        return "/data/dumps/upload/start/"

    def mock_external_calls(self):
        return patch("jolpica_api.dumps.views.generate_presigned_url", return_value="https://test-url.com")

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

        with patch("jolpica_api.dumps.views.generate_presigned_url") as mock_url:
            mock_url.return_value = "https://test-upload-url.com"
            response = client.post("/data/dumps/upload/start/", data, format="json")

        assert response.status_code == status.HTTP_200_OK
        assert not response.data["exists"]
        assert "upload_url" in response.data
        assert "dump_id" in response.data
        assert "key" in response.data
        assert response.data["upload_url"] == "https://test-upload-url.com"

    @pytest.mark.django_db
    def test_aws_exception_handling(self, client_with_permission, sample_hash):
        client, user = client_with_permission

        data = {
            "dump_type": "csv",
            "file_hash": sample_hash,
            "file_size": 1000,
        }

        with patch("jolpica_api.dumps.views.generate_presigned_url") as mock_url:
            mock_url.side_effect = Exception("AWS error")
            response = client.post("/data/dumps/upload/start/", data)

        assert response.status_code == status.HTTP_500_INTERNAL_SERVER_ERROR
        assert "Failed to generate upload URL" in response.data["error"]


class TestDumpUploadCompleteView(BaseViewTestMixin):
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

    @pytest.mark.django_db
    def test_exception_handling(self, client_with_permission, sample_hash):
        client, user = client_with_permission

        data = {
            "dump_type": "csv",
            "file_hash": sample_hash,
        }

        with patch("jolpica_api.dumps.views.confirm_dump_upload") as mock_confirm:
            mock_confirm.side_effect = Exception("Database error")
            response = client.post("/data/dumps/upload/complete/", data)

        assert response.status_code == status.HTTP_500_INTERNAL_SERVER_ERROR
        assert "Failed to confirm upload" in response.data["error"]
