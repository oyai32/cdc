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

<link rel="stylesheet" type="text/css" href="${ctx }/css/index.css">
<script type="text/javascript" src="${ctx }/js/index.js"></script>
<style type="text/css">
</style>
</head>
<body>
	<div class="top">基于WHO PEN干预的慢性病信息管理系统</div>
	<div class="ti">
		你好！${sessionScope.userName } <a href="${ctx }/login.jsp"
			style="margin-left:800px;color: black;">退出系统</a>
	</div>
	<div class="mi">
		<ul class="left">
			<c:forEach var="p" items="${sessionScope.power }">
				<c:if test="${p==1 }">
					<c:set var="flag1" value="true"></c:set>
				</c:if>
				<c:if test="${p==2 }">
					<c:set var="flag2" value="true"></c:set>
				</c:if>
				<c:if test="${p==3 }">
					<c:set var="flag3" value="true"></c:set>
				</c:if>
				<c:if test="${p==4 }">
					<c:set var="flag4" value="true"></c:set>
				</c:if>
				<c:if test="${p==5 }">
					<c:set var="flag5" value="true"></c:set>
				</c:if>
				<c:if test="${p==6 }">
					<c:set var="flag6" value="true"></c:set>
				</c:if>
				<c:if test="${p==7 }">
					<c:set var="flag7" value="true"></c:set>
				</c:if>
				<c:if test="${p==8 }">
					<c:set var="flag8" value="true"></c:set>
				</c:if>
				<c:if test="${p==9 }">
					<c:set var="flag9" value="true"></c:set>
				</c:if>
				<c:if test="${p==10 }">
					<c:set var="flag10" value="true"></c:set>
				</c:if>
				<c:if test="${p==11 }">
					<c:set var="flag11" value="true"></c:set>
				</c:if>
			</c:forEach>
			<li><div class="ltop" id="li1" onclick="zhang(1)">居民信息管理</div>
				<div class="liex" id="liex1">
					<c:if test="${flag1||flag2 }">
						<a href="${ctx }/html/person.jsp" target="main">个人信息</a>
					</c:if>
					<c:if test="${flag3||flag4 }">
						<p>
							<a href="${ctx }/html/family.jsp" target="main">家庭档案</a>
					</c:if>
				</div>
			</li>
			<li><div class="ltop" id="li2" onclick="zhang(2)">慢病管理</div>
				<div class="liex" id="liex2">
					<c:if test="${flag9||flag10 }">
						<a href="${ctx }/html/mbmanager.jsp?type=gxy" target="main">高血压</a>
						<p>
							<a href="${ctx }/html/mbmanager.jsp?type=tang" target="main">糖尿病</a>
						<p>
							<a href="${ctx }/html/mbmanager.jsp?type=qi" target="main">其他慢性病</a>
					</c:if>
				</div>
			</li>
			<c:if test="${flag11 }">
				<li><div class="ltop" id="li4" onclick="zhang(4)">人群分类</div>
					<div class="liex" id="liex4">

						<a href="${ctx }/html/ren.jsp?type=gao" target="main">高危人群</a>
						<p>
							<a href="${ctx }/html/ren.jsp?type=huan" target="main">患病人群</a>
						<p>
							<a href="${ctx }/html/ren.jsp?type=yi" target="main">一般人群</a>
					</div>
				</li>
				<li><div class="ltop">
						<a href="${ctx }/html/count.jsp" target="main">统计报表</a>
					</div>
				</li>
			</c:if>
			<li><div class="ltop" id="li3" onclick="zhang(3)">系统管理</div>
				<div class="liex" id="liex3">
					<c:if test="${flag5 }">
						<a href="${ctx }/html/qxgl.jsp?" target="main">权限管理</a>
					</c:if>
					<c:if test="${flag6 }">
						<p>
							<a href="${ctx }/html/selzh.jsp" target="main">帐号维护</a>
					</c:if>
					<c:if test="${flag7 }">
						<p>
							<a href="${ctx }/servlet/AdminServlet?b=lie" target="main">公告管理</a>
					</c:if>
					<c:if test="${flag8 }">
						<p>
							<a href="${ctx }/html/maintenance.jsp" target="main">数据维护</a>
					</c:if>

				</div>
			</li>

			<li><div class="ltop">
					<a href="${ctx }/html/my.jsp" target="main">修改密码</a>
				</div>
			</li>
		</ul>


		<div class="right">

			<iframe scrolling="no" name="main"
				src="${ctx }/servlet/AdminServlet?b=zhuye"></iframe>
		</div>
	</div>
</body>
</html>
