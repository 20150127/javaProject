<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../pub/taglib.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>修改考生信息</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
		<script type='text/javascript'
			src='<%=path%>/dwr/interface/registerService.js'></script>
		<script type='text/javascript' src='<%=path%>/dwr/engine.js'></script>
		<style type="text/css">
<!--
.anjian {
	cursor: hand;
}

body,td,th {
	font-size: 12px;
}

body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(images/bg03.gif);
}

.bround {
	background-image: url(images/jxl.gif);
	background-repeat: no-repeat;
	background-position: left bottom;
}

.style1 {
	color: #FF0000
}
-->
</style>
<link href="<%=request.getContextPath()%>/css/methodfish.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">   
			  function CtoH(obj){ 
			　　var str=obj.value;
			　　var result="";
			　　for (var i = 0; i < str.length; i++){
			　　if (str.charCodeAt(i)==12288){
			　　　　result+= String.fromCharCode(str.charCodeAt(i)-12256);
			　　　　continue;
			　　　}
			　　　if (str.charCodeAt(i)>65280 && str.charCodeAt(i)<65375) result+= String.fromCharCode(str.charCodeAt(i)-65248);
			　　　else result+= String.fromCharCode(str.charCodeAt(i));
			　　}
			　　obj.value=result;
			　} 
			  <%--
				function checkIDCard(){
					var regNull = /^\s*$/;
					if(!regNull.test($("#IDCardNum").val())){
						registerService.findByIDCard($("#IDCardNum").val(),function(data){
							if(data){
								$("#cardtmp").val("yes");
								alert("该身份证号已经注册,请检查是否填错,否则请联系管理员!");
							}else{
								$("#cardtmp").val("");
							}
						});
					}else{
						alert("身份证号很重要，必须填写!");
					}
				}
--%>
				function checkExamNum() {
					var regNull = /^\s*$/;
					var oldNum = $("#sessionNum").val();
					if(!regNull.test($("#examineeNum").val())){
						if($("#sessionNum").val() != $("#examineeNum").val()){
							registerService.findByExamNum($("#examineeNum").val(),function(data){
								if(data){
									$("#numtmp").val("yes");
									alert("该考生号已经被注册，请检查是否填错，否则请联系管理员!");
								}else{
									$("#numtmp").val("");
								}
							});
						}
					}else{
						alert("考生号很重要，必须填写!！");
					}
				}
				
			function check(){
				var regNull = /^\s*$/;
				var birthday = /^\d{8}$/;
				//var cardNum = /^\d{14,17}[\dxX]$/;
				var cardNum = /^(([0-9]{14}[x0-9]{1})|([0-9]{17}[xX0-9]{1}))$/;
				var examineeNum = /^\d{14}$/;
				var hkkh = /^\d{11}$/;
				var graduationDate = /^\d{4}$/;
				var mobilePhone = /^1\d{10}$/;
				var postCode = /^\d{6}$/;
				var picReg = /^jpg$/;
				if(regNull.test($("#name").val())){
					alert("用户名不能为空");
					$("#name").select();
					return false;
				}
				  <%--
				if(!birthday.test($("#birthday").val())){
					alert("出生日期格式不合法,必须是8位数字,并符合年、月、日规范!");
					$("#birthday").select();
					return false;
				}
				if(!cardNum.test($("#IDCardNum").val())) {
					alert("身份证号只能是 15-18 位数字，或者最后一位为字母 x、X，并且不能为空!");
					$("#IDCardNum").select();
					return false;
				}
				if($("#cardtmp").val()=="yes"){
					alert("该身份证号已经注册,请检查是否填错,否则请联系管理员!");
					return false;
				}
				--%>
				if($("#numtmp").val()=="yes"){
					alert("该考生号已经被注册，请检查是否填错，否则请联系管理员!");
					return false;
				}
				
				if(!examineeNum.test($("#examineeNum").val())) {
					alert("考生号必须为 14 位数字,并且不能为空!");
					$("#examineeNum").select();
					return false;
				}
				//if(!hkkh.test($("#hkkh").val())) {
				//	alert("会考考号必须为11 位数字,并且不能为空!");
				//	$("#hkkh").select();
				//	return false;
				//}	
				if(regNull.test($("#school").val())){
					alert("所在学校不能为空！");
					$("#school").select();
					return false;
				}
				
				if(!graduationDate.test($("#graduationDate").val())){
					alert("毕业时间必须填写4位年份数字,并且不能为空!");
					$("#graduationDate").select();
					return false;
				}
				
				if(regNull.test($("#address").val())){
					alert("家庭住址不能为空");
					$("#address").select();
					return false;
				}
				if(regNull.test($("#street").val())){
					alert("户口所在街道不能为空");
					$("#street").select();
					return false;
				}

				if(regNull.test($("#homePhone").val())){
					alert("住址电话不能为空");
					$("#homePhone").select();
					return false;
				}

				if(!mobilePhone.test($("#mobilePhone").val())){
					alert("手机必须填写,必须以1开头,11位数字!");
					$("#mobilePhone").select();
					return false;
				}

				if(regNull.test($("#letterAddress").val())){
					alert("邮寄录取通知书地址不能为空");
					$("#letterAddress").select();
					return false;
				}
				if(regNull.test($("#letterName").val())){
					alert("收件人姓名不能为空");
					$("#letterName").select();
					return false;
				}

				if(regNull.test($("#linkPhone").val())){
					alert(" 联系电话不能为空");
					$("#linkPhone").select();
					return false;
				}
					
				if(!postCode.test($("#postCode").val())){
					alert("邮编不能为空，请填写6位数字!");
					$("#postCode").select();
					return false;
				}
				if($("#specialtyId2").val() == $("#specialtyId").val()){
					alert("报考专业第一志愿与报考专业第二志愿不能相同!");
					return false;
				}
			
				if(regNull.test($("#password").val())){
					alert(" 密码不能为空,且至少六位!.");
					$("#password").select();
					return false;
				}

				if($("#password").val().length < 6){
					alert(" 密码至少六位!.");
					$("#password").select();
					return false;
				}
				
				if($("#passwordConfirm").val() != $("#password").val()){
					alert("两次密码输入不一致，请重新输入!");
					return false;
				}
				
				if(regNull.test(document.myform.img.src.substring(document.myform.img.src.lastIndexOf("/")+1))){
					alert("照片不能为空!\n\n请填写jpg 格式的图片!,像素 120*150,大小不超过200K!");
					$("#upload").select();
					return false;
				}
				
				return true;
			}

			function showimg(){
				var picReg = /^jpg$/;
				var pic = new Image();
				pic.src = document.myform.file.value;
				if(!picReg.test(pic.src.substring(pic.src.lastIndexOf(".")+1))){
					alert("图片必须为jpg格式!!");
					document.myform.img.src="";
					return false;
				}else if(pic.width > 150){
					alert("图片宽度不能大于120像素!!");
					document.myform.img.src="";
					return false;
				}else if(pic.height > 150){
					alert("图片高度不能大于150像素!!");
					document.myform.img.src="";
					return false;
				}else if(pic.fileSize>200*1024){
				    alert("图片文件大小大于200KB!!");
				    document.myform.img.src="";
				    return false;
				}else{
					document.myform.img.src=document.myform.file.value;	
				}									
			}
		</script>
	</head>
	<body>
		<form name="myform" method="post"
			action="<%=path%>/examinee/update.action" enctype="multipart/form-data"
			onsubmit="return check();">

			<input type="hidden" id="cardtmp">
			<input type="hidden" id="numtmp">
			<input type="hidden" id="sessionNum" value="${o.examineeNum }">
			<table width="100%" height="1196" border="0" cellpadding="0"
				cellspacing="0" bgcolor="#FFFFFF" class="table">
				<tr>
					<td height="1196" align="center" valign="top" class="content_L">

						<strong><br> 下表中的信息如无特殊提示必须填写,所有数字必须使用半角输入,仔细阅读提示 .
						</strong>
						<br>
						<table width="73%" height="301" border="0" cellpadding="0"
							cellspacing="0" class="table">
							<tr>
								<td height="288" align="center" valign="top" class="content_L">
									<fieldset>
										<legend>
											<strong><strong>基本信息: </strong> </strong>
										</legend>
										<table width="544" height="271" border="0" cellpadding="0"
											cellspacing="0" class="table">
											<tr>
												<td width="14%" height="34" align="right" class="title">
													<strong> 姓名: </strong>
												</td>
												<td width="60%" height="34" align="left" class="content_L">
													<input name="o.name" type="text" id="name" size="14"
														maxlength="7" onkeyup="CtoH(this)" value="${o.name }">
													<span class="style1">** 与本人身份证、户口本姓名一致</span>
												</td>
												<td width="26%" rowspan="6" align="center" valign="middle">
													<table width="140" height="150" border="1" cellpadding="0"
														cellspacing="0" class="table">
														<tr>
															<td width="138" height="150" align="center"
																valign="middle" bordercolor="#FFFFFF" class="content_L">
																<img
																	src="<%=path%>/upload/${o.examineeNum}.jpg"
																	id="img" name="img" width="120" height="150">
																<input type="hidden" id="photo" value=""><br>
																<input type="file" name="file" style="width: 160px;" id="upload" onchange="showimg()"><br>
																<span class="style1"> 120*150 的jpg格式的图片,大小不超过200K!!</span>
															</td>
														</tr>
													</table>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 性别: </strong>
												</td>
												<td height="30" align="left" class="content_L">
													<select name="o.sex" id="sex">
														<c:forEach items="${xb}" var="xb">
															<c:choose>
																<c:when test="${xb.id eq o.sex}">
																	<option value="${xb.id}" selected="selected">
																		${xb.xbmc}
																	</option>
																</c:when>
																<c:otherwise>
																	<option value="${xb.id}">
																		${xb.xbmc}
																	</option>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</select>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 出生日期: </strong>
												</td>
												<td height="30" align="left" class="content_L">
													<input name="o.birthday" type="text" id="birthday" size="8"
														maxlength="8" onkeyup="CtoH(this)" value="${o.birthday }" readonly>
													<span class="style1">*与身份证号匹配不允许修改</span>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong>区县: </strong>
												</td>
												<td height="30" align="left" class="content_L">
													<select name="o.area" id="area">
														<c:forEach items="${dq}" var="dq">
															<c:choose>
																<c:when test="${dq.id eq o.area}">
																	<option value="${dq.id}" selected="selected">
																		${dq.dqmc}
																	</option>
																</c:when>
																<c:otherwise>
																	<option value="${dq.id}">
																		${dq.dqmc}
																	</option>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</select>
												</td>
											</tr>
											<tr>
												<td height="27" align="right" class="title">
													<strong> 政治面目: </strong>
												</td>
												<td height="27" align="left" class="content_L">
													<select name="o.politics" id="politics">
														<c:forEach items="${zzmm}" var="zzmm">
															<c:choose>
																<c:when test="${zzmm.id eq o.politics}">
																	<option value="${zzmm.id}" selected="selected">
																		${zzmm.zzmmmc}
																	</option>
																</c:when>
																<c:otherwise>
																	<option value="${zzmm.id}">
																		${zzmm.zzmmmc}
																	</option>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</select>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title" >
													<strong> 民族: </strong>
												</td>
												<td height="30" align="left" class="content_L" colspan="1">
													<select name="o.nationality" id="nationality">
														<c:forEach items="${mz}" var="mz">
															<c:choose>
																<c:when test="${mz.id eq o.nationality}">
																	<option value="${mz.id}" selected="selected">
																		${mz.mzmc}
																	</option>
																</c:when>
																<c:otherwise>
																	<option value="${mz.id}">
																		${mz.mzmc}
																	</option>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</select>
												</td>
												<!--
												<td align="left" class="content_L">
													 
														<input name="file" type="file" id="upload"
															onchange="showimg()">
													 		
												</td>
												-->
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong>身份证号: </strong>
												</td>
												<td height="30" colspan="2" align="left" class="content_L">
													<!-- 
													<input name="o.IDCardNum" type="text" id="IDCardNum"
														size="18" maxlength="18" onkeyup="CtoH(this)"
														onblur="checkIDCard()" value="${o.IDCardNum }">
													 -->
													${o.IDCardNum }
													<span class="style1">** 身份证号作为报名注册的账号,不能再修改!! (半角输入)</span>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 考生号: </strong>
												</td>
												<td height="30" colspan="2" align="left" class="content_L">
													<input name="o.examineeNum" type="text" id="examineeNum"
														size="16" maxlength="14" onkeyup="CtoH(this)" value="${o.examineeNum }" onblur="checkExamNum()">
													<span class="style1">** 请考生必须正确填写14位考生号，(半角输入) </span>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 会考考号: </strong>
												</td>
												<td height="30" colspan="2" align="left" class="content_L">
													<input name="o.hkkh" type="text" id="hkkh"
														size="16" maxlength="11" onkeyup="CtoH(this)" value="${o.hkkh}">
													<!--<span class="style1">** 请考生必须正确填写11位会考考号，(半角输入) </span>-->
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 考生类别: </strong>
												</td>
												<td height="30" colspan="2" align="left" class="content_L">
													<select name="o.examineeType" id="examineeType">
														<c:forEach items="${kslb}" var="kslb">
															<option value="${kslb.id}" <c:if test="${o.examineeType eq kslb.id}">selected</c:if>>
																${kslb.kslbmc }
															</option>
														</c:forEach>
													</select>
												</td>
											</tr>
										<tr>
											<td height="30" align="right" class="title">
												<strong> 考试类型: </strong>
											</td>
											<td height="30" colspan="2" align="left" class="content_L">
												<select name="o.kslx" id="kslx">
													<c:forEach items="${kslx}" var="kslx">
														<c:choose>
															<c:when test="${o.kslx eq kslx.id}">
																<option value="${kslx.id}" selected="selected">
																	${kslx.kslxmc }
																</option>
															</c:when>
															<c:otherwise>
																<option value="${kslx.id}">
																	${kslx.kslxmc }
																</option>
															</c:otherwise>
														</c:choose>	
														
													</c:forEach>
												</select>
											</td>
										</tr>
										</table>
									</fieldset>
								</td>
							</tr>
						</table>
						<br>
						<table width="73%" height="124" border="0" cellpadding="0"
							cellspacing="0" class="table">
							<tr>
								<td height="124" align="center" valign="top" class="content_L">
									<fieldset>
										<legend>
											<strong><strong> 在校信息:</strong> </strong>
										</legend>
										<table width="544" height="93" border="0" cellpadding="0"
											cellspacing="0" class="table">
											<tr>
												<td width="14%" height="30" align="right" class="title">
													<strong> 所在学校: </strong>
												</td>
												<td width="86%" height="30" align="left" class="content_L">
													<input name="o.school" type="text" id="school" size="18"
														maxlength="18" onkeyup="CtoH(this)" value="${o.school }">
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 毕业时间: </strong>
												</td>
												<td height="30" align="left" class="content_L">
													<input name="o.graduationDate" type="text"
														id="graduationDate" size="8" maxlength="4"
														onkeyup="CtoH(this)" value="${o.graduationDate }">
													<span class="style1">** 请输入年份，如2009</span>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 毕业类别: </strong>
												</td>
												<td height="30" align="left" class="content_L">
													<select name="o.graduationType" id="graduationType">
														<c:forEach items="${bylb}" var="bylb">
															<option value="${bylb.id }" <c:if test="${o.graduationType eq bylb.id}">selected</c:if>>
																${bylb.bylbmc }
															</option>
														</c:forEach>
													</select>
												</td>
											</tr>
										</table>
									</fieldset>
								</td>
							</tr>
						</table>
						<br>
						<table width="73%" height="246" border="0" cellpadding="0"
							cellspacing="0" class="table">
							<tr>
								<td height="102" align="center" valign="top" class="content_L">
									<fieldset>
										<legend>
											<strong><strong> 在校表现： (以下各项简要填写,五十字以内)</strong> </strong>
										</legend>
										<table width="544" height="210" border="0" cellpadding="0"
											cellspacing="0" class="table">
											<tr>
												<td width="18%" height="30" align="right" class="title">
													<strong> 在校或工作期间担任社会工作: </strong>
												</td>
												<td width="82%" height="30" align="left" class="content_L">
													<textarea name="o.works" cols="46" rows="2" id="works"
														onkeyup="CtoH(this)">${o.works }</textarea>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 在校或工作期间 受过何种处分: </strong>
												</td>
												<td height="30" align="left" class="content_L">
													<textarea name="o.disposal" cols="46" rows="2"
														id="disposal" onkeyup="CtoH(this)">${o.disposal }</textarea>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 获奖情况: </strong>
												</td>
												<td height="30" align="left" class="content_L">
													<textarea name="o.rewards" cols="46" rows="2" id="rewards"
														onkeyup="CtoH(this)">${o.rewards }</textarea>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 取得各类证书: </strong>
												</td>
												<td height="30" align="left" class="content_L">
													<textarea name="o.cerificate" cols="46" rows="2"
														id="cerificate" onkeyup="CtoH(this)">${o.cerificate }</textarea>
												</td>
											</tr>
											<tr>
												<td height="42" align="right" class="title">
													<strong> 个人兴趣爱好<br> 及特长: </strong>
												</td>
												<td height="42" align="left" class="content_L">
													<textarea name="o.hobby" cols="46" rows="2" id="hobby"
														onkeyup="CtoH(this)">${o.hobby }</textarea>
												</td>
											</tr>
											<tr>
												<td height="42" align="right" class="title">
													<strong> 自我鉴定: </strong>
												</td>
												<td height="42" align="left" class="content_L">
													<textarea name="o.zwjd" cols="46" rows="2" id="zwjd"
														onkeyup="CtoH(this)">${o.zwjd }</textarea>
												</td>
											</tr>
										</table>
									</fieldset>
								</td>
							</tr>
						</table>
						<br>
						<table width="73%" height="273" border="0" cellpadding="0"
							cellspacing="0" class="table">
							<tr>
								<td height="102" align="center" valign="top" class="content_L">
									<fieldset>
										<legend>
											<strong><strong> 联系方式:</strong> </strong>
										</legend>
										<table width="544" height="240" border="0" cellpadding="0"
											cellspacing="0" class="table">
											<tr>
												<td width="14%" height="30" align="right" class="title">
													<strong> 家庭住址: </strong>
												</td>
												<td width="86%" height="30" align="left" class="content_L">
													<input name="o.address" type="text" id="address" size="40"
														maxlength="40" onkeyup="CtoH(this)" value="${o.address }">
														<span class="style1">*</span>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 户口所在街道: </strong>
												</td>
												<td height="30" align="left" class="content_L">
													<input name="o.street" type="text" id="street" size="40"
														maxlength="40" onkeyup="CtoH(this)" value="${o.street }">
														<span class="style1">*</span>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 住址电话: </strong>
												</td>
												<td height="30" align="left" class="content_L">
													<input name="o.homePhone" type="text" id="homePhone"
														size="18" maxlength="18" onkeyup="CtoH(this)"
														value="${o.homePhone }">
														<span class="style1">*</span>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 手机: </strong>
												</td>
												<td height="30" align="left" class="content_L">
													<input name="o.mobilePhone" type="text" id="mobilePhone"
														size="18" maxlength="11" onkeyup="CtoH(this)"
														value="${o.mobilePhone }">
														<span class="style1">*</span>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 邮寄录取通知书地址: </strong>
												</td>
												<td height="30" align="left" class="content_L">
													<input name="o.letterAddress" type="text"
														id="letterAddress" size="40" maxlength="50"
														onkeyup="CtoH(this)" value="${o.letterAddress }">
														<span class="style1">*</span>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 收件人姓名: </strong>
												</td>
												<td height="30" align="left" class="content_L">
													<input name="o.letterName" type="text" id="letterName"
														size="18" maxlength="18" onkeyup="CtoH(this)"
														value="${o.letterName }">
														<span class="style1">*</span>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 联系电话: </strong>
													<span class="style1">*</span>
												</td>
												<td height="30" align="left" class="content_L">
													<input name="o.linkPhone" type="text" id="linkPhone"
														size="18" maxlength="18" onkeyup="CtoH(this)"
														value="${o.linkPhone }">
													<span class="style1">*必须随时能联系 </span>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 邮编: </strong>
												</td>
												<td height="30" align="left" class="content_L">
													<input name="o.postCode" type="text" id="postCode" size="6"
														maxlength="6" onkeyup="CtoH(this)" value="${o.postCode }">
														<span class="style1">*</span>
												</td>
											</tr>
										</table>
									</fieldset>
								</td>
							</tr>
						</table>
						<br>
						<table width="73%" height="153" border="0" cellpadding="0"
							cellspacing="0" class="table">
							<tr>
								<td height="102" align="center" valign="top" class="content_L">
									<fieldset>
										<legend>
											<strong><strong> 报考意向:</strong> </strong>
										</legend>
										<table width="544" height="120" border="0" cellpadding="0"
											cellspacing="0" class="table">
											<tr>
												<td width="14%" height="30" align="right" class="title">
													<strong> 报考专业第一志愿: </strong>
												</td>
												<td width="86%" height="30" align="left" class="content_L">
												 
													<select name="o.specialtyId.id" id="specialtyId">
														<c:forEach items="${specialty}" var="specialty">
															<c:choose>
																<c:when test="${o.specialtyId.id==specialty.id}">
																	<option value="${specialty.id}" selected>
																		${specialty.name}
																	</option>
																</c:when>
																<c:otherwise>
																	<option value="${specialty.id}">
																		${specialty.name}
																	</option>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</select>
												 	
													<!-- ${o.specialtyId.name } -->
												</td>
											</tr>
											<tr>
												<td width="14%" height="30" align="right" class="title">
													<strong> 报考专业第二志愿: </strong>
												</td>
												<td width="86%" height="30" align="left" class="content_L">
												 
													<select name="o.specialtyId2.id" id="specialtyId2">
														<c:forEach items="${specialty}" var="specialty">
															<c:choose>
																<c:when test="${o.specialtyId2.id==specialty.id}">
																	<option value="${specialty.id}" selected>
																		${specialty.name}
																	</option>
																</c:when>
																<c:otherwise>
																	<option value="${specialty.id}">
																		${specialty.name}
																	</option>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</select>
												 	<input name="o.ifAdjust" id="tj_1" type="hidden" value="1">
													<!-- ${o.specialtyId.name } -->
												</td>
											</tr>
											<!-- tr>
												<td height="30" align="right" class="title">
													<strong> 是否同意调剂: </strong>
												</td>
												<td height="30" align="left" class="content_L">
													<c:choose>
														<c:when test="${o.ifAdjust == 1}">
															<label for="tj_1">
																<input name="o.ifAdjust" id="tj_1" type="radio"
																	value="1" checked>
																是






															</label>
													&nbsp;&nbsp;&nbsp;&nbsp;
													<label for="tj_2">
																<input name="o.ifAdjust" id="tj_2" type="radio"
																	value="0">
																否






															</label>
														</c:when>
														<c:otherwise>
															<label for="tj_1">
																<input name="o.ifAdjust" id="tj_1" type="radio"
																	value="1" >
																是






															</label>
													&nbsp;&nbsp;&nbsp;&nbsp;
													<label for="tj_2">
																<input name="o.ifAdjust" id="tj_2" type="radio"
																	value="0" checked>
																否






															</label>
														</c:otherwise>
													</c:choose>

												</td>
											</tr-->
										</table>
									</fieldset>
								</td>
							</tr>
						</table>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="22" align="center">
									<input type="submit" value=" 提交 " class="f_btn01">
									<input type="button" value=" 关闭 " class="f_btn01" onclick="if(!confirm('确定离开本页面吗？')) return false;window.close();">
									<input type="hidden" name="o.id" value="${o.id }">
									<input type="hidden" name="o.password" value="${o.password }">
									<input type="hidden" name="o.IDCardNum" value="${o.IDCardNum}">
								</td>
							</tr>
						</table>
				</td>
				</tr>
				</table>
		</form>
	</body>
</html>
