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
.cx {
	border-bottom: 2px solid #ccc;
	height: 100px;
	padding: 40px 0px 20px 40px;
}

#bianji {
	margin-left: 20px;
}

.title {
	font-size: 22px;
	font-weight: bold;
	text-align: center;
}

.jz {
	text-align: center;
}

span {
	color: red;
}

table {
	background: #ccc;
	margin: 10px auto;
}

td {
	background: white;
}
</style>
<script type="text/javascript">
function gy(id){
	var suggest=document.getElementById("suggest").value;
	window.location.href="cdc/servlet/BingServlet?b=suggest&&id="+id+"&&suggest="+suggest;
}
</script>
</head>

<body>
	
		
	<c:forEach var="p" items="${sessionScope.power }">
		<c:if test="${p==9 }">
			<c:set var="flag9" value="true"></c:set>
		</c:if>
		<c:if test="${p==10 }">
			<c:set var="flag10" value="true"></c:set>
		</c:if>
		<c:if test="${p==12 }">
			<c:set var="flag12" value="true"></c:set>
		</c:if>
	</c:forEach>
	<div class="title">患者管理卡</div>
	<c:set value="${requestScope.person }" var="p"></c:set>

	<form action="${ctx }/servlet/BingServlet?b=suifang&&id=${p.p_id}"
		method="post" onsubmit="return check('bing')">
		<table>
			<tr>
				<td>姓名</td>
				<td>${p.p_name }</td>
				<td>性别</td>
				<td>${p.p_sex }</td>
			</tr>
			<tr>
				<td>出生日期</td>
				<td>${p.p_birth }</td>
				<td>联系电话</td>
				<td>${p.tel }</td>
			</tr>
			<tr>
				<td>村庄</td>
				<td>${p.cz }</td>
				<td>详细地址</td>
				<td>${p.address }</td>
			</tr>
			<tr>
				<td>收缩压</td>
				<td>${p.ssy }mmHg</td>
				<td>舒张压</td>
				<td>${p.szy }mmHg</td>
			</tr>
			<tr>
				<td>空腹血糖</td>
				<td>${p.kfxt }mmol/L</td>
				<td>餐后血糖</td>
				<td>${p.chxt }mmol/L</td>
			</tr>
		
			<c:if test="${requestScope.suggest!=null }">
				<tr>
					<td>干预建议</td>
					<td colspan="3">${requestScope.suggest }</td>
				</tr>
			</c:if>
			<c:if test="${flag10 }">
				<tr>
					<td style="width:150px;">添加随访时间<span>*</span>
					</td>
					<td><input name="sftime" id="sftime" class="Wdate"
						style="width:120px;" onclick="WdatePicker({isShowWeek:true})" />
					</td>
					<td>添加转诊信息</td>
					<td><input name="zz" /></td>
				</tr>
				<tr>
					<td>添加随访记录</td>
					<td colspan="3"><textarea rows="3" cols="20" name="sftext"
							id="sftext" style="color:black;text-align: left;width:400px;"></textarea>
					</td>
				</tr>
				<tr>
					<td>添加干预信息</td>
					<td colspan="3"><textarea rows="3" cols="20" name="text"
							id="text" style="color:black;text-align: left;width:400px;"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">是否设为其他慢性病</td>
					<td colspan="2"><input type="radio" name="szmxb" value="是" />是<input
						type="radio" name="szmxb" value="否" checked="checked" />否</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align: center;"><input
						type="submit" value="保存" /><input type="reset" /></td>
				</tr>
			</c:if>
			<c:if test="${flag12 }">
				<tr>
					<td>添加干预建议</td>
					<td colspan="3"><textarea rows="3" cols="20" name="suggest"
							id="suggest" style="color:black;text-align: left;width:400px;"></textarea>
					</td>
				</tr>

				<tr>
					<td colspan="4" style="text-align: center;"><input
						type="button" value="保存" onclick="gy(${p.p_id})" /><input
						type="reset" /></td>
				</tr>
			</c:if>
		</table>
		<table>
			<tr>
				<td colspan="5" class="jz" height=30px;>随访记录</td>
			</tr>
			<tr>
				<td class="jz" style="width:10px;">序号</td>
				<td class="jz">随访时间</td>
				<td class="jz">随访记录</td>
				<td class="jz">干预信息</td>
				<td class="jz">转诊情况</td>
			</tr>
			<c:forEach var="m" items="${requestScope.mlist }" varStatus="row">
				<tr>
					<td class="jz">${row.count }</td>
					<td class="jz">${m.visit_time }</td>
					<td class="jz">${m.sftext }</td>
					<td class="jz">${m.text }</td>
					<td class="jz">${m.zz }</td>
				</tr>
			</c:forEach>
		</table>


	</form>
</body>
</html>
