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
table {
	text-align: center;
	background: #ccc;
}

.title {
	text-align: left;
	font-size: 16px;
	font-weight: bold;
}
table {
	margin: 0px auto;
}
td {
	background: white;
}
</style>

</head>

<body>
	<c:set value="${requestScope.user }" var="user"></c:set>

	<div class="title">查询结果：</div>
	<table>
		<tr>
		
			<td>帐号</td>
			<td>用户名</td>
			<td>身份</td>
			<td>现有权限</td>
			<td>操作</td>
		</tr>
		<tr>
		
			<td>${user.zhanghao }</td>
			<td>${user.userName }</td>
			<td>${user.r_name }</td>
			<td>${user.power }</td>
			<td><button onclick="xgqx(${user.u_id})">修改权限</button></td>
		</tr>
	</table>
</body>
</html>
