
function sel(p,type){
	if(p==1){
		var start=document.getElementById("start").value;
		var end=document.getElementById("end").value;
		bbottom.location.href="cdc/servlet/BingServlet?b=time&&start="+start+"&&end="+end+"&&type="+type;
		
	}else{
		var cun=document.getElementById("cun").value;
		bbottom.location.href="cdc/servlet/BingServlet?b=cun&&cun="+cun+"&&type="+type;
	}
}

function update(id){
	window.location.href="cdc/servlet/SelectFamily?b=toupdate&&id="+id;
}

function del(id){
	window.location.href="cdc/servlet/SelectFamily?b=del&&id="+id;

}