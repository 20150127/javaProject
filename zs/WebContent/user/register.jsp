<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../pub/taglib.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>考生注册</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link href="<%=request.getContextPath() %>/css/methodfish.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
		<script type='text/javascript' src='<%=path%>/dwr/interface/registerService.js'></script>
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

			A.leftmenu:link {
				DISPLAY: block; WIDTH: 100%; COLOR:#000000; LINE-HEIGHT: 44px; FONT-FAMILY: "宋体"; HEIGHT: 20px; TEXT-ALIGN:center; TEXT-DECORATION: none
			}
			a.bb:link, a.bb:active, a.bb:visited{TEXT-DECORATION:none ;Color:#000000;}/*ߵ*/
			
			a.bb:hover{TEXT-DECORATION:underline ;Color:#945678;}
			table{
				font-size: 15px;font-family: "宋体";
			}
			.f_btn01 {
			BORDER-RIGHT: #7b9ebd 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #7b9ebd 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 12px; FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ffffff, EndColorStr=#cecfde); BORDER-LEFT: #7b9ebd 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #7b9ebd 1px solid
			}
			A.leftmenu:link {
				DISPLAY: block; WIDTH: 100%; COLOR: #1785aa; LINE-HEIGHT: 30px; FONT-FAMILY: "宋体"; HEIGHT: 20px; TEXT-ALIGN: left; TEXT-DECORATION: none
			}
			A.leftmenu:visited {
				DISPLAY: block; WIDTH: 100%; COLOR: #1785aa; LINE-HEIGHT: 30px; FONT-FAMILY: "宋体"; HEIGHT: 20px; TEXT-ALIGN: left; TEXT-DECORATION: none
			}
			A.leftmenu:hover {
				DISPLAY: block; WIDTH: 100%; COLOR: #1785aa; LINE-HEIGHT: 30px; FONT-FAMILY: "宋体"; HEIGHT: 20px; background:url(<%=request.getContextPath()%>/images/cc.gif); TEXT-ALIGN: left; TEXT-DECORATION: none
			}
			#apDiv1 {
				position:absolute;
				width:714px;
				height:33px;
				z-index:1;
				left: 284px;
				top: 197px;
				float:right;
			}
			#navcontainer { 
			}
						
			ul#navlist {
				margin: 1px 0 0 0;
				padding: 0;
				list-style-type: none;
				white-space: nowrap;
			}
						
			ul#navlist li {
				float: left;
				font-family: verdana, arial, sans-serif;
				font-size: 14px;
				font-weight: bold;
				margin: 0;
				padding: 3px 0 2px 0;
				border-top:0px solid #e0ede9;
				border-bottom: 0px solid #e0ede9;
			}
						
			#navlist a, #navlist a:link {
				margin: 0;
				padding: 5px 9px 4px 9px;
				color:#333333;
				border-right: 0px dashed #d1e3db;
				text-decoration: none;
			}
						
			ul#navlist li#active {
				color: #95bbae;
				background-color: #deebe5;
			}
						
			#navlist a:hover {
				color:#FFFFFF; 
				background:url(<%=request.getContextPath()%>/images/bb.gif);
			}
			#newPreview
			{
			    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);
			}
			
			-->
 </style> 	
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
				function checkScore(ele){
					if(regNull.test($(ele).val())){
						alert("成绩不能为空！");
						$(ele).select();
						return false;
					}else{
						try{
							if($(ele).val()*1 < 0 || $(ele).val()*1 > 150)
								throw new Error(-1,'error');
						}catch(e){
							alert("成绩不合法！");
							$("ele").select();
							return false;
						}
						
					}
				}
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

				function checkExamNum() {
					var regNull = /^\s*$/;
					if(!regNull.test($("#examineeNum").val())){
						registerService.findByExamNum($("#examineeNum").val(),function(data){
							if(data){
								$("#numtmp").val("yes");
								alert("该考生号已经被注册，请检查是否填错，否则请联系管理员!");
							}else{
								$("#numtmp").val("");
							}
						});
					}else{
						alert("考生号很重要，必须填写!");
					}
				}
			function check(){
				var regNull = /^\s*$/;
				var birthday = /^\d{8}$/;
				//var cardNum = /^\d{14,17}[\dxX]$/;
				var cardNum = /^(([0-9]{14}[x0-9]{1})|([0-9]{17}[xX0-9]{1}))$/;
				var examineeNum = /^\d{14}$/;
				var graduationDate = /^\d{4}$/;
				var mobilePhone = /^1\d{10}$/;
				var postCode = /^\d{6}$/;
				var picReg = /^jpg$/;
				//var score = /^150|1[0-4][0-9]|1[0-4][0-9]\.?[0-9]|[1-9][0-9]|[1-9][0-9]\.?[0-9]|[1-9]$/;
				if(regNull.test($("#name").val())){
					alert("用户名不能为空");
					$("#name").select();
					return false;
				}
				if(regNull.test($("#chineseScore").val())){
					alert("语文成绩不能为空！");
					$("#chineseScore").select();s
					return false;
				}else{
					try{
						if($("#chineseScore").val()*1 < 0 || $("#chineseScore").val()*1 > 150)
							throw new Error(-1,'error');
					}catch(e){
						alert("语文成绩不合法！");
						$("#chineseScore").select();
						return false;
					}
					
				}
				if(regNull.test($("#mathScore").val())){
					alert("数学成绩不能为空！");
					$("#mathScore").select();
					return false;
				}else{
					try{
						if($("#mathScore").val()*1 < 0 || $("#mathScore").val()*1 > 150)
							throw new Error(-1,'error');
					}catch(e){
						alert("数学成绩不合法！");
						$("#mathScore").select();
						return false;
					}
					
				}
				if(regNull.test($("#englishScore").val())){
					alert("英语成绩不能为空！");
					$("#englishScore").select();
					return false;
				}else{
					try{
						if($("#englishScore").val()*1 < 0 || $("#englishScore").val()*1 > 150)
							throw new Error(-1,'error');
					}catch(e){
						alert("英语成绩不合法！");
						$("#englishScore").select();
						return false;
					}
					
				}
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
				if(document.getElementById("IDCardNum").value.substring(6,14)!=document.getElementById("birthday").value){
					alert("身份证号和出生日期填写不匹配,请检查是否填错,否则请联系管理员!");
					return false;
				}
				if(!examineeNum.test($("#examineeNum").val())) {
					alert("考生号必须为 14 位数字,并且不能为空!");
					$("#examineeNum").select();
					return false;
				}	
				if($("#numtmp").val()=="yes"){
					alert("该考生号已经被注册，请检查是否填错，否则请联系管理员!");
					return false;
				}

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
				if(regNull.test($("#specialtyId").val())){
					alert("请选择报考专业第一志愿");
					return false;
				}
				if(regNull.test($("#specialtyId2").val())){
					alert("请选择报考专业第二志愿");
					return false;
				}
				
				if(!regNull.test($("#specialtyId").val())&&!regNull.test($("#specialtyId2").val())){
					if($("#specialtyId2").val() == $("#specialtyId").val()){
						alert("报考专业第一志愿与报考专业第二志愿不能相同!");
						return false;
					}	
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
				
				return true;
			}

			var pic = null;
			function showimg(imgFile){
				var picReg = /^jpg$/;
				if(pic)pic.removeNode(true);
				pic=document.createElement("img");
				pic.src = imgFile.value;
				if(!picReg.test(pic.src.substring(pic.src.lastIndexOf(".")+1))){
					refreshUploader(imgFile);
					alert("图片必须为jpg格式!!");
					return;
				}else if(pic.width > 120){
					refreshUploader(imgFile);
					alert("图片宽度不能大于120像素!!");
					imgFile.value= "" ;
					return;
				}else if(pic.height > 150){
					refreshUploader(imgFile);
					alert("图片高度不能大于150像素!!");
					imgFile.value= "" ;
					return;
				}else if(pic.fileSize>200*1024){
					refreshUploader(imgFile);
				    alert("图片文件大小大于200KB!!");
				    imgFile.value= "" ;
				    return;
				}else{
					var newPreview = document.getElementById("newPreview");
			        newPreview.innerHTML = "";
			        newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgFile.value;
			        newPreview.style.width = "100px";
			        newPreview.style.height = "100px";
				}
			}
			function refreshUploader(who){
				var who2= who.cloneNode(false);
				who2.onchange= who.onchange;// events are not cloned 
				who.parentNode.replaceChild(who2,who);
			}
		</script>
	</head>
	<body>
		<form name="myform" method="post" action="<%=path%>/us/register.action"
			enctype="multipart/form-data" onsubmit="return check();">

			<input type="hidden" id="cardtmp">
			<input type="hidden" id="numtmp">
			
			
		<table width="1000px" align="center" border="0" cellspacing="0" cellpadding="0" background="<%=request.getContextPath()%>/images/logobg3.jpg" >
  <tr>
    <td height="230" align="center" valign="top">
    <table width="88%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="44%" align="left" valign="bottom"><img src="<%=request.getContextPath()%>/images/logos.jpg" /></td>
    <td width="8%">&nbsp;</td>
    <td width="48%" align="left" valign="bottom"><img src="<%=request.getContextPath()%>/images/logos1.jpg" /></td>
  </tr>
</table>
<table width="88%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left" valign="middle">
      <div class="1" id="1" style="margin-top:8px; height:44px; background:url(<%=request.getContextPath()%>/images/logobgs.jpg)">
      <table width="729" height="44" border="0" cellpadding="0" cellspacing="0" background="<%=request.getContextPath()%>/images/logobgs.jpg" style="font-size:14px;
    font-weight:bold;">
  <tr>
    
    <td width="106" align="center"><div id="navcontainer"  style="margin-left:8px;"><ul id="navlist"><li><a href="<%=path%>/us/toUpdate.action" class="bb">修改报名信息</a></li></ul></div></td>
    <td width="5" align="center"><img src="<%=request.getContextPath()%>/images/lines1.jpg" alt="" /></td>
    <td width="106" align="center"><div id="navcontainer"  style="margin-left:0px;"><ul id="navlist"><li><a href="<%=path%>/us/show.action" class="bb">打印报名信息</a></li></ul></div></td>
    <td width="5" align="center"><img src="<%=request.getContextPath()%>/images/lines1.jpg" alt="" /></td>
    <td width="106" align="center"><div id="navcontainer"  style="margin-left:0px;"><ul id="navlist"><li><a href="<%=path%>/us/queryInfo.action" class="bb">查询录取通知</a></li></ul></div></td>
    <td width="5" align="center"><img src="<%=request.getContextPath()%>/images/lines1.jpg" alt="" /></td>
	 <td width="86" align="center"><div id="navcontainer"  style="margin-left:0px;"><ul id="navlist"><li><a href="<%=path%>/us/listBook.action" class="bb">留言板</a></li></ul></div></td>
    <td width="5" align="center"><img src="<%=request.getContextPath()%>/images/lines1.jpg" alt="" /></td>
    <td width="76" height="44" align="center"><div id="navcontainer"  style="margin-left:0px;"><ul id="navlist"><li><a href="<%=path%>/us/toUpdatepwd.action" class="bb">修改密码</a></li></ul></div></td>
    <td width="5" align="center"><img src="<%=request.getContextPath()%>/images/lines1.jpg" alt="" /></td>
    <td width="106" align="center"><div id="navcontainer"  style="margin-left:0px;"><ul id="navlist"><li><a href="<%=path%>/us/exit.action" class="bb">退出系统</a></li></ul></div></td>
<td width="11"><img src="<%=request.getContextPath()%>/images/lines1.jpg" alt="" /></td>
<td width="106" align="center">&nbsp;</td>
  </tr>
</table>
      </div>  
      
        <div class="2" id="2" style="float:right; margin-top:-56px;">
        <div id="xixi" style="width:268px; height:122px; background:url(<%=request.getContextPath()%>/images/gga.jpg); line-height:22px; font-size:16px;">
      <p style=" margin-top:24px; margin-left:20px;font-size: 13px;font-weight: bold">
      欢迎<font color="#945678"><c:choose><c:when test="${not empty sessionScope.o}">${sessionScope.o.name}</c:when><c:otherwise>您</c:otherwise></c:choose></font>登陆系统<br />
       <span  id="time"><script>document.getElementById('time').innerHTML=new Date().toLocaleString()+'<br/>&nbsp;&nbsp;'+' 星期'+'日一二三四五六'.charAt(new Date().getDay());setInterval("document.getElementById('time').innerHTML=new Date().toLocaleString()+'<br/>&nbsp;&nbsp;'+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
</script>
      </span>
        </div>
        </div>
       </td>
  </tr>
</table>

</td>
  </tr>
</table>	
			
			
			<table width="1000px;" align="center" height="1196" border="0" cellpadding="0"
				cellspacing="0" bgcolor="#FFFFFF" class="table">
				<tr>
					<td height="1196" align="center" valign="top">

						<table align="center" class="table" border="1" cellpadding="0" cellspacing="0" width="100%" height="301"
				style="border-collapse: collapse;">
						<!--table width="73%" height="301" border="0" cellpadding="0"
							cellspacing="0"-->
							<tr>
								<td height="288" align="center" valign="top" class="content_L">
									<fieldset>
										<legend>
											<strong><strong>基本信息: </strong> </strong>
										</legend>
										<table align="center" class="table" border="1" cellpadding="0" cellspacing="0" width="744" height="271"
												style="border-collapse: collapse;">
										
											<tr>
												<td width="14%" height="34" align="right" class="title">
													<strong> 姓名: </strong>
												</td>
												<td width="56%" height="34" align="left" class="content_L">
													<input name="o.name" type="text" id="name" size="14"
														maxlength="7" onkeyup="CtoH(this)">
													<span class="style1">** 与本人身份证、户口本姓名一致</span>
												</td>
												<td width="20%" rowspan="5" align="center" valign="middle" class="content_L">
													<table width="140" height="150" border="1" cellpadding="0"
														cellspacing="0" class="table">
														<tr>
															<td width="138" height="150" align="center"
																valign="middle"   class="content_L">
															<!-- 	<img src="" id="img" name="img"> -->
																	<div id="newPreview" style="width: 120px;height: 150px;"><br/><br/>照<br/>片<br/>上<br/>传</div>
																<input type="hidden" id="photo" value="">	
															</td>
														</tr>
													</table>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title"> 
													<strong> 性别: </strong>
												</td>
												<td height="30" align="left" class="content_L" >
													<select name="o.sex" id="sex">
														<c:forEach items="${xb}" var="xb">
															<option value="${xb.id}">
																${xb.xbmc}
															</option>
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
														maxlength="8" onkeyup="CtoH(this)">
													<span class="style1">** 如:19880808(半角输入)</span>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong>区县: </strong>
												</td>
												<td height="30" align="left" class="content_L">
													<select name="o.area" id="area">
														<c:forEach items="${dq}" var="dq">
															<option value="${dq.id}">
																${dq.dqmc}
															</option>
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
															<option value="${zzmm.id }">
																${zzmm.zzmmmc }
															</option>
														</c:forEach>
													</select>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 民族: </strong>
												</td>
												<td height="30" align="left" class="content_L">
													<select name="o.nationality" id="nationality">
														<c:forEach items="${mz}" var="mz">
															<option value="${mz.id }">
																${mz.mzmc }
															</option>
														</c:forEach>
													</select>
												</td>
												<td align="left" class="content_L">
													<input name="file" type="file" id="upload" onchange="javascript:showimg(this);">
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong>身份证号: </strong>
												</td>
												<td height="30" colspan="2" align="left" class="content_L">
													<input name="o.IDCardNum" type="text" id="IDCardNum"
														size="18" maxlength="18" onkeyup="CtoH(this)" onblur="checkIDCard()">
													<span class="style1">** 身份证号作为报名注册的账号,不能再修改!! (半角输入)</span>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 考生号: </strong>
												</td>
												<td height="30" colspan="2" align="left" class="content_L">
													<input name="o.examineeNum" type="text" id="examineeNum"
														size="16" maxlength="14" onkeyup="CtoH(this)" onblur="checkExamNum()">
													<span class="style1">** 请考生必须正确填写14位考生号，(半角输入) </span>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 会考考号: </strong>
												</td>
												<td height="30" colspan="2" align="left" class="content_L">
													<input name="o.hkkh" type="text" id="hkkh"
														size="16" maxlength="11">
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 考生类别: </strong>
												</td>
												<td height="30" colspan="2" align="left" class="content_L">
													<select name="o.examineeType" id="examineeType">
														<c:forEach items="${kslb}" var="kslb">
															<option value="${kslb.id}">
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
															<option value="${kslx.id}">
																${kslx.kslxmc }
															</option>
														</c:forEach>
													</select>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 语文成绩: </strong>
												</td>
												<td height="30" colspan="2" align="left" class="content_L">
													<input class="score" name="o.chineseScore" type="text" id="chineseScore"
														size="16" maxlength="5" onblur="checkScore(this)">
													<span class="style1">** 普通高中生填写高中会考成绩，中职生填写最后一学年期末成绩</span>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 数学成绩: </strong>
												</td>
												<td height="30" colspan="2" align="left" class="content_L">
													<input class="score" name="o.mathScore" type="text" id="mathScore"
														size="16" maxlength="5" onblur="checkScore(this)">
													<span class="style1">** 普通高中生填写高中会考成绩，中职生填写最后一学年期末成绩</span>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 英语成绩: </strong>
												</td>
												<td height="30" colspan="2" align="left" class="content_L">
													<input score="score" name="o.englishScore" type="text" id="englishScore"
														size="16" maxlength="5" onblur="checkScore(this)">
													<span class="style1">** 普通高中生填写高中会考成绩，中职生填写最后一学年期末成绩</span>
												</td>
											</tr>
										</table>
									</fieldset>
								</td>
							</tr>
						</table>
						<br>
						<table width="100%" height="124" border="0" cellpadding="0"
							cellspacing="0" class="table">
							<tr>
								<td height="124" align="center" valign="top" class="content_L">
									<fieldset>
										<legend>
											<strong><strong> 在校信息:</strong> </strong>
										</legend>
										<table width="744" height="93" border="0" cellpadding="0"
											cellspacing="0" class="table">
											<tr>
												<td width="14%" height="30" align="right" class="title">
													<strong> 所在学校: </strong>
												</td>
												<td width="86%" height="30" align="left" class="content_L">
													<input name="o.school" type="text" id="school" size="18"
														maxlength="18" onkeyup="CtoH(this)">
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 毕业时间: </strong>
												</td>
												<td height="30" align="left" class="content_L">
													<input name="o.graduationDate" type="text"
														id="graduationDate" size="8" maxlength="4"
														onkeyup="CtoH(this)">
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
															<option value="${bylb.id }">
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
						<table width="100%" height="246" border="0" cellpadding="0"
							cellspacing="0" class="table">
							<tr>
								<td height="102" align="center" valign="top" class="content_L">
									<fieldset>
										<legend>
											<strong><strong> 个人表现： (以下各项简要填写在校或工作或服兵役期间的表现,五十字以内)</strong> </strong>
										</legend>
										<table width="744" height="210" border="0" cellpadding="0"
											cellspacing="0" class="table">
											<tr>
												<td width="14%" height="30" align="right" class="title">
													<strong> 担任社会工作: </strong>
												</td>
												<td width="86%" height="30" align="left" class="content_L">
													<textarea name="o.works" cols="46" rows="2" id="works"
														onkeyup="CtoH(this)"></textarea>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 受过何种处分: </strong>
												</td>
												<td height="30" align="left" class="content_L">
													<textarea name="o.disposal" cols="46" rows="2"
														id="disposal" onkeyup="CtoH(this)"></textarea>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 获奖情况: </strong>
												</td>
												<td height="30" align="left" class="content_L">
													<textarea name="o.rewards" cols="46" rows="2" id="rewards"
														onkeyup="CtoH(this)"></textarea>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 取得各类证书: </strong>
												</td>
												<td height="30" align="left" class="content_L">
													<textarea name="o.cerificate" cols="46" rows="2"
														id="cerificate" onkeyup="CtoH(this)"></textarea>
													<span class="style1">所填证书需提供原件，现场信息确认时交审</span>
												</td>
											</tr>
											<tr>
												<td height="42" align="right" class="title">
													<strong> 个人兴趣爱好<br> 及特长: </strong>
												</td>
												<td height="42" align="left" class="content_L">
													<textarea name="o.hobby" cols="46" rows="2" id="hobby"
														onkeyup="CtoH(this)"></textarea>
												</td>
											</tr>
											<tr>
												<td height="42" align="right" class="title">
													<strong> 自我鉴定: </strong>
												</td>
												<td height="42" align="left" class="content_L">
													<textarea name="o.zwjd" cols="46" rows="2" id="zwjd"
														onkeyup="CtoH(this)"></textarea>
												</td>
											</tr>
										</table>
									</fieldset>
								</td>
							</tr>
						</table>
						<br>
						<table width="100%" height="273" border="0" cellpadding="0"
							cellspacing="0" class="table">
							<tr>
								<td height="102" align="center" valign="top" class="content_L">
									<fieldset>
										<legend>
											<strong><strong> 联系方式:</strong> </strong>
										</legend>
										<table width="744" height="240" border="0" cellpadding="0"
											cellspacing="0" class="table">
											<tr>
												<td width="14%" height="30" align="right" class="title">
													<strong> 家庭住址: </strong>
												</td>
												<td width="86%" height="30" align="left" class="content_L">
													<input name="o.address" type="text" id="address" size="40"
														maxlength="40" onkeyup="CtoH(this)"><span class="style1">*</span>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 户口所在街道: </strong>
												</td>
												<td height="30" align="left" class="content_L">
													<input name="o.street" type="text" id="street" size="40"
														maxlength="40" onkeyup="CtoH(this)"><span class="style1">*</span>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 住址电话: </strong>
												</td>
												<td height="30" align="left" class="content_L">
													<input name="o.homePhone" type="text" id="homePhone"
														size="18" maxlength="13" onkeyup="CtoH(this)"><span class="style1">*</span>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 手机: </strong>
												</td>
												<td height="30" align="left" class="content_L">
													<input name="o.mobilePhone" type="text" id="mobilePhone"
														size="18" maxlength="11" onkeyup="CtoH(this)"><span class="style1">*</span>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 邮寄录取通知书地址: </strong>
												</td>
												<td height="30" align="left" class="content_L">
													<input name="o.letterAddress" type="text"
														id="letterAddress" size="40" maxlength="50"
														onkeyup="CtoH(this)"><span class="style1">*</span>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 收件人姓名: </strong>
												</td>
												<td height="30" align="left" class="content_L">
													<input name="o.letterName" type="text" id="letterName"
														size="18" maxlength="18" onkeyup="CtoH(this)"><span class="style1">*</span>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 联系电话: </strong>
												</td>
												<td height="30" align="left" class="content_L">
													<input name="o.linkPhone" type="text" id="linkPhone"
														size="18" maxlength="13" onkeyup="CtoH(this)">
													<span class="style1">** 必须随时能联系 </span>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 邮编: </strong>
												</td>
												<td height="30" align="left" class="content_L">
													<input name="o.postCode" type="text" id="postCode" size="6"
														maxlength="6" onkeyup="CtoH(this)"><span class="style1">*</span>
												</td>
											</tr>
										</table>
									</fieldset>
								</td>
							</tr>
						</table>
						<br>
						<table width="100%" height="153" border="0" cellpadding="0"
							cellspacing="0" class="table">
							<tr>
								<td height="102" align="center" valign="top" class="content_L">
									<fieldset>
										<legend>
											<strong><strong> 报考意向:</strong> </strong>
										</legend>
										<table width="744" height="120" border="0" cellpadding="0"
											cellspacing="0" class="table">
											<tr>
												<td width="14%" height="30" align="right" class="title" nowrap>
													<strong> 报考专业第一志愿: </strong>
												</td>
												<td width="86%" height="30" align="left" class="content_L">
													<select name="o.specialtyId.id" id="specialtyId">
														<option value="">请选择</option>
														<c:forEach items="${specialty}" var="specialty"> 
															<option value="${specialty.id}">${specialty.name}</option>
														</c:forEach>
													</select>
											<span class="style1">**请慎重选择专业，选择之后无法修改!</span>
												</td>
											</tr>
											  
											<tr>
												<td width="14%" height="30" align="right" class="title" nowrap>
													<strong> 报考专业第二志愿: </strong>
												</td>
												<td width="86%" height="30" align="left" class="content_L">
													<select name="o.specialtyId2.id" id="specialtyId2">
														<option value="">请选择</option>
														<c:forEach items="${specialty}" var="specialty"> 
															<option value="${specialty.id}">${specialty.name}</option>
														</c:forEach>
													</select>
													<span class="style1">**请慎重选择专业，选择之后无法修改!</span>
											<!-- <input name="o.ifAdjust" id="tj_1" type="hidden" value="1"> -->
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 是否同意调剂: </strong>
												</td>
												<td height="30" align="left" class="content_L">
													<label for="tj_1">
														<input name="o.ifAdjust" id="tj_1" type="radio" value="1" checked="checked" />是
													</label>
&nbsp;&nbsp;&nbsp;&nbsp;
													<label for="tj_2">
														<input name="o.ifAdjust" id="tj_2" type="radio" value="0" />否
													</label>
												</td>
											</tr>
											
										</table>
									</fieldset>
								</td>
							</tr>
						</table>
						<br>
						<table width="100%" height="153" border="0" cellpadding="0"
							cellspacing="0" class="table">
							<tr>
								<td height="102" align="center" valign="top" class="content_L">
									<fieldset>
										<legend>
											<strong><strong> 安全设置:</strong> </strong>
										</legend>
										<table width="744" height="120" border="0" cellpadding="0"
											cellspacing="0" class="table">
											<tr>
												<td width="14%" height="30" align="right" class="title">
													<strong> 密  码: </strong>
												</td>
												<td width="86%" height="30" align="left" class="content_L">
													<input name="o.password" type="password" id="password" maxlength="20">
														<span class="style1">**密码由字母、数字、特殊符号组成。此密码由考生自己指定，至少六位，为保护个人信息请选用稍复杂的密码。修改信息， 打印报名信息 、查询录取通知、都将使用此密码，请牢记。一旦设置不能更改。</span>
												</td>
											</tr>
											<tr>
												<td height="30" align="right" class="title">
													<strong> 重复密码 :</strong>
												</td>
												<td height="30" align="left" class="content_L">
													<input type="password" id="passwordConfirm" maxlength="20">
														<span class="style1">**</span>
												</td>
											</tr>
											
										</table>
									</fieldset>
								</td>
							</tr>
						</table>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="22" align="center">
									<input type="submit" value=" 提交 " class="f_btn01">
									<input type="reset" value=" 重置 " class="f_btn01">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		
		<table width="1000px;" align="center" border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td height="30" align="center" valign="middle" background="<%=request.getContextPath()%>/images/bubg.jpg">
    <p style=" color:#FFFFFF; line-height:20px;"><font style="font-size: 12px;">北京青年政治学院</font> 
    </p>
    </td>
  </tr>
</table>
		</form>
	</body>
</html>
