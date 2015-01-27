<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>导入成绩结果</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
	</head>

	<body>
		导入成功的学生
		<hr>
		<s:iterator value="#request.ss" id="s">
			<s:property />
			<br>
		</s:iterator>
		<p>
		导入失败的学生
		<hr>
		<table width="100%">

			<s:iterator value="#request.r" id="on">
				<tr>
					<s:property />
				</tr>
			</s:iterator>
		</table>
	</body>
</html>

