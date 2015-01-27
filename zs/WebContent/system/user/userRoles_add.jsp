<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../pub/taglib.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>为用户分配角色</title>
		<link href="<%=request.getContextPath() %>/css/methodfish.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/public.js"></script>
		<script language=javascript type="text/javascript">
	function checkForm(){
		var nullReg = /^\s*$/;
		var reg=/^\d{1,4}$/;
	 	
		if(nullReg.test($("#roleName").val())){
			$("#roleNameError").html("上级模块必须填写！");
  			$("#xz").bind("click",function (){$("#roleNameError").html("")});
  			return false;
		}
		if(!reg.test($("#priority").val())){
			$("#priorityError").html("优先级填写不正确！");
  			$("#priority").select();
  			$("#priority").bind("keyup",function (){if(event.keyCode!=13){$("#priorityError").html("");}});
  			return false;
		}
		myform.submit();
	}
	
		
</script>
</head>
	<body>
		<form  name="myform"  method="post" action="<%=request.getContextPath()%>/user/userAddRoles.action?userId=${userId}" >
			<table align="center" class="table" border="1" width="100%" style="border-collapse:collapse;">
				<tr>
					<td class="edit_Title">
						<img src="../images/xiushi_04.gif" width="13" height="13">
						<font style="font-weight:bold;font-size:13">分配角色</font>
					</td>
					<td align="right" width="50%">
					<c:if test="${xy:hasPermission(user.id,'user',2)}">
						<input type="button" id="MLKZ_BaoCun"  class="f_btn01" onClick="checkForm()" value="保存">
						</c:if>
						<input type="button" id="MLKZ_GuanBi"  class="f_btn01" onClick=" if(!confirm('确定离开本页面吗？')) return false;window.close();" value="关闭">
					</td>
				</tr>
			</table>
			<table align="center" class="table" border="1" width="100%" style="border-collapse:collapse;">
				<tr>
					<td width="20%" class="title" align="center">
						角色名称
					</td>
					<td class="content_L" width="60%">
						<input type="text"  readonly  id="roleName"  maxlength="10" style="width:85%"  class="f_input"><input type="hidden"  name="usersRoles.sysRoles.id" id="roleId"><input type="button" id="xz" value="选择" class="f_btn01" onclick="openWin('<%=request.getContextPath() %>/role/select.action','给用户分配角色',800,500,1);">
						<br><font color="red" ><span id="roleNameError"></span></font>

					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						优先级




					</td>
					<td class="content_L" width="60%">
						<input type="text"  name="usersRoles.priority" id="priority" maxlength="4" style="width:95%" class="f_input"><font color="red" title="必填项">*</font><br>
						如果您有多个角色将按此优先级继承权限（只能填写阿拉伯数字）<br>
						<font color="red" ><span id="priorityError"></span></font>
					</td>
				</tr>
				
			</table>
</form>
</body>
</html>
