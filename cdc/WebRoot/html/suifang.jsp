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
	border-bottom: 2px solid #ccc;
	height: 100px;
	padding: 40px 0px 20px 40px;
}

#bianji {
	margin-left: 20px;
}

.title {
	font-size: 22px;
	font-weight: bold;
	text-align: center;
}

table {
	background: #ccc;
	margin: 10px auto;
}

td {
	background: white;
}
.jz{
text-align: center;}
</style>
</head>

<body>
	<div class="title">患者信息</div>
	<c:set value="${requestScope.person }" var="p"></c:set>
	<table>
		<tr>
			<td>姓名</td>
			<td>${p.p_name }</td>
			<td>性别</td>
			<td>${p.p_sex }</td>
		</tr>
		<tr>
			<td>出生日期</td>
			<td>${p.p_birth }</td>
			<td>联系电话</td>
			<td>${p.tel }</td>
		</tr>
		<tr>
			<td>村庄</td>
			<td>${p.cz }</td>
			<td>详细地址</td>
			<td>${p.address }</td>
		</tr>
		<tr>
			<td>收缩压</td>
			<td>${p.ssy }mmHg</td>
			<td>舒张压</td>
			<td>${p.szy }mmHg</td>
		</tr>
		<tr>
			<td>空腹血糖</td>
			<td>${p.kfxt }mmol/L</td>
			<td>餐后血糖</td>
			<td>${p.chxt }mmol/L</td>
		</tr>
		<tr><td colspan="4" class="jz">随访记录</td></tr>
		<tr>
			<td  class="jz">序号</td>
			<td  class="jz">随访时间</td>
			<td  class="jz">干预时间</td>
			<td  class="jz">转诊情况</td>
		</tr>
		<tr>
			<td>序号</td>
			<td>随访时间</td>
			<td>干预时间</td>
			<td>转诊情况</td>
		</tr>

	</table>

</body>
</html>
