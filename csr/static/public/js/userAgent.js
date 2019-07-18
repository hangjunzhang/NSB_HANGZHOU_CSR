var userAgent = window.navigator.userAgent;
	if (userAgent.indexOf('MSIE') != -1) {
		var divdom=document.createElement("div");
		var node=document.createTextNode("Please use up-to-date Chrome Firefox Safari etc, but NOT IE, when visiting this site!");
		divdom.style.color="red"
		divdom.style.fontSize="24px"
		divdom.style.width='100%'
		divdom.style.backgroundColor='#eee'
		divdom.appendChild(node)
		var firstchild = document.body.firstChild
		document.body.insertBefore(divdom,firstchild)
	}