# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from django.http import HttpResponseRedirect
from app.wechat import wechatauth,gettoken
from app.models import Wechatuser,Confirm
from app.common import md5form
# Create your views here.


def homepage(request):
	code = request.GET.get('code',None)
	state = request.GET.get('state',0)
	state = int(state)
	(r,o) = wechatauth(request,code,state)
	print o
	if r:
		return o
	if o is None:
		return HttpResponseRedirect('/mobile/confirm/')
	else:
		return render(request,'test.html')
			

def confirm(request):
	openid = request.session.get('openid',None)
	if openid is None:
		return HttpResponseRedirect('/mobile/')
	c = Confirm.objects.get_or_create(openid=openid)
	
	if c[0].email is None:
		c[0].email = ""
	else:
		if c[0].active==1:
			user = Wechatuser.objects.get(openid=openid)
			user.email = c[0].email
			if user.userid is None:
				user.nickname = c[0].email
				user.headimg = "/static/headimg/default.png"
			user.save()
			return HttpResponseRedirect('/mobile/')
	return render(request,'confirm.html',{'email':c[0].email})
	
	
def doconfirm(request):
	token = request.GET.get('token',None)
	openid = request.GET.get('openid',None)
	action = request.GET.get('action',None)
	if token is None or openid is None or action is None:
		msg = '此链接无效'
	else:
		o = Confirm.objects.filter(openid=openid).values()
		if len(o)==0:
			msg = '此链接无效'
		else:
			o = o[0]
			email = md5form(o['email'])
			if email == token:
				if int(action) == 1:
					Confirm.objects.filter(openid=openid).update(active=1)
					user = Wechatuser.objects.get(openid=openid)
					user.email = o['email']
					if user.userid is None:
						user.nickname = o['email']
						user.headimg = "/static/headimg/default.png"
					user.save()
					msg = "验证成功，请在企业微信中重新登入"
				else:
					Confirm.objects.filter(openid=openid).delete()
					Wechatuser.objects.filter(openid=openid).delete()
					msg = "验证取消成功"
			else:
				msg = 'Token验证错误'
	
	return render(request,'doconfirm.html',{'msg':msg})
	
	
	