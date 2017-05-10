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
.title {
	font-size: 22px;
	font-weight: bold;
	text-align: center;
}
table{
float:left;}
td{
border:1px solid #ccc;
height:30px;}
</style>
</head>

<body>
	<div class="title">权限修改</div>
	<c:set value="${requestScope.user }" var="user"></c:set>
	<form action="${ctx }/servlet/UserServlet?b=qxtijiao&&id=${user.u_id}"
		method="post">
		<div style="margin:0px auto;text-align: center;width:230px;height:380px;">
		<table style="text-align: right;">
			<tr>
				<td>帐号</td>
			</tr>
			<tr>
				<td>用户名</td>
			</tr>
			<tr>
				<td>身份</td>
			</tr>
			<tr>
				<td>权限修改</td>
			</tr>
			<c:forEach items="${requestScope. ypIdList}" var="yid">
				<tr>
					<td><input type="checkbox" name="power" value="${yid }" checked="checked" />
					</td>
				</tr>
			</c:forEach>
			<c:forEach items="${requestScope. fIdList}" var="fid">
				<tr>
					<td><input type="checkbox" name="power" value="${fid }" />
					</td>
				</tr>
			</c:forEach>
		</table>
		<table>
			<tr>
				<td>${user.zhanghao }</td>
			</tr>
			<tr>
				<td>${user.userName }</td>
			</tr>
			<tr>
				<td>${user.r_name }</td>
			</tr>
			<tr>
				<td>              </td>
			</tr>
			<c:forEach items="${requestScope. ypNameList}" var="yname">
				<tr>
					<td>${yname }</td>
				</tr>
			</c:forEach>
			<c:forEach items="${requestScope. fNameList}" var="fname">
				<tr>
					<td>${fname }</td>
				</tr>
			</c:forEach>
		</table>
		</div>
		<p>
<div style="text-align: center;"><input type="submit" value="保存"/></div>

	</form>
</body>
</html>
