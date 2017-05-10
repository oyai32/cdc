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
	text-align: left;
	font-size: 16px;
	font-weight: bold;
}

table {
	background: gray;
	margin: 0px auto;
}

td {
	padding: 10px;
	background: white;
	text-align: center;
}
</style>
</head>

<body>
	<c:set value="${requestScope.count }" var="count"></c:set>
	<div class="title">查询结果：</div>
	<table cellpadding="0">
		<tr>
			<td>高血压患病人数</td>
			<td>${count.gxyhbr } 人</td>
			<td>糖尿病患病人数</td>
			<td>${count.tnbhbr } 人</td>
			<td>其他慢性病患病人数</td>
			<td>${count.qthbr } 人</td>
		</tr>
		<tr>
			<td>高血压管理人数</td>
			<td>${count.gxyglr } 人</td>
			<td>糖尿病管理人数</td>
			<td>${count.tnbglr } 人</td>
			<td>其他慢性病管理人数</td>
			<td>${count.qtglr } 人</td>
		</tr>
		<tr>
			<td>高血压管理率</td>
			<td>${count.gxygll }</td>
			<td>糖尿病管理率</td>
			<td>${count.tnbgll }</td>
			<td>其他慢性病管理率</td>
			<td>${count.qtgll } </td>
		</tr>
		<tr>
			<td>高血压随访人数</td>
			<td>${count.gxysfr } 人</td>
			<td>糖尿病随访人数</td>
			<td>${count.tnbsfr } 人</td>
			<td>其他慢性病随访人数</td>
			<td>${count.qtsfr } 人</td>
		</tr>
		<tr>
			<td>高血压随访率</td>
			<td>${count.gxysfl }</td>
			<td>糖尿病随访率</td>
			<td>${count.tnbsfl } </td>
			<td>其他慢性病随访率</td>
			<td>${count.qtsfl } </td>
		</tr>
		<tr>
			<td>高血压干预人数</td>
			<td>${count.gxygyr } 人</td>
			<td>糖尿病干预人数</td>
			<td>${count.tnbgyr } 人</td>
			<td>其他慢性病干预人数</td>
			<td>${count.qtgyr } 人</td>
		</tr>
		<tr>
			<td>高血压干预率</td>
			<td>${count.gxygyl } </td>
			<td>糖尿病干预率</td>
			<td>${count.tnbgyl }</td>
			<td>其他慢性病干预率</td>
			<td>${count.qtgyl } </td>
		</tr>
	</table>
</body>
</html>
