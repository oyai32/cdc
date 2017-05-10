<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'login.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
body {
	background: #0169A6;
}

.back {
	background-image: url("images/b4.jpg");
	background-repeat: no-repeat;
	background-size: 100%;
	width: 1150px;
	height: 600px;
	margin: auto;
}

#userName {
	height: 20px;
	width: 130px;
}

#password {
	height: 20px;
	margin-top: 9px;
	width: 130px;
}

#login {
	width: 55px;
	background: #272727;
	color: white;
	border: 0px;
	height: 20px;
	border-radius: 5px;
	margin-left: 2px;
}

form {
	width: 250px;
	height: 200px;
	padding: 336px 0px 0px 515px;
}
</style>
</head>

<body>
	<div>
		<div class="back">
			<form action="servlet/LoginServlet" method="post">
				<input id="zhanghao" name="zhanghao"/> <input id="password" name="password" type="password"/> <input
					type="submit" value="登录" id="login" />
			</form>
		</div>
	</div>
</body>
</html>
