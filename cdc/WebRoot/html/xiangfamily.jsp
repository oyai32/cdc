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
.title{
font-size: 22px;
font-weight: bold;
text-align: center;
}
table{
margin:10px auto;
 font-size: 16px;
background:#ccc;}
td{
background:white;}
</style>
</head>

<body>
	<div class="title">家庭档案详情</div>
	<c:set var="f" value="${requestScope.family }"></c:set>
	
		<table >
			<tr>
				<td class="td2">户主姓名</td>
				<td>${f.hzxm }</td>
			</tr>
			<tr>
				<td class="td2">身份证号</td>
				<td>${f.sfzh }</td>
			</tr>
			<tr>
				<td class="td2">联系电话</td>
				<td>${f.tel }</td>
			</tr>
			<tr>
				<td class="td2">出生日期</td>
				<td>${f.birth }</td>
			</tr>
			<tr>
				<td class="td2">家庭人口数</td>
				<td>${f.num }人</td>
			</tr>
			<tr>
				<td class="td2">家庭人均月收入</td>
				<td>${f.shouru } </td>
			</tr>
				<tr>
				<td class="td2">隶属村庄</td>
				<td>${f.cz }</td>
			</tr>
			<tr>
				<td class="td2">家庭住址</td>
				<td>${f.address }</td>
			</tr>
			<tr>
				<td class="td2">是否低保户</td>
				<td>${f.db }</td>
			</tr>
			
		</table>
</body>
</html>
