from io import StringIO
from pathlib import Path
from unittest.mock import MagicMock, patch

import pytest
from django.core.management import call_command
from django.core.management.base import CommandError
from django.test import TestCase

from ..management.commands.generate_dumps import Command
from ..models import DumpConfiguration, DumpRecord


@pytest.mark.django_db
class TestGenerateDumpsCommand:
    """Test the generate_dumps management command"""

    def test_command_help(self):
        """Test command help output"""
        # For Django management commands, help is handled by argparse
        # and bypasses custom stdout/stderr, so we just test that --help exits cleanly
        with pytest.raises(SystemExit) as exc_info:
            call_command("generate_dumps", "--help")

        # SystemExit with code 0 indicates successful help display
        assert exc_info.value.code == 0

    def test_command_with_disabled_config(self):
        """Test command behavior when dumps are disabled"""
        # Clear any existing configurations and create disabled one with pk=1
        DumpConfiguration.objects.all().delete()
        DumpConfiguration.objects.create(pk=1, is_enabled=False)

        out = StringIO()
        call_command("generate_dumps", stdout=out)
        output = out.getvalue()

        assert "Dumps are disabled in configuration" in output

        # No dump records should be created
        assert DumpRecord.objects.count() == 0

    def test_command_creates_default_config(self):
        """Test that command creates default configuration if none exists"""
        # Clear existing configurations
        DumpConfiguration.objects.all().delete()
        assert DumpConfiguration.objects.count() == 0

        out = StringIO()
        with patch(
            "jolpica.formula_one_dump.management.commands.generate_dumps.Command._execute_dump_script"
        ) as mock_script:
            # Mock the script to avoid actual execution
            mock_script.side_effect = CommandError("Script not found")

            with pytest.raises(CommandError):
                call_command("generate_dumps", "--dry-run", stdout=out)

        output = out.getvalue()
        assert "Created default dump configuration" in output

        # Configuration should be created
        config = DumpConfiguration.objects.first()
        assert config is not None
        assert config.is_enabled is True
        assert config.delay_days == 30

    @patch("jolpica.formula_one_dump.management.commands.generate_dumps.Command._execute_dump_script")
    def test_latest_dump_dry_run(self, mock_script):
        """Test latest dump generation with dry run"""
        # Setup
        DumpConfiguration.objects.all().delete()
        _config = DumpConfiguration.objects.create()

        # Mock script execution
        mock_dump_path = MagicMock()
        mock_dump_path.stat.return_value.st_size = 5000000  # 5MB
        mock_dump_path.exists.return_value = True
        mock_script.return_value = mock_dump_path

        # Mock file hash calculation
        with patch("jolpica.formula_one_dump.management.commands.generate_dumps.Command._calculate_hash") as mock_hash:
            mock_hash.return_value = "abc123def456"

            out = StringIO()
            call_command("generate_dumps", "--type=latest", "--dry-run", stdout=out)

        output = out.getvalue()
        assert "Starting dump generation..." in output
        assert "Generating latest dump..." in output
        assert "Dry run - skipping S3 upload" in output
        assert "Latest dump completed" in output

        # Check record was created correctly
        record = DumpRecord.objects.get(dump_type="latest")
        assert record.status == DumpRecord.Status.COMPLETED
        assert record.file_hash == "abc123def456"
        assert record.file_size == 5000000
        assert record.has_changes is True
        assert record.triggered_by == "manual"

    @patch("jolpica.formula_one_dump.management.commands.generate_dumps.Command._execute_dump_script")
    def test_no_changes_detected(self, mock_script):
        """Test behavior when no changes are detected"""
        # Setup - create existing record with same hash
        DumpConfiguration.objects.all().delete()
        _config = DumpConfiguration.objects.create()
        _existing_record = DumpRecord.objects.create(
            dump_type=DumpRecord.DumpType.LATEST, status=DumpRecord.Status.COMPLETED, file_hash="abc123def456"
        )

        # Mock script execution
        mock_dump_path = MagicMock()
        mock_dump_path.stat.return_value.st_size = 5000000
        mock_dump_path.exists.return_value = True
        mock_script.return_value = mock_dump_path

        # Mock file hash calculation - same hash as existing record
        with patch("jolpica.formula_one_dump.management.commands.generate_dumps.Command._calculate_hash") as mock_hash:
            mock_hash.return_value = "abc123def456"  # Same hash

            out = StringIO()
            call_command("generate_dumps", "--type=latest", "--dry-run", stdout=out)

        output = out.getvalue()
        assert "No changes detected in latest dump" in output

        # Check that a new record was created but marked as no changes
        new_records = DumpRecord.objects.filter(dump_type="latest").order_by("-started_at")

        assert new_records.count() == 2  # Original + new one
        latest_record = new_records.first()
        assert latest_record.has_changes is False
        assert latest_record.status == DumpRecord.Status.COMPLETED

    def test_force_upload_with_no_changes(self):
        """Test --force flag bypasses change detection"""
        # Setup - create existing record with same hash
        DumpConfiguration.objects.all().delete()
        _config = DumpConfiguration.objects.create()
        _existing_record = DumpRecord.objects.create(
            dump_type=DumpRecord.DumpType.LATEST, status=DumpRecord.Status.COMPLETED, file_hash="abc123def456"
        )

        with patch(
            "jolpica.formula_one_dump.management.commands.generate_dumps.Command._execute_dump_script"
        ) as mock_script:
            mock_dump_path = MagicMock()
            mock_dump_path.stat.return_value.st_size = 5000000
            mock_dump_path.exists.return_value = True
            mock_script.return_value = mock_dump_path

            with patch(
                "jolpica.formula_one_dump.management.commands.generate_dumps.Command._calculate_hash"
            ) as mock_hash:
                mock_hash.return_value = "abc123def456"  # Same hash

                out = StringIO()
                call_command("generate_dumps", "--type=latest", "--force", "--dry-run", stdout=out)

        output = out.getvalue()
        assert "No changes detected" not in output  # Should skip change detection
        assert "Latest dump completed" in output

        # Should create new record even with same hash due to --force
        new_records = DumpRecord.objects.filter(dump_type="latest").order_by("-started_at")
        latest_record = new_records.first()
        assert latest_record.has_changes is True  # Force sets this to True

    def test_script_execution_failure(self):
        """Test handling of dump script execution failure"""
        DumpConfiguration.objects.all().delete()
        _config = DumpConfiguration.objects.create()

        with patch(
            "jolpica.formula_one_dump.management.commands.generate_dumps.Command._execute_dump_script"
        ) as mock_script:
            mock_script.side_effect = CommandError("Script execution failed")

            with pytest.raises(CommandError, match="Script execution failed"):
                call_command("generate_dumps", "--type=latest", "--dry-run")

        # Should create failed record
        record = DumpRecord.objects.get(dump_type="latest")
        assert record.status == DumpRecord.Status.FAILED
        assert "Script execution failed" in record.error_message

    def test_triggered_by_parameter(self):
        """Test custom triggered_by parameter"""
        DumpConfiguration.objects.all().delete()
        _config = DumpConfiguration.objects.create()

        with patch(
            "jolpica.formula_one_dump.management.commands.generate_dumps.Command._execute_dump_script"
        ) as mock_script:
            mock_dump_path = MagicMock()
            mock_dump_path.stat.return_value.st_size = 1000000
            mock_dump_path.exists.return_value = True
            mock_script.return_value = mock_dump_path

            with patch(
                "jolpica.formula_one_dump.management.commands.generate_dumps.Command._calculate_hash"
            ) as mock_hash:
                mock_hash.return_value = "custom123"

                call_command("generate_dumps", "--type=latest", "--dry-run", "--triggered-by=data_import")

        record = DumpRecord.objects.get(dump_type="latest")
        assert record.triggered_by == "data_import"

    def test_delayed_dump_placeholder(self):
        """Test that delayed dump creates placeholder (Phase 1)"""
        DumpConfiguration.objects.all().delete()
        _config = DumpConfiguration.objects.create()

        out = StringIO()
        call_command("generate_dumps", "--type=delayed", stdout=out)

        output = out.getvalue()
        assert "Generating delayed dump..." in output
        assert "Delayed dump logic will be implemented in Phase 2" in output

        # Should create placeholder record
        record = DumpRecord.objects.get(dump_type="delayed")
        assert record.status == DumpRecord.Status.COMPLETED
        assert record.triggered_by == "manual"


class TestCommandUtilityMethods(TestCase):
    """Test utility methods of the Command class"""

    def setUp(self):
        self.command = Command()

    def test_calculate_hash(self):
        """Test file hash calculation"""
        # Create a temporary file for testing
        import tempfile

        with tempfile.NamedTemporaryFile(mode="w", delete=False) as f:
            f.write("test content for hashing")
            temp_path = Path(f.name)

        try:
            hash_value = self.command._calculate_hash(temp_path)

            # Verify it's a valid SHA256 hash (64 characters)
            assert len(hash_value) == 64
            assert all(c in "0123456789abcdef" for c in hash_value)

            # Hash should be consistent
            hash_value2 = self.command._calculate_hash(temp_path)
            assert hash_value == hash_value2

        finally:
            temp_path.unlink(missing_ok=True)

    def test_validate_db_param_valid_values(self):
        """Test database parameter validation with valid values"""
        # Test various valid database parameter formats
        valid_params = [
            "localhost",
            "db-server.example.com",
            "postgres_user",
            "my-database",
            "user123",
            "db.local",
            "test_db_2024",
        ]

        for param in valid_params:
            result = self.command._validate_db_param(param, "TEST")
            assert result == param

    def test_validate_db_param_invalid_values(self):
        """Test database parameter validation with invalid values"""
        # Test various invalid database parameter formats
        invalid_params = [
            "db; DROP TABLE users;",  # SQL injection attempt
            "db && rm -rf /",  # Command injection attempt
            "db|cat /etc/passwd",  # Pipe injection
            "db`whoami`",  # Command substitution
            "db$(whoami)",  # Command substitution
            "db/path/to/something",  # Slashes not allowed
            "db:5432",  # Colons not allowed
            "db server",  # Spaces not allowed
            "",  # Empty string
            123,  # Not a string
        ]

        for param in invalid_params:
            with pytest.raises(CommandError, match="Unsafe value for DB TEST"):
                self.command._validate_db_param(param, "TEST")

    @pytest.mark.django_db
    def test_has_changes_first_dump(self):
        """Test change detection with no previous dumps"""
        result = self.command._has_changes("abc123", "latest")
        assert result is True  # First dump always has changes

    @pytest.mark.django_db
    def test_has_changes_with_different_hash(self):
        """Test change detection with different hash"""
        # Create previous record
        DumpRecord.objects.create(dump_type="latest", status=DumpRecord.Status.COMPLETED, file_hash="old_hash")

        result = self.command._has_changes("new_hash", "latest")
        assert result is True  # Different hash = changes

    @pytest.mark.django_db
    def test_has_changes_with_same_hash(self):
        """Test change detection with same hash"""
        # Create previous record
        DumpRecord.objects.create(dump_type="latest", status=DumpRecord.Status.COMPLETED, file_hash="same_hash")

        result = self.command._has_changes("same_hash", "latest")
        assert result is False  # Same hash = no changes
