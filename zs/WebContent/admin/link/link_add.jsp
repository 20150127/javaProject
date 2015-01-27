<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../pub/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>报考指南新增</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <link href="<%=request.getContextPath() %>/css/methodfish.css" rel="stylesheet" type="text/css">
		<link href="<%=request.getContextPath() %>/css/calendar_tas.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="<%=request.getContextPath()%>/dwr/engine.js"></script>
		<script language="javascript" src="<%=request.getContextPath()%>/dwr/util.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script language="javascript" src="<%=request.getContextPath()%>/dwr/interface/specialtyService.js"></script>
		<script language="javascript" src="<%=request.getContextPath() %>/js/public.js"></script>
		<script language=javascript type="text/javascript">
	function checkForm(){
		var nullReg = /^\s*$/;
		var accountReg = /^\w{6,16}$/;
		var numReg = /^\+?[1-9][0-9]*$/;
		var reg = /^([\u4E00-\u9FA5]|[\uFE30-\uFFA0]|[a-zA-Z])*$/;
		var snreg=/^[a-zA-Z0-9]*$/;
		
		if(nullReg.test($("#pxh").val())){
			$("#pxhError").html("排序号必须填写！");
  			$("#pxh").select();
  			$("#pxh").bind("keyup",function (){if(event.keyCode!=13){$("#pxhError").html("");}});
  			return false;
		}
		if(!nullReg.test($("#pxh").val())){
			if(!numReg.test($("#pxh").val())){
				$("#pxhError").html("排序号只允许填写正整数！");
	  			$("#pxh").select();
	  			$("#pxh").bind("keyup",function (){if(event.keyCode!=13){$("#pxhError").html("");}});
	  			return false;
			}
		}
		if(nullReg.test($("#title").val())){
			$("#titleError").html("名称必须填写！");
  			$("#title").select();
  			$("#title").bind("keyup",function (){if(event.keyCode!=13){$("#titleError").html("");}});
  			return false;
		}
		if(nullReg.test($("#path").val())){
			$("#pathError").html("链接网址必须填写！");
  			$("#path").select();
  			$("#path").bind("keyup",function (){if(event.keyCode!=13){$("#pathError").html("");}});
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
	<body class="middlebody">
		<form  name="myform"  method="post" action="<%=request.getContextPath() %>/link/add.action">
			<table align="center" class="table" border="1" width="100%"
				style="border-collapse: collapse;">
				<tr>
					<td class="edit_Title">
						<img src="<%=request.getContextPath() %>/images/xiushi_04.gif" width="13" height="13">
						<font style="font-weight:bold;font-size:13">新添报考指南</font>
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
						排序号<font  color="red" title="必填项">*</font>
					</td>
					<td class="content_L" width="60%">
						<input type="text"  name="link.pxh" id="pxh" maxlength="40" style="width:95%" class="f_input"  title="排序号">
						<br>
						<font color="red" ><span id="pxhError"></span></font>
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						名称<font  color="red" title="必填项">*</font>
					</td>
					<td class="content_L" width="60%">
						<input type="text"  name="link.title" id="title" maxlength="40" style="width:95%" class="f_input" title="名称">
						<br>
						<font color="red" ><span id="titleError"></span></font>
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						链接网址<font  color="red" title="必填项">*</font>
					</td>
					<td class="content_L" width="60%">
						<input type="text"  name="link.path" id="path" maxlength="100" style="width:95%" class="f_input" title="链接网址">
						<br>
						<font color="red" ><span id="pathError"></span></font>
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						备注
					</td>
					<td class="content_L" width="80%" colspan="3">
						<textarea  name="link.remark" style="width:95%" id="remark" onblur="check()" class="f_textarea" rows="5" cols="20" title="备注"></textarea>
						<font color="red" ><span id="remarkError"></span></font>
					</td>
				</tr>
				
			</table>
</form>
</body>

</html>
