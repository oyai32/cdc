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
<script type="text/javascript" src="${ctx }/js/index.js"></script>
<link href="${ctx }/My97DatePicker/skin/WdatePicker.css"
	rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript"
	src="${ctx }/My97DatePicker/WdatePicker.js"></script>
<style type="text/css">
.cx {
	height: 100px;
	padding: 40px 0px 20px 40px;
}

#del {
	margin-left: 20px;
}

#text {
	font-size: 14px;
	float: left;
	margin-left:-100px;
}
</style>
</head>

<body>
	<div class="top">>>删除个人健康档案</div>
	<div class="cx">
		姓&nbsp;&nbsp;&nbsp;&nbsp;名: <input id="cxname" />
		<p>
			身份证号：<input id="cxsfzh" /><input type="button" id="del" value="删除"
				onclick="del('person')" />
	<div id="text">*删除成功</div>
	</div>

</body>
</html>
