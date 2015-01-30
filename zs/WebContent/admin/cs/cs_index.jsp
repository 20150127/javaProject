<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../pub/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>面试成绩管理</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="<%=request.getContextPath()%>/css/methodfish.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/public.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/pagination.js"></script>
		<script type="text/javascript">
		me(function(){
			if(me("#condition").val()=='kl'){
		 	 document.getElementById("td1").style.display="";
		 	 document.getElementById("td2").style.display="none";
		 	 document.getElementById("td3").style.display="none";
			}
			if(me("#condition").val()=='zy'){
		 	 document.getElementById("td1").style.display="none";
		 	 document.getElementById("td2").style.display="none";
		 	 document.getElementById("td3").style.display="";
			}
		});
		function set(){
			
			
			if(me("#condition").val()=='zy' || me("#condition").val()=='kl'){
				 document.getElementById("td2").style.display="none";
				 if(me("#condition").val()=='zy'){
				 	me("#key").val(""); 
					me("select").get(1).options[0].selected=true;
					document.getElementById("td3").style.display="";
					document.getElementById("td1").style.display="none";
				 }
				 if(me("#condition").val()=='kl'){
				 	me("#key").val("");
					me("select").get(2).options[0].selected=true;
					document.getElementById("td1").style.display="";
					document.getElementById("td3").style.display="none";
				 }
			}
			if(me("#condition").val()!='zy' && me("#condition").val()!='kl'){
				me("select").get(1).options[0].selected=true;
				me("select").get(2).options[0].selected=true;
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
			}else if(condition == "IDCardNum"){
				key = me("#key").val();
			}else if(condition == "admissionId"){
				key = me("#key").val();
			}else{
				alert("查询项错误!");
			}
			var url = "<%=request.getContextPath()%>/cs/toExport.action?condition="+condition+"&key="+encodeURI(encodeURI(key));
			openWin(url,'面试成绩',600,180,1);
		}
		</script>
	</head>

	<body class="middlebody">
		<form name="myform" method="post" action="<%=request.getContextPath()%>/cs/list.action">
			<table align="center" class="table" border="1" width="100%"	style="border-collapse: collapse;">
				<tr>
					<td class="content_L"  align="left">
						<select name="condition" id="condition" class="f_select" onchange="set()">
							<option value="examineeNum" <c:if test="${condition eq 'examineeNum' }">selected</c:if>>考&nbsp;&nbsp;生&nbsp;&nbsp;号</option>
							<option value="name" <c:if test="${condition eq 'name' }">selected</c:if>>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</option>
							<option value="kl" <c:if test="${condition eq 'kl' }">selected</c:if>>科&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;类</option>
							<c:if test="${empty user.specialty}">
								<option value="zy" <c:if test="${condition eq 'zy' }">selected</c:if>>专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业1</option>
							</c:if>
							<option value="IDCardNum" <c:if test="${condition eq 'IDCardNum' }">selected</c:if>>身份证号</option>
							<option value="admissionId" <c:if test="${condition eq 'admissionId' }">selected</c:if>>准考证号</option>
						</select>
					</td>
					<td class="content_L"  align="left" id="td1" style="display: none">
						<select name="key1" id="key1" class="f_select" style="width:85px;" >
							<option value="0" <c:if test="${key1 eq '0' }">selected</c:if>>全部</option>
							<option value="1" <c:if test="${key1 eq '1' }">selected</c:if>>文科</option>
							<option value="5" <c:if test="${key1 eq '5' }">selected</c:if>>理科</option>
							<option value="9" <c:if test="${key1 eq '9' }">selected</c:if>>单考</option>
						</select>
					</td>
					<td class="content_L"  align="left" id="td2">
						<input type="text" name="key" id="key" value="${key}" class="f_input">
					</td>
					<td class="content_L"  align="left" id="td3" style="display: none">
						<select name="key2" id="key2" class="f_select" style="width:85px;" >
							<option value="0" <c:if test="${key2 eq '0' }">selected</c:if>>全部</option>
							<c:forEach items="${specialtys}" var="sss">
								
							<option value="${sss.code}" <c:if test="${key2 eq sss.code }">selected</c:if>>${sss.name}</option>
							
							</c:forEach>
						</select>
					</td>
					<td class="content_L" width="85%" align="left">
						<c:if test="${xy:hasPermission(user.id,'cs',1)}">
							<input type="button" class="f_btn01" value="查询" onclick="submit()">
						</c:if>
						
					</td>
					<td class="content_L"  align="center">
						<c:if test="${xy:hasPermission(user.id,'cs',1)}">
							<input type="button" class="f_btn01" value="导出EXCEL" onclick="toExport()">
						</c:if>
					</td>
				</tr>
			</table>
			<br>
			<table align="center" class="table" border="1" width="100%"	style="border-collapse: collapse;">
				<tr>
					
					<td class="title" align="center" class="content_L">姓名</td>
					<td class="title" align="center" class="content_L">考生号</td>
					<td class="title" align="center" class="content_L">准考证号</td>
					<td class="title" align="center" class="content_L">考场号</td>
					<td class="title" align="center" class="content_L">报考专业1</td>
					<td class="title" align="center" class="content_L">面试成绩</td>
					<td class="title" align="center" class="content_L">操作</td>
				</tr>

				<c:if test="${!empty page.datas}">
					<c:forEach items="${page.datas }" var="score">
						<tr class="line">
							<td align="center" class="content_L">
								<c:choose>
									<c:when test="${xy:hasPermission(user.id,'examinee',1)}">
										<a class="bb" href="javascript:void(0);"
											onclick="openWin('<%=request.getContextPath()%>/examinee/showToAdmin.action?o.id=${score.id }','newwindow',800,750,1);">${score.name }</a>
									</c:when>
									<c:otherwise>
										${score.name }
									</c:otherwise>
								</c:choose>
							</td>
							<td align="center" class="content_L">${score.examineeNum}</td>
							<td align="center" class="content_L">${score.admissionId}</td>
							<td align="center" class="content_L">${score.roomId}</td>
							<td align="center" class="content_L">${score.specialtyId.name}</td>
							<td align="center" class="content_L">
							<c:choose>
								<c:when test="${my:endsWith(score.cs,'.0')}">
									<fmt:formatNumber value="${score.cs}" pattern="0"/>
								</c:when>
								<c:otherwise>
									${score.cs}
								</c:otherwise>
							</c:choose>
							<td align="center" class="content_L">
								<c:choose>
									<c:when test="${xy:hasPermission(user.id,'cs',2)}">
										<a class="bb" href="javascript:void(0);" onclick="openWin('<%=request.getContextPath()%>/cs/toUpdate.action?score.id=${score.id }','',650,280);">编辑</a>
									</c:when>
									<c:otherwise>
										...
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</c:if>

				<c:forEach var="i" begin="${my:length(page.datas)}" end="${ps-1}">
					<tr>
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
							id="tmpPZ" value="${ps}"
							onkeyup="javascript:if(event.keyCode ==13 ){selectPagesize(this)}">
						条









					</td>
				</tr>
			</table>
		</form>

	</body>
</html>
