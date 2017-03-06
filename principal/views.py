# -*- encoding: utf-8
import os
from io import BytesIO
from PIL import Image
from naturista.settings import MEDIA_ROOT
from reportlab.pdfgen import canvas
from django.shortcuts import render
from principal.models import Publicaciones, Productos, Testimonios, Perfil_Author, AcercaDe
from principal.form import Contactanos, perfil_usuario, Cambiar_password, Usuario
from django.http import HttpResponseRedirect, HttpResponse, Http404
from django.core.mail import send_mail
from django.core.mail import EmailMessage
from naturista.settings import EMAIL_HOST_USER
from django.views.generic import ListView, FormView
from django.core.paginator import InvalidPage, Paginator, EmptyPage, PageNotAnInteger
from django.contrib.auth.decorators import login_required 
from django.contrib.auth.models import User
from django.contrib import auth
# Create your views here.
#from feeds.views import lista_videos
#Inicio del sistema Home 
def inicio(request):
	# Las Publicaciones mas recientes publicadas
    contenidos= Publicaciones.objects.filter(status="P").order_by('-fecha_de_publicacion')[:4]
    
    return render(request, 'inicio/inicio.html', {'contenidos':contenidos,})
#Perfil
#@login_required

class CrearUsuario(FormView):
    template_name='usuario/crearauthor.html'
    context_objects_name='form'
    form_class= Usuario
    success_url= '/inicio/'
    def form_valid(self, form):
        #este metodo es llamado cuando el formulario valida los datos
        Username= form.cleaned_data['Usuario']
        Password= form.cleaned_data['Contrasena']
        user = User.objects.create_user(username=Username, password=Password, is_staff=True)
        
        
        #usuario = UsuarioPerfil.objects.get(usuario=Username, nombre = Nombre, apellido= Apellido, Email=Email, Contrasena= contrasena)
        #perfil.usuario=User.objects.get(username=Username) 
        user.save()
        #joe = User.objects.create(nombre="Joe") 
        #Entrada.autor = joe 
        #joe.save()
        contrasena= len(Password)*'*'
        perfil = Perfil_Author.objects.create(author=user, Contrasena=contrasena )
        perfil.save()
        return super(CrearUsuario, self).form_valid(form)

@login_required
def perfil(request):
    
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/inicio')
    else:
        user = request.user 
        info = "iniciado"
        perfiles = Perfil_Author.objects.get(author=user)
        usuario= User.objects.get(username= user)
        if request.method == "POST":
            perfil = perfil_usuario(request.POST,request.FILES, instance=perfiles)
            if perfil.is_valid():
                nombre= request.POST['nombre']
                apellido= request.POST['apellido']
                email= request.POST['correo']            
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
@login_required
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
                return HttpResponseRedirect('/')
            


        else:
            cambio = Cambiar_password()
        return render(request, 'usuario/cambiar_pass.html',{'cambio':cambio})

def logout(request): 
    auth.logout(request) 
    # Redireccciona a una pagina de entrada correcta.    
    return HttpResponseRedirect('/admin')
#Lista de articulos

def articulos(request):
    contenidos= Publicaciones.objects.filter(status="P").order_by('-fecha_de_publicacion')
    paginator = Paginator(contenidos, 12)
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
    print bum
    #contenidos.paginator.num_pages
    print lista
    return render(request, 'contenido/articulos.html', {'contenidos':contacts,
						'contacts': contacts,
                        'lista':lista})
def publicacion(request, year, month, day, pk):
    try:
        pk = int(pk)
	
    except ValueError:
        raise Http404()
	
   
    contenido = Publicaciones.objects.get(status="P", 
    										fecha_de_publicacion__year=year, 
    										fecha_de_publicacion__month =month,
    										fecha_de_publicacion__day=day,
    										pk=pk)
    #if contenido.count()==0:
    #	raise Http404()

    objeto='lista de ojetos'
    articulo_extra=''
    #Artuculos relacionados
    articulo=''
    cuenta=''
    
    rel = contenido.tema
    relacionado= Publicaciones.objects.filter(tema=rel).exclude(pk=pk)
    cuenta = relacionado.count()
    articulo_extra3=''
    if cuenta <3:
        num = 3 - cuenta 
        a=[]
        for i in relacionado:
            a.append(i)
        articulo_extra1 = Publicaciones.objects.all()
        articulo_extra2=  articulo_extra1.exclude(pk=pk)
        articulo_extra3=articulo_extra2.order_by('-fecha_de_publicacion')[0:num]
    user = request.user
    author= Perfil_Author.objects.get(author=contenido.author)
    print contenido.author.pk

    return render(request, 'contenido/articulo.html', {'contenidos':contenido,
														'objeto':objeto,
                                                        'relacionado':relacionado,
                                                        'cuenta':cuenta,
                                                        'articulo_extra':articulo_extra3,
                                                        'author':author})

@login_required
def articulos_borradores(request):
    contenidos= Publicaciones.objects.filter(status="B").order_by('-fecha_de_publicacion')
    paginator = Paginator(contenidos, 12)
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
    print bum
    #contenidos.paginator.num_pages
    print lista
    return render(request, 'contenido/articulosborradores.html', {'contenidos':contacts,
                        'contacts': contacts,
                        'lista':lista})
@login_required
def publicacion_borrador(request, year, month, day, pk):
    try:
        pk = int(pk)
    
    except ValueError:
        raise Http404()
    
   
    contenido = Publicaciones.objects.filter(status="B", 
                                            fecha_de_publicacion__year=year, 
                                            fecha_de_publicacion__month =month,
                                            fecha_de_publicacion__day=day,
                                            pk=pk)
    if len(contenido)==0:
        raise Http404()

    objeto='lista de ojetos'
    rel=''
    for content in contenido:
       rel = str(content.titulo)
    relacionado= Publicaciones.objects.filter(titulo__icontains=rel)
    print relacionado
    return render(request, 'contenido/publicacionborradores.html', {'contenido':contenido,
                                                        'objeto':objeto,
                                                        'relacionado':relacionado})

def buscador(request):
	
    error_pub=''
    error_pro=''
    a = 0
    publicaciones= ''
    productos =''
    numero_pub =0
    numero_pro =0


    if request.method=='GET':
        if 'buscar' in request.GET and request.GET['buscar']:
            busqueda = request.GET['buscar']
		
            publicaciones= Publicaciones.objects.filter(titulo__istartswith=busqueda).order_by('titulo')
            numero_pub = publicaciones.count()
            if numero_pub == 0:
                error_pub= 'No se Encontraron Publicaciones'
            productos= Productos.objects.filter(disponible=True, nombre__istartswith=busqueda).order_by('nombre')
            numero_pro = productos.count()
            if numero_pro == 0:
                error_pro = 'No se encontraron Productos'
       
		
    return render(request, 'inicio/buscador.html', {'publicaciones':publicaciones,
													'productos':productos,
													'numero_pub':numero_pub,
													'numero_pro':numero_pro,
													'error_pro':error_pro,
													'error_pub':error_pub

															})

def MostrarProductos(request):
    productos = Productos.objects.filter(disponible=True).order_by('fecha_de_agregado')
    return render(request, 'productos/productos.html', {'productos':productos})

def InfoProductos(request, pk):
    try:
        pk = int(pk)
	
    except ValueError:
        raise Http404()

    producto = Productos.objects.filter(disponible=True, pk=pk)

    if len(producto) ==0:
    	raise Http404()
    return render(request, 'productos/info_productos.html', {'productos':producto})

def contactanos(request):	
    if request.method== 'POST':
        contacto= Contactanos(request.POST)
        if contacto.is_valid():
            nombre = contacto.cleaned_data['nombre']
            asunto = contacto.cleaned_data['asunto']
            mensaje= contacto.cleaned_data['mensaje']
            Email = contacto.cleaned_data['email']
            message = "<html>text</html>"
            msg = EmailMessage(asunto, mensaje, to=['obramedicanatural@gmail.com'])

            email = EmailMessage(str(asunto), str(mensaje), 'obramedicanatural@gmail.com',
            [str(Email)],reply_to=[Email], headers={'Message-ID': 'foo'})

            email=EmailMessage(asunto, '%s : <br> Este es el cuerpo <br> %s <br> De: %s' %(nombre, mensaje, Email),to=[EMAIL_HOST_USER],reply_to=[Email])
            email.content_subtype = "html"
            email.send(fail_silently=True) #ail_silently=False
            return HttpResponse('<html><title>mensaje enviado</title><body><article>Su mensaje ha sido enviado correctamente<br><a class="btn" href="/">ir a la pagina principal</a></article></body> </html>')

		
    else:
        contacto= Contactanos()
    return render(request, 'inicio/contactanos.html',{'contacto':contacto})

def conocenos(request):
    informacion = AcercaDe.objects.filter(pk=1)

    return render(request, 'informacion/conocenos.html', {'informacion': informacion})

def testimonio(request):
    testimonios= Testimonios.objects.filter(habilitado=True)
    return render(request, 'informacion/testimonios.html',{'testimonios':testimonios})

def InfoTestimonio(request, pk):
    testimonios= Testimonios.objects.filter(pk=pk)
    return render(request, 'informacion/info_testimonios.html',{'testimonios':testimonios})

def perfil_author(request):
    author = Perfil_Author.objects.get(author=request.user)
    return render(request, 'informacion/perfil.html')

def ejemplo(request):
	dic= {'hola':'mundo', 'var':1}
	a = []
	b =[]
	c= []
	d= []
	for k, v in request.META.items():
		c= [k]
		d= [v]
		a.extend([c, d])
		b.extend(d)
		c= []
		d =[]
	#request.COOKIES.set_cookie(request.META['REMOTE_ADDR'])

	
	#response.set_cookie('ip',request.META['REMOTE_ADDR'])
	a =request.GET
	b =a.copy()
	#del(b['color_favorito'])
	b.update({'color_favorito':'request.META[''REMOTE_ADDR'']}'})
	#response= HttpResponse('tu ip es: %s'% b['ip'])
	#response.set_cookie("ip", b["ip"])
	color={'color_favorito':'Azul'}
	if "color_favorito" in b:
		print True
        # Crea un objeto HttpResponse... 
		response = HttpResponse("Tu color favorito es ahora %s" % \
            color["color_favorito"]) 
         # ... y definimos la cookie en la respuesta 
		#print response.set_cookie('color_favorito', 'Azul')
		response.set_cookie("color_favorito", "Azul")

		return HttpResponse(request.META['REMOTE_ADDR'])
	else: 
		return HttpResponse("No haz elegido un color favorito.") 
	
	

def mostrar_color(request): 
    #if "color_favorito" in request.COOKIES: 
    #    return HttpResponse("Tu color favorito es %s" % \
    #		request.COOKIES["color_favorito"]) 
    #else:
    a= []
    b= []
    for k in request.COOKIES:
    	a.append(k)
 

    return HttpResponse(request.COOKIES, a)

def set_color(request): 
    
    if "color_favorito" in request.GET: 
        # Crea un objeto HttpResponse... 
 		response = HttpResponse("Tu color favorito es ahora %s" % \
            request.GET["color_favorito"])
 		response.set_cookie("color_favorito", request.GET["color_favorito"])

 		return response
    else:
 		return HttpResponse("No haz elegido un color favorito.") 