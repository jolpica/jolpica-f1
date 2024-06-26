# Generated by Django 4.2.10 on 2024-03-09 17:51

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("formula_one", "0007_teamchampionship_and_more"),
    ]

    operations = [
        migrations.RemoveConstraint(
            model_name="championshipsystem",
            name="championship_point_scheme_unique",
        ),
        migrations.AddField(
            model_name="championshipadjustment",
            name="points",
            field=models.FloatField(
                blank=True,
                help_text="Points to deduct if POINT_DEDUCTION adjustment, otherwise null",
                null=True,
            ),
        ),
        migrations.AddField(
            model_name="championshipsystem",
            name="eligibility",
            field=models.PositiveSmallIntegerField(
                choices=[
                    (1, "Entry must score at least 1 championship point"),
                    (2, "Entry must have a classified finish in at least 1 round"),
                ],
                default=1,
            ),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name="driverchampionship",
            name="session_number",
            field=models.PositiveSmallIntegerField(default=0),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name="teamchampionship",
            name="session_number",
            field=models.PositiveSmallIntegerField(default=0),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name="championshipadjustment",
            name="adjustment",
            field=models.PositiveSmallIntegerField(
                choices=[
                    (0, "None"),
                    (1, "Point Deduction"),
                    (101, "Disqualified"),
                    (102, "Excluded"),
                ]
            ),
        ),
        migrations.AlterField(
            model_name="driverchampionship",
            name="adjustment_type",
            field=models.PositiveSmallIntegerField(
                choices=[
                    (0, "None"),
                    (1, "Point Deduction"),
                    (101, "Disqualified"),
                    (102, "Excluded"),
                ],
                default=0,
            ),
        ),
        migrations.AlterField(
            model_name="teamchampionship",
            name="adjustment_type",
            field=models.PositiveSmallIntegerField(
                choices=[
                    (0, "None"),
                    (1, "Point Deduction"),
                    (101, "Disqualified"),
                    (102, "Excluded"),
                ],
                default=0,
            ),
        ),
        migrations.AddConstraint(
            model_name="championshipsystem",
            constraint=models.UniqueConstraint(
                fields=(
                    "eligibility",
                    "driver_season_split",
                    "driver_best_results",
                    "team_season_split",
                    "team_best_results",
                ),
                name="championship_point_scheme_unique",
            ),
        ),
    ]
