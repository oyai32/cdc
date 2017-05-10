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
<script type="text/javascript" src="${ctx }/js/person.js"></script>
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
<c:forEach var="p" items="${sessionScope.power }">
		<c:if test="${p==1 }">
			<c:set var="flag1" value="true"></c:set>
		</c:if>
		<c:if test="${p==2 }">
			<c:set var="flag2" value="true"></c:set>
		</c:if>
	</c:forEach>
	<div class="title">查询结果： </div>
	<table cellpadding="0" >
		<tr>
			<td style="width:15px;">序号</td>
			<td style="width:60px;">姓名</td>
			<td style="width:15px;">性别</td>
			<td>出生日期</td>
				<td>身份证号</td>
							<c:if test="${!flag1 }">
			<td>村庄</td>
			</c:if>
			<td>注册日期</td>
			<td>操作</td>
		</tr>
			<c:choose>
			<c:when test="${fn:length(requestScope.plist)>0}">
		<c:forEach items="${requestScope.plist }" var="plist" varStatus="row">
		<tr>
			<td>${row.count }</td>
			<td>${plist.p_name }</td>
			<td>${plist.p_sex }</td>
			<td>${plist.p_birth }</td>
			<td>${plist.sfzh }</td>
				<c:if test="${!flag1 }">
			<td>${plist.cz }</td>
			</c:if>
			<td>${plist.create_time }</td>
			<td>
			<c:if test="${flag1 }">
			<button onclick="update(${plist.p_id})">编辑 </button><button onclick="del(${plist.p_id})">删除</button>
			</c:if>
			<c:if test="${flag2 }">
			<button onclick="xiangqing(${plist.p_id})">详情 </button>
			</c:if>
			</td>
		</tr>
		</c:forEach>
		</c:when>
		<c:otherwise>
			<div style="width:100%;text-align: center;color:red; margin-top:80px;">*无此条记录</div>
		
		</c:otherwise>
		
		</c:choose>
	</table>
</body>
</html>
