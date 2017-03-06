"""from django.shortcuts import render
from usuario.form import Usuario
from django.contrib.auth.models import User
from django.contrib import auth
from usuario.models import UsuarioPerfil
from usuario.form import perfil_usuario, Cambiar_password
from django.views.generic import FormView, DetailView
from django.http import HttpResponse, HttpResponseRedirect
# Create your views here.
class nuevo():
	def CrearUsuario(request):
		
	
		return render(request, 'admin/auth/user/add_form.html', {'usuario':usuario})


class CrearUsuario(FormView):
	template_name='admin/auth/user/add_form.html'
	context_objects_name='form'
	form_class= Usuario
	success_url= '/inicio/'
	def form_valid(self, form):
		#este metodo es llamado cuando el formulario valida los datos
		Username= form.cleaned_data['Usuario']
		Password= form.cleaned_data['Contrasena']
		user = User.objects.create_user(username=Username, password=Password)
		perfil = UsuarioPerfil()
		contrasena= len(Password)*'*'
		#usuario = UsuarioPerfil.objects.get(usuario=Username, nombre = Nombre, apellido= Apellido, Email=Email, Contrasena= contrasena)
		#perfil.usuario=User.objects.get(username=Username) 
		user.save()
		#joe = User.objects.create(nombre="Joe") 
		#Entrada.autor = joe 
		#joe.save()
		perfil.save()
		return super(CrearUsuario, self).form_valid(form)

class PerfildeUsuario(DetailView):
	model= Usuario
	template_name= 'usuario/perfil.html'
	context_objects_name='perfil'

def perfil(request):
	
	if not request.user.is_authenticated():
		return HttpResponseRedirect('/inicio')
	else:
		user = request.user 
		info = "iniciado"
		perfiles = UsuarioPerfil.objects.get(usuario=user)
		usuario= User.objects.get(username= user)
		if request.method == "POST":
			perfil = perfil_usuario(request.POST,request.FILES, instance=perfiles)
			if perfil.is_valid():
				nombre= request.POST['nombre']
				apellido= request.POST['apellido']
				email= request.POST['Email']			
				usuario.first_name= nombre
				usuario.last_name= apellido
				usuario.email= email

				usuario.save()
				form = perfil.save(commit=False)
				perfil.save_m2m()
				form.save() # Guardamos el objeto
				info = "Correcto"

				return HttpResponseRedirect('.')
		else:
			perfil = perfil_usuario(instance=perfiles)
		return render(request, 'usuario/perfil.html', {'perfil':perfil, 'informacion':info})
def Cambiar_pass(request):
	if not request.user.is_authenticated():
		return HttpResponseRedirect('/inicio')
	else:
		user= request.user
		usuario = User.objects.get(username=user)
		if request.method=='POST':
			cambio=Cambiar_password(request.POST)
			if cambio.is_valid():
				actual= request.POST['contrasena_actual']
				if usuario.check_password(actual):
					pass
				else:

					 nueva = request.POST['contrasena_nueva']
					 return render(request,'usuario/cambiar_pass.html',{'cambio':Cambiar_password(),'info':'su contrasena es incorrecta'})

				nueva = request.POST['contrasena_nueva']
				usuario.set_password(nueva)
				usuario.save()
				user= auth.authenticate(username=user, password=nueva)
				auth.login(request, user)
				return HttpResponseRedirect('/inicio')
			


		else:
			cambio = Cambiar_password()
		return render(request, 'usuario/cambiar_pass.html',{'cambio':cambio})

def logout(request): 
    auth.logout(request) 
    # Redireccciona a una pagina de entrada correcta.    
    return HttpResponseRedirect('/admin')"""