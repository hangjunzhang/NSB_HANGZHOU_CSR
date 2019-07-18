from hashlib import md5


def md5form(data):
	new_md5 = md5()
	new_md5.update(data.encode(encoding='utf-8'))
	return new_md5.hexdigest()