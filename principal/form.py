from django import forms
from django.contrib.auth.models import User
from ckeditor.fields import RichTextFormField
from principal.models import Perfil_Author

class Contactanos(forms.Form): 
    nombre = forms.CharField(widget=forms.TextInput(attrs={
    												
    												}))
    email = forms.EmailField(widget=forms.TextInput(attrs={
    												
    												}))
    asunto= forms.CharField(widget=forms.TextInput(attrs={
    												
    												}))
    mensaje = forms.CharField(widget=forms.Textarea) 
 
    def send_email(self): 
        # Envia el email usando el diccionario self.cleaned_data 
        pass

    def clean_Nombre(self):
		nombre = self.cleaned_data["nombre"]
		if len(nombre)>=3 and len(nombre) <= 20:
			pass
			if nombre:
				
				#for nombres in nombre:
				#	if str(usuario)== ' ':
				#		raise forms.ValidationError('usuario no puede contener espacios en blanco')
				#	else:
				pass
		elif len(nombre) < 3:
			raise forms.ValidationError('su nombre es demaciado corto deve ser mayor de dos caracteres')


		elif len(nombre) >20:
			raise forms.ValidationError('su nombre es demaciado largo')

    def clean_Email(self):
		email= self.cleaned_data['Email']
    def clean_Asunto(self):
		asunto = self.cleaned_data["asunto"]
		if len(asunto)>=5 and len(asunto)<= 20:
			pass
			if asunto:
				
				#for asuntos in asunto:
				#	if str(usuario)== ' ':
				#		raise forms.ValidationError('usuario no puede contener espacios en blanco')
				#	else:
				pass
		elif len(asunto) < 5:
			raise forms.ValidationError('por favor 5 palabras como minimo para el asunto')


		elif len(asunto) >20:
			raise forms.ValidationError('su asunto es demaciado largo')

		




class perfil_usuario(forms.ModelForm):
	class Meta:
		model= Perfil_Author
		fields = ['nombre','apellido','correo', 'foto', 'telefono','descripcion']


class Usuario(forms.Form):
	Usuario= forms.CharField(widget=forms.TextInput())
#	Email=forms.EmailField(widget=forms.TextInput())
	Contrasena= forms.CharField(widget=forms.PasswordInput())
	Confirmar_contrasena= forms.CharField(widget=forms.PasswordInput())
	
	def clean_Usuario(self):
		username = self.cleaned_data["Usuario"]
		if len(username)>=3:
			pass
			if username:
				
				for usuario in username:
					if str(usuario)== ' ':
						raise forms.ValidationError('usuario no puede contener espacios en blanco')
					else:
						pass


		else:
			raise forms.ValidationError('Usuario debe ser mayor de 3 caracteres')
		try:
			u = User.objects.get(username=username)
		except User.DoesNotExist:
			return username
		raise forms.ValidationError('nombre de usuario ya existe')
		if len(username)>3:
			pass
		else:
			raise forms.ValidationError('usuario debe tener 3 o mas caracteres')
	
		raise forms.ValidationError('Email ya esta registrado')

	def clean_Confirmar_contrasena(self):
		contrasena_uno= self.cleaned_data["Contrasena"]
		contrasena_dos= self.cleaned_data["Confirmar_contrasena"]
		if len(contrasena_uno)>6:
			pass
			if contrasena_uno == contrasena_dos:
				pass
			else:
				raise forms.ValidationError("contrasenas no coinciden")
		else:
			raise forms.ValidationError("la contrasena debe ser de 6 o mas caracteres")

class Cambiar_password(forms.Form):
	
	contrasena_actual = forms.CharField(widget= forms.PasswordInput)
	contrasena_nueva = forms.CharField(widget= forms.PasswordInput)
	repita_contrasena = forms.CharField(widget= forms.PasswordInput)
	def clean_repita_contrasena(self):
		contrasena_uno= self.cleaned_data["contrasena_nueva"]
		contrasena_dos= self.cleaned_data["repita_contrasena"]
		if len(contrasena_uno)>=6:
			pass
			if contrasena_uno == contrasena_dos:
				pass
			else:
				raise forms.ValidationError("contrasenas no coinciden")
		else:
			raise forms.ValidationError("la contrasena debe ser de 6 o mas caracteres")