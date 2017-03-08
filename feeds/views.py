#-*- encoding: utf -8
from django.core.paginator import InvalidPage, Paginator, EmptyPage, PageNotAnInteger

from principal.models import Publicaciones
from django.http import HttpResponse
from django.contrib.syndication.views import Feed
from django.utils import feedgenerator
from django.core.urlresolvers import reverse
from django.contrib.syndication.views import FeedDoesNotExist
from django.shortcuts import render, get_object_or_404
import feedparser
import time

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
        return reverse("articulos",)
 
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

def lista_videos(request):
    canal = "https://www.youtube.com/feeds/videos.xml?channel_id=UCsVl4Ztbfv-GdsiTb-RH52A"
    #mi_feed= "http://127.0.0.1:8000/rss/adjuntos/"
    try:

        feed = feedparser.parse(canal)
    except feedbozobozo_exceptionentries:

        return HttpResponse(feed)


    #feed2= feedparser.parse(mi_feed)

    #prueva2= feed2['entries']
    pruevas = feed['entries']
    array =[]
    videos_p = []
    c ={}
    valores= {}
    #for i in feed:
    #    a.append(i)
    #for i in prueva2:
    #    c['titulo']= i['title']
    #    c['ids']= i['id']
    #    c['link']= i['link']
    #    #c['media']=i['media_thumbnail']
    #    array.extend([c])
    #    c =  {}
    #    las= []
    #    a=[]
    #    nuevo=''

    for i in pruevas:
        valores['titulo']= i['title']
        nuevo= str(i['id'])
        valores['ids']= a= nuevo[9:]
        
        a= nuevo[9:]
        valores['author']= i['authors']
        valores['link']= i['link']
        valores['media']=i['media_thumbnail']
        valores['url']= i['title'].replace(' ', '_')
        videos_p.extend([valores])
        valores = {}



    paginator = Paginator(videos_p, 20)
    page = request.GET.get('page')
    try:
        contacts = paginator.page(page)
    except PageNotAnInteger:

        contacts = paginator.page(1)
    except EmptyPage:
        contacts = paginator.page(paginator.num_pages)

    bum = paginator.num_pages
    lista= []
    for num in range(bum):
        lista.append(num+1)

    return render(request, 'videos/videos.html', {'var':feed, 'canal':contacts,
                                                  'pruevas':pruevas,'las':feed,
                                                   
                                                  'lista':lista
                                                  }) 





def video_publicado(request, titulo):
    canal = "https://www.youtube.com/feeds/videos.xml?channel_id=UCsVl4Ztbfv-GdsiTb-RH52A"
    feed = feedparser.parse(canal)

    #feed2= feedparser.parse(mi_feed)

    #prueva2= feed2['entries']
    pruevas = feed['entries']
    array =[]
    videos_p = []
    c ={}
    valores= {}
    titulo = titulo.replace('_', ' ')

    for i  in pruevas:
        if titulo in i['title']:
            valores['titulo']= i['title']
            nuevo= str(i['id'])
            valores['ids']= a= nuevo[9:]
            valores['author']= i['authors']
            valores['link']= i['link']
            valores['media']=i['media_thumbnail']
            videos_p.extend([valores])
            break
    #array = request.COOKIES
    return render(request, 'videos/video_publicado.html',{'titulo':titulo, 'array':array, 'videos_p': videos_p})

