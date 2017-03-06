"""from django import forms
from django.contrib.auth.models import User
from ckeditor.fields import RichTextFormField
from usuario.models import UsuarioPerfil



class perfil_usuario(forms.ModelForm):
	class Meta:
		model= UsuarioPerfil
		fields = ['nombre','apellido','Email', 'imagen', 'fechadenacimiento' ]


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
			raise forms.ValidationError("la contrasena debe ser de 6 o mas caracteres")"""