
function sel(p){
	if(p==1){
		var start=document.getElementById("start").value;
		var end=document.getElementById("end").value;
		//alert(start);
		fbottom.location.href="cdc/servlet/SelectFamily?b=time&&start="+start+"&&end="+end;
		
	}else{
		var cun=document.getElementById("cun").value;
		fbottom.location.href="cdc/servlet/SelectFamily?b=cun&&cun="+cun;
	}
}

function update(id){
	window.location.href="cdc/servlet/SelectFamily?b=toupdate&&c=up&&id="+id;
}
function xiangqing(id){
	window.location.href="cdc/servlet/SelectFamily?b=toupdate&&c=xiang&&id="+id;
}
function del(id){
	window.location.href="cdc/servlet/SelectFamily?b=del&&id="+id;

}