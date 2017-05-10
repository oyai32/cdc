/**
 * 查询个人信息
 * @param p
 */
function sel(p){
	if(p==1){
		var start=document.getElementById("start").value;
		var end=document.getElementById("end").value;
		bottom.location.href="cdc/servlet/SelectPerson?b=time&&start="+start+"&&end="+end;
		
	}else if(p==2){
		var cun=document.getElementById("cun").value;
		bottom.location.href="cdc/servlet/SelectPerson?b=cun&&cun="+cun;
	}else if(p==3){
		bottom.location.href="cdc/servlet/SelectPerson?b=gao";
	}else if(p==4){
		bottom.location.href="cdc/servlet/SelectPerson?b=huan";
	}else if(p==5){
		bottom.location.href="cdc/servlet/SelectPerson?b=yi";
	}
}

function update(id){
	window.location.href="cdc/servlet/SelectPerson?b=toupdate&&c=up&&id="+id;
}
function xiangqing(id){
	window.location.href="cdc/servlet/SelectPerson?b=toupdate&&c=xiang&&id="+id;
}

function del(id){
	window.location.href="cdc/servlet/SelectPerson?b=del&&id="+id;

}