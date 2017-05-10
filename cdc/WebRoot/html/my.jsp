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
<script type="text/javascript" src="${ctx }/js/user.js"></script>
<link href="${ctx }/My97DatePicker/skin/WdatePicker.css"
	rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript"
	src="${ctx }/My97DatePicker/WdatePicker.js"></script>
<style type="text/css">
table {
	margin:30px auto;
}
</style>

</head>

<body>
	<div class="top">>>修改密码</div>
	<table>
		<tr>
			<td>原密码：</td>
			<td><input id="ypw" type="password"/>
			</td>
		</tr>
		<tr>
			<td>新密码：</td>
			<td><input id="xpw" type="password"/>
			</td>
		</tr>
		<tr>
			<td>确认密码：</td>
			<td><input id="qpw" type="password"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;"><input type="button"
				value="保存" onclick="xgmm()" /><input type="reset" />
			</td>
		</tr>
	</table>
</body>
</html>
