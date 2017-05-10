function xgmm(){
	var ypw=document.getElementById("ypw").value;
	var xpw=document.getElementById("xpw").value;
	var qpw=document.getElementById("qpw").value;
	if(ypw==""||xpw==""||qpw==""){
		alert("信息填写不完整！");
	
	}else{
		if(xpw==qpw){
			window.location.href="cdc/servlet/UserServlet?b=xgmm&&xpw="+xpw+"&&ypw="+ypw;
		}else{
			alert("密码不一致！");
		}
	}
	
	

}