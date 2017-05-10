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
</style>
</head>

<body>
	<div class="title">修改个人健康档案</div>
	<c:set var="p" value="${requestScope.person }"></c:set>
	<form id="addPerson"
		action="${ctx }/servlet/SelectPerson?id=${p.p_id}&&b=update"
		method="post">
		<table style="margin:10px auto; font-size: 13px;">
			<tr>
				<td class="tdr">姓名</td>
				<td><input name="name" style="width:80px" value="${p.p_name }" />
				</td>
				<td class="tdr" class="width:100px;">性别</td>
				<td><input name="sex" value="${p.p_sex }" />
				</td>
				<td class="tdr">出生日期</td>
				<td><input name="birth" class="Wdate" style=";width:100px;"
					onclick="WdatePicker({isShowWeek:true})" value="${p.p_birth }" />
			</tr>
			<tr>
				<td class="tdr">身高</td>
				<td><input name="height"  style="width:40px"  value="${p.height }"  />cm
				</td>
				<td class="tdr">体重</td>
				<td>
				<input name="weight"  style="width:40px"  value="${p.weight }" />kg
				</td>
				<td class="tdr">平均吸烟</td>
				<td>
					<input name="yan"  style="width:40px"  value="${p.yan }" />支/天
				</td>
			</tr>
			<tr>
				<td class="tdr">身份证号</td>
				<td><input name="sfzh" style=";width:120px;" value="${p.sfzh }" />
				</td>
				<td class="tdr" class="width:100px;">居住状况</td>
				<td><input name="jzzk" value="${p.jzzk }" />
				</td>
				<td class="tdr">与户主关系</td>
				<td><input name="yhzgx" value="${p.yhzgx }" /></td>
			</tr>
			<tr>
				<td class="tdr">村庄</td>
				<td><input name="cz" style="width:80px;" value="${p.cz }" /></td>
				<td class="tdr">户主姓名</td>
				<td><input name="hzxm" style="width:80px;" value="${p.hzxm }" />
				</td>
				<td class="tdr">户主身份证号</td>
				<td><input name="hzsfzh" value="${p.hzsfzh }" />
				</td>
			</tr>
			<tr>
				<td class="tdr">详细地址</td>
				<td colspan="3"><input name="address" style="width:320px;"
					value="${p.address }" /></td>
				<td class="tdr">联系电话</td>
				<td><input name="tel" value="${p.tel }" />
				</td>
			</tr>
			<tr>
				<td class="tdr">工作单位</td>
				<td colspan="3"><input name="gzdw" style="width:320px;"
					value="${p.gzdw }" /></td>
				<td class="tdr">文化程度</td>
				<td><input name="whcd" value="${p.whcd }" />
				</td>
			</tr>
			<tr>

				<td class="tdr">婚姻状况</td>
				<td><input name="hyzk" value="${p.hyzk }" /></td>
				<td class="tdr">民族</td>
				<td><input name="mz" style="width:80px;" value="${p.mz }" />
				</td>
				<td class="tdr">收缩压</td>
				<c:choose>
					<c:when test="${p.ssy==0 }">
						<td><input name="ssy" style="width:50px;" />mmHg</td>
					</c:when>
					<c:otherwise>
						<td><input name="ssy" style="width:50px;" value="${p.ssy }" />mmHg</td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td class="tdr">舒张压</td>
				<c:choose>
					<c:when test="${p.szy==0 }">
						<td><input name="szy" style="width:50px;" />mmHg</td>
					</c:when>
					<c:otherwise>
						<td><input name="szy" style="width:50px;" value="${p.szy }" />mmHg</td>
					</c:otherwise>
				</c:choose>

				<td class="tdr">空腹血糖</td>
				<c:choose>
					<c:when test="${p.kfxt==0.0 }">
						<td><input name="kfxt" style="width:50px;" />mmol/L</td>
					</c:when>
					<c:otherwise>
						<td><input name="kfxt" style="width:50px;" value="${p.kfxt }" />mmol/L</td>
					</c:otherwise>
				</c:choose>

				<td class="tdr">餐后血糖</td>
				<c:choose>
					<c:when test="${p.chxt==0.0 }">
						<td><input name="chxt" style="width:50px;" />mmol/L</td>
					</c:when>
					<c:otherwise>
						<td><input name="chxt" style="width:50px;" value="${p.chxt }" />mmol/L</td>
					</c:otherwise>
				</c:choose>

			</tr>
			<tr>
				<td class="tdr" colspan="6" style="height:50px;"><input
					type="submit" value="保存" /><input type="reset" /></td>
			</tr>
		</table>
	</form>
</body>
</html>
