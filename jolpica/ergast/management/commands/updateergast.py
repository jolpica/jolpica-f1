from django.core.management.base import BaseCommand, CommandError
from jolpica.ergast.update import ErgastUpdater


class Command(BaseCommand):
    help = "Updates the database with latest data from ergast"

    def handle(self, *args, **options):
        updater = ErgastUpdater()
        try:
            self.stdout.write(f"Downloading updated files from {updater.url}")
            updater.get_files()
        except Exception as ex:
            print(ex)
            raise CommandError("Failed to download files")

        try:
            self.stdout.write("Updating models from downloaded files")
            updater.update_from_csv()
        except Exception as ex:
            print(ex)
            raise CommandError("Failed to update models") from ex

        self.stdout.write(self.style.SUCCESS("Successfully updated ergast"))
