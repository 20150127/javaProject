<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更新记录成功</title>
<link href="<%=request.getContextPath()%>/css/methodfish.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	window.onload = function(){
		alert("修改成功");
		window.location.href = "<%=request.getContextPath()%>/sysVar/show.action?o.id=1";
	}
</script>
</head>
<body class="middlebody">
</body>
</html>