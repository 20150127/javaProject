<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../pub/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>角色新增</title>
	    <link href="<%=request.getContextPath() %>/css/methodfish.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script language=javascript type="text/javascript">
	function checkForm(){
		var nullReg = /^\s*$/; 
		var accountReg = /^\w{6,16}$/;
		var telReg1=/^(\d{3,4}-\d{7,8})|(1\d{10})$/;
		var reg = /^([\u4E00-\u9FA5]|[\uFE30-\uFFA0]|[a-zA-Z])*$/; 
	
		if(nullReg.test($("#roleName").val())){
			$("#roleNameError").html("角色名称必须填写！");
  			$("#roleName").select();
  			$("#roleName").bind("keyup",function (){if(event.keyCode!=13){$("#roleNameError").html("");}});
  			return false;
		}
		if(!reg.test($("#roleName").val())){
			$("#roleNameError").html("角色名称填写不正确！");
  			$("#roleName").select();
  			$("#roleName").bind("keyup",function (){if(event.keyCode!=13){$("#roleNameError").html("");}});
  			return false;
		}

		if(($("#remark").val()).length >2000) {
			$("#remarkError").html("输入的备注超过规定长度！");
			return false;		
		}
		myform.submit();
	}
	function check(){
		if(($("#remark").val()).length >2000) {
			$("#remarkError").html("输入的备注超过规定长度！");
			return false;		
		}else{
			$("#remarkError").html("");
			return true;
		}
		
	}
	
</script>
</head>
	<body>
		<form  name="myform"  method="post" action="<%=request.getContextPath()%>/role/update.action" >
			<table align="center" class="table" border="1" width="100%" style="border-collapse:collapse;">
				<tr>
					<td class="edit_Title">
						<img src="<%=request.getContextPath()%>/images/xiushi_04.gif" width="13" height="13">
						<font style="font-weight:bold;font-size:13">角色更新</font>
					</td>
					<td align="right" width="50%">
					<c:if test="${xy:hasPermission(user.id,'role',2)}">
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
						<input type="text"  name="sysRole.roleName" id="roleName" value="${sysRole.roleName}" readonly maxlength="10" style="width:95%" class="f_input"><input type="hidden" name="sysRole.id" value="${sysRole.id}"/><font color="red" title="必填项">*</font><br>
						只允许填写中文、和英文字母<br>
						<font color="red" ><span id="roleNameError"></span></font>

					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						备注
					</td>
					<td class="content_L"  width="60%">
						<textarea  name="sysRole.remark" style="width:95%" id="remark"  onblur="check()" class="f_textarea" rows="5" cols="50"><s:property value="#request.sysRole.remark"/></textarea><br>
						<font color="red" ><span id="remarkError"></span></font>
					</td>
						
				</tr>
			</table>
</form>
</body>

</html>
