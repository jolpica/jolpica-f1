from datetime import timedelta

import pytest
from django.utils import timezone

from ..models import DumpConfiguration, DumpDownload, DumpRecord


@pytest.mark.django_db
class TestDumpConfiguration:
    """Test DumpConfiguration model"""

    def test_dump_configuration_creation(self):
        """Test creating a dump configuration with default values"""
        config = DumpConfiguration.objects.create()

        assert config.delay_type == DumpConfiguration.DelayType.FIXED_DAYS
        assert config.delay_days == 30
        assert config.is_enabled is True
        assert config.s3_bucket_public == "jolpica-dumps-public"
        assert config.s3_bucket_private == "jolpica-dumps-private"
        assert config.slack_webhook_url == ""

    def test_dump_configuration_custom_values(self):
        """Test creating a dump configuration with custom values"""
        config = DumpConfiguration.objects.create(
            delay_type=DumpConfiguration.DelayType.SEASON_END,
            delay_days=60,
            is_enabled=False,
            slack_webhook_url="https://hooks.slack.com/test",
            s3_bucket_public="test-public",
            s3_bucket_private="test-private",
        )

        assert config.delay_type == DumpConfiguration.DelayType.SEASON_END
        assert config.delay_days == 60
        assert config.is_enabled is False
        assert config.slack_webhook_url == "https://hooks.slack.com/test"
        assert config.s3_bucket_public == "test-public"
        assert config.s3_bucket_private == "test-private"

    def test_dump_configuration_str_representation(self):
        """Test string representation of dump configuration"""
        config = DumpConfiguration.objects.create(delay_type=DumpConfiguration.DelayType.MILESTONE, delay_days=45)

        expected = "Dump Config - Milestone Based (45 days)"
        assert str(config) == expected

    def test_dump_configuration_choices(self):
        """Test that delay type choices work correctly"""
        assert DumpConfiguration.DelayType.FIXED_DAYS == "fixed"
        assert DumpConfiguration.DelayType.SEASON_END == "season"
        assert DumpConfiguration.DelayType.MILESTONE == "milestone"


@pytest.mark.django_db
class TestDumpRecord:
    """Test DumpRecord model"""

    def test_dump_record_creation_minimal(self):
        """Test creating a dump record with minimal data"""
        record = DumpRecord.objects.create(dump_type=DumpRecord.DumpType.LATEST)

        assert record.dump_type == DumpRecord.DumpType.LATEST
        assert record.status == DumpRecord.Status.PENDING
        assert record.triggered_by == "scheduled"
        assert record.has_changes is False
        assert record.started_at is not None
        assert record.completed_at is None

    def test_dump_record_creation_full(self):
        """Test creating a dump record with full data"""
        now = timezone.now()
        record = DumpRecord.objects.create(
            dump_type=DumpRecord.DumpType.DELAYED,
            status=DumpRecord.Status.COMPLETED,
            started_at=now,
            completed_at=now + timedelta(minutes=5),
            file_hash="abc123def456",
            file_size=10485760,  # 10MB
            s3_key="delayed/test-dump.zip",
            s3_url="https://s3.amazonaws.com/bucket/delayed/test-dump.zip",
            has_changes=True,
            previous_hash="old123hash456",
            triggered_by="manual",
        )

        assert record.dump_type == DumpRecord.DumpType.DELAYED
        assert record.status == DumpRecord.Status.COMPLETED
        assert record.file_hash == "abc123def456"
        assert record.file_size == 10485760
        assert record.s3_key == "delayed/test-dump.zip"
        assert record.has_changes is True
        assert record.triggered_by == "manual"

    def test_dump_record_str_representation(self):
        """Test string representation of dump record"""
        record = DumpRecord.objects.create(dump_type=DumpRecord.DumpType.LATEST, status=DumpRecord.Status.GENERATING)

        expected = f"Latest (Paid) - Generating ({record.started_at.date()})"
        assert str(record) == expected

    def test_dump_record_duration_property(self):
        """Test duration calculation property"""
        start_time = timezone.now()

        # Test completed record
        completed_record = DumpRecord.objects.create(
            dump_type=DumpRecord.DumpType.LATEST,
            status=DumpRecord.Status.COMPLETED,
            started_at=start_time,
            completed_at=start_time + timedelta(minutes=2),
        )

        duration = completed_record.duration
        # Within 1 second tolerance
        assert abs(duration.total_seconds() - 120) < 1

        # Test in-progress record
        in_progress_record = DumpRecord.objects.create(
            dump_type=DumpRecord.DumpType.LATEST, status=DumpRecord.Status.GENERATING, started_at=start_time
        )

        # Duration should be calculated from start to now
        duration = in_progress_record.duration
        assert duration is not None
        assert duration.total_seconds() > 0

        # Test pending record (no duration)
        pending_record = DumpRecord.objects.create(
            dump_type=DumpRecord.DumpType.LATEST, status=DumpRecord.Status.PENDING
        )

        assert pending_record.duration is None

    def test_dump_record_file_size_mb_property(self):
        """Test file size in MB property"""
        # Test with file size
        record_with_size = DumpRecord.objects.create(
            dump_type=DumpRecord.DumpType.LATEST,
            file_size=10485760,  # 10MB exactly
        )

        assert record_with_size.file_size_mb == 10.0

        # Test with no file size
        record_no_size = DumpRecord.objects.create(dump_type=DumpRecord.DumpType.LATEST)

        assert record_no_size.file_size_mb is None

    def test_dump_record_choices(self):
        """Test that dump type and status choices work correctly"""
        assert DumpRecord.DumpType.LATEST == "latest"
        assert DumpRecord.DumpType.DELAYED == "delayed"

        assert DumpRecord.Status.PENDING == "pending"
        assert DumpRecord.Status.GENERATING == "generating"
        assert DumpRecord.Status.UPLOADING == "uploading"
        assert DumpRecord.Status.COMPLETED == "completed"
        assert DumpRecord.Status.FAILED == "failed"

    def test_dump_record_ordering(self):
        """Test that dump records are ordered by started_at descending"""
        # Clear any existing records to isolate this test
        DumpRecord.objects.all().delete()

        from django.utils import timezone

        base_time = timezone.now()

        # Create records with significant time differences
        DumpRecord.objects.create(dump_type=DumpRecord.DumpType.LATEST, started_at=base_time)
        DumpRecord.objects.create(dump_type=DumpRecord.DumpType.LATEST, started_at=base_time + timedelta(hours=1))

        # Test the model's default ordering (should be -started_at)
        records = list(DumpRecord.objects.all())
        assert len(records) == 2
        # Most recent first
        assert records[0].started_at > records[1].started_at


@pytest.mark.django_db
class TestDumpDownload:
    """Test DumpDownload model"""

    def test_dump_download_creation(self):
        """Test creating a dump download record"""
        dump_record = DumpRecord.objects.create(
            dump_type=DumpRecord.DumpType.DELAYED, status=DumpRecord.Status.COMPLETED
        )

        download = DumpDownload.objects.create(
            dump_record=dump_record,
            ip_address="192.168.1.100",
            user_agent="Mozilla/5.0 Test Browser",
            donator_id="kofi_12345",
            referer="https://example.com",
            country_code="US",
        )

        assert download.dump_record == dump_record
        assert download.ip_address == "192.168.1.100"
        assert download.user_agent == "Mozilla/5.0 Test Browser"
        assert download.donator_id == "kofi_12345"
        assert download.referer == "https://example.com"
        assert download.country_code == "US"
        assert download.downloaded_at is not None

    def test_dump_download_str_representation(self):
        """Test string representation of dump download"""
        dump_record = DumpRecord.objects.create(dump_type=DumpRecord.DumpType.LATEST)

        download = DumpDownload.objects.create(dump_record=dump_record, ip_address="10.0.0.1")

        expected = f"Download of {dump_record} at {download.downloaded_at}"
        assert str(download) == expected

    def test_dump_download_relationship(self):
        """Test relationship between DumpDownload and DumpRecord"""
        dump_record = DumpRecord.objects.create(dump_type=DumpRecord.DumpType.LATEST)

        # Create multiple downloads for the same record
        download1 = DumpDownload.objects.create(dump_record=dump_record, ip_address="1.2.3.4")
        download2 = DumpDownload.objects.create(dump_record=dump_record, ip_address="5.6.7.8")

        # Test related manager
        downloads = dump_record.downloads.all()
        assert download1 in downloads
        assert download2 in downloads
        assert downloads.count() == 2


@pytest.mark.django_db
class TestDumpModelsIntegration:
    """Integration tests for dump models"""

    def test_dump_workflow_simulation(self):
        """Test a complete dump workflow simulation"""
        # Step 1: Create configuration
        config = DumpConfiguration.objects.create(delay_days=30, is_enabled=True)

        # Step 2: Create dump record (simulating command start)
        record = DumpRecord.objects.create(dump_type=DumpRecord.DumpType.LATEST, triggered_by="scheduled")

        assert record.status == DumpRecord.Status.PENDING

        # Step 3: Update to generating
        record.status = DumpRecord.Status.GENERATING
        record.save()

        # Step 4: Complete the dump
        record.status = DumpRecord.Status.COMPLETED
        record.file_hash = "abc123"
        record.file_size = 5242880  # Exactly 5MB (5 * 1024 * 1024)
        record.has_changes = True
        record.completed_at = timezone.now()
        record.save()

        # Step 5: Simulate downloads
        DumpDownload.objects.create(dump_record=record, ip_address="1.1.1.1", donator_id="user1")
        DumpDownload.objects.create(dump_record=record, ip_address="2.2.2.2", donator_id="user2")

        # Verify the complete workflow
        assert config.is_enabled
        assert record.status == DumpRecord.Status.COMPLETED
        assert record.has_changes
        assert record.file_size_mb == 5.0
        assert record.downloads.count() == 2

        # Test we can find completed dumps
        completed_dumps = DumpRecord.objects.filter(
            status=DumpRecord.Status.COMPLETED, dump_type=DumpRecord.DumpType.LATEST
        )
        assert record in completed_dumps

    def test_change_detection_basic(self):
        """Test basic change detection functionality"""
        # Test that records can be created with different hashes
        record1 = DumpRecord.objects.create(
            dump_type=DumpRecord.DumpType.LATEST,
            status=DumpRecord.Status.COMPLETED,
            file_hash="hash1",
            has_changes=True,
        )

        record2 = DumpRecord.objects.create(
            dump_type=DumpRecord.DumpType.LATEST,
            status=DumpRecord.Status.COMPLETED,
            file_hash="hash2",
            has_changes=False,
        )

        # Verify the records have different hashes
        assert record1.file_hash != record2.file_hash
        assert record1.has_changes is True
        assert record2.has_changes is False
