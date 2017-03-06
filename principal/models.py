#-*- encode utf-8-*-
from django.db import models
from ckeditor_uploader.fields import RichTextUploadingField
from PIL import Image
from django.contrib.auth.models import User
#from usuario.models import User
from django.core.urlresolvers import reverse
# Create your models here.
from django.contrib import admin
from ckeditor.widgets import CKEditorWidget
from django.core.urlresolvers import reverse
# Create your models here.
from tinymce.models import HTMLField
from django.core.validators import RegexValidator
from django.contrib import admin
from django.contrib.auth.models import User



STATUS_CHOICES=(
	('B', 'Borrador'),
	('P', 'Publicado'),
	)

class UsuarioManager(models.Manager):
	def __init__(self):
		users = User.objects.all()

		for i in users:
			username = i.username
			password = i.password
			nombre = i.last_name
			apellido = i.first_name
			email = i.email
			"""self(author= username, nombre= nombre,
																 apellido=apellido, correo = email, Contrasena=password)
												self.save()"""
		return 'None'
		#return Perfil_Author


class Perfil_Author(models.Model):
	author = models.OneToOneField(User)
	nombre= models.CharField(max_length=50, blank=True)
	apellido = models.CharField(max_length=50, blank=True)
	Contrasena= models.CharField(max_length= 30, blank=True)
	foto = models.ImageField(upload_to='imagenes/usuario', default='imagenes/usuario.png')
	correo= models.EmailField(blank=True)
	telefono= models.CharField(max_length=12, blank=True)
	descripcion= models.TextField(blank=True)
	objects= models.Manager()
	#usuario= UsuarioManager()
	def __unicode__(self):
		return '%s %s'%(self.nombre, self.apellido)

class PerfilAdmin(admin.ModelAdmin): 
    list_display = ('usuario', 'nombre', 'apellido')
    search_fields = ['usuario', 'nombre', 'apellido']

class Tema_Publicacion(models.Model):
	tema= models.CharField(max_length=50, unique=True)
	descripcion= models.TextField()
	def __unicode__(self):
		return self.tema
class Publicaciones(models.Model):
	author = models.ForeignKey(User)
	titulo= models.CharField(max_length=50, unique=True)
	tema= models.ForeignKey(Tema_Publicacion)
	portada = models.ImageField(upload_to='tutoriales', height_field=False,width_field=False)
	contenido = RichTextUploadingField()# Usamos  RichTextField()config_name='awesome_ckeditor'
	comentario= models.CharField(max_length=50)
	fecha_de_publicacion= models.DateField(auto_now_add=True)
	status= models.CharField(max_length=1, choices=STATUS_CHOICES)
	index_db= True
	def get_absolute_url(self):
		fecha = self.fecha_de_publicacion
		dia= int(fecha.day)
		mes = int(fecha.month)

		dias=str(dia)
		mese=str(mes)
		if dia <10:
			dias= '0'+str(dia)
		if mes <10:
			mese= '0'+str(mes)

			'''http://127.0.0.1:8000/articulos/2016/07/12/6'''
			'''http://127.0.0.1:8000/articulos/2016/07//6'''

		return "/articulos/%s/%s/%s/%s" % (fecha.year, mese,dias,self.id)
		#return reverse('gente.views.detalles', args=[str(self.id)]) 

	def __unicode__(self):
		return self.titulo
	class Meta:
		ordering= ['-fecha_de_publicacion']

class PublicacionesAdmin(admin.ModelAdmin): 
	list_display = ('titulo', 'author', 'fecha_de_publicacion', 'status')
	search_fields = ['titulo', 'author__first_name', 'status']
	list_filter = ('fecha_de_publicacion',) 
	date_hierarchy = 'fecha_de_publicacion' 
    #filter_horizontal = ('autores',)
    #raw_id_fields = ('author',)  

class Productos(models.Model):
	nombre = models.CharField(max_length=100, unique= True)
	imagen = models.ImageField(upload_to='productos')
	descripcion= HTMLField()
	disponible = models.BooleanField(default= False)
	fecha_de_agregado = models.DateTimeField(auto_now_add=True)
	index_db= True
	def __unicode__(self):
		return self.nombre
	def get_absolute_url(self):
		return reverse('principal.views.InfoProductos', args=[str(self.id)])
class ProductosAdmin(admin.ModelAdmin): 
	list_display = ('nombre', 'disponible')
	search_fields = ['nombre']

class Testimonios(models.Model):
	nombre = models.CharField(max_length=200, unique=True)
	paciente = models.CharField(max_length=100)
	imagen= models.ImageField(upload_to='testimonios', default='imagenes/biografia.png')
	fecha_de_consulta = models.DateTimeField()
	testimonios= models.TextField()
	observaciones= models.TextField()
	habilitado = models.BooleanField(default=False)
	def __unicode__(self):
		return ('%s -- %s') %(self.paciente, self.nombre)
	def get_absolute_url(self):
		return reverse('principal.views.InfoTestimonio', args=[str(self.id)])
class TestimoniosAdmin(admin.ModelAdmin): 
	list_display = ('paciente', 'nombre', 'fecha_de_consulta', 'habilitado')
	search_fields = ['paciente', 'nombre']
	list_filter = ('fecha_de_consulta',) 
    #date_hierarchy = 'fecha_de_consulta'

class AcercaDe(models.Model):
	empresa = models.CharField(max_length=100)
	logo =models.ImageField(upload_to = 'empresa')
	presidente = models.CharField(max_length='50')
	slogan =  models.CharField(max_length=200)
	mision = models.TextField()
	vision = models.TextField()
	quienes_somos = models.TextField()
	ubicacion = models.TextField()

