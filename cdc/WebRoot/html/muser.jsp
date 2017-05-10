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

<script type="text/javascript" src="${ctx }/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${ctx }/js/index.js"></script>
<link href="${ctx }/My97DatePicker/skin/WdatePicker.css"
	rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript"
	src="${ctx }/My97DatePicker/WdatePicker.js"></script>
<style type="text/css">
.title {
	text-align: left;
	font-size: 16px;
	font-weight: bold;
}

table {
	background: gray;
	margin:0px auto;
}

td {
padding:10px;
	background: white;
	text-align: center;
}
</style>
</head>

<body>
	<div class="title">查询结果：</div>
	<table cellpadding="0" >
		<tr>
			<td style="width:50px;">序号</td>
			<td style="width:80px;">户主姓名</td>
			<td>性别</td>
		
				<td>身份证号</td>
					<td>人数</td>
			<td>村庄</td>
			<td>更新时间</td>
			<td>操作</td>
		</tr>
		<tr>
			<td>1</td>
			<td>欧阳年底</td>
			<td>男</td>
			<td>1993年1月1日</td>
			<td>1234567891234456</td>
			<td>幸福村</td>
			<td>1993年1月1日</td>
			<td><button >编辑 	</button><button >删除</button></td>
		</tr>
	</table>
</body>
</html>
