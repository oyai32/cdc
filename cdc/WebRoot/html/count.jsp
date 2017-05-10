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
	function sel(p) {
		if (p == 1) {
			var cun = document.getElementById("cun").value;
			bottom.location.href = "cdc/servlet/CountServlet?b=cun&&cun="+ cun;

		} else {
					bottom.location.href = "cdc/servlet/CountServlet?b=quan";
		}
	}
</script>
</head>

<body>

	<div class="top">>>统计报表</div>
	<div class="cx">
		按项目村查询：<input id="cun" />
		<button onclick="sel(1)">按村庄统计</button>
		<button onclick="sel(2)">统计全部</button>
	</div>


	<iframe scrolling="auto" name="bottom"
		style="border:0px ;width: 99%;height: 61%;" id="bottom"></iframe>
</body>
</html>
