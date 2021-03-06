# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-07-12 20:46
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('principal', '0003_publicaciones'),
    ]

    operations = [
        migrations.CreateModel(
            name='Perfil_Author',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=50)),
                ('apellido', models.CharField(max_length=50)),
                ('foto', models.ImageField(default=b'imagenes/usuario.png', upload_to=b'imagenes/usuario')),
                ('correo', models.CharField(blank=True, max_length=100)),
                ('telefono', models.IntegerField()),
                ('descripcion', models.TextField()),
                ('author', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
