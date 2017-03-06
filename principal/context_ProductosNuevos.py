from principal.models import Publicaciones, Productos, Testimonios, Perfil_Author
#from aplicacion.models import Ensenanzas
import django

def Productos_nuevos(request):
	#publicaciones= Publicaciones.objects.filter(titulo__istartswith=busqueda).order_by('titulo')
	#numero_pub = publicaciones.count()
	productos= Productos.objects.filter(disponible=True).order_by('-fecha_de_agregado')[0:3]

	return productos

def Publicaciones_Recientes(request):
	publicaciones= Publicaciones.objects.filter(status='P').order_by('-fecha_de_publicacion')[0:3]
	return publicaciones

def Testimonios_Recientes(request):
	testimonios= Testimonios.objects.filter(habilitado=True).order_by('-fecha_de_consulta')[0:3]
	return testimonios

def Info_usuario(request):
	if request.user.is_authenticated():
		author= Perfil_Author.objects.get(author= request.user)
		return author
	else:
		return 0


def my_processor(request):
	context = {"django_version":django.get_version(),
				"get_productos_nuevos":Productos_nuevos(request),
				"get_publicaciones_recientes": Publicaciones_Recientes(request),
				"get_testimonios_recientes": Testimonios_Recientes(request),
				"get_author": Info_usuario(request)
	}
	return context