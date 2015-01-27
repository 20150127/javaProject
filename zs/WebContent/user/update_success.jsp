<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册成功</title>
<script type="text/javascript">
	window.onload = function(){
		alert("修改成功,返回信息页面!");
		window.location.href = "<%=request.getContextPath()%>/us/show.action";
	}
</script>
</head>
<body>
</body>
</html>