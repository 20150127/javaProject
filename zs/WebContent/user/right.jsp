<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录成功!</title>
<link href="<%=request.getContextPath()%>/css/methodfish.css" rel="stylesheet" type="text/css">
<script type="text/javascript">

	function closewindow(){
		window.location.href = "<%=request.getContextPath()%>/us/show.action";
	}
	function clock(){
		i = i -1;
		if(document.getElementById("info")){
			document.getElementById("info").innerHTML = "本窗口将在"+i+"秒后重新跳转到您的信息页面!";
		}
		if(i > 0)
			setTimeout("clock();",1000);
		else
			closewindow();
	}

	var i = 4;
	clock();
</script>
<style type="text/css">
	body{ background-color: aaf;};
</style>
</head>
<body class="middlebody">
<center>
	<font size="6px;">
	登录成功,欢迎访问本校自主招生网站..<p>
	身份证号：${sessionScope.IDCard}
	<div id="info">本窗口将在3秒后重新跳转到您的信息页面!</div>
	<div id="tiaozhuan">手动跳转请点<a href="#" onclick="closewindow()"><font color="blue" size="6px">这里</font></a></div>
	<br>
	</font>
</center>
</body>
</html>