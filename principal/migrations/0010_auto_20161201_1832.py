# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('principal', '0009_perfil_author'),
    ]

    operations = [
        migrations.AlterField(
            model_name='perfil_author',
            name='Contrasena',
            field=models.CharField(max_length=30, blank=True),
        ),
        migrations.AlterField(
            model_name='perfil_author',
            name='apellido',
            field=models.CharField(max_length=50, blank=True),
        ),
        migrations.AlterField(
            model_name='perfil_author',
            name='descripcion',
            field=models.TextField(blank=True),
        ),
        migrations.AlterField(
            model_name='perfil_author',
            name='nombre',
            field=models.CharField(max_length=50, blank=True),
        ),
        migrations.AlterField(
            model_name='perfil_author',
            name='telefono',
            field=models.CharField(max_length=12, blank=True),
        ),
    ]
