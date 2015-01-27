<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../pub/taglib.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>设置系统变量</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="<%=path%>/css/methodfish.css" rel="stylesheet"
			type="text/css">
		<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
		<script language="javascript" src="<%=path%>/js/public.js"></script>
		<script type="text/javascript">
	function checkForm() {
		var reg = /^\s*$/;
		for(var i=1;i<12;i++){
			if(reg.test($("#filed"+i).val())){
				$("#filed"+i+"Error").html($("#filed"+i).attr("title")+"不能为空！");
				$("#filed"+i).select();
				$("#filed"+i).bind("keyup",function (){if(event.keyCode!=13){$("#filed"+i+"Error").html("");}});
				return false;
			}
		}
		return true;
	}
</script>
	</head>
	<body>
		<form action="<%=path%>/sysVar/update.action"
			onsubmit="return checkForm();" method="post">
			<input type="hidden" name="o.id" value="${o.id }" />
			<table align="center" class="table" border="1" width="70%"
				style="border-collapse: collapse;">
				<tr>
					<td width="20%" class="title" align="right">
						报名时间:&nbsp;&nbsp;
					</td>
					<td class="content_L" width="60%">
						<input type="text" name="o.registerTitle" id="filed10"
							value="${o.registerTitle}" maxlength="30" style="width: 95%"
							class="f_input" title="报名时间">
						<font color="red">*</font>
						<font color="red"><span id="filed10Error"></span>
						</font>
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="right">
						准考证号头:&nbsp;&nbsp;
					</td>
					<td class="content_L" width="60%">
						<input type="text" name="o.admissionHead" id="filed1"
							value="${o.admissionHead}"
							onkeyup="value=value.replace(/\D/g,'')" maxlength="40"
							style="width: 95%" class="f_input" title="准考证号头">
						<font color="red">*<span id="one"></span>
						</font>
						<font color="red"><span id="filed1Error"></span>
						</font>
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="right">
						当前考场号:&nbsp;&nbsp;
					</td>
					<td class="content_L" width="60%">
						<input type="text" name="o.roomNum" id="filed2"
							value="${o.roomNum}" maxlength="10" style="width: 95%"
							class="f_input" title="当前考场号"
							onkeyup="value=value.replace(/\D/g,'')">
						<font color="red">*</font>
						<font color="red"><span id="filed2Error"></span>
						</font>
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="right">
						座号(1-${o.pcount}):&nbsp;&nbsp;
					</td>
					<td class="content_L" width="60%">
						<input type="text" name="o.roomId" id="filed3" value="${o.roomId}"
							maxlength="10" style="width: 95%" class="f_input"
							title="当前考场序号(1-${o.pcount})" onkeyup="value=value.replace(/\D/g,'')">
						<font color="red">*</font>
						<font color="red"><span id="filed3Error"></span>
						</font>
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="right">
						每个考场的人数:&nbsp;&nbsp;
					</td>
					<td class="content_L" width="60%">
						<input type="text" name="o.pcount" id="filed4" value="${o.pcount}"
							maxlength="10" style="width: 95%" class="f_input" title="每个考场的人数"
							onkeyup="value=value.replace(/\D/g,'')">
						<font color="red">*</font>
						<font color="red"><span id="filed4Error"></span>
						</font>
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="right">
						笔试时间:&nbsp;&nbsp;
					</td>
					<td class="content_L" width="60%">
						<input type="text" name="o.examDate" id="filed7"
							value="${o.examDate}" maxlength="30" style="width: 95%"
							class="f_input" title="笔试时间">
						<font color="red">*</font>
						<font color="red"><span id="filed7Error"></span>
						</font>
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="right">
						复试时间设置:&nbsp;&nbsp;
					</td>
					<td class="content_L" width="60%">
						<input type="text" name="o.retestsDate" id="filed8"
							value="${o.retestsDate}" maxlength="30" style="width: 95%"
							class="f_input" title="复试时间设置">
						<font color="red">*</font>
						<font color="red"><span id="filed8Error"></span>
						</font>
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="right">
						笔试、复试地点:&nbsp;&nbsp;
					</td>
					<td class="content_L" width="60%">
						<input type="text" name="o.retestsAddress" id="filed9"
							value="${o.retestsAddress}" maxlength="30" style="width: 95%"
							class="f_input" title="笔试、复试地点">
						<font color="red">*</font>
						<font color="red"><span id="filed9Error"></span>
						</font>
					</td>
				</tr>
				
				<tr>
					<td width="20%" class="title" align="right">
						准考证表头:&nbsp;&nbsp;
					</td>
					<td class="content_L" width="60%">
						<input type="text" name="o.admissionTitle" id="filed11"
							value="${o.admissionTitle}" maxlength="30" style="width: 95%"
							class="f_input" title="准考证表头">
						<font color="red">*</font>
						<font color="red"><span id="filed11Error"></span>
						</font>
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="right">
						发放录取通知书时间:&nbsp;&nbsp;
					</td>
					<td class="content_L" width="60%">
						<input type="text" name="o.issueDate" id="filed6"
							value="${o.issueDate}" maxlength="30" style="width: 95%"
							class="f_input" title="发放录取通知书时间">
						<font color="red">*</font>
						<font color="red"><span id="filed6Error"></span>
						</font>
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="right">
						到校报到时间:&nbsp;&nbsp;
					</td>
					<td class="content_L" width="60%">
						<input type="text" name="o.registerDate" id="filed5"
							value="${o.registerDate}" maxlength="30" style="width: 95%"
							class="f_input" title="到校报道时间">
						<font color="red">*</font>
						<font color="red"><span id="filed5Error"></span>
						</font>
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="right">
						登录开关:&nbsp;&nbsp;
					</td>
					<td class="content_L" width="60%">
						<c:choose>
							<c:when test="${o.ifLogin eq 1}">
								<label for="ifLogin1">
									<input type="radio" value="1" name="o.ifLogin" id="ifLogin1" checked="checked"/>允许
								</label>
								&nbsp;&nbsp;
								<label for="ifLogin2">
									<input type="radio" value="0" name="o.ifLogin" id="ifLogin2"/>禁止
								</label>
							</c:when>
							<c:otherwise>
								<label for="ifLogin1">
									<input type="radio" value="1" name="o.ifLogin" id="ifLogin1"/>允许
								</label>
								&nbsp;&nbsp;
								<label for="ifLogin2">
									<input type="radio" value="0" name="o.ifLogin" id="ifLogin2" checked="checked"/>禁止
								</label>
							</c:otherwise>
						</c:choose>
						
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="right">
						注册开关:&nbsp;&nbsp;
					</td>
					<td class="content_L" width="60%">
						<c:choose>
							<c:when test="${o.ifReg eq 1}">
								<label for="ifReg1">
									<input type="radio" value="1" name="o.ifReg" id="ifReg1" checked="checked"/>允许
								</label>
								&nbsp;&nbsp;
								<label for="ifReg2">
									<input type="radio" value="0" name="o.ifReg" id="ifReg2"/>禁止
								</label>
							</c:when>
							<c:otherwise>
								<label for="ifReg1">
									<input type="radio" value="1" name="o.ifReg" id="ifReg1"/>允许
								</label>
								&nbsp;&nbsp;
								<label for="ifReg2">
									<input type="radio" value="0" name="o.ifReg" id="ifReg2" checked="checked"/>禁止
								</label>
							</c:otherwise>
						</c:choose>		
					</td>
				</tr>
<tr>
					<td width="20%" class="title" align="right">
						初试开关:&nbsp;&nbsp;
					</td>
					<td class="content_L" width="60%">
						<c:choose>
							<c:when test="${o.ifPreliminary eq 1}">
								<label for="ifPreliminary1">
									<input type="radio" value="1" name="o.ifPreliminary" id="ifPreliminary1" checked="checked"/>允许
								</label>
								&nbsp;&nbsp;
								<label for="ifPreliminary2">
									<input type="radio" value="0" name="o.ifPreliminary" id="ifPreliminary2"/>禁止
								</label>
							</c:when>
							<c:otherwise>
								<label for="ifPreliminary1">
									<input type="radio" value="1" name="o.ifPreliminary" id="ifPreliminary1"/>允许
								</label>
								&nbsp;&nbsp;
								<label for="ifPreliminary2">
									<input type="radio" value="0" name="o.ifPreliminary" id="ifPreliminary2" checked="checked"/>禁止
								</label>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
<tr>
					<td width="20%" class="title" align="right">
						复试开关:&nbsp;&nbsp;
					</td>
					<td class="content_L" width="60%">
						<c:choose>
							<c:when test="${o.ifRetrial eq 1}">
								<label for="ifRetrial1">
									<input type="radio" value="1" name="o.ifRetrial" id="ifRetrial1" checked="checked"/>允许
								</label>
								&nbsp;&nbsp;
								<label for="ifRetrial2">
									<input type="radio" value="0" name="o.ifRetrial" id="ifRetrial2"/>禁止
								</label>
							</c:when>
							<c:otherwise>
								<label for="ifRetrial1">
									<input type="radio" value="1" name="o.ifRetrial" id="ifRetrial1"/>允许
								</label>
								&nbsp;&nbsp;
								<label for="ifRetrial2">
									<input type="radio" value="0" name="o.ifRetrial" id="ifRetrial2"  checked="checked"/>禁止
								</label>
							</c:otherwise>
						</c:choose>
						
					</td>
				</tr>
				<tr>
					<td class="content_L" colspan="2" align="center">
						<c:if test="${xy:hasPermission(user.id,'sysVariable',2)}">
						<input type="submit" value="提交" class="f_btn01" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" value="重置" class="f_btn01" />
						</c:if>
						
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
