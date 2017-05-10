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
<script type="text/javascript" src="${ctx }/js/admin.js"></script>
<link href="${ctx }/My97DatePicker/skin/WdatePicker.css"
	rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript"
	src="${ctx }/My97DatePicker/WdatePicker.js"></script>
<style type="text/css">
.cx {
	height: 100px;
	padding: 20px;
	margin-bottom: 20px;
	border-bottom:2px solid #ccc;
}

</style>

</head>

<body>
	<div class="top">>>权限管理</div>
		<div class="cx">
	
		帐号：<input id="zhanghao" />	<button  onclick="qsel(1)">按帐号查询</button>
		<p>
	用户名：<input id="userName" />	<button  onclick="qsel(2)">按用户名查询</button>
	</div>
	
		<iframe scrolling="auto"  name="fbottom" style="border:0px ;width: 99%;height: 61%;" id="fbottom"></iframe>
</body>
</html>
