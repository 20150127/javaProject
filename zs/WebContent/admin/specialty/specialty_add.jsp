<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../pub/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>专业新增</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <link href="<%=request.getContextPath() %>/css/methodfish.css" rel="stylesheet" type="text/css">
		<link href="<%=request.getContextPath() %>/css/calendar_tas.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="<%=request.getContextPath()%>/dwr/engine.js"></script>
		<script language="javascript" src="<%=request.getContextPath()%>/dwr/util.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script language="javascript" src="<%=request.getContextPath()%>/dwr/interface/specialtyService.js"></script>
		<script language="javascript" src="<%=request.getContextPath() %>/js/public.js"></script>
		<script language=javascript type="text/javascript">
		function checkAccount(){
			var specialtycode = $("#specialtycode").val();
			specialtyService.findBycodeAndId(specialtycode,0,function(data){
				if(data!=null){
					$("#specialtycodeError").html("专业编码已经存在！");
					$("#specialtycode").select();
		  			$("#specialtycode").bind("keyup",function (){if(event.keyCode!=13){$("#specialtycodeError").html("");}});
				}
			});
		}
		
	function checkForm(){
		var nullReg = /^\s*$/;
		var accountReg = /^\w{6,16}$/;
		var numReg = /^\+?[1-9][0-9]*$/;
		var reg = /^([\u4E00-\u9FA5]|[\uFE30-\uFFA0]|[a-zA-Z])*$/;
		var snreg=/^[a-zA-Z0-9]*$/;
		
		if(nullReg.test($("#specialtycode").val())){
			$("#specialtycodeError").html("专业编码必须填写！");
  			$("#specialtycode").select();
  			$("#specialtycode").bind("keyup",function (){if(event.keyCode!=13){$("#specialtycodeError").html("");}});
  			return false;
		}
		if(!nullReg.test($("#specialtycode").val())){
			if(!snreg.test($("#specialtycode").val())){
				$("#specialtycodeError").html("专业编码只允许填写英文字母和数字");
	  			$("#specialtycode").select();
	  			$("#specialtycode").bind("keyup",function (){if(event.keyCode!=13){$("#specialtycodeError").html("");}});
	  			return false;
			}
		}
		if(nullReg.test($("#specialtyName").val())){
			$("#specialtyNameError").html("专业名称必须填写！");
  			$("#specialtyName").select();
  			$("#specialtyName").bind("keyup",function (){if(event.keyCode!=13){$("#specialtyNameError").html("");}});
  			return false;
		}
		
		myform.submit();
	}
	
</script>
</head>
	<body class="middlebody">
		<form  name="myform"  method="post" action="<%=request.getContextPath() %>/specialty/add.action">
			<table align="center" class="table" border="1" width="100%"
				style="border-collapse: collapse;">
				<tr>
					<td class="edit_Title">
						<img src="<%=request.getContextPath() %>/images/xiushi_04.gif" width="13" height="13">
						<font style="font-weight:bold;font-size:13">新添专业</font>
					</td>
					<td class="edit_Title" align="right" width="50%">
						<input type="button" id="MLKZ_BaoCun" name="MLKZ_BaoCun" class="f_btn01"  value="保存" onclick="checkForm();">
						<input type="button" id="MLKZ_GuanBi" name="MLKZ_GuanBi" class="f_btn01" onClick=" if(!confirm('确定离开本页面吗？')) return false;window.close();" value="关闭">
					</td>
				</tr>
			</table>
			<table align="center" class="table" border="1" width="100%"
				style="border-collapse: collapse;">
				<tr>
					<td width="20%" class="title" align="center">
						专业编码<font  color="red" title="必填项">*</font>
					</td>
					<td class="content_L" width="60%">
						<input type="text"  name="specialty.code" id="specialtycode" maxlength="40" style="width:95%" class="f_input" onblur="checkAccount()" title="专业编码">
						<br>
						<font color="red" ><span id="specialtycodeError"></span></font>
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						专业名称<font  color="red" title="必填项">*</font>
					</td>
					<td class="content_L" width="60%">
						<input type="text"  name="specialty.name" id="specialtyName" maxlength="40" style="width:95%" class="f_input" title="专业名称">
						<br>
						<font color="red" ><span id="specialtyNameError"></span></font>
					</td>
				</tr>
				
				
			</table>
</form>
</body>

</html>
