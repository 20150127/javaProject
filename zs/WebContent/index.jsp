<%@ page language="java"  pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>北京青年政治学院自主招生系统后台</title>
<link href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/public.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script language="javascript">
		function doValidate(){
			var nullReg=/^\s*$/;	
			//str.replace(/[\s　]/g, "");
			var name=$("#loginName").val().replace(/[\s　]/g, "");
			var pwd=$("#loginPwd").val().replace(/[\s　]/g, "");
			if(nullReg.test(name)){
				$("#loginNameError").html("请输入用户名!");
				$("#loginName").select();
				$("#loginName").bind("keyup",function(){if(event.keyCode!=13){$("#loginNameError").html("");}});
				return false;
			}
			if(nullReg.test(pwd)){
				$("#passwordError").html("请输入密码!");
				$("#loginPwd").select();
				$("#loginPwd").bind("keyup",function(){if(event.keyCode!=13){$("#passwordError").html("");}});
				return false;
			}
			return true;
			
		}
		function submited(){		
			if(doValidate()){
				document.form1.submit();
			}
		}
		function reset1(){
			$("#loginName").html("");
			$("#loginPwd").html("");
		}	
		$(function(){
			if(${not empty  message}){
				alert('${message}');
			}
		});
		
	</script>
</head>

<body text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="<%=request.getContextPath()%>/images/bg.jpg">

<form name="form1" method="post" action="<%=request.getContextPath() %>/login/login.action">
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td align="center" valign="middle">
   
    <table width="746" height="400" border="0" cellspacing="0" cellpadding="0" background="<%=request.getContextPath() %>/images/d.jpg" style="margin-top:80px;">
  <tr>
    <td width="308" align="right">
    <table width="100" border="0" cellspacing="0" cellpadding="0" style="margin-top:18px;">
  <tr>
    <td><img src="<%=request.getContextPath()%>/images/yh.jpg" /></td>
    <td><input type="text" id="loginName"  name="loginName" style="background:url(<%=request.getContextPath()%>/images/bg1.jpg); border-top:none; border-bottom:none; border-left:none; border-right:none; width:146px; height:29px;" />
		<font color="red" size="2px" ><span id="loginNameError"></span></font>
	</td>
  </tr>
  <tr>
    <td colspan="2" height="8"></td>
    </tr>
  <tr>
    <td><img src="<%=request.getContextPath()%>/images/yh1.jpg" width="87" height="29" /></td>
    <td><input type="password" name="loginPwd" id="loginPwd"  style="background:url(<%=request.getContextPath()%>/images/bg1.gif); border-top:none; border-bottom:none; border-left:none; border-right:none; width:146px; height:28px;"/>
		<font color="red" size="2px"><span id="passwordError"></span></font>
	</td>
  </tr>
</table>

    </td>
    <td width="85" align="left" valign="middle">
    <table border="0" cellspacing="0" cellpadding="0" style="margin-top:18px; margin-left:12px;">
  <tr>
    <td><input name="imageField" type="image" onclick="submited()" src="<%=request.getContextPath()%>/images/dd.gif" width="73" " height="66" border="0"></td>
  </tr>
</table>

    </td>
    <td width="353">&nbsp;</td>
  </tr>
</table>
    </td>
  </tr>
</table>
</form>
</body>
</html>
