# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-07-12 20:14
from __future__ import unicode_literals

import ckeditor_uploader.fields
from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('principal', '0002_auto_20160712_1955'),
    ]

    operations = [
        migrations.CreateModel(
            name='Publicaciones',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('titulo', models.CharField(max_length=50)),
                ('portada', models.ImageField(upload_to=b'tutoriales')),
                ('contenido', ckeditor_uploader.fields.RichTextUploadingField()),
                ('comentario', models.CharField(max_length=50)),
                ('fecha_de_publicacion', models.DateField(auto_now_add=True)),
                ('status', models.CharField(choices=[(b'B', b'Borrador'), (b'P', b'Publicado')], max_length=1)),
                ('author', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'ordering': ['-fecha_de_publicacion'],
            },
        ),
    ]
