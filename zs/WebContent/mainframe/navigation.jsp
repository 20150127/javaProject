<%@ page language="java"  pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
		<!--
		body {margin: 0px;}
		-->
		.midbg01 { background-image: url(<%=request.getContextPath()%>/images/mid_bg_01.gif);  background-repeat: repeat-x; }
		.location {font-size: 9pt; line-height: 150%; color: #333333; padding-left:5pt; text-decoration: none}
		
	</style>
	
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<table   align="center" class="midbg01" height="100%" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="0%" align="center"><img src="<%=request.getContextPath()%>/images/mid_adorn_01.gif" width="11" height="11"></td>
          <td width="97%" class="location">您的当前位置：<span id="nav_pan">首页</span></td>
        </tr>
      </table>
</body>
</html>