# Generated by Django 3.2.6 on 2021-08-07 18:19

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("ergast", "0003_auto_20210807_1908"),
    ]

    operations = [
        migrations.AlterField(
            model_name="constructors",
            name="constructor_ref",
            field=models.CharField(
                db_column="constructorRef", max_length=255, unique=True, verbose_name="Unique constructor identifier"
            ),
        ),
    ]
