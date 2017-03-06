"""naturista URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.8/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf.urls import include, url
from django.contrib import admin
import settings
from principal import views
from feeds.views import Publicaciones_feed, PublicacionesPorMesFeed, UltimosLibrosConAdjuntos, lista_videos, video_publicado
#from usuario.views import CrearUsuario, PerfildeUsuario, perfil, Cambiar_pass, logout
from utilidades.views import EntradasDiarias, PublicacionesMes, PublicacionesAnuales
from utilidades.templatetags.etiquetas import cal_mes, mostrar_color, set_color
from principal.models import Publicaciones
from django.views.generic.dates import ArchiveIndexView 
from django.views.decorators.cache import cache_page
from django.contrib.auth.decorators import login_required, permission_required 

#feeds = {
#    'latest': LatestEntries,
#    'categories': LatestEntriesByCategory,
#}
urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^tinymce/', include('tinymce.urls')),
    url(r'^media/(?P<path>.*)','django.views.static.serve', {'document_root':settings.MEDIA_ROOT}),
    url(r'^CKEditor/', include('ckeditor_uploader.urls')),
    url(r'^logout/$', views.logout, name='logout'),
    url(r'^$', views.inicio, name= 'inicio'),
    url(r'^perfil/author$', views.perfil_author, name= 'perfil-author'),

    url(r'^agregar/$', login_required(views.CrearUsuario.as_view())),
    #url(r'^perfil/usuario/$', views.perfil, name='MiPerfil'),
    url(r'^calendario/$', cal_mes),
    url(r'^mostrar_color/$', mostrar_color),
    url(r'^set_color/$', set_color),
    url(r'^ejemplo/$', views.ejemplo),
    url(r'^buscador/$', views.buscador),
    url(r'^articulos/$', views.articulos, name= 'articulos'),
    #url(r'^articulos/(?P<pk>.*)/$', views.publicacion, name="lista_articulos"),
    url(r'^recientes/$', ArchiveIndexView.as_view(model=Publicaciones,
                                                  template_name='contenido/ultimas_publicaciones.html',
                                                  date_field="fecha_de_publicacion"),
                                                  name="ultimos_libros"), 
    url(r'^articulos/(?P<year>\d{4})/$', PublicacionesAnuales.as_view(), name='entradas_anuales'),
    url(r'^articulos/(?P<year>\d{4})/(?P<month>\d{2})/$', PublicacionesMes.as_view(), name='entradas_mensuales'),
    url(r'^articulos/(?P<year>\d{4})/(?P<month>\d{2})/(?P<day>\d{2})/$',EntradasDiarias.as_view(), name='entradas_diarias'),
    url(r'^articulos/(?P<year>\d{4})/(?P<month>\d{2})/(?P<day>\d{2})/(?P<pk>.*)$',views.publicacion, name='lista_articulos'),
    url(r'^articulosborradores/$', views.articulos_borradores, name="borradores"),
    url(r'^articulosborradores/(?P<year>\d{4})/(?P<month>\d{2})/(?P<day>\d{2})/(?P<pk>.*)$',views.publicacion_borrador, name=''),
    url(r'^productos/$', views.MostrarProductos, name= 'productos'),

    url(r'^productos/(?P<pk>[0-9])/$', views.InfoProductos),
   
    url(r'^inicio/contactanos/$', views.contactanos, name='contactanos'),
    url(r'^inicio/conocenos/$', views.conocenos, name='conocenos'),
    url(r'^inicio/testimonio/$', views.testimonio, name='testimonios'),
    url(r'^inicio/testimonio/(?P<pk>[0-9])/$', views.InfoTestimonio),
    #url(r'^feeds/(?P<url>.*)/$', 'django.contrib.syndication.views.Feed', {'feed_dict': feeds}),
    url(r'^feeds/(?P<url>.*)/$', Publicaciones_feed(), name="rss"),
    url(r'^videos/$', lista_videos, name="lista_videos"),
    url(r'^videos/(?P<titulo>.*)/$', video_publicado, name="videos"),
    url(r'^feed/(?P<obj>.*)/$', PublicacionesPorMesFeed(), name="rss_mes"),
    url(r'^rss/adjuntos/$', UltimosLibrosConAdjuntos()),
    #url(r'^Iglesia/usuario/perfil/(?P<pk>.*)/$', PerfildeUsuario.as_view(), name='perfil_usuario'),
    #url(r'^inicio/usuario/auth/perfil/$',perfil, name="perfildeusuario"),
    #url(r'^Inicio/usuario/auth/perfil/cambiar_pass', views.Cambiar_pass, name='cambiar_pass'),

]

