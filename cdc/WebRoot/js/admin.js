
function sel(p){
	if(p==1){
		var start=document.getElementById("start").value;
		var end=document.getElementById("end").value;
		fbottom.location.href="cdc/servlet/UserServlet?b=time&&start="+start+"&&end="+end;
		
	}else if(p==2){
		var cun=document.getElementById("cun").value;
		fbottom.location.href="cdc/servlet/UserServlet?b=cun&&cun="+cun;
	}
}

function qsel(p){
	if(p==1){
		var zhanghao=document.getElementById("zhanghao").value;
		fbottom.location.href="cdc/servlet/UserServlet?b=zhang&&zhanghao="+zhanghao;
		
	}else if(p==2){
		var userName=document.getElementById("userName").value;
		fbottom.location.href="cdc/servlet/UserServlet?b=userName&&userName="+userName;
	}
}

function shusel(p){
	if(p==1){
		var start=document.getElementById("start").value;
		var end=document.getElementById("end").value;
		fbottom.location.href="cdc/servlet/AdminServlet?b=shu&&type=time&&start="+start+"&&end="+end;
		
	}else if(p==2){
		var name=document.getElementById("name").value;
		fbottom.location.href="cdc/servlet/AdminServlet?b=shu&&type=name&&name="+name;
	}else if(p==3){
		var content=document.getElementById("content").value;
		fbottom.location.href="cdc/servlet/AdminServlet?b=shu&&type=content&&content="+content;
	}
}

function update(id){
	window.location.href="cdc/servlet/UserServlet?b=update&&id="+id;
}

function del(id){
	window.location.href="cdc/servlet/UserServlet?b=del&&id="+id;

}

function xgqx(id){
	window.location.href="cdc/servlet/UserServlet?b=gqx&&id="+id;
}