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
<script type="text/javascript" src="${ctx }/js/person.js"></script>
<link href="${ctx }/My97DatePicker/skin/WdatePicker.css"
	rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript"
	src="${ctx }/My97DatePicker/WdatePicker.js"></script>


<style type="text/css">
.cx {
	height: 100px;
	padding: 20px;
	margin-bottom: 20px;
	border-bottom: 2px solid #ccc;
}

a {
	text-decoration: none;
	color: #464646;
	font-size: 12px;
}

span {
	border: 1px solid #ccc;
	border-radius: 10px;
	padding: 5px 10px;
	background: #eee;
}

input {
	width: 100px;
}
</style>

</head>

<body>
	<c:forEach var="p" items="${sessionScope.power }">
		<c:if test="${p==1 }">
			<c:set var="flag1" value="true"></c:set>
		</c:if>
		<c:if test="${p==2 }">
			<c:set var="flag2" value="true"></c:set>
		</c:if>

	</c:forEach>
	<div class="top">>>个人信息</div>
	<div class="cx">
		添加日期：从 <input id="start" class="Wdate"
			onclick="WdatePicker({isShowWeek:true})" /> 到 <input id="end"
			class="Wdate" onclick="WdatePicker({isShowWeek:true})" />
		<button onclick="sel(1)">按时间查询</button>

		<c:if test="${flag2&&!flag1 }">
			<!-- 项目用户 -->
			<p>
				按项目村查询：<input id="cun" />
				<button onclick="sel(2)">按村庄查询</button>
		</c:if>
		<c:if test="${flag1 }">
			<p>
				<span><a href="${ctx }/html/addperson.jsp" target="bottom">添加档案</a>
				</span>
		</c:if>

	</div>


	<iframe scrolling="auto" name="bottom"
		style="border:0px ;width: 99%;height: 61%;" id="bottom"></iframe>
</body>
</html>
