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
	<div class="title">添加家庭档案</div>
	<form id="addFamily" action="${ctx }/servlet/AddFamily" method="post"  onsubmit="return check('family')">
		<table  style="margin-top:10px;font-size: 13px;">
			<tr>
				<td class="td2">户主姓名</td>
				<td><input name="hzxm" id="hzxm" style="width:80px;" /><span
					style="color:red;">*</span></td>
			</tr>
			<tr>
				<td class="td2">身份证号</td>
				<td><input name="sfzh" /></td>
			</tr>
			<tr>
				<td class="td2">联系电话</td>
				<td><input name="tel" /></td>
			</tr>
			<tr>
				<td class="td2">出生日期</td>
				<td><input name="birth" class="Wdate"
					onclick="WdatePicker({isShowWeek:true})" /></td>
			</tr>
			<tr>
				<td class="td2">家庭人口数</td>
				<td><input name="num" style="width:30px" />人</td>
			</tr>
			<tr>
				<td class="td2">家庭人均月收入</td>
				<td><select name="shouru"><option value="1000元以下">1000元以下</option>
						<option value="1000元-2000元">1000元-2000元</option>
						<option value="2000元-3000元">2000元-3000元</option>
						<option value="3000元以上">3000元以上</option>
				</select></td>
			</tr>
				<tr>
				<td class="td2">隶属村庄</td>
				<td><input name="cz" style="width:80px;" /></td>
			</tr>
			<tr>
				<td class="td2">家庭住址</td>
				<td><input name="address" style="width:300px;" /></td>
			</tr>
			<tr>
				<td class="td2">是否低保户</td>
				<td><input type="radio" name="db" value="是" checked="checked" />是<input type="radio"
					name="dibao" value="否" />否</td>
			</tr>
			<tr>
				<td colspan="4" style="text-align: right;height:40px;"><input
					type="submit" /><input type="reset" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
