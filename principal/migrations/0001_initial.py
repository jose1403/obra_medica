# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
from django.conf import settings
import ckeditor_uploader.fields


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Publicaciones',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('titulo', models.CharField(max_length=40)),
                ('portada', models.ImageField(upload_to=b'tutoriales')),
                ('contenido', ckeditor_uploader.fields.RichTextUploadingField()),
                ('comentario', models.CharField(max_length=50)),
                ('fecha_de_publicacion', models.DateTimeField(auto_now=True)),
                ('status', models.CharField(max_length=1, choices=[(b'B', b'Borrador'), (b'P', b'Publicado')])),
                ('author', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
