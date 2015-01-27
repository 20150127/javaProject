<%@ page language="java"  pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>北京青年政治学院自主招生系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <frameset rows="141,*,28"  border="0" framespacing="0">
	<frame src="<%=request.getContextPath() %>/mainframe/top.jsp" scrolling="no" noresize frameborder="0">
	<frameset cols="180,10,*"  framespacing="0" id="mid" >
  		<frame src="<%=request.getContextPath() %>/mainframe/left.jsp" name="leftTree" scrolling="no" frameborder="0">
  		<frame src="<%=request.getContextPath() %>/mainframe/middle.jsp" name="middle" scrolling="no" frameborder="0">
		  <frame src="<%=request.getContextPath() %>/mainframe/main.htm" name="leftinfo" scrolling="auto" frameborder="0" noresize> 	
		</frameset>
	<frame src="<%=request.getContextPath() %>/mainframe/bottom.jsp" name="bottomFrame" scrolling="no" frameborder="0" noresize>
</frameset>
<noframes>
<body>
</body>
</noframes>
</html>
