<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>Error</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/methodfish.css" rel="stylesheet" type="text/css">
</head>
<body class="middlebody">
<center>
<table cellspacing="1" class="table">
	<tr>
		<td class="content_L" align="center">
			<font style="font-size: 12px;">
			<s:fielderror></s:fielderror>
			<s:property value="exception.message" />
			</font>
		</td>
	</tr>
</table>
<table cellspacing="1" class="table" >
	<tr>
		<td class="content_L" align="center">
			<input type="button" class="f_btn01" value="关闭" onclick="javascript:window.close();">
		</td>
	</tr>
</table>
</center>
</body>
</html>