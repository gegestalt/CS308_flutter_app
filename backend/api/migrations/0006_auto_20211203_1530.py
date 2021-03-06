# Generated by Django 3.2.8 on 2021-12-03 12:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0005_auto_20211203_1526'),
    ]

    operations = [
        migrations.AlterField(
            model_name='event',
            name='location',
            field=models.CharField(default='Location: ', max_length=100),
        ),
        migrations.AlterField(
            model_name='event',
            name='prices',
            field=models.TextField(default='Prices: '),
        ),
        migrations.AlterField(
            model_name='event',
            name='rules',
            field=models.TextField(default='Event details: '),
        ),
        migrations.AlterField(
            model_name='event',
            name='time',
            field=models.CharField(default='Time: ', max_length=50),
        ),
    ]
