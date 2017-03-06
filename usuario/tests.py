from django.test import TestCase

# Create your tests here.
change_form="""
<!--{% url 'admin:app_list' app_label=opts.app_label %}-->
{%coment%}
<!--{% block submit_buttons_bottom %}{% submit_row %}{% endblock %}-->
{%encoment%}
"""