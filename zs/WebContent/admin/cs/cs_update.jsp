<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../pub/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
		<title>测试成绩编辑</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <link href="<%=request.getContextPath() %>/css/methodfish.css" rel="stylesheet" type="text/css">
		<link href="<%=request.getContextPath() %>/css/calendar_tas.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script language="javascript" src="<%=request.getContextPath() %>/js/public.js"></script>
		<script language=javascript type="text/javascript">
		function checkForm(){
			var nullReg = /^\s*$/;
			var floatReg = /^\d+(\.\d+)?$/;
			if(!nullReg.test($("#techangcj").val())){
				if(!floatReg.test($("#techangcj").val())){
					$("#techangcjError").html("测试成绩填写不正确！");
		  			$("#techangcj").select();
		  			$("#techangcj").bind("keyup",function (){if(event.keyCode!=13){$("#techangcjError").html("");}});
		  			return false;
				}
			}
			
			
			myform.submit();
		}
	
	
</script>
</head>
	<body class="middlebody">
		<form name="myform"  method="post" action="<%=request.getContextPath() %>/cs/update.action" >
			<input type="hidden" name="score.id" value="${score.id }">
			<table align="center" class="table" border="1" width="100%" cellspacing="1"
				style="border-collapse: collapse;">
				<tr>
					<td class="content_L">
					<div align="left" style="float: left;width: 50%;">
						<img src="<%=request.getContextPath() %>/images/xiushi_04.gif" width="13" height="13"><b>测试成绩</b>
					</div>
					<div  align="right">
					<c:if test="${xy:hasPermission(user.id,'cs',2)}">
						<input type="button" id="MLKZ_BaoCun" name="MLKZ_BaoCun" class="f_btn01"  value="保存" onclick="checkForm()">
					</c:if>
						<input type="button" id="MLKZ_GuanBi" name="MLKZ_GuanBi" class="f_btn01" onClick=" if(!confirm('确定离开本页面吗？')) return false;window.close();" value="关闭">
					</div>	
					</td>
				</tr>
			</table>
			<table align="center" class="table" border="1" width="100%"
				style="border-collapse: collapse;">
				<tr>
					<td width="20%" class="title" align="center">
						考生号



					</td>
					<td class="content_L" width="60%">
						${score.examineeNum }
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						姓名
					</td>
					<td class="content_L" width="60%">
						${score.name }
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						身份证号
					</td>
					<td class="content_L" width="60%">
						${score.IDCardNum }
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						准考证号



					</td>
					<td class="content_L" width="60%">
						${score.admissionId }
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						考场号



					</td>
					<td class="content_L" width="60%">
						${score.roomId }
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						测试成绩
					</td>
					<td class="content_L" width="60%">
						<c:choose>
							<c:when test="${my:endsWith(score.cs,'.0')}">
								<input type="text"  name="score.cs" id="techangcj" value="<fmt:formatNumber value='${score.cs}' pattern="0"/>" maxlength="40" style="width:95%" class="f_input" title="测试成绩">
							</c:when>
							<c:otherwise>
								<input type="text"  name="score.cs" id="techangcj" value="${score.cs}" maxlength="40" style="width:95%" class="f_input" title="测试成绩">
							</c:otherwise>
						</c:choose>
						<font  color="red" title="必填项">*</font><br>
						<font color="red" ><span id="techangcjError"></span></font>
					</td>
				</tr>
				
			</table>
</form>
</body>

</html>
