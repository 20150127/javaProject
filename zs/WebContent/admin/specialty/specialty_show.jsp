<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../pub/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
		<title>专业查看</title>
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
			var specialtyId = $("#specialtyId").val();
			specialtyService.findBycodeAndId(specialtycode,specialtyId,function(data){
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
		var numReg =/^\+?[1-9][0-9]*$/;
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
		
		return true;
	}
	
</script>
</head>
	<body class="middlebody">
		<form  method="post" action="<%=request.getContextPath() %>/specialty/update.action" onsubmit="return checkForm();">
			<input type="hidden" name="specialty.id" value="${specialty.id }" id="specialtyId">
			<table align="center" class="table" border="1" width="100%" cellspacing="1"
				style="border-collapse: collapse;">
				<tr>
					<td class="content_L">
					<div align="left" style="float: left;width: 50%;">
						<img src="<%=request.getContextPath() %>/images/xiushi_04.gif" width="13" height="13"><b>专业查看</b>
					</div>
					<div  align="right">
						<c:if test="${xy:hasPermission(user.id,'specialty',2)}">
						<input type="submit" id="MLKZ_BaoCun" name="MLKZ_BaoCun" class="f_btn01"  value="保存">
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
						专业编码<font  color="red" title="必填项">*</font>
					</td>
					<td class="content_L" width="60%">
						<input type="text"  name="specialty.code" id="specialtycode" value="${specialty.code }" maxlength="40" style="width:90%" class="f_input" onblur="checkAccount()" title="专业编码"><br>
						<font color="red" ><span id="specialtycodeError"></span></font>
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						专业名称<font  color="red" title="必填项">*</font>
					</td>
					<td class="content_L" width="60%">
						<input type="text"  name="specialty.name" id="specialtyName" value="${specialty.name }" maxlength="40" style="width:90%" class="f_input" title="专业名称"><br>
						<font color="red" ><span id="specialtyNameError"></span></font>
					</td>
				</tr>
				
				
			</table>
</form>
</body>

</html>
