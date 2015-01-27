<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="../../pub/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>问题解答</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <link href="<%=request.getContextPath() %>/css/methodfish.css" rel="stylesheet" type="text/css">
		<link href="<%=request.getContextPath() %>/css/calendar_tas.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script language="javascript" src="<%=request.getContextPath() %>/js/public.js"></script>
		<script language="javascript" src="<%=request.getContextPath()%>/js/calender.js"></script>
		<script language=javascript type="text/javascript">
		
		
	function checkForm(){
		
		if(($("#answer").val()).length >2000) {
			$("#answerError").html("输入的内容超过规定长度！");
			return false;		
		}
		
		myform.submit();
	}

	
	function check(){
		if(($("#answer").val()).length >2000) {
			$("#answerError").html("输入的内容超过规定长度！");
			return false;		
		}else{
			$("#answerError").html("");
			return true;
		}
		
	}
	
</script>
</head>
	<body class="middlebody">
		<form  name="myform"  method="post" action="<%=request.getContextPath() %>/guestBook/update.action" enctype="multipart/form-data">
			<input type="hidden" name="guestBook.id" value="${guestBook.id }">
			<table align="center" class="table" border="1" width="100%"
				style="border-collapse: collapse;">
				<tr>
					<td class="edit_Title">
						<img src="<%=request.getContextPath() %>/images/xiushi_04.gif" width="13" height="13">
						<font style="font-weight:bold;font-size:13">问题解答</font>
					</td>
					<td class="edit_Title" align="right" width="50%">
						<c:if test="${xy:hasPermission(user.id,'guestBook',2)}">
						<input type="button" id="MLKZ_BaoCun" name="MLKZ_BaoCun" class="f_btn01"  value="保存" onclick="checkForm();">
						</c:if>
						<input type="button" id="MLKZ_GuanBi" name="MLKZ_GuanBi" class="f_btn01" onClick=" if(!confirm('确定离开本页面吗？')) return false;window.close();" value="关闭">
					</td>
				</tr>
			</table>
			<table align="center" class="table" border="1" width="100%"
				style="border-collapse: collapse;">
				<tr>
					<td width="20%" class="title" align="center">
						提问人
					</td>
					<td class="content_L" width="30%">
						${guestBook.asker.name }
					</td>
					<td width="20%" class="title" align="center">
						提问时间
					</td>
					<td class="content_L" width="30%">
						${guestBook.askTime }
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						问题标题
					</td>
					<td class="content_L" width="80%" colspan="3">
						${guestBook.title }
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						问题描述
					</td>
					<td class="content_L" width="80%" colspan="3">
						${guestBook.content}
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						回答内容
					</td>
					<td class="content_L" width="80%" colspan="3">
						<textarea  name="guestBook.answer" style="width:95%" id="answer" onblur="check()" class="f_textarea" rows="5" cols="20" title="回答内容">${guestBook.answer}</textarea>
						<font  color="red" title="必填项">*</font><br>
						<font color="red" ><span id="answerError"></span></font>
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						回答人
					</td>
					<td class="content_L" width="80%" colspan="3">
						<input type="text" name="guestBook.answerPerson"  class="f_input" style="width:95%" value="${sessionScope.user.userName }"  readonly="readonly">
						
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						回答时间
					</td>
					<td class="content_L" width="80%" colspan="3">
						<input type="text" name="guestBook.answerTime"  class="f_input" style="width:95%" value="<fmt:formatDate value='${now}' type='both' dateStyle='long' pattern='yyyy-MM-dd hh:mm:ss '/>" readonly="readonly">
					</td>
				</tr>
				
				
				
			</table>
</form>
</body>

</html>
