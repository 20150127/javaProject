<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>复试资格修改成功</title>
<link href="<%=request.getContextPath()%>/css/methodfish.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function closewindow(){
	window.returnValue = true;
	window.close();
}
function clock(){
	i = i -1;
	if(document.getElementById("info")){
		document.getElementById("info").innerHTML = "本窗口将在"+i+"秒后自动关闭";
	}
	if(i > 0)
		setTimeout("clock();",1000);
	else
		closewindow();
}

var i = 4;
clock();
window.onload=function(){
	window.resizeTo(320,180);
}
</script>
</head>
<body class="middlebody">
<center>
	复试资格修改成功！<p>
	<div id="info">本窗口将在3秒后自动关闭</div>
	<br>
	<input type="button" class="f_btn01" value="关闭窗口" onclick="closewindow();">
</center>
</body>
</html>