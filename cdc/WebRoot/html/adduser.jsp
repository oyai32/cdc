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
margin:0px auto;}
</style>

</head>

<body>
	<div class="title">添加用户</div>
	<form action="${ctx }/servlet/UserServlet?b=add" method="post" onsubmit="return check('user')">
		<table>
			<tr>
				<td>帐号</td>
				<td><input name="zhanghao" id="zhanghao"/></td>
			</tr>
			<tr>
				<td>用户名</td>
				<td><input name="userName" id="userName" /></td>
			</tr>
			<tr>
				<td>级别</td>
				<td><select name="jibie"><option value="2">区市县用户</option>
				<option value="4">乡用户</option>
						<option value="1">村用户</option>
				</select></td>
			</tr>
			<tr>
				<td>村庄</td>
				<td><input name="cun" id="cun"/></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;"><input type="submit" value="添加"/><input type="reset"/></td>
			</tr>
		</table>
	</form>
</body>
</html>
