# Generated by Django 3.2.8 on 2021-12-19 12:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0016_waitinglist'),
    ]

    operations = [
        migrations.AddField(
            model_name='event',
            name='totalTickets',
            field=models.IntegerField(default=10),
            preserve_default=False,
        ),
    ]
