# encoding: utf-8
import smtplib  
from email.mime.text import MIMEText

MAILHOST ="smtp.163.com"
MAILUSER="aecenavy@163.com"
MAILKEY="QRzhj6123995"

  
def send_mail(to_list,sub,content):
	me="NSB HangZhou"+"<"+MAILUSER+">"
	msg = MIMEText(content,_subtype='html',_charset='gb2312')
	msg['Subject'] = sub
	msg['From'] = me
	msg['To'] = ";".join(to_list)
	try:
		s  = smtplib.SMTP_SSL(MAILHOST, 465) 
		s.login(MAILUSER,MAILKEY)
		s.sendmail(me, to_list, msg.as_string())
		s.close()
		return True
	except (Exception):
		return False  
