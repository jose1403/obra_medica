#-*- encoding: utf -8

from principal.models import Publicaciones
from django.contrib.syndication.views import Feed
from django.utils import feedgenerator
from django.core.urlresolvers import reverse
from django.contrib.syndication.views import FeedDoesNotExist 
from django.shortcuts import get_object_or_404


class Publicaciones_feed(Feed):
    title = "Crecer.org syndication"
    link = "/articulos/"
    description = "Post del centro medico natural"
    title_template= 'feeds/feed_title.html'
    description_template= 'feeds/feed_descripcion.html'
    def items(self):
        return Publicaciones.objects.order_by('-fecha_de_publicacion')[:5]
    def item_link(self, item):
    	return reverse("lista_articulos", args=[str(item.pk)])
    def item_title(self, item):
    	return item.titulo
    def item_description(self, item):
    	return item.comentario
   	def item_enclosure_url(self, item):
   		return item.portada.url 
 
    def item_enclosure_length(self, item):
    	return item.portada.size
 
    item_enclosure_mime_type = "image/jpeg" 

    #def item_pubdate(self, item):
    #	return item.fecha_de_publicacion


class UltimosLibrosConAdjuntos(Feed): 
    title = "Ultimas portadas de Libros" 
    link = "/rss/" 
 
    def items(self): 
        return Publicaciones.objects.all()[:30] 
 
    def item_enclosure_url(self, item): 
        return str(item.portada.url)
 
    def item_enclosure_length(self, item): 
        return item.portada.size
    def item_link(self, item):
    	return reverse("articulos")
 
    item_enclosure_mime_type = "image/jpeg"



class PublicacionesPorMesFeed(Feed):
	
	a="""description_template = 'feeds/feed_description.html'
                title_template = 'feeds/feed_title.html'
            
                def items(self):
            
             		return Publicaciones.objects.filter(fecha_de_publicacion__month=5).order_by('­fecha_de_publicacion')[:5] 
                def item_title(self, item): 
                    return "Police beat central: Crimes for beat %s" % item.titulo
             
                def item_link(self, mes): 
                     return reverse('articulos_por_mes', args=[str(mes)])
             
                def item_description(self, item):
                	return "Crimes recently reported in police beat %s" % str(item.comentario)
             	
                
            """
	pass