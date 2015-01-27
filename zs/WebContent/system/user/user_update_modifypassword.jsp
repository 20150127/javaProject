<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../pub/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>密码修改</title>
<link href="<%=request.getContextPath() %>/css/methodfish.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/public.js"></script>
<script language=javascript type="text/javascript">
	function checkForm(){
		var nullReg = /^\s*$/;
		if(nullReg.test($("#old_pwd").val())){
			$("#oldError").html("旧密码必须填写！");
  			$("#old_pwd").select();
  			$("#old_pwd").bind("keyup",function (){if(event.keyCode!=13){$("#oldError").html("");}});
  			return false;
		}

		if(!($("#oldpwd").val() == $("#old_pwd").val())){
			$("#oldError").html("旧密码错误！");
  			$("#old_pwd").select();
  			$("#old_pwd").bind("keyup",function (){if(event.keyCode!=13){$("#oldError").html("");}});
			return false;
		}

		if(nullReg.test($("#pwdone").val())){
			$("#oneError").html("请输入新密码！");
  			$("#pwdone").select();
  			$("#pwdone").bind("keyup",function (){if(event.keyCode!=13){$("#oneError").html("");}});
			return false;
		}

		if(nullReg.test($("#pwdtwo").val())){
			$("#twoError").html("再次输入新密码！");
  			$("#pwdtwo").select();
  			$("#pwdtwo").bind("keyup",function (){if(event.keyCode!=13){$("#twoError").html("");}});
			return false;
		}

		if(!($("#pwdone").val() == $("#pwdtwo").val())){
			$("#twoError").html("两次密码输入不一致，请重新输入！");
  			$("#pwdtwo").select();
  			$("#pwdtwo").bind("keyup",function (){if(event.keyCode!=13){$("#twoError").html("");}});
			return false;
		}
		return true;
	}

	$(function(){
		$("#closeWin").bind("click",function(){
			ymPrompt.alert({message:'确定退出修改吗？',autoClose:false,btn:[['是','yes'],['否','no']],handler:getNext});
		});
	});

	function getNext(tp){
		if(tp=='yes'){
			window.location.href="<%=request.getContextPath()%>/welcome.html;target=_self";
		} 
		if(tp=='no'){
			ymPrompt.close();
		}
	}
</script>
<head>
</head>
<body>
<br>
<form name="myform" method="post" action="<%=request.getContextPath()%>/user/updateUserMM.action" onSubmit="return checkForm();">
<input name="oldpwd" id="oldpwd" type="hidden" value="<s:property value="#session.user.password"/>">
<input name="sysUser.id" type="hidden" value="<s:property value="#session.user.id"/>">
<div class="table01" align="center">
  <table align="center" class="table" border="1" width="100%" style="border-collapse:collapse;">
    <tr class="edit_Title">
     	 <td class="content_L" colspan="2">
					<div align="left" style="float: left;width: 50%;">
						<img src="<%=request.getContextPath() %>/images/xiushi_04.gif" width="13" height="13"><b>修改密码</b>
					</div>
		</td>
    </tr>
    <tr>
      <td width="33%" align="right" class="content_L">输入旧密码：</td>
      <td width="66%" class="content_C" style="text-align:left"><input type="password" id="old_pwd" name="pass_old" value=""><font color="red"><font color="red">*<span id="oldError"></span></font></font></td>
    </tr>
	<tr>
      <td width="33%" align="right" class="content_L">输入新密码：</td>
      <td width="66%" class="content_C" style="text-align:left"><input type="password" id="pwdone" name="sysUser.password" value=""><font color="red">*<span id="oneError"></span></font></td>
    </tr>
	<tr>
      <td width="33%" align="right" class="content_L">再次输入新密码：</td>
      <td width="66%" class="content_C" style="text-align:left"><input type="password" id="pwdtwo"  value=""><font color="red">*<span id="twoError"></span></font></td>
    </tr>
  </table>
</div>
<br>
<div align="center"><span class="addRs"><input type="submit" class="f_btn01" value="保 存" /> <input type="button" class="f_btn01" value="关闭" onclick="if(!confirm('确定离开本页面吗？')) return false;window.close();"/></span>
</div>
</form>
</body>
</html>