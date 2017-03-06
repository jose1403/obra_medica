# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('principal', '0010_auto_20161201_1832'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='perfil_author',
            name='author',
        ),
        migrations.DeleteModel(
            name='Productos',
        ),
        migrations.RemoveField(
            model_name='publicaciones',
            name='author',
        ),
        migrations.RemoveField(
            model_name='publicaciones',
            name='tema',
        ),
        migrations.DeleteModel(
            name='Testimonios',
        ),
        migrations.DeleteModel(
            name='Perfil_Author',
        ),
        migrations.DeleteModel(
            name='Publicaciones',
        ),
        migrations.DeleteModel(
            name='Tema_Publicacion',
        ),
    ]
