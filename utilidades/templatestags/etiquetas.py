from django.shortcuts import render
from django import template
from datetime import date, timedelta
from principal.models import Publicaciones

register = template.Library()

def get_last_day_of_month(year,month):
	if (month ==12):
		year +=1
		month = 1
	else:
		month += 1
	return date(year, month, 1)- timedelta(1)

@register.inclusion_tag('tags/cal_mes.html')
def cal_mes(year= date.today().year, month=date.today().month):
	event_list= Publicaciones.objects.filter(fecha_de_publicacion__year = year, fecha_de_publicacion__month= month)
	first_day_of_month = date(year, month, 1)
	last_day_0f_month = get_last_day_of_month(year, month)
	first_day_of_calendar = last_day_0f_month + timedelta(first_day_of_month.weekday())
	last_day_0f_calendar = last_day_0f_month + timedelta(7- last_day_0f_month.weekday())

	cal_mes = []
	week= []
	week_headers = []

	i = 0
	day = first_day_of_calendar
	while day <= last_day_0f_calendar:
		if i < 7:
			week_headers.append(day)
		cal_day = {}
		cal_day['day']= day
		cal_day['event']= False
		for event in event_list:
			if day >= event.fecha_de_publicacion.date() and day <= event.fecha_de_publicacion.date():
				cal_day['event']= True
		if day.month == month:
			cal_day['in_month']= True
		else:
			cal_day['in_month']= False
		week.append(cal_day)
		if day.weekday() ==6:
			cal_mes.append(week)
			week = []
		i += 1
		day += timedelta(1)
	return {'calendar': cal_mes, 'headers': week_headers}

import datetime 
 
class NodoFechaActual(template.Node):  
    def __init__(self, formato_cadena): 
        self.formato_cadena = str(formato_cadena) 
 
    def render(self, context): 
        ahora = datetime.datetime.now() 
        return ahora.strftime(self.formato_cadena) 

register.inclusion_tag('tags/cal_mes.html')(cal_mes)
