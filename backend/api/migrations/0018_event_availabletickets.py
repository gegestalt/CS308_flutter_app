# Generated by Django 3.2.8 on 2021-12-19 12:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0017_event_totaltickets'),
    ]

    operations = [
        migrations.AddField(
            model_name='event',
            name='availableTickets',
            field=models.IntegerField(default=2),
            preserve_default=False,
        ),
    ]
