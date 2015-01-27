<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../pub/taglib.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>查看用户</title>
		<link href="<%=request.getContextPath() %>/css/methodfish.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="<%=request.getContextPath() %>/js/public.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script language="javascript" src="<%=request.getContextPath()%>/js/calender.js"></script>
	<script language=javascript type="text/javascript">
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
		<form  name="myform"  method="post" action="<%=request.getContextPath()%>/user/updateExpireTime.action" >
			<table align="center" class="table" border="1"  cellspacing="1" width="100%" style="border-collapse:collapse;">
				<tr>
					<td class="edit_Title">
						<img src="../images/xiushi_04.gif" width="13" height="13">
						<font style="font-weight:bold;font-size:13">查看用户</font>
					</td>
					<td align="right" width="50%">
						<c:if test="${xy:hasPermission(user.id,'user',2)}">
						<input type="button" id="MLKZ_BaoCun"  class="f_btn01" onClick="checkForm()" value="保存">
						</c:if>
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
						<input type="text"  name="sysUser.userName" id="userName" value="<s:property value="#request.sysUser.userName"/>" maxlength="10" style="width:95%" class="f_input">
						<input type="hidden" name="sysUser.id" value="<s:property value="#request.sysUser.id"/>">

					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						用户账号
					</td>
					<td class="content_L" width="60%">
						<input type="text"  name="sysUser.account" value="<s:property value="#request.sysUser.account"/>" readonly id="account" maxlength="16" style="width:95%" class="f_input">
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						电话
					</td>
					<td class="content_L"  width="60%">
						<input type="text"  id="tel" name="sysUser.tel" value="<s:property value="#request.sysUser.tel"/>" maxlength="15" style="width:95%" class="f_input">
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						创建时间
					</td>
					<td class="content_L"  width="60%">
					
					<input type="text"  name="createTime" value="<fmt:formatDate value="${sysUser.createTime }" pattern="yyyy-MM-dd"/>" readonly="readonly"  maxlength="20" style="width:95%" class="f_input">
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						失效时间
					</td>
					<td class="content_L"  width="60%">
					<input type="text"  onclick="setday(this,document.all.expireTime,'yyyy-MM-dd')" name="expireTime" value="<fmt:formatDate value="${sysUser.expireTime}" pattern="yyyy-MM-dd"/>" readonly="readonly"  maxlength="20" style="width:95%" class="f_input">
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						管理专业
					</td>
					<td class="content_L"  width="60%">
						<select name="sysUser.specialty.id" id="specialty"  style="width: 95%;" class="f_select" >
							<option value="0">全部专业</option>
							<c:forEach items="${specialtys}" var="specialtys">
								<c:choose>
									<c:when test="${!empty sysUser.specialty && specialtys.id==sysUser.specialty.id}">
										<option value="${specialtys.id}" selected="selected">${specialtys.name}</option>
									</c:when>
									<c:otherwise>
										<option value="${specialtys.id}">${specialtys.name}</option>
									</c:otherwise>
								</c:choose>
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
						<textarea  name="sysUser.remark" style="width:95%" id="remark" onblur="check()" class="f_textarea" rows="5" cols="50"><s:property value="#request.sysUser.remark"/></textarea>
					</td>
						
				</tr>
			</table>
</form>
</body>

</html>
