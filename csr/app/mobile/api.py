# encoding: utf-8


from django.shortcuts import HttpResponse
from django.db.models import Q,Sum
from app.models import Block,Topic,Post,Wechatuser,Answer,Event,Confirm
from app.wechat import doauth,sendmsg,MSGTEMP
from app.mailfunc import send_mail
from app.common import md5form
import json
import time
import os
import datetime
from pyquery import PyQuery as pq
import sys

reload(sys)

sys.setdefaultencoding('utf8')

def getauthorname(plist):
	for i in range(0,len(plist)):
		plist[i]['authorname'] = Wechatuser.objects.get(id=plist[i]['authorid']).nickname
	return plist

def getblocklist(request):
	data = {}
	blocklist = list(Block.objects.filter(active=1).values())
	for i in range(0,len(blocklist)):
		blocklist[i]['topic'] = list(Topic.objects.filter(active=1,blockid=blocklist[i]['id']).values())
	data['list'] = blocklist
	return HttpResponse(json.dumps(data),content_type="application/json")
	
def addpost(request):
	auth_data = doauth(request)
	if auth_data['code']!='0000':
		data = auth_data
		return HttpResponse(json.dumps(data),content_type="application/json")
	user = auth_data['user']
	data = {}
	subject = request.POST.get('subject',None)
	description = request.POST.get('description',None)
	block = request.POST.get('block',None)
	topic = request.POST.get('topic',None)
	hours = request.POST.get('stime',None)
	if subject is None or description is None or block is None:
		data['code'] = "0001"
		data['msg'] = '标题、内容、板块不能为空'
		return HttpResponse(json.dumps(data),content_type="application/json")
	if len(subject)>512:
		data['code'] = "0002"
		data['msg'] = '标题过长'
		return HttpResponse(json.dumps(data),content_type="application/json")
	add = {}
	posttime = time.time()
	add['subject'] = subject
	add['authorid'] = user.id
	add['description'] = description
	add['blockid'] = block
	add['topicid'] = topic
	add['createtime'] = posttime
	add['edittime'] = posttime
	add['updatetime'] = posttime
	try:
		hours = int(hours)
	except:
		hours = 0
	add['hours'] = hours
	r = Post.objects.create(**add)
	if int(topic) == 1:
		msg = MSGTEMP['textcard']
		msg['touser'] = user.userid
		msg['textcard']['title'] = "自愿服务消息"
		datestr = datetime.datetime.now().strftime('%Y年%m月%d日')
		if hours ==0:
			subtitle = '您添加的《{}》自愿者服务成功，自愿者服务时长填写错误'.format(subject)
			timetext = "请到Nokia CSR 工具中修改"
		else:
			subtitle = '您添加的《{}》自愿者服务成功，自愿者服务时长增加{}小时'.format(subject,hours)
			all = Post.objects.filter(topicid=int(topic),authorid=user.id).aggregate(sum = Sum('hours'))
			timetext = "截止目前您的自愿者服务时长为{}小时".format(all['sum'])
		msg['textcard']['description'] = "<div class=\"gray\">{}</div> <div class=\"normal\">{}</div><div class=\"highlight\">{}</div>".format(datestr,subtitle,timetext)
		msg['textcard']['url'] = "http://"+request.get_host()+"/mobile/"
		sendmsg(msg)
	data['code'] = '0000'
	data['msg'] = '发布成功'
	return HttpResponse(json.dumps(data),content_type="application/json")
	
def getpostlist(request):
	auth_data = doauth(request)
	if auth_data['code']!='0000':
		data = auth_data
		return HttpResponse(json.dumps(data),content_type="application/json")
	user = auth_data['user']
	data = {}
	num = 10
	blockid = request.POST.get('blockid',None)
	topicid = request.POST.get('topicid',0)
	timestamp = request.POST.get('timestamp',0)
	
	if blockid is None:
		data['code'] = "0001"
		data['msg'] = '目标贴错误'
		return HttpResponse(json.dumps(data),content_type="application/json")
	blockid = int(blockid)
	topicid = int(topicid)
	timestamp = int(timestamp)
	if timestamp == 0:
		timestamp = time.time()
		top = Post.objects.filter(Q(Q(blockid=blockid) & Q(top=1))|Q(top__gt=1)).order_by('-top','-updatetime').values()[0:8]
		data['top'] = list(top)
		
	post = Post.objects.filter(blockid=blockid,updatetime__lt=timestamp,top=0)
	if topicid>0:
		post = post.filter(topicid=topicid)
	post = list(post.order_by('-updatetime').values()[0:num])
	if len(post)<num:
		data['more'] = 0
	else:
		data['more'] = 1
	for i in range(0,len(post)):
		userinfo = Wechatuser.objects.get(id=post[i]['authorid'])
		post[i]['username'] = userinfo.nickname
		post[i]['headimg'] = userinfo.headimg
		post[i]['read'] = Event.objects.filter(target=post[i]['id'],action=1,authorid=user.id).count()
	data['code'] = "0000"
	data['msg'] = '成功'
	data['list'] = list(post)
	
	return HttpResponse(json.dumps(data),content_type="application/json")
	
def getpost(request):
	auth_data = doauth(request)
	if auth_data['code']!='0000':
		data = auth_data
		return HttpResponse(json.dumps(data),content_type="application/json")
	user = auth_data['user']

	data = {}
	id = request.POST.get('id',None)
	num = request.POST.get('num','0')
	num = int(num)
	if id is None:
		data['code'] = "0001"
		data['msg'] = '目标贴错误'
		return HttpResponse(json.dumps(data),content_type="application/json")
	post = Post.objects.filter(id=int(id)).values()
	e = Event.objects.get_or_create(target=id,action=1,authorid=user.id)
	if len(post)==0:
		data['code'] = "0002"
		data['msg'] = '此贴已删除'
		return HttpResponse(json.dumps(data),content_type="application/json")
	post = post[0]
	Post.objects.filter(id=int(id)).update(hot = post['hot']+1)
	userinfo = Wechatuser.objects.get(id=post['authorid'])
	answerlist = list(Answer.objects.filter(postid=id,active=1).order_by('-up','createtime').values()[num:num+10])
	for i in range(0,len(answerlist)):
		w_u =  Wechatuser.objects.get(id=answerlist[i]['authorid'])
		answerlist[i]['authorname'] = w_u.nickname
		answerlist[i]['headimg'] = w_u.headimg
		answerlist[i]['uped'] = Event.objects.filter(target=answerlist[i]['id'],action=3,authorid=user.id).count()
		if answerlist[i]['imgs']:
			answerlist[i]['imgs'] = answerlist[i]['imgs'].split(',')
		else:
			answerlist[i]['imgs'] = []
		if answerlist[i]['answerid']:
			answerlist[i]['answerid'] = getauthorname(Answer.objects.filter(id=answerlist[i]['answerid']).values())[0]
		answerlist[i]['tome'] = getauthorname(list(Answer.objects.filter(answerid=answerlist[i]['id']).order_by('createtime').values()))
	post['username'] = userinfo.nickname
	post['headimg'] = userinfo.headimg
	post['uped'] = Event.objects.filter(target=post['id'],action=2,authorid=user.id).count()
	data['code'] = "0000"
	data['msg'] = '成功'
	data['info'] = post
	data['answer'] = answerlist
	return HttpResponse(json.dumps(data),content_type="application/json")
	
def getanswers(request):
	auth_data = doauth(request)
	if auth_data['code']!='0000':
		data = auth_data
		return HttpResponse(json.dumps(data),content_type="application/json")
	user = auth_data['user']
	data = {}
	pid = request.POST.get('post',None)
	start = request.POST.get('start','10')
	start = int(start)
	if pid is None:
		data['code'] = "0001"
		data['msg'] = '目标贴错误'
		return HttpResponse(json.dumps(data),content_type="application/json")
	answerlist = list(Answer.objects.filter(postid=pid,active=1).order_by('-up','createtime').values()[start:start+10])
	if len(answerlist)==0:
		data['code'] = "0002"
		data['msg'] = '无更多'
		return HttpResponse(json.dumps(data),content_type="application/json")
	for i in range(0,len(answerlist)):
		answerlist[i]['authorname'] = Wechatuser.objects.get(id=answerlist[i]['authorid']).nickname
		answerlist[i]['uped'] = Event.objects.filter(target=answerlist[i]['id'],action=3,authorid=user.id).count()
		if answerlist[i]['imgs']:
			answerlist[i]['imgs'] = answerlist[i]['imgs'].split(',')
		else:
			answerlist[i]['imgs'] = []
		if answerlist[i]['answerid']:
			answerlist[i]['answerid'] = getauthorname(Answer.objects.filter(id=answerlist[i]['answerid']).values())[0]
		answerlist[i]['tome'] = getauthorname(list(Answer.objects.filter(answerid=answerlist[i]['id']).order_by('createtime').values()))
	data['code'] = "0000"
	data['msg'] = '成功'
	data['list'] = answerlist
	return HttpResponse(json.dumps(data),content_type="application/json")
	
def upload(request):
	data = {}
	file =request.FILES.get("file", None)
	basepath = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
	basepath = os.path.join(basepath,'static/upload')
	if not file:
		data['code'] = '0001'
		data['msg'] = "no files for upload!"
		return HttpResponse(json.dumps(data), content_type='application/json')
	filename = "{}_{}".format(int(time.time()),file.name)
	dir = os.path.join(basepath,filename)
	f = open(dir,'wb+')
	for chunk in file.chunks():
		f.write(chunk)
	f.close()
	data['code'] = '0000'
	data['path'] = "/static/upload/{}".format(filename)
	data['msg'] = '上传成功'
	return HttpResponse(json.dumps(data), content_type='application/json')

	
def reply(request):
	auth_data = doauth(request)
	if auth_data['code']!='0000':
		data = auth_data
		return HttpResponse(json.dumps(data),content_type="application/json")
	user = auth_data['user']
	data = {}
	postid = request.POST.get('post',None)
	answerid = request.POST.get('answer',None)
	description = request.POST.get('description',None)
	img = request.POST.get('img',None)
	if postid is None or (description is None and img is None):
		data['code'] = "0001"
		data['msg'] = '回复不能为空'
		return HttpResponse(json.dumps(data),content_type="application/json")
		
	answer = {}
	postid = int(postid)
	post = Post.objects.get(id=postid)
	post.resnum = post.resnum+1
	answer['floor'] = post.resnum
	post.updatetime = time.time()
	post.save()
	answer['postid'] = postid
	if answerid is not None:
		answerid = int(answerid)
	answer['answerid'] = answerid
	answer['description'] = description
	if img is not None:
		img = img.strip(',')
	answer['imgs'] = img
	answer['createtime'] = time.time()
	answer['authorid'] = user.id
	answer['active']=1
	r = Answer.objects.create(**answer)
	answer['authorname'] = Wechatuser.objects.get(id=answer['authorid']).nickname
	data['code'] = "0000"
	data['msg'] = '成功'
	data['answer'] = answer
	return HttpResponse(json.dumps(data), content_type='application/json')

	
def upanswer(request):
	auth_data = doauth(request)
	if auth_data['code']!='0000':
		data = auth_data
		return HttpResponse(json.dumps(data),content_type="application/json")
	user = auth_data['user']
	data = {}
	aid = request.POST.get('answer',None)
	if aid is None:
		data['code'] = "0001"
		data['msg'] = '输入错误'
		return HttpResponse(json.dumps(data),content_type="application/json")
	aid = int(aid)
	e = Event.objects.get_or_create(target=aid,action=3,authorid=user.id)
	if e[1]:
		answer = Answer.objects.get(id=aid)
		answer.up = answer.up+1
		answer.save()
		data['code'] = "0000"
		data['msg'] = '成功'
	else:
		data['code'] = "0002"
		data['msg'] = '已经点过'
	
	return HttpResponse(json.dumps(data), content_type='application/json')

def uppost(request):
	auth_data = doauth(request)
	if auth_data['code']!='0000':
		data = auth_data
		return HttpResponse(json.dumps(data),content_type="application/json")
	user = auth_data['user']
	data = {}
	pid = request.POST.get('post',None)
	if pid is None:
		data['code'] = "0001"
		data['msg'] = '输入错误'
		return HttpResponse(json.dumps(data),content_type="application/json")
	pid = int(pid)
	e = Event.objects.get_or_create(target=pid,action=2,authorid=user.id)
	if e[1]:
		post = Post.objects.get(id=pid)
		post.up = post.up+1
		post.save()
		data['code'] = "0000"
		data['msg'] = '成功'
	else:
		data['code'] = "0002"
		data['msg'] = '已经点过'
	return HttpResponse(json.dumps(data), content_type='application/json')
	
def sendmail(request):
	data = {}
	FILEDIR = os.path.dirname(os.path.abspath(__file__))
	FILEPATH = os.path.join(FILEDIR,'templates/confirm_pc.html')
	openid = request.session.get('openid',None)
	if openid is None:
		data['code'] = "9999"
		data['msg'] = 'session timeout'
		return HttpResponse(json.dumps(data),content_type="application/json")
	email = request.POST.get('email',None)
	if email is None:
		data['code'] = "0001"
		data['msg'] = '输入错误'
		return HttpResponse(json.dumps(data),content_type="application/json")
	token = md5form(email)
	confirm_url = "http://{}/mobile/doconfirm?token={}&openid={}&action=1".format(request.get_host(),token,openid)
	cancel_url = "http://{}/mobile/doconfirm?token={}&openid={}&action=0".format(request.get_host(),token,openid)
	f = open(FILEPATH)
	dom = pq(filename=FILEPATH,encoding="utf-8")
	dom.find('#confirm').attr('href',confirm_url)
	dom.find('#cancel_url').attr('href',cancel_url)
	dom.find('#mail').html(email)
	html_content = dom.outerHtml()
	r = send_mail([email],'testmail',html_content)
	if r:
		c = Confirm.objects.get_or_create(openid=openid)
		c = c[0]
		c.email = email
		c.createtime = time.time()
		c.save()
		data['code'] = "0000"
		data['msg'] = '发送成功'
	else:
		data['code'] = "0002"
		data['msg'] = '发送失败'

	return HttpResponse(json.dumps(data), content_type='application/json')
