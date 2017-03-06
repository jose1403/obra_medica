#-*-encoding: utf-8 -*-
from django.contrib import admin
from principal.models import *
admin.site.register(Perfil_Author)
admin.site.register(Publicaciones, PublicacionesAdmin)
admin.site.register(Tema_Publicacion)
admin.site.register(Productos, ProductosAdmin)
admin.site.register(Testimonios, TestimoniosAdmin)
admin.site.register(AcercaDe)
#Register your models her