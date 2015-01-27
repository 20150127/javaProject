<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../pub/taglib.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>找回密码</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link href="<%=request.getContextPath()%>/css/methodfish.css"
			rel="stylesheet" type="text/css">
<script type="text/javascript">
	function check(){
	var nullreg  = /^\s*$/;
		if(nullreg.test(document.getElementById("card").value)){
			alert("身份证必须输入");
			document.getElementById("card").focus();
			return false;
		}
		return true;
	}
</script>
	</head>

	<body>
	<form action="<%=request.getContextPath()%>/examinee/zhmm.action" method="post" onsubmit="return check();">
		<table align="center" class="table" border="1" width="300"
			style="border-collapse: collapse;margin-top: 100px;margin-left: 50px;">
			<tr height="30">
				<td>
					请输入身份证号:
				</td>
				<td>
					<input type="text" name="idcard" id="card" maxlength="18">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="还原密码">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<font color="red">考生忘记注册密码时，为注册考生还原密码，<br />密码默认还原为<font
						color="blue" size="3">123456</font>
					</font>
				</td>
			</tr>
		</table>
</form>
	</body>
</html>
