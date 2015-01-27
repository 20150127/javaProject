<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../pub/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>用户新增</title>
		<link href="<%=request.getContextPath() %>/css/methodfish.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script type='text/javascript' src='/zs/dwr/interface/userService.js'></script>
  		<script type='text/javascript' src='/zs/dwr/engine.js'></script>

		<script language="javascript" src="<%=request.getContextPath()%>/js/calender.js"></script>
		<script language=javascript type="text/javascript">

		function checkAccount(){
			var account = $("#account").val();
			userService.findUserAccount(account,function(data){
			if(data!=null){
				$("#accountError").html("用户账号已经存在！");
					$("#acid").val("1");
				}else{
					$("#acid").val("0");
				}
			});
		}
		function set(){
			$("#accountError").html("");
		}
		function checkForm(){
			var nullReg = /^\s*$/;
			var accountReg = /^\w{6,16}$/;
			var telReg1=/^(\d{3,4}-\d{7,8})|(1\d{10})$/;
			var reg = /^([\u4E00-\u9FA5]|[\uFE30-\uFFA0]|[a-zA-Z])*$/; 
			
			if(nullReg.test($("#userName").val())){
				$("#userNameError").html("用户姓名必须填写！");
	  			$("#userName").select();
	  			$("#userName").bind("keyup",function (){if(event.keyCode!=13){$("#userNameError").html("");}});
	  			return false;
			}
	
			if(!reg.test($("#userName").val())){
				$("#userNameError").html("用户姓名填写不正确！");
	  			$("#userName").select();
	  			$("#userName").bind("keyup",function (){if(event.keyCode!=13){$("#userNameError").html("");}});
	  			return false;
			}
	
			if(nullReg.test($("#account").val())){
				$("#accountError").html("用户账号必须填写！");
	  			$("#account").select();
	  			$("#account").bind("keyup",function (){if(event.keyCode!=13){$("#accountError").html("");}});
	  			return false;
			}
			checkAccount();
			if($("#acid").val() == "1"){
				$("#accountError").html("用户账号已经存在！");
	  			//$("#account").select();
	  			//$("#account").bind("keyup",function (){if(event.keyCode!=13){$("#accountError").html("");}});
	  			return false;
			}
			
			if(!accountReg.test($("#account").val())){
				$("#accountError").html("用户账号填写不正确！");
	  			$("#account").select();
	  			$("#account").bind("keyup",function (){if(event.keyCode!=13){$("#accountError").html("");}});
	  			return false;
			}
			
		
			if(nullReg.test($("#password1").val())){
				$("#password1Error").html("用户密码必须填写！");
	  			$("#password1").select();
	  			$("#password1").bind("keyup",function (){if(event.keyCode!=13){$("#password1Error").html("");}});
	  			return false;
			}
			if(!accountReg.test($("#password1").val())){
				$("#password1Error").html("用户密码填写不正确！");
	  			$("#password1").select();
	  			$("#password1").bind("keyup",function (){if(event.keyCode!=13){$("#password1Error").html("");}});
	  			return false;
			}
			if(nullReg.test($("#password2").val())){
				$("#password2Error").html("重复输入密码必须填写！");
	  			$("#password2").select();
	  			$("#password2").bind("keyup",function (){if(event.keyCode!=13){$("#password2Error").html("");}});
	  			return false;
			}
	
			if(!($("#password1").val() == $("#password2").val())){
				$("#password2Error").html("两次密码输入不一致，请重新输入！");
	  			$("#password1").val("");
	  			$("#password2").val("");
	  			$("#password1").select();
	  			$("#password1").bind("keyup",function (){if(event.keyCode!=13){$("#password2Error").html("");}});
				return false;
			}
			if(!nullReg.test($("#tel").val())){
				if(!telReg1.test($("#tel").val())){
					$("#telError").html("电话填写不正确！");
		  			$("#tel").select();
		  			$("#tel").bind("keyup",function (){if(event.keyCode!=13){$("#telError").html("");}});
		  			return false;
				}
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
		<form  name="myform"  method="post" action="<%=request.getContextPath()%>/user/add.action" >
			<input type="hidden" name="acid" id="acid" value="">
			<table align="center" class="table" border="1" width="100%" cellspacing="1" style="border-collapse:collapse;">
				<tr>
					<td class="edit_Title">
						<img src="../images/xiushi_04.gif" width="13" height="13">
						<font style="font-weight:bold;font-size:13">用户新增</font>
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
						用户姓名
					</td>
					<td class="content_L" width="60%">
						<input type="text"  name="sysUser.userName" id="userName" maxlength="10" style="width:95%" class="f_input"><font  color="red" title="必填项">*</font><br>
						只允许填写中文、和英文字母<br>
						<font color="red" ><span id="userNameError"></span></font>

					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						用户账号
					</td>
					<td class="content_L" width="60%">
						<input type="text"  name="sysUser.account" id="account" maxlength="16" style="width:95%" class="f_input"  onchange="set()"><font color="red" title="必填项">*</font><br>
						6-16位之间，请用英文字母、数字、和下划线组成，不区分大小写<br><font color="red" ><span id="accountError"></span></font>
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						用户密码
					</td>
					<td class="content_L"  width="60%">
						<input type="password"  name="sysUser.password" id="password1" maxlength="16" style="width:95%" class="f_input"><font  color="red"title="必填项">*</font><br>
						6-16位之间，请用英文字母、数字、和下划线组成，不区分大小写<br><font color="red" ><span id="password1Error"></span></font>
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						重复输入密码
					</td>
					<td class="content_L"  width="60%">
						<input type="password"  id="password2" maxlength="16" style="width:95%" class="f_input"><font  color="red"title="必填项">*</font><br>
						两次密码输入需要一致<font color="red" ><span id="password2Error"></span></font>
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						电话
					</td>
					<td class="content_L"  width="60%">
						<input type="text"  name="sysUser.tel" id="tel" maxlength="15" style="width:95%" class="f_input"><br>
						<font color="red" ><span id="telError"></span></font>
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						失效时间
					</td>
					<td class="content_L"  width="60%">
						<input type="text"  onclick="setday(this,document.all.expireTime,'yyyy-MM-dd')" name="expireTime" value="" readonly="readonly" id="purchasing_date" maxlength="20" style="width:95%" class="f_input">
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						管理专业
					</td>
					<td class="content_L"  width="60%">
						<select name="sysUser.specialty.id" id="specialty"  style="width: 95%;" class="f_select" >
						<option value="0">全部专业</option>
							<c:forEach items="${specialtys}" var="s">
								<option value="${s.id}">${s.name}</option>
							</c:forEach>	
						</select>
						<br><font color="red"><span id="specialtyError"></span></font>
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						备注
					</td>
					<td class="content_L"  width="60%">
						<textarea  name="sysUser.remark" style="width:95%" id="remark" onblur="check()" class="f_textarea" rows="5" cols="50"></textarea><br>
						<font color="red" ><span id="remarkError"></span></font>
					</td>
						
				</tr>
			</table>
</form>
</body>

</html>
