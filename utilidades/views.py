from principal.models import Publicaciones
from django.views.generic import DayArchiveView
from django.views.generic import MonthArchiveView
from django.views.generic import YearArchiveView

class PublicacionesAnuales(YearArchiveView): 
	queryset = Publicaciones.objects.all() 
	template_name='contenido/entradas_ano.html'
	date_field = "fecha_de_publicacion"
	context_object_name='entradas'
	make_object_list = True
class PublicacionesMes(MonthArchiveView):
	'''Entradas por mes'''
	queryset=Publicaciones.objects.order_by('fecha_de_publicacion')
	template_name='contenido/entradas_mes.html'
	date_field = 'fecha_de_publicacion'
	month_format = '%m'
	context_object_name='entradas'

class  EntradasDiarias(DayArchiveView):
        '''Entradas por dia'''
	queryset=Publicaciones.objects.order_by('fecha_de_publicacion')
	template_name='contenido/entradas_dia.html'
	date_field = 'fecha_de_publicacion'
	context_object_name='entradas'
	month_format = '%m'








# Create your views here.
