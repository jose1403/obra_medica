# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-07-21 02:26
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('principal', '0006_auto_20160721_0155'),
    ]

    operations = [
        migrations.AddField(
            model_name='testimonios',
            name='imagen',
            field=models.ImageField(default=b'biografia.png', upload_to=b'testimonios'),
        ),
    ]
