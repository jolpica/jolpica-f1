# Generated by Django 3.2.6 on 2021-08-08 09:52

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("ergast", "0009_auto_20210808_0110"),
    ]

    operations = [
        migrations.AlterField(
            model_name="laptimes",
            name="id",
            field=models.CharField(
                max_length=255, primary_key=True, serialize=False, verbose_name="Unique id '<raceId>|<driverId>|<lap>'"
            ),
        ),
        migrations.AlterField(
            model_name="status",
            name="statusId",
            field=models.AutoField(db_column="statusId", primary_key=True, serialize=False, verbose_name="Primary key"),
        ),
    ]
