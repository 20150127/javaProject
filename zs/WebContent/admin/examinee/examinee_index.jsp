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
<title>考生管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/methodfish.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/public.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/pagination.js"></script>
<script type="text/javascript">
			function SC(url,info){
			if(openSC(url,info)){
				window.location.reload(true);
			}	
		}
		function openSC(url,confirmString){
			var c = confirmString;
			if(c == null || c == ''){
				c = "你确认生成准考证吗？";
			}
			if(confirm(c)){
				return window.showModalDialog(url,"window123","dialogHeight:234px;dialogWidth:271px;resizable:no;help:yes;status:no;scroll:no");
			}
			return false;
		}
				
		me(function(){
			if(me("#condition").val()=='kl'){
		 	 document.getElementById("td1").style.display="";
		 	 document.getElementById("td2").style.display="none";
		 	 document.getElementById("td3").style.display="none";
		 	 document.getElementById("td4").style.display="none";
		 	document.getElementById("td5").style.display="none";
			}
			if(me("#condition").val()=='zy'){
		 	 document.getElementById("td1").style.display="none";
		 	 document.getElementById("td2").style.display="none";
		 	 document.getElementById("td3").style.display="";
		 	 document.getElementById("td4").style.display="none";
		 	document.getElementById("td5").style.display="none";
			}
			if(me("#condition").val()=='zy2'){
				document.getElementById("td5").style.display="none";
			 	document.getElementById("td1").style.display="none";
			 	document.getElementById("td2").style.display="none";
			 	document.getElementById("td3").style.display="none";
			 	document.getElementById("td4").style.display="";
			}
			if(me("#condition").val()=='studentGroup'){
			 	document.getElementById("td1").style.display="none";
			 	document.getElementById("td2").style.display="none";
			 	document.getElementById("td3").style.display="none";
			 	document.getElementById("td4").style.display="none";
			 	document.getElementById("td5").style.display="";
			}
		});
		function set(){
			
			
			if(me("#condition").val()=='zy' || me("#condition").val()=='kl' || me ("#condition").val()=='zy2' ||me("#condition").val()=='studentGroup'){
				 document.getElementById("td2").style.display="none";
				 if(me("#condition").val()=='zy'){
				 	me("#key").val("");
				 	me("#key3").val("");
					me("select").get(1).options[0].selected=true;
					document.getElementById("td3").style.display="";
					document.getElementById("td1").style.display="none";
					document.getElementById("td4").style.display="none";
					document.getElementById("td5").style.display="none";
				 }
				 if(me("#condition").val()=='kl'){
				 	me("#key").val("");
					me("select").get(2).options[0].selected=true;
					document.getElementById("td1").style.display="";
					document.getElementById("td3").style.display="none";
					document.getElementById("td4").style.display="none";
					document.getElementById("td5").style.display="none";
				 }
				 if(me("#condition").val()=='zy2'){
					 	me("#key").val("");
					 	me("#key2").val("");
						me("select").get(1).options[0].selected=true;
						document.getElementById("td3").style.display="none";
						document.getElementById("td1").style.display="none";
						document.getElementById("td4").style.display="";
						document.getElementById("td5").style.display="";
					 }
				 if(me("#condition").val()=='studentGroup'){
					me("#key").val("");
					me("select").get(4).options[0].selected=true;
					document.getElementById("td1").style.display="none";
					document.getElementById("td3").style.display="none";
					document.getElementById("td4").style.display="none";
					document.getElementById("td5").style.display="";
				 }
			}
			if(me("#condition").val()!='zy' && me("#condition").val()!='kl' && me("#condition").val()!='zy2' && me("#condition").val()!='studentGroup'){
				me("select").get(1).options[0].selected=true;
				me("select").get(2).options[0].selected=true;
				me("select").get(3).options[0].selected=true;
				me("select").get(4).options[0].selected=true;
				document.getElementById("td5").style.display="none";
				document.getElementById("td4").style.display="none";
				document.getElementById("td3").style.display="none";
				document.getElementById("td1").style.display="none";
				document.getElementById("td2").style.display="";
			}
			
			
		}
		
		function toExport(){
			var condition = me("#condition").val();
			var key;
			if(condition == "examineeNum"){
				key = me("#key").val();
			}else if(condition == "name"){
				key = me("#key").val();
			}else if(condition == "kl"){
				key = me("#key1").val();
			}else if(condition == "zy"){
				key = me("#key2").val();
			}else if(condition == "zy2"){
				key = me("#key3").val();
			}else if(condition == "IDCardNum"){
				key = me("#key").val();
			}else if(condition == "admissionId"){
				key = me("#key").val();
			}else if(condition == "studentGroup"){
				key = me("#key4").val();
			}else{
				alert("查询项错误!");
			}
			var url = "<%=request.getContextPath()%>/export/toExport.action?condition="
				+ condition + "&key=" + encodeURI(encodeURI(key));
		openWin(url, '考生导出', 800, 380, 1);
	}
</script>
</head>

<body class="middlebody">
	<form name="myform" method="post"
		action="<%=request.getContextPath()%>/examinee/list.action">
		<table align="center" class="table" border="1" width="100%"
			style="border-collapse: collapse;">
			<tr>
	<td class="content_L" align="left"><select name="condition"
					id="condition" class="f_select" onchange="set()">
						<option value="examineeNum"
							<c:if test="${condition eq 'examineeNum' }">selected</c:if>>考&nbsp;&nbsp;生&nbsp;&nbsp;号</option>
						<option value="name"
							<c:if test="${condition eq 'name' }">selected</c:if>>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</option>
						<option value="kl"
							<c:if test="${condition eq 'kl' }">selected</c:if>>科&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;类</option>
						<c:if test="${empty user.specialty}">
							<option value="zy"
								<c:if test="${condition eq 'zy' }">selected</c:if>>专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业1</option>
						</c:if>
						<option value="zy2"
							<c:if test="${condition eq 'zy2' }">selected</c:if>>专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业2</option>
						<option value="IDCardNum"
							<c:if test="${condition eq 'IDCardNum' }">selected</c:if>>身份证号</option>
						<option value="admissionId"
							<c:if test="${condition eq 'admissionId' }">selected</c:if>>准考证号</option>
						<option value="studentGroup"
							<c:if test="${condition eq 'studentGroup' }">selected</c:if>>考生类别</option>
				</select></td>
				<td class="content_L" align="left" id="td1" style="display: none">
					<select name="key1" id="key1" class="f_select" style="width: 85px;">
						<option value="0" <c:if test="${key1 eq '0' }">selected</c:if>>全部</option>
						<option value="1" <c:if test="${key1 eq '1' }">selected</c:if>>文科</option>
						<option value="5" <c:if test="${key1 eq '5' }">selected</c:if>>理科</option>
						<option value="9" <c:if test="${key1 eq '9' }">selected</c:if>>单考</option>
				</select>
				</td>
				<td class="content_L" align="left" id="td2"><input type="text"
					name="key" id="key" value="${key}" class="f_input"></td>
				<td class="content_L" align="left" id="td3" style="display: none">
					<select name="key2" id="key2" class="f_select"
					style="width: 210px;">
						<option value="0" <c:if test="${key2 eq '0' }">selected</c:if>>全部</option>
						<c:forEach items="${specialtys}" var="sss">

							<option value="${sss.code}"
								<c:if test="${key2 eq sss.code }">selected</c:if>>${sss.name}</option>

						</c:forEach>
				</select>
				</td>
				<td class="content_L" align="left" id="td4" style="display: none">
					<select name="key3" id="key3" class="f_select"
					style="width: 210px;">
						<option value="0" <c:if test="${key3 eq '0' }">selected</c:if>>全部</option>
						<c:forEach items="${specialtys}" var="sss">

							<option value="${sss.code}"
								<c:if test="${key3 eq sss.code }">selected</c:if>>${sss.name}</option>

						</c:forEach>
				</select>
				</td>
				<td class="content_L" align="left" id="td5" style="display: none">
					<select name="key4" id="key4" class="f_select"
					style="width: 210px;">
						<option value="0" <c:if test="${key4 eq '0' }">selected</c:if>>全部</option>
						<option value="1" <c:if test="${key4 eq '1' }">selected</c:if>>城镇</option>
						<option value="2" <c:if test="${key4 eq '2' }">selected</c:if>>农村</option>
				</select>
				</td>
				<td class="content_L" align="left" width="40%"><c:if
						test="${xy:hasPermission(user.id,'examinee',1)}">
						<input type="button" class="f_btn01" value="查询" onclick="submit()">
					</c:if></td>
				<td class="content_L" align="right" width="45%"><c:if
						test="${xy:hasPermission(user.id,'examinee',0)}">
						<input type="button" class="f_btn01" value="打印考场桌贴"
							onclick="openWin2('<%=path%>/examinee/zt.action','桌贴',800,760,1)">
					</c:if> &nbsp; <c:if test="${xy:hasPermission(user.id,'examinee',0)}">
						<input type="button" class="f_btn01" value="打印考场考生信息"
							onclick="openWin2('<%=path%>/examinee/ks.action','考生',800,750,1)">
					</c:if> <c:if test="${xy:hasPermission(user.id,'examinee',1)}">
						<input type="button" class="f_btn01" value="导出EXCEL"
							onclick="toExport()">
					</c:if></td>

			

	</tr>
		</table>
	</form>
	<table align="center" class="table" border="1" width="100%"
		style="border-collapse: collapse;">
		<tr>
				<td  class="title"  align="center" >编号</td>
				<td  class="title"  align="center" >姓名</td>
				<td  class="title"  align="center" >性别</td>
				<td  class="title"  align="center" >考生号</td>
				<td  class="title"  align="center" >准考证号</td>
				<td  class="title"  align="center" >身份证号</td>
				<td  class="title"  align="center" >报考专业1</td>
				<td  class="title"  align="center" >报考专业2</td>
				<td  class="title"  align="center" >语文</td>
				<td  class="title"  align="center" >数学</td>
				<td  class="title"  align="center" >英语</td>
				<td  class="title"  align="center" >考生类别</td>
				<td  class="title"  align="center" >修改</td>
				<td  class="title"  align="center" >生成准考证号</td>
				<td  class="title"  align="center" >打印准考证</td>
				<td  class="title"  align="center" >删除</td>
		</tr>

		<c:if test="${!empty page.datas}">
          <c:forEach items="${page.datas }" var="examinee" >
	      	<tr>
				<td align="center" class="content_L">${examinee.id}</td>
				<td align="center" class="content_L"><a href="#" onclick="openWin('<%=path%>/examinee/showToAdmin.action?o.id=${examinee.id}','newwindow',800,750,1)">${examinee.name}</a></td>
				<td align="center" class="content_L">
				${xy:sex(examinee.sex)}
				</td>
				<td align="center" class="content_L">${examinee.examineeNum}</td>
				<td align="center" class="content_L">${examinee.admissionId}</td>
				<td align="center" class="content_L">${examinee.IDCardNum}</td>
				<td align="center" class="content_L">${examinee.specialtyId.name}</td>
				<td align="center" class="content_L">${examinee.specialtyId2.name}</td>
				<td align="center" class="content_L">${examinee.chineseScore}</td>
				<td align="center" class="content_L">${examinee.mathScore}</td>
				<td align="center" class="content_L">${examinee.englishScore}</td>
				<td align="center" class="content_L">
					
					<c:if test="${examinee.examineeType==1}">
						城镇
					</c:if>
					<c:if test="${examinee.examineeType==2}">
						农村
					</c:if>
				</td>
				<td align="center" class="content_L">
				
				
				
					<c:choose>

							<c:when test="${xy:hasPermission(user.id,'examinee',2)}">


								<a
									href="<%=path%>/examinee/toUpdate.action?o.id=${examinee.id }"
									target="_blank" class="bb">修改</a>

							</c:when>
							<c:otherwise>
							...
							</c:otherwise>
						</c:choose></td>
					<td align="center" class="content_L"><c:choose>
							<c:when test="${empty examinee.admissionId}">
								<c:choose>
									<c:when test="${xy:hasPermission(user.id,'examinee',0)}">
										<a href="#"
											onclick="SC('<%=request.getContextPath() %>/examinee/sc.action?o.id=${examinee.id }','');">生成</a>
									</c:when>
									<c:otherwise>
							...
							</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<font color="red">已生成</font>
							</c:otherwise>
						</c:choose></td>
					<td align="center" class="content_L"><c:choose>
							<c:when test="${xy:hasPermission(user.id,'examinee',0)}">
								<c:choose>
									<c:when test="${not empty examinee.admissionId}">

										<a href="#"
											onclick="openWin2('<%=request.getContextPath() %>/examinee/zkzPrint.action?o.id=${examinee.id }','准考证',600,440,1)">打印</a>
									</c:when>
									<c:otherwise>
					...
					</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
							...
							</c:otherwise>
						</c:choose></td>
					<td align="center" class="content_L"><c:choose>
							<c:when test="${xy:hasPermission(user.id,'examinee',3)}">
								<a href="#"
									onclick="del('<%=request.getContextPath() %>/examinee/del.action?o.id=${examinee.id }')">删除</a>
							</c:when>
							<c:otherwise>
						...
						</c:otherwise>
						</c:choose></td>
				</tr>
			</c:forEach>
		</c:if>

		<c:forEach var="j" begin="${my:length(page.datas)}" end="${ps-1}">
			<tr>
				<td align="center" class="content_L">&nbsp;</td>
				<td align="center" class="content_L">&nbsp;</td>
				<td align="center" class="content_L">&nbsp;</td>
				<td align="center" class="content_L">&nbsp;</td>
				<td align="center" class="content_L">&nbsp;</td>
				<td align="center" class="content_L">&nbsp;</td>
				<td align="center" class="content_L">&nbsp;</td>
				<td align="center" class="content_L">&nbsp;</td>
				<td align="center" class="content_L">&nbsp;</td>
				<td align="center" class="content_L">&nbsp;</td>
				<td align="center" class="content_L">&nbsp;</td>
				<td align="center" class="content_L">&nbsp;</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<table align="center" class="table" border="1" width="100%"
				style="border-collapse: collapse;">
				<tr>
					<td class="content_L" align="center">
						共<span id="totalPage"></span>页/共${page.total}条记录


						<input type="hidden" value="${page.total/ps}" id="tmp">
						<input type="hidden" value="${page.offset/ps+1}" id="tmpNP">
						<pg:pager url="list.action" items="${page.total}"
							maxPageItems="${ps}" export="currentPageNumber=pageNumber">
							<pg:param name="key" value="${key}" />
							<pg:param name="key1" value="${key1}" />
							<pg:param name="key2" value="${key2}" />
							<pg:param name="key3" value="${key3}" />
							<pg:param name="condition" value="${condition}" />
							<pg:first>
								<a href="${pageUrl}" id="firstpageurl" class="bb">首页</a>
							</pg:first>
							<pg:prev>
								<a href="${pageUrl }" class="bb">前页</a>
							</pg:prev>
							<pg:next>
								<a href="${pageUrl }" class="bb">后页</a>
							</pg:next>
							<pg:last>
								<a href="${pageUrl }" class="bb">尾页</a>
							</pg:last>
						</pg:pager>
						第


						<select class="sel1" name="nowPage" id="nowPage" onchange="selectNowPage(this)">
						</select>
						页 每页显示
						<input class="input1" size="2" maxlength="3" name="pagesize"
							id="tmpPZ" value="${ps}" onkeyup="javascript:if(event.keyCode ==13 ){selectPagesize(this)}">
						条


					</td>
				</tr>
			</table>
</body>
</html>
