<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../pub/taglib.jsp"%> 

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>域值修改</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <link href="<%=request.getContextPath() %>/css/methodfish.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script language="javascript" src="<%=request.getContextPath() %>/js/public.js"></script>
		<script language=javascript type="text/javascript">
	function checkForm(){
		var nullReg = /^\s*$/;
		if(nullReg.test($("#valueName").val())){
			$("#valueNameError").html("域值未填写！");
  			$("#valueName").select();
  			$("#valueName").bind("keyup",function (){if(event.keyCode!=13){$("#valueNameError").html("");}});
  			return false;
		}
		
		if(($("#remark").val()).length >2000) {
			$("#remarkError").html("输入的备注超过规定长度！");
			return false;		
		}

		return true;
	}
	
</script>
</head>
	<body>
		<form  method="post" action="<%=request.getContextPath() %>/domain/updateValue.action" onsubmit="return checkForm();">
			<table align="center" class="table" border="1" width="100%" style="border-collapse:collapse;">
				<tr>
					<td class="edit_Title">
						<img src="<%=request.getContextPath() %>/images/xiushi_04.gif" width="13" height="13">
						<font style="font-weight:bold;font-size:12px;">域值修改</font>
					</td>
					<td align="right" width="50%">
				
						<input type="submit" id="MLKZ_BaoCun" name="MLKZ_BaoCun" class="f_btn01"  value="保存">
				
						<input type="hidden" name="domainValue.domain.id" value="${domainValue.domain.id }">
						<input type="hidden" name="domainValue.id" value="${domainValue.id}">
						<input type="button" id="MLKZ_GuanBi" name="MLKZ_GuanBi" class="f_btn01" onClick=" if(!confirm('确定离开本页面吗？')) return false;window.close();" value="关闭">
					</td>
				</tr>
			</table>
			<table align="center" class="table" border="1" width="100%" style="border-collapse:collapse;">
				<tr>
					<td width="20%" class="title" align="center">
						域值
					</td>
					<td class="content_L" width="60%">
						<input type="text"  name="domainValue.valueName" value="${domainValue.valueName }" id="valueName" maxlength="30" style="width:95%" class="f_input" title="域值"><font  color="red" title="必填项">*</font><br>
						<font color="red" ><span id="valueNameError"></span></font>
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						备注
					</td>
					<td class="content_L"  width="60%">
						<textarea  name="domainValue.remark" style="width:95%" id="remark" onblur="check()" class="f_textarea" rows="5" cols="50">${domainValue.remark }</textarea><br>
						<font color="red" ><span id="remarkError"></span></font>
					</td>
				</tr>
			</table>
</form>
</body>

</html>
