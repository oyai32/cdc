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
	padding: 40px;
	margin-bottom: 40px;
	border-bottom: 2px solid #ccc;
}

table {
	background: #ccc;
	margin:0px auto;
}
a{
text-decoration: none;
color: gray;}
td {
	background: white;
	text-align: center;
}
</style>

</head>

<body>
	<div class="top">>>公告管理</div>
	<form action="${ctx }/servlet/AdminServlet?b=fb" method="post">
		<div class="cx">
		<table>
		<tr><td>主题：</td><td><input name="title" style="width:100%;" /></td></tr>
		<tr><td>		内容：</td><td>	<textarea rows="5" cols="70" name="content"></textarea></td></tr>
		<tr><td colspan="2"><input type="submit" value="发布"/></td></tr>
		</table>
		</div>
	</form>
	<table>
		<tr>
			<td>序号</td>
			<td style="width:200px">主题</td>
			<td  style="width:350px">内容</td>
			<td>创建时间</td>
			<td>操作</td>
		</tr>
		<c:forEach var="post" items="${requestScope.plist }" varStatus="row">
				<tr>
			<td>${row.count }</td>
			<td>${post.title }</td>
			<td>${post.content }</td>
			<td>${post.create_time }</td>
			<td><a href="${ctx }/servlet/AdminServlet?b=del&&id=${post.post_id}">删除</a></td>
		</tr>
		
		</c:forEach>
	</table>

</body>
</html>
