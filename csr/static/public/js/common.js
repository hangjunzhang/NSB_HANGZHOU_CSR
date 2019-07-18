function myalert(msg,time,callback){
			var myalert = $("<div class='myalert' style='position:fixed;width:20%;min-width:240px;background-color:black;line-height:28px;color:#fff;text-align:center;margin:auto;left:40%;top:50px;z-index:99999'></div>");
			myalert.html(msg)
			$("body").append(myalert);
			myalert.fadeOut(time,function(){$(this).remove();callback()})
		}