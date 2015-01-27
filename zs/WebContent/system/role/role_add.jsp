<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>角色新增</title>
	    <link href="<%=request.getContextPath() %>/css/methodfish.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="/zs/dwr/engine.js"></script>
		<script language="javascript" src="/zs/dwr/util.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script language="javascript" src="/zs/dwr/interface/roleService.js"></script>
		<script language=javascript type="text/javascript">
		function checkAccount(){
			var account = $("#roleName").val();
			roleService.findRoleName(account,function(data){
			if(data!=null){
				$("#roleNameError").html("角色名称已经存在！");
					$("#acid").val("1");
				}else{
					$("#acid").val("0");
				}
			});
		}
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
		if($("#acid").val() == "1"){
			$("#roleNameError").html("角色名称已经存在！");
  			$("#roleName").select();
  			$("#roleName").bind("keyup",function (){if(event.keyCode!=13){$("#accountError").html("");}});
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
		<form  name="myform"  method="post" action="<%=request.getContextPath()%>/role/add.action" >
			<input type="hidden" value="" id="acid">
			<table align="center" class="table" border="1" width="100%" style="border-collapse:collapse;">
				<tr>
					<td class="edit_Title">
						<img src="<%=request.getContextPath()%>/images/xiushi_04.gif" width="13" height="13">
						<font style="font-weight:bold;font-size:13">角色新增</font>
					</td>
					<td align="right" width="50%">
						<input type="button" id="MLKZ_BaoCun"  class="f_btn01" onClick="checkForm()" value="保存">
						
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
						<input type="text"  name="sysRole.roleName" id="roleName" maxlength="10" style="width:95%" class="f_input" onblur="checkAccount()"><font  color="red" title="必填项">*</font><br>
						只允许填写中文、和英文字母<br>
						<font color="red" ><span id="roleNameError"></span></font>

					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						备注
					</td>
					<td class="content_L"  width="60%">
						<textarea  name="sysRole.remark" style="width:95%" id="remark" onblur="check()" class="f_textarea" rows="5" cols="50"></textarea><br>
						<font color="red" ><span id="remarkError"></span></font>
					</td>
						
				</tr>
			</table>
</form>
</body>

</html>
