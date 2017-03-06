from django.shortcuts import render
from django.http import HttpResponse
from django import template
from datetime import date, timedelta
from principal.models import Publicaciones

register = template.Library()

def get_ultimo_dia_del_mes(year,month):
	if (month ==12):
		year +=1
		month = 1
	else:
		month += 1
	return date(year, month, 1)- timedelta(1)
#@register.inclusion_tag('tags/cal_mes.html')
#utilidades.templatetags.templatetags.etiquetas.cal_mes

def cal_mes(year= date.today().year, month=date.today().month):
	lista_eventos= Publicaciones.objects.filter(fecha_de_publicacion__year = year, fecha_de_publicacion__month= month)
	
	primer_dia_del_mes = date(year, month, 1)
	
	ultimo_dia_del_mes = get_ultimo_dia_del_mes(year, month)

	primer_dia_del_calendario = primer_dia_del_mes - timedelta(primer_dia_del_mes.weekday())
	ultimo_dia_del_calendario = ultimo_dia_del_mes + timedelta(7- ultimo_dia_del_mes.weekday())
	

	calcular_mes = []
	semana= []
	lista_semana = []

	
	i = 0
	dia = primer_dia_del_calendario
	while dia <= ultimo_dia_del_calendario:
		if i < 7:
			lista_semana.append(dia)
		calcular_dia = {}
		calcular_dia['dia']= dia
		calcular_dia['evento']= False
		for evento in lista_eventos:
			
			if dia >= evento.fecha_de_publicacion and dia <= evento.fecha_de_publicacion:
				calcular_dia['evento']= True
				
		if dia.month == month:
			calcular_dia['en_mes']= True
		else:
			calcular_dia['en_mes']= False
		semana.append(calcular_dia)
		if dia.weekday()==6:
			calcular_mes.append(semana)
			semana = []
		i += 1
		dia += timedelta(1)
	fecha = date(year, month, day=date.today().day)
	return {'calendario': calcular_mes, 'encabesado': lista_semana, 
			'fecha':fecha}

register.inclusion_tag('tags/cal_mes.html')(cal_mes)


#cookies

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
    get = request.GET
    
    copia_get =get.copy()
    copia_get.update({'color_favorito':'Azul'})

    
    if "color_favorito" in copia_get: 
        # Crea un objeto HttpResponse... 
 		response = HttpResponse("Tu color favorito es ahora %s" % \
            copia_get["color_favorito"])
 		response.set_cookie("color_favorito", copia_get["color_favorito"])

 		return HttpResponse('%s'% request.COOKIES)
    else:
 		return HttpResponse("No haz elegido un color favorito.") 
