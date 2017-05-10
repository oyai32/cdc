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
	<c:set value="${sessionScope.user }" var="user"></c:set>
	<div class="title">查询结果：</div>
	<table cellpadding="0">
		<tr>
			<td style="width:15px;">序号</td>
			<td style="width:60px;">姓名</td>
			<td style="width:15px;">性别</td>
			<td>出生日期</td>
			<td>身份证号</td>
			<c:if test="${user.r_id==2||user.r_id==4 }">
				<td>村庄</td>
			</c:if>
			<c:if test="${type=='gxy'}">
				<td>收缩压</td>
				<td>舒张压</td>
			</c:if>
			<c:if test="${type=='tang'}">
				<td>空腹血糖</td>
				<td>餐后血糖</td>
			</c:if>
			<td>操作</td>
		</tr>
		<c:choose>
			<c:when test="${fn:length(requestScope.plist)>0}">
				<c:forEach items="${requestScope.plist }" var="plist"
					varStatus="row">
					<tr>
						<td>${row.count }</td>
						<td>${plist.p_name }</td>
						<td>${plist.p_sex }</td>
						<td>${plist.p_birth }</td>
						<td>${plist.sfzh }</td>
						<c:if test="${user.r_id==2||user.r_id==4 }">
							<td>${plist.cz }</td>
						</c:if>
						<c:if test="${type=='gxy'}">
							<td>${plist.ssy }mmHg</td>
							<td>${plist.szy }mmHg</td>
						</c:if>
						<c:if test="${type=='tang'}">
							<td>${plist.kfxt }mmol/L</td>
							<td>${plist.chxt }mmol/L</td>
						</c:if>
						<td><a
							href="${ctx }/servlet/BingServlet?id=${plist.p_id }&&b=xq">详情</a>
						</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div
					style="width:100%;text-align: center;color:red; margin-top:80px;">*无此条记录</div>

			</c:otherwise>

		</c:choose>
	</table>
</body>
</html>
