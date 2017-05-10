<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/commons/taglib.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="${ctx }">

<title>慢性病管理信息系统</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="${ctx }/css/add.css">
<script type="text/javascript" src="${ctx }/js/jquery-1.9.1.min.js"></script>
<link href="${ctx }/My97DatePicker/skin/WdatePicker.css"
	rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript"
	src="${ctx }/My97DatePicker/WdatePicker.js"></script>


<style type="text/css">
.cx {
	height: 50px;
	padding: 20px;
	margin-bottom: 20px;
	border-bottom: 2px solid #ccc;
}

a {
	text-decoration: none;
	color: #464646;
	font-size: 12px;
}

span {
	border: 1px solid #ccc;
	border-radius: 10px;
	padding: 5px 10px;
	background: #eee;
}

input {
	width: 100px;
}
</style>
<script type="text/javascript">
	function sel(p,type) {
		if(p==1){
			var cun = document.getElementById("cun").value;
			bottom.location.href = "cdc/servlet/SelectPerson?b=ren&&type=" + type
					+ "&&cun=" + cun+"&&p=1";
		}else{
				bottom.location.href = "cdc/servlet/SelectPerson?b=ren&&type=" + type+"&&p=2";
		}
	}
</script>
</head>

<body>
	<c:set value="${param.type }" var="type"></c:set>
	<div class="top">>>
	<c:if test="${type=='gao' }">高危人群</c:if>
	<c:if test="${type=='huan' }">患病人群</c:if>
	<c:if test="${type=='yi' }">一般人群</c:if>
</div>
	<div class="cx">
		项目村：<input id="cun" />
		<button onclick="sel(1,'${type}')">按村庄查询</button>
		<button onclick="sel(2,'${type}')">查询全部</button>
	</div>


	<iframe scrolling="auto" name="bottom"
		style="border:0px ;width: 99%;height: 61%;" id="bottom"></iframe>
</body>
</html>
