<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../pub/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
		<title>笔试成绩编辑</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <link href="<%=request.getContextPath() %>/css/methodfish.css" rel="stylesheet" type="text/css">
		<link href="<%=request.getContextPath() %>/css/calendar_tas.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script language="javascript" src="<%=request.getContextPath() %>/js/public.js"></script>
		<script language=javascript type="text/javascript">
		
		function toSumScore(){
			var bjyw = FormatNumber($("#bjyw").val(),1);
			var bjsx = FormatNumber($("#bjsx").val(),1);
			var bjyy = FormatNumber($("#bjyy").val(),1);
			var sumscore = bjyw+bjsx+bjyy;
			document.getElementById("sumscore").value = FormatNumber(sumscore,1);
		}

		function checkForm(){
			var nullReg = /^\s*$/;
			var floatReg = /^\d+(\.\d+)?$/;
			if(!nullReg.test($("#bjyw").val())){
				if(!floatReg.test($("#bjyw").val())){
					$("#bjywError").html("语文成绩填写不正确！");
		  			$("#bjyw").select();
		  			$("#bjyw").bind("keyup",function (){if(event.keyCode!=13){$("#bjywError").html("");}});
		  			return false;
				}
			}
			if(!nullReg.test($("#bjsx").val())){
				if(!floatReg.test($("#bjsx").val())){
					$("#bjsxError").html("数学成绩填写不正确！");
		  			$("#bjsx").select();
		  			$("#bjsx").bind("keyup",function (){if(event.keyCode!=13){$("#bjsxError").html("");}});
		  			return false;
				}
			}
			if(!nullReg.test($("#bjyy").val())){
				if(!floatReg.test($("#bjyy").val())){
					$("#bjyyError").html("英语成绩填写不正确！");
		  			$("#bjyy").select();
		  			$("#bjyy").bind("keyup",function (){if(event.keyCode!=13){$("#bjyyError").html("");}});
		  			return false;
				}
			}
			
			myform.submit();
		}
	
	
</script>
</head>
	<body class="middlebody">
		<form name="myform"  method="post" action="<%=request.getContextPath() %>/bj/update.action" >
			<input type="hidden" name="score.id" value="${score.id }">
			<table align="center" class="table" border="1" width="100%"
				style="border-collapse: collapse;" cellspacing="1">
				<tr>
					<td class="content_L">
					<div align="left" style="float: left;width: 50%;">
						<img src="<%=request.getContextPath() %>/images/xiushi_04.gif" width="13" height="13"><b>笔试成绩</b>
					</div>
					<div  align="right">
						<c:if test="${xy:hasPermission(user.id,'bj',2)}">
							<input type="button" id="MLKZ_BaoCun" name="MLKZ_BaoCun" class="f_btn01"  value="保存" onclick="checkForm()">
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
						考生号


					</td>
					<td class="content_L" width="60%">
						${score.examineeNum }
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						姓名
					</td>
					<td class="content_L" width="60%">
						${score.name }
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						身份证号
					</td>
					<td class="content_L" width="60%">
						${score.IDCardNum }
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						准考证号


					</td>
					<td class="content_L" width="60%">
						${score.admissionId }
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						考场号


					</td>
					<td class="content_L" width="60%">
						${score.roomId }
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						语文成绩
					</td>
					<td class="content_L" width="60%">
						<c:choose>
							<c:when test="${my:endsWith(score.bjyw,'.0')}">
								<input type="text"  name="score.bjyw" id="bjyw" value="<fmt:formatNumber value='${score.bjyw}' pattern="0"/>" maxlength="40" style="width:95%" class="f_input" title="语文成绩">
							</c:when>
							<c:otherwise>
								<input type="text"  name="score.bjyw" id="bjyw" value="${score.bjyw}" maxlength="40" style="width:95%" class="f_input" title="语文成绩">
							</c:otherwise>
						</c:choose>
						<font  color="red" title="必填项">*</font><br>
						<font color="red" ><span id="bjywError"></span></font>
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						数学成绩
					</td>
					<td class="content_L" width="60%">
						<c:choose>
							<c:when test="${my:endsWith(score.bjsx,'.0')}">
								<input type="text"  name="score.bjsx" id="bjsx" value="<fmt:formatNumber value='${score.bjsx}' pattern="0"/>" maxlength="40" style="width:95%" class="f_input" title="数学成绩">
							</c:when>
							<c:otherwise>
								<input type="text"  name="score.bjsx" id="bjsx" value="${score.bjsx}" maxlength="40" style="width:95%" class="f_input" title="数学成绩">
							</c:otherwise>
						</c:choose>
						
						<font  color="red" title="必填项">*</font><br>
						<font color="red" ><span id="bjsxError"></span></font>
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						英语成绩
					</td>
					<td class="content_L" width="60%">
						<c:choose>
							<c:when test="${my:endsWith(score.bjyy,'.0')}">
								<input type="text"  name="score.bjyy" id="bjyy" value="<fmt:formatNumber value='${score.bjyy}' pattern="0"/>" maxlength="40" style="width:95%" class="f_input" title="英语成绩">
							</c:when>
							<c:otherwise>
								<input type="text"  name="score.bjyy" id="bjyy" value="${score.bjyy}" maxlength="40" style="width:95%" class="f_input" title="英语成绩">
							</c:otherwise>
						</c:choose>
						<font  color="red" title="必填项">*</font><br>
						<font color="red" ><span id="bjyyError"></span></font>
					</td>
				</tr>
				<!-- <tr>
					<td width="20%" class="title" align="center">
						总分
					</td>
					<td class="content_L" width="60%">
						<c:choose>
							<c:when test="${my:endsWith(score.bjyw+score.bjsx+score.bjyy,'.0')}">
								<input type="text"  name="sumscore" id="sumscore" value="<fmt:formatNumber value='${score.bjyw+score.bjsx+score.bjyy}' pattern="0"/>" maxlength="40" style="width:95%" class="f_input" title="总分" onclick="toSumScore();">
							</c:when>
							<c:otherwise>
								<input type="text"  name="sumscore" id="sumscore" value="${score.bjyw+score.bjsx+score.bjyy}" maxlength="40" style="width:95%" class="f_input" title="总分" onclick="toSumScore();">
							</c:otherwise>
						</c:choose>
						<font  color="red" title="必填项">*</font><br>
						<font color="red" ><span id="scoreNameError"></span></font>
					</td>
				</tr> -->

				
				
			</table>
</form>
</body>

</html>
