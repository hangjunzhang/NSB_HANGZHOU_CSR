# encoding: utf-8
from app.models import Wechatuser,Token
from urllib import quote
from django.http import HttpResponseRedirect
import requests
import time,json






CORPID = "wx273258661ff25abb"
AGENTID = 1000009
APPSECRET = "QPhm9gbDsc8aeL_O7UiSNGDNVYa2W02magVLQDy5mzQ"
SCOPETYPE = ['snsapi_userinfo','snsapi_privateinfo']


MSGTEMP = {
	"text":{
		"touser": "oixJ6txo_M_uheUdcJG-5Ys4rVTQ",
		"msgtype": "text",
		"agentid": AGENTID,
		"text": {
		   "content": "Test message for admin"
		},
		"safe":0
	},
	"textcard":{
		"touser" : "ZhangHaiJun",
		"msgtype" : "textcard",
		"agentid" : AGENTID,
		"textcard" : {
			"title" : "领奖通知",
			"description" : "<div class=\"gray\">2016年9月26日</div> <div class=\"normal\">恭喜你抽中iPhone 7一台，领奖码：xxxx</div><div class=\"highlight\">请于2016年10月10日前联系行政同事领取</div>",
			"url" : "URL",
			"btntxt":"更多"
		}
	}
}






CODEURL = "https://open.weixin.qq.com/connect/oauth2/authorize?appid={}&redirect_uri={}&response_type=code&scope={}&agentid={}&state={}#wechat_redirect"
AUTHURL = "https://qyapi.weixin.qq.com/cgi-bin/user/getuserinfo?access_token={}&code={}"
TOKENURL = "https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid={}&corpsecret={}"
OPENIDURL = "https://qyapi.weixin.qq.com/cgi-bin/user/convert_to_openid?access_token={}"
USERINFOURL = "https://qyapi.weixin.qq.com/cgi-bin/user/getuserdetail?access_token={}"
SENDMSGURL = "https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token={}"


def doauth(req):
	data = {}
	openid = req.session.get('openid',None)
	if openid is None:
		data['code']="9999"
		data['msg'] = "session timeout"
	else:
		data['code']="0000"
		data['user'] = Wechatuser.objects.get(openid=openid)
	return data

def wechatauth(req,code,state):
	openid = req.session.get('openid',None)
	if openid is None:
		if code is None:
			url = CODEURL.format(CORPID,quote(req.build_absolute_uri()),SCOPETYPE[0],AGENTID,0)
			return (True,HttpResponseRedirect(url))
		else:
			access_token = gettoken()
			url = AUTHURL.format(access_token,code)
			userinfo = requests.get(url).json()
			if 'UserId' in userinfo:
				userid = userinfo['UserId']
				ticket = userinfo['user_ticket']
				url = OPENIDURL.format(access_token)
				r_openid = requests.post(url,json.dumps({'userid':userid})).json()
				openid = r_openid['openid']
				
				if state==1:
					url = USERINFOURL.format(access_token)
					r = requests.post(url,json.dumps({"user_ticket":ticket}))
					r.encoding = "utf-8"
					r_userinfo = r.json()
					print r_userinfo
					newuser = {}
					newuser['openid'] = openid
					newuser['userid'] = userid
					newuser['nickname'] = r_userinfo['name']
					newuser['headimg'] = r_userinfo['avatar']
					newuser['sex'] = int(r_userinfo['gender'])
					newuser['mobile'] = r_userinfo['mobile']
					newuser['qrcode'] = r_userinfo['qr_code']
					if r_userinfo['email']=="":
						newuser['email'] = None
					else:
						newuser['email'] = r_userinfo['email']
					Wechatuser.objects.create(**newuser)
					req.session['openid'] = openid
				userinfo = Wechatuser.objects.filter(openid=openid).values()
				if len(userinfo)==0:
					url = CODEURL.format(CORPID,quote("http://"+req.get_host()+"/mobile/"),SCOPETYPE[1],AGENTID,1)
					return (True,HttpResponseRedirect(url))
				else:
					req.session['openid'] = userinfo[0]['openid']
					return (False,userinfo[0]['email'])
			else:
				openid = userinfo['OpenId']
				Wechatuser.objects.get_or_create(openid=openid)
				req.session['openid'] = openid
				return (False,None)
	else:
		userinfo = Wechatuser.objects.get(openid=openid)
		return (False,userinfo.email)

	
def gettoken():
	token = Token.objects.filter(name='nsb',expires__gt=time.time()).values()
	if len(token)>0:
		return token[0]['token']
	else:
		url = TOKENURL.format(CORPID,APPSECRET)
		token = requests.get(url).json()
		if "access_token" in token:
			t = Token.objects.get_or_create(name='nsb')[0]
			t.token = token['access_token']
			t.expires = time.time()+int(token['expires_in'])-600
			t.save()
			return token['access_token']
		else:
			return None
			
def sendmsg(msg):
	token = gettoken()
	url = SENDMSGURL.format(token)
	r = requests.post(url,json.dumps(msg))
	
	
	
	
