<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录错误!</title>
<link href="<%=request.getContextPath()%>/css/methodfish.css" rel="stylesheet" type="text/css">
<script type="text/javascript">

	function closewindow(){
		window.location.href = "<%=request.getContextPath()%>/us/toLogin.action";
	}
	function clock(){
		i = i -1;
		if(document.getElementById("info")){
			document.getElementById("info").innerHTML = "本窗口将在"+i+"秒后重新跳转到登录页面!";
		}
		if(i > 0)
			setTimeout("clock();",1000);
		else
			closewindow();
	}

	var i = 5;
	clock();
</script>
</head>
<body class="middlebody">
<center>
	${loginMsg}<p>
	<div id="info">本窗口将在5秒后重新跳转到登录页面!</div>
	<div id="tiaozhuan">手动跳转请点<a href="<%=request.getContextPath()%>/us/toLogin.action"><font color="blue">这里</font></a></div>
	<br>
</center>
</body>
</html>