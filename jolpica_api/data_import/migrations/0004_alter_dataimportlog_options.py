# Generated by Django 5.2 on 2025-05-24 16:51

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ("data_import", "0003_dataimportlog_api_version_and_more"),
    ]

    operations = [
        migrations.AlterModelOptions(
            name="dataimportlog",
            options={
                "permissions": [("can_import_f1_data", "Can import Formula 1 data")]
            },
        ),
    ]
