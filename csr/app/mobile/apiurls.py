"""testdjango URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from app.mobile import api
urlpatterns = [
    url(r'^getblocklist/', api.getblocklist),
	url(r'^addpost/', api.addpost),
	url(r'^upload/', api.upload),
	url(r'^getpost/', api.getpost),
	url(r'^getpostlist/', api.getpostlist),
	url(r'^reply/', api.reply),
	url(r'^getanswers/', api.getanswers),
	url(r'^upanswer/', api.upanswer),
	url(r'^uppost/', api.uppost),
	url(r'^mail/', api.sendmail),
]
