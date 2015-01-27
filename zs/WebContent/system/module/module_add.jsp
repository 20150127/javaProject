<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../pub/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>模块新增</title>
	    <link href="<%=request.getContextPath() %>/css/methodfish.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/public.js"></script>
		<script language=javascript type="text/javascript">
		function checkForm(){
		var nullReg = /^\s*$/;
		var telReg1=/^(\d{3,4}-\d{7,8})|(1\d{10})$/;
		var reg = /^([\u4E00-\u9FA5]|[\uFE30-\uFFA0]|[a-zA-Z])*$/; 
		var snreg=/^[a-zA-Z0-9]*$/; 
		var numreg=/^\d+$/;
		var urlreg = /^[a-zA-Z0-9\.\/]*$/;
		if(nullReg.test($("#moduleName").val())){
			$("#moduleNameError").html("模块名称必须填写！");
  			$("#moduleName").select();
  			$("#moduleName").bind("keyup",function (){if(event.keyCode!=13){$("#moduleNameError").html("");}});
  			return false;
		}
		if(!reg.test($("#moduleName").val())){
			$("#moduleNameError").html("模块名称填写不正确！");
  			$("#moduleName").select();
  			$("#moduleName").bind("keyup",function (){if(event.keyCode!=13){$("#moduleNameError").html("");}});
  			return false;
		}
		if(nullReg.test($("#sn").val())){
			$("#snError").html("唯一标示必须填写！");
  			$("#sn").select();
  			$("#sn").bind("keyup",function (){if(event.keyCode!=13){$("#snError").html("");}});
  			return false;
		}
		if(!snreg.test($("#sn").val())){
			$("#snError").html("唯一标示填写不正确！");
  			$("#sn").select();
  			$("#sn").bind("keyup",function (){if(event.keyCode!=13){$("#snError").html("");}});
  			return false;
		}
		if(nullReg.test($("#pmoduleName").val())){
			$("#pmoduleNameError").html("上级模块必须填写！");
  			$("#xz").bind("click",function (){$("#pmoduleNameError").html("")});
  			return false;
		}
		if(nullReg.test($("#orderId").val())){
			$("#orderIdError").html("排序号必须填写！");
  			$("#orderId").select();
  			$("#orderId").bind("keyup",function (){if(event.keyCode!=13){$("#orderIdError").html("");}});
  			return false;
		}
		if(!numreg.test($("#orderId").val())){
			$("#orderIdError").html("排序号只能填写数字！");
  			$("#orderId").select();
  			$("#orderId").bind("keyup",function (){if(event.keyCode!=13){$("#orderIdError").html("");}});
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
		<form  name="myform"  method="post" action="<%=request.getContextPath()%>/module/add.action" >
			<table align="center" class="table" border="1" width="100%" style="border-collapse:collapse;">
				<tr>
					<td class="edit_Title">
						<img src="<%=request.getContextPath()%>/images/xiushi_04.gif" width="13" height="13">
						<font style="font-weight:bold;font-size:13">模块新增</font>
					</td>
					<td align="right" width="50%">
						<c:if test="${xy:hasPermission(user.id,'module',0)}">
						<input type="button" id="MLKZ_BaoCun"  class="f_btn01" onClick="checkForm()" value="保存">
						</c:if>
						<input type="button" id="MLKZ_GuanBi"  class="f_btn01" onClick=" if(!confirm('确定离开本页面吗？')) return false;window.close();" value="关闭">
					</td>
				</tr>
			</table>
			<table align="center" class="table" border="1" width="100%" style="border-collapse:collapse;">
				<tr>
					<td width="20%" class="title" align="center">
						模块名称
					</td>
					<td class="content_L" width="60%">
						<input type="text"  name="sysModule.sysModuleName" id="moduleName" maxlength="20" style="width:95%" class="f_input"><font  color="red" title="必填项">*</font><br>
						只允许填写中文、和英文字母<br>
						<font color="red" ><span id="moduleNameError"></span></font>

					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						唯一标示
					</td>
					<td class="content_L" width="60%">
						<input type="text"  name="sysModule.sn" id="sn" maxlength="20" style="width:95%" class="f_input"><font  color="red" title="必填项">*</font><br>
						只允许填写英文字母和数字<br>
						<font color="red" ><span id="snError"></span></font>

					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						上级模块
					</td>
					<td class="content_L" width="60%">
						<input type="text"  readonly  id="pmoduleName" name="sysModule.parentModule.sysModuleName" maxlength="10" style="width:88%" value="顶级模块" class="f_input"><input type="hidden"  name="sysModule.parentModule.id" id="moduleId"><input type="button" id="xz" value="选择" class="f_btn01" onclick="openWin('<%=request.getContextPath() %>/module/selectList.action','选择上级模块',800,500,1);"><font  color="red" title="必填项">*</font><br>默认为顶级模块



						<font color="red" ><span id="pmoduleNameError"></span></font>

					</td>
				</tr>
			
				<tr>
					<td width="20%" class="title" align="center">
						排序号
					</td>
					<td class="content_L" width="60%">
						<input type="text"  name="sysModule.orderId" id="orderId" maxlength="10" style="width:95%" class="f_input"><font  color="red" title="必填项">*</font><br>
						同一层次的排列顺序（阿拉伯数字）<br>
						<font color="red" ><span id="orderIdError"></span></font>

					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						备注
					</td>
					<td class="content_L"  width="60%">
						<textarea  name="sysModule.remark" style="width:95%" id="remark" onblur="check()" class="f_textarea" rows="5" cols="50"></textarea><br>
						<font color="red" ><span id="remarkError"></span></font>
					</td>
						
				</tr>
			</table>
</form>
</body>

</html>
