# Generated by Django 3.2.8 on 2021-12-19 04:06

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0008_announcement'),
    ]

    operations = [
        migrations.CreateModel(
            name='Ticket',
            fields=[
                ('ticketID', models.AutoField(primary_key=True, serialize=False, unique=True)),
                ('date', models.DateTimeField()),
                ('category', models.CharField(default='Category 1', max_length=50)),
                ('price', models.DecimalField(decimal_places=2, max_digits=10)),
                ('eventID', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.event')),
            ],
        ),
    ]
