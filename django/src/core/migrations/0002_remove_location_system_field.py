# Generated by Django 2.2.4 on 2019-10-27 20:26

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='location',
            name='system_field',
        ),
    ]
