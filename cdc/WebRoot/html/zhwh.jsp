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
<script type="text/javascript" src="${ctx }/js/admin.js"></script>
<link href="${ctx }/My97DatePicker/skin/WdatePicker.css"
	rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript"
	src="${ctx }/My97DatePicker/WdatePicker.js"></script>
<style type="text/css">
table {
	text-align: center;
	background: #ccc;
	margin: 0px auto;
}

td {
	background: white;
}

.title {
	text-align: left;
	font-size: 16px;
	font-weight: bold;
}
</style>

</head>

<body>
	<div class="title">查询结果：</div>
	<table>
		<tr>
			<td>序号</td>
			<td>帐号</td>
			<td>用户名</td>
			<td>村庄</td>
			<td>身份</td>
			<td>操作</td>
		</tr>
		<c:choose>
			<c:when test="${fn:length(requestScope.ulist)>0}">

				<c:forEach items="${requestScope.ulist }" varStatus="row" var="u">
					<tr>
						<td>${row.count }</td>
						<td>${u.zhanghao }</td>
						<td>${u.userName }</td>
						<td>${u.cz }</td>
						<td>${u.r_name }</td>
						<td style="width:200px;"><button onclick="update(${u.u_id})">初始化密码</button>
							<button onclick="del(${u.u_id})">删除用户</button>
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
