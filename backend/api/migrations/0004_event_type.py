# Generated by Django 3.2.8 on 2021-12-03 12:02

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0003_auto_20211203_1405'),
    ]

    operations = [
        migrations.AddField(
            model_name='event',
            name='type',
            field=models.CharField(default='normal', max_length=50),
        ),
    ]
