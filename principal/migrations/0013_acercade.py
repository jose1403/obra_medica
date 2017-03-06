# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('principal', '0012_auto_20170109_0615'),
    ]

    operations = [
        migrations.CreateModel(
            name='AcercaDe',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('empresa', models.CharField(max_length=100)),
                ('logo', models.ImageField(upload_to=b'empresa')),
                ('presidente', models.CharField(max_length=b'50')),
                ('slogan', models.CharField(max_length=200)),
                ('mision', models.TextField()),
                ('vision', models.TextField()),
                ('quienes_somos', models.TextField()),
                ('ubicacion', models.TextField()),
            ],
        ),
    ]
