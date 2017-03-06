# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import tinymce.models
from django.conf import settings
import ckeditor_uploader.fields


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('principal', '0011_auto_20170109_0608'),
    ]

    operations = [
        migrations.CreateModel(
            name='Perfil_Author',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('nombre', models.CharField(max_length=50, blank=True)),
                ('apellido', models.CharField(max_length=50, blank=True)),
                ('Contrasena', models.CharField(max_length=30, blank=True)),
                ('foto', models.ImageField(default=b'imagenes/usuario.png', upload_to=b'imagenes/usuario')),
                ('correo', models.EmailField(max_length=254, blank=True)),
                ('telefono', models.CharField(max_length=12, blank=True)),
                ('descripcion', models.TextField(blank=True)),
                ('author', models.OneToOneField(to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Productos',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('nombre', models.CharField(unique=True, max_length=100)),
                ('imagen', models.ImageField(upload_to=b'productos')),
                ('descripcion', tinymce.models.HTMLField()),
                ('disponible', models.BooleanField(default=False)),
                ('fecha_de_agregado', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='Publicaciones',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('titulo', models.CharField(unique=True, max_length=50)),
                ('portada', models.ImageField(upload_to=b'tutoriales')),
                ('contenido', ckeditor_uploader.fields.RichTextUploadingField()),
                ('comentario', models.CharField(max_length=50)),
                ('fecha_de_publicacion', models.DateField(auto_now_add=True)),
                ('status', models.CharField(max_length=1, choices=[(b'B', b'Borrador'), (b'P', b'Publicado')])),
                ('author', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'ordering': ['-fecha_de_publicacion'],
            },
        ),
        migrations.CreateModel(
            name='Tema_Publicacion',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('tema', models.CharField(unique=True, max_length=50)),
                ('descripcion', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='Testimonios',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('nombre', models.CharField(unique=True, max_length=200)),
                ('paciente', models.CharField(max_length=100)),
                ('imagen', models.ImageField(default=b'imagenes/biografia.png', upload_to=b'testimonios')),
                ('fecha_de_consulta', models.DateTimeField()),
                ('testimonios', models.TextField()),
                ('observaciones', models.TextField()),
                ('habilitado', models.BooleanField(default=False)),
            ],
        ),
        migrations.AddField(
            model_name='publicaciones',
            name='tema',
            field=models.ForeignKey(to='principal.Tema_Publicacion'),
        ),
    ]
