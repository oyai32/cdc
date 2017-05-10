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
<script type="text/javascript" src="${ctx }/js/bing.js"></script>
<link href="${ctx }/My97DatePicker/skin/WdatePicker.css"
	rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript"
	src="${ctx }/My97DatePicker/WdatePicker.js"></script>
<style type="text/css">
.cx {
	height: 100px;
	padding: 20px 0px 0px 20px;
	margin-bottom: 20px;
	border-bottom: 2px solid #ccc;
}

input {
	width: 100px;
}
</style>

</head>

<body>
	<c:set value="${param.type }" var="type"></c:set>
	<div class="top">
		>>
		<c:if test="${type=='gxy'}">高血压</c:if>
		<c:if test="${type=='tang'}">糖尿病</c:if>
		<c:if test="${type=='qi'}">其他慢性病</c:if>
	</div>
	<div class="cx">
		更新日期：从 <input id="start" class="Wdate"
			onclick="WdatePicker({isShowWeek:true})" /> 到 <input id="end"
			class="Wdate" onclick="WdatePicker({isShowWeek:true})" />
		<button onclick="sel(1,'${type}')">按时间查询</button>
		<c:set value="${sessionScope.user.r_id }" var="r_id"></c:set>
		<c:if test="${r_id==2||r_id==4 }">
		<p>
			按项目村查询：<input id="cun" />
			<button onclick="sel(2,'${type}')">按村庄查询</button>
			</c:if>
	</div>


	<iframe scrolling="auto" id="bbottom" name="bbottom"
		style="border:0px solid red ;width: 99%;height: 61%;"></iframe>
</body>
</html>
