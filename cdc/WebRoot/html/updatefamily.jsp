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

</style>
</head>

<body>
	<div class="title">修改家庭档案</div>
	<c:set var="f" value="${requestScope.family }"></c:set>
	<form id="addFamily" action="${ctx }/servlet/SelectFamily?id=${f.f_id}" method="post">
		<table  style="margin-top:10px;font-size: 13px;">
			<tr>
				<td class="td2">户主姓名</td>
				<td><input name="hzxm" style="width:80px;" value="${f.hzxm }" /></td>
			</tr>
			<tr>
				<td class="td2">身份证号</td>
				<td><input name="sfzh"   value="${f.sfzh }" /></td>
			</tr>
			<tr>
				<td class="td2">联系电话</td>
				<td><input name="tel"  value="${f.tel }" /></td>
			</tr>
			<tr>
				<td class="td2">出生日期</td>
				<td><input name="birth" class="Wdate"
					onclick="WdatePicker({isShowWeek:true})"  value="${f.birth }" /></td>
			</tr>
			<tr>
				<td class="td2">家庭人口数</td>
				<td><input name="num" style="width:30px"  value="${f.num }" />人</td>
			</tr>
			<tr>
				<td class="td2">家庭人均月收入</td>
				<td><input  value="${f.shouru }" name="shouru" /></td>
			</tr>
				<tr>
				<td class="td2">隶属村庄</td>
				<td><input name="cz" style="width:80px;"  value="${f.cz }" /></td>
			</tr>
			<tr>
				<td class="td2">家庭住址</td>
				<td><input name="address" style="width:300px;"  value="${f.address }" /></td>
			</tr>
			<tr>
				<td class="td2">是否低保户</td>
				<td><input name="db"  value="${f.db }" /></td>
			</tr>
			<tr>
				<td colspan="4" style="text-align: right;height:40px;"><input
					type="submit" value="保存"/><input type="reset" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
