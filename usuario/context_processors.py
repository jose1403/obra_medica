"""from usuario.models import UsuarioPerfil
from django.contrib.auth.models import User

#from aplicacion.models import Ensenanzas
import django

def user_image(request):
	try:
		imagen = None
		user = request.user
		up = UsuarioPerfil.objects.get(usuario=user)
		imagen = "/media/%s"%up.imagen
	except:
		imagen = "/media/images/img.png.jpg"
	return imagen


def my_processor(request):
	context = {"django_version":django.get_version(),
				"get_image_profile":user_image(request),
	}
	return context


"""