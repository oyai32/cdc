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
table {
	background: #ccc;
	margin: 50px auto;
}

td {
	background: white;
}
.jz{
text-align: center;}
</style>

</head>

<body>


	<table>
		<tr>
			<td colspan="4" class="jz">公告栏</td>
		</tr>
		<tr>
			<td class="jz">序号</td>
			<td style="width:200px" class="jz">主题</td>
			<td style="width:350px" class="jz">内容</td>
			<td class="jz">创建时间</td>
		</tr>
		<c:forEach var="post" items="${requestScope.plist }" varStatus="row">
			<tr>
				<td class="jz">${row.count }</td>
				<td class="jz">${post.title }</td>
				<td class="jz">${post.content }</td>
				<td class="jz">${post.create_time }</td>
			</tr>

		</c:forEach>
	</table>

</body>
</html>
