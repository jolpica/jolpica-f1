import hashlib
import re
import subprocess
import tempfile
from pathlib import Path
from typing import Any

from django.conf import settings
from django.core.management.base import BaseCommand, CommandError
from django.utils import timezone

from jolpica.formula_one_dump.models import DumpConfiguration, DumpRecord


class Command(BaseCommand):
    help = "Generate and upload database dumps"

    def add_arguments(self, parser):
        parser.add_argument(
            "--type",
            choices=["latest", "delayed", "both"],
            default="both",
            help="Type of dump to generate (default: both)",
        )
        parser.add_argument("--force", action="store_true", help="Force upload even if no changes detected")
        parser.add_argument("--dry-run", action="store_true", help="Generate dump but do not upload to S3")
        parser.add_argument("--triggered-by", default="manual", help="How this dump was triggered (default: manual)")

    def handle(self, *args, **options):
        """Main command handler"""
        try:
            # Get or create configuration
            config = self._get_configuration()
            if not config.is_enabled:
                self.stdout.write(self.style.WARNING("Dumps are disabled in configuration"))
                return

            self.stdout.write("Starting dump generation...")

            # Generate requested dumps
            if options["type"] in ["latest", "both"]:
                self._generate_latest_dump(options, config)

            if options["type"] in ["delayed", "both"]:
                self._generate_delayed_dump(options, config)

            self.stdout.write(self.style.SUCCESS("Dump generation completed successfully"))

        except Exception as e:
            self.stdout.write(self.style.ERROR(f"Dump generation failed: {e}"))
            raise CommandError(f"Dump generation failed: {e}")

    def _get_configuration(self) -> DumpConfiguration:
        """Get or create dump configuration"""
        config, created = DumpConfiguration.objects.get_or_create(
            pk=1,  # Singleton pattern - only one configuration
            defaults={
                "delay_days": 30,
                "is_enabled": True,
            },
        )
        if created:
            self.stdout.write("Created default dump configuration")
        return config

    def _validate_db_param(self, param: str, name: str) -> str:
        """Validate/sanitize database configuration values before passing to subprocess"""
        # Allow alphanumerics, underscores, hyphens, dots (for hostnames/usernames/db names)
        if not isinstance(param, str) or not re.match(r"^[\w\-.]+$", param):
            raise CommandError(f"Unsafe value for DB {name}: {param!r}")
        return param

    def _generate_latest_dump(self, options: dict[str, Any], config: DumpConfiguration):
        """Generate latest dump for paid users"""
        self.stdout.write("Generating latest dump...")

        record = DumpRecord.objects.create(
            dump_type=DumpRecord.DumpType.LATEST, triggered_by=options.get("triggered_by", "manual")
        )

        try:
            record.status = DumpRecord.Status.GENERATING
            record.save()

            # Generate dump file
            dump_path = self._execute_dump_script()
            file_hash = self._calculate_hash(dump_path)

            # Check for changes unless forced
            if not options["force"] and not self._has_changes(file_hash, "latest"):
                record.status = DumpRecord.Status.COMPLETED
                record.has_changes = False
                record.completed_at = timezone.now()
                record.save()
                self.stdout.write("No changes detected in latest dump")
                return

            # Update record with file information
            record.file_hash = file_hash
            record.file_size = dump_path.stat().st_size
            record.has_changes = True
            record.save()

            if options["dry_run"]:
                self.stdout.write("Dry run - skipping S3 upload")
                record.status = DumpRecord.Status.COMPLETED
            else:
                record.status = DumpRecord.Status.UPLOADING
                record.save()

                # TODO: Phase 2 - Implement S3 upload
                self.stdout.write("S3 upload not yet implemented - will be added in Phase 2")
                record.status = DumpRecord.Status.COMPLETED
                record.s3_key = f"latest/jolpica-f1-latest-{timezone.now().strftime('%Y%m%d')}.zip"

            record.completed_at = timezone.now()
            record.save()

            self.stdout.write(
                self.style.SUCCESS(
                    f"Latest dump completed - Size: {record.file_size_mb}MB, Hash: {record.file_hash[:8]}..."
                )
            )

        except Exception as e:
            record.status = DumpRecord.Status.FAILED
            record.error_message = str(e)
            record.save()
            self.stdout.write(self.style.ERROR(f"Latest dump failed: {e}"))
            raise
        finally:
            # Cleanup temporary file
            if "dump_path" in locals() and dump_path.exists():
                dump_path.unlink(missing_ok=True)

    def _generate_delayed_dump(self, options: dict[str, Any], config: DumpConfiguration):
        """Generate delayed dump for public access"""
        self.stdout.write("Generating delayed dump...")

        # TODO: Phase 2 - Implement delayed dump logic with date filtering
        # For now, just create a placeholder record
        DumpRecord.objects.create(
            dump_type=DumpRecord.DumpType.DELAYED,
            status=DumpRecord.Status.COMPLETED,
            triggered_by=options.get("triggered_by", "manual"),
            completed_at=timezone.now(),
        )

        self.stdout.write("Delayed dump logic will be implemented in Phase 2")

    def _execute_dump_script(self) -> Path:
        """Execute the CSV dump script and return path to generated file"""
        self.stdout.write("Executing dump script...")

        with tempfile.TemporaryDirectory() as temp_dir:
            # Execute the generate_csv_dump.sh script
            script_path = Path("scripts/generate_csv_dump.sh")
            if not script_path.exists():
                raise CommandError("Dump script not found: scripts/generate_csv_dump.sh")

            db_config = settings.DATABASES["default"]

            # Validate/sanitize DB config values before passing to subprocess
            db_host = self._validate_db_param(db_config.get("HOST", "localhost"), "HOST")
            db_user = self._validate_db_param(db_config.get("USER", "postgres"), "USER")
            db_name = self._validate_db_param(db_config.get("NAME", "jolpica"), "NAME")

            # ruff: noqa: S607
            result = subprocess.run(  # noqa: S603 # trusted script with validated DB params
                [
                    "bash",
                    str(script_path),
                    db_host,
                    db_user,
                    db_name,
                ],
                cwd=temp_dir,
                capture_output=True,
                text=True,
            )

            if result.returncode != 0:
                raise CommandError(f"Dump script failed: {result.stderr}")

            # Check if dump.zip was created
            dump_file = Path(temp_dir) / "dump.zip"
            if not dump_file.exists():
                raise CommandError("dump.zip was not created by the script")

            # Use secure temporary file creation instead of predictable path
            with tempfile.NamedTemporaryFile(delete=False, suffix=".zip") as tmp_file:
                final_path = Path(tmp_file.name)

            dump_file.rename(final_path)

            self.stdout.write(f"Dump generated: {final_path} ({final_path.stat().st_size} bytes)")
            return final_path

    def _calculate_hash(self, file_path: Path) -> str:
        """Calculate SHA256 hash of file"""
        sha256_hash = hashlib.sha256()
        with open(file_path, "rb") as f:
            for chunk in iter(lambda: f.read(4096), b""):
                sha256_hash.update(chunk)
        return sha256_hash.hexdigest()

    def _has_changes(self, current_hash: str, dump_type: str) -> bool:
        """Check if dump has changes compared to previous version"""
        last_record = (
            DumpRecord.objects.filter(dump_type=dump_type, status=DumpRecord.Status.COMPLETED, file_hash__isnull=False)
            .order_by("-completed_at")
            .first()
        )

        if not last_record:
            return True  # First dump, always has changes

        return last_record.file_hash != current_hash
