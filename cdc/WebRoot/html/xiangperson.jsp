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
	<div class="title">个人健康档案详情</div>
	<c:set var="p" value="${requestScope.person }"></c:set>

	<table >
		<tr>
			<td class="tdr">姓名</td>
			<td>${p.p_name }</td>
			<td class="tdr" class="width:100px;">性别</td>
			<td>${p.p_sex }</td>
			<td class="tdr">出生日期</td>
			<td>${p.p_birth }
		</tr>
		<tr>
			<td  colspan="2">平均吸烟  ${p.yan } (支/天)</td>
			<td  colspan="2" >身高 ${p.height } (cm)  &nbsp;&nbsp;&nbsp;&nbsp;体重 ${p.weight } (kg)</td>
			<td  colspan="2" >BMI &nbsp;${p.bmi }</td>
		</tr>
		<tr>
			<td class="tdr">身份证号</td>
			<td>${p.sfzh }</td>
			<td class="tdr" class="width:100px;">居住状况</td>
			<td>${p.jzzk }</td>
			<td class="tdr">与户主关系</td>
			<td>${p.yhzgx }</td>
		</tr>
		<tr>
			<td class="tdr">村庄</td>
			<td>${p.cz }</td>
			<td class="tdr">户主姓名</td>
			<td>${p.hzxm }</td>
			<td class="tdr">户主身份证号</td>
			<td>${p.hzsfzh }</td>
		</tr>
		<tr>
			<td class="tdr">详细地址</td>
			<td colspan="3">${p.address }</td>
			<td class="tdr">联系电话</td>
			<td>${p.tel }</td>
		</tr>
		<tr>
			<td class="tdr">工作单位</td>
			<td colspan="3">${p.gzdw }</td>
			<td class="tdr">文化程度</td>
			<td>${p.whcd }</td>
		</tr>
		<tr>

			<td class="tdr">婚姻状况</td>
			<td>${p.hyzk }</td>
			<td class="tdr">民族</td>
			<td>${p.mz }</td>
			<td class="tdr">收缩压</td>
			<c:choose>
				<c:when test="${p.ssy==0 }">
					<td>mmHg</td>
				</c:when>
				<c:otherwise>
					<td>${p.ssy }mmHg</td>
				</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<td class="tdr">舒张压</td>
			<c:choose>
				<c:when test="${p.szy==0 }">
					<td>mmHg</td>
				</c:when>
				<c:otherwise>
					<td>${p.szy }mmHg</td>
				</c:otherwise>
			</c:choose>

			<td class="tdr">空腹血糖</td>
			<c:choose>
				<c:when test="${p.kfxt==0.0 }">
					<td>mmol/L</td>
				</c:when>
				<c:otherwise>
					<td>${p.kfxt }mmol/L</td>
				</c:otherwise>
			</c:choose>

			<td class="tdr">餐后血糖</td>
			<c:choose>
				<c:when test="${p.chxt==0.0 }">
					<td>mmol/L</td>
				</c:when>
				<c:otherwise>
					<td>${p.chxt }mmol/L</td>
				</c:otherwise>
			</c:choose>

		</tr>

	</table>
</body>
</html>
