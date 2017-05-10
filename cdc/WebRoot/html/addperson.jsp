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
	<div class="title">添加个人健康档案</div>
	<form id="addPerson" action="${ctx }/servlet/AddPerson" method="post"  onsubmit="return check('person')">
		<table style="margin:10px auto; font-size: 13px;">
			<tr>
				<td class="tdr">姓名</td>
				<td><input name="name" id="name" style="width:80px" /><span
					style="color:red;">*</span>
				</td>
				<td class="tdr">性别</td>
				<td><input name="sex" type="radio" value="男" checked="checked" />男<input name="sex"
					type="radio" value="女" />女<span style="color:red;">*</span>
				</td>
				<td class="tdr">出生日期</td>
				<td><input name="birth" id="birth" class="Wdate" style=";width:100px;"
					onclick="WdatePicker({isShowWeek:true})" /><span
					style="color:red">*</span></td>
			</tr>
				<tr>
				<td class="tdr">身高</td>
				<td><input name="height"  style="width:40px" />cm
				</td>
				<td class="tdr">体重</td>
				<td>
				<input name="weight"  style="width:40px" />kg
				</td>
				<td class="tdr">平均吸烟</td>
				<td>
					<input name="yan"  style="width:40px" />支/天
				</td>
			</tr>
			<tr>
				<td class="tdr">身份证号</td>
				<td><input name="sfzh"  id="sfzh" style=";width:120px;" /><span style="color:red;">*</span>
				</td>
				<td class="tdr">居住状况</td>
				<td><select name="jzzk"><option value="本地户籍常住">本地户籍常住</option>
						<option value="本地户籍暂住">本地户籍暂住</option>
						<option value="外地户籍暂住">外地户籍暂住</option>
						<option value="外地户籍常住">外地户籍常住</option>
				</select>
				</td>
				<td class="tdr">与户主关系</td>
				<td><select name="yhzgx"><option value="户主">户主</option>
						<option value="配偶">配偶</option>
						<option value="父子">父子</option>
						<option value="母子">母子</option>
						<option value="兄弟">兄弟</option>
						<option value="姐妹">姐妹</option>
				</select></td>
			</tr>
			<tr>
			<td class="tdr">村庄</td>
				<td ><input name="cz" style="width:80px;" id="cz"/><span
					style="color:red">*</span></td>
				<td class="tdr">户主姓名</td>
				<td ><input name="hzxm" style="width:80px;" /></td>
				<td class="tdr" >户主身份证号</td>
				<td><input name="hzsfzh" />
				</td>
			</tr>
			<tr>
				<td class="tdr">详细地址</td>
				<td colspan="3"><input name="address" style="width:320px;" /></td>
				<td class="tdr">联系电话</td>
				<td><input name="tel" />
				</td>
			</tr>
			<tr>
				<td class="tdr">工作单位</td>
				<td colspan="3"><input name="gzdw" style="width:320px;" /></td>
				<td class="tdr">文化程度</td>
				<td><select name="whcd"><option value="硕士以上">硕士以上</option>
						<option value="硕士">硕士</option>
						<option value="本科">本科</option>
						<option value="专科">专科</option>
						<option value="高中">高中</option>
						<option value="高中以下">高中以下</option>
				</select>
				</td>
			</tr>
			<tr>
				
				<td class="tdr">婚姻状况</td>
				<td><select name="hyzk" style="width:80px;"><option value="未婚">未婚</option>
						<option value="已婚">已婚</option>
				</select></td>
				<td class="tdr" >民族</td>
				<td><input name="mz" style="width:80px;" />
				</td>
				<td class="tdr">收缩压</td>
				<td><input name="ssy" style="width:50px;" />mmHg</td>
			</tr>
				<tr>
				<td class="tdr">舒张压</td>
				<td><input name="szy" style="width:50px;" />mmHg</td>
				<td class="tdr">空腹血糖</td>
				<td><input name="kfxt" style="width:50px;" />mmol/L</td>
				<td class="tdr">餐后血糖</td>
				<td><input name="chxt" style="width:50px;" />mmol/L</td>
			</tr>
			<tr><td  class="tdr"  colspan="6" style="height:80px;"><input
					type="submit"  /><input type="reset" /></td></tr>
		</table>
	</form>
</body>
</html>
