<%@ page language="java"  pageEncoding="UTF-8"%>
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
		<base href="<%=basePath%>">
		<title>证书成绩管理</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="description" content="证书成绩管理">
		<link rel="stylesheet" type="text/css" href="css/Application.css">
		<link rel="stylesheet" type="text/css" href="css/methodfish.css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/public.js"></script>
		<script type="text/javascript">
		function checkForm(){
			var cjReg= /^\d+(\.\d)?$/;
				if(!cjReg.test($("#zonghecj").val())){
					$("#zonghecjError").html("成绩填写不正确！");
		  			$("#zonghecj").select();
		  			$("#zonghecj").bind("keyup",function (){if(event.keyCode!=13){$("#zonghecjError").html("");}});
		  			return false;
				}
			myform.submit();
		}
		
		</script>
    		
	</head>
	<body>
		<form name="myform" method="post" action="<%=request.getContextPath()%>/zh/update.action" >
			<table cellspacing="1" class="table" width="90%" align="center">
				<tr>
					<td class="content_L">
					<div align="left" style="float: left;width: 50%;">
						<img src="<%=request.getContextPath() %>/images/xiushi_04.gif" width="13" height="13"><b>证书成绩</b>
					</div>
					<div  align="right">
					<c:if test="${xy:hasPermission(user.id,'zh',2)}">
						<input type="button" class="f_btn01" value="保存" onclick="checkForm()">&nbsp;&nbsp;
					</c:if>
						<input type="button" class="f_btn01" value="关闭" onclick="javascript:if(!confirm('您确定要退出并关闭窗口吗')){return false;}else{window.close();}">
					</div>
					</td>
					
				</tr>
			</table>
			<table cellspacing="1" class="table" width="90%" align="center">
				<tr>
					<td class="title" width="15%" align="center">
						姓名<font color="red">*</font>
					</td>
					<td class="content_L" width="35%" >
						<input type="text" name="score.name" value="${score.name}" readonly style="width:95%" maxlength="50" id="name"><br><font color="red"><span id="nameError"></span></font>
						<input type="hidden" name="score.id" value="${score.id}">
					</td>
				
				</tr>
				<tr>
					<td class="title" width="15%" align="center">
						考生号<font color="red">*</font>
					</td>
					<td class="content_L" width="35%" >
						<input type="text" name="score.examineeNum" value="${score.examineeNum}" readonly style="width:95%" maxlength="50" >
					</td>
				</tr>
				<tr>
					<td class="title" width="15%" align="center">
						准考证号<font color="red">*</font>
					</td>
					<td class="content_L" width="35%" >
						<input type="text"  value="${score.admissionId}" style="width:95%" readonly maxlength="50" >
					</td>
				</tr>
				<tr>
					<td class="title" width="15%" align="center">
						考场号

					</td>
					<td class="content_L" width="35%" >
						<input type="text"  value="${score.roomId}" style="width:95%" readonly maxlength="50" >
					</td>
				</tr>
				<tr>	
					<td class="title" width="15%" align="center">
						评定成绩
					</td>
					<td class="content_L">
					<c:choose>
						<c:when test="${my:endsWith(score.zonghecj,'.0')}">
							<input type="text" name="score.zonghecj" style="width:95%" value="<fmt:formatNumber value="${score.zonghecj}" pattern="0"/>"  maxlength="50" id="zonghecj">
						</c:when>
						<c:otherwise>
							<input type="text" name="score.zonghecj" style="width:95%" value="${score.zonghecj}"  maxlength="50" id="zonghecj">
						</c:otherwise>
					</c:choose><br><font color="red"><span id="zonghecjError"></span></font>
					</td>
				</tr>
				
			</table>
		</form>
	</body>
</html>
