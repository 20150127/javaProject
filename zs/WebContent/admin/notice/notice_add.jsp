<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="../../pub/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>公告信息新增</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <link href="<%=request.getContextPath() %>/css/methodfish.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script language="javascript" src="<%=request.getContextPath() %>/js/public.js"></script>
		<script language="javascript" src="<%=request.getContextPath()%>/js/calender.js"></script>
		<script language=javascript type="text/javascript">
		function addMore(){
			var inputs = document.getElementsByTagName("input");
			var j=0;
			for(var i=0;i<inputs.length;i++){
				if("file" == inputs[i].getAttribute("type")){
					j++;
					if(j>10){
						break;
					}
				}
			}
			if(j<10){
				var td = document.getElementById("td");
				var br = document.createElement("br");
				var input = document.createElement("input");
				var button = document.createElement("input");
				input.type = "file";
				input.name = "file";
				input.setAttribute("id", "doup");
				button.type = "button";
				button.value = "移除文件";
				button.setAttribute("id", "butt");
				button.onclick = function(){
					if (confirm("确定删除对该文件的上传?")){
						td.removeChild(br);
						td.removeChild(input);
						td.removeChild(button);
					}
				}
				td.appendChild(br);
				td.appendChild(input);
				td.appendChild(button);
			}else{
				alert("最多只能上传10个文件");
			}
		}
		
	function checkForm(){
		var nullReg = /^\s*$/;
		var accountReg = /^\w{6,16}$/;
		var numReg = /^\+?[1-9][0-9]*$/;
		var reg = /^([\u4E00-\u9FA5]|[\uFE30-\uFFA0]|[a-zA-Z])*$/;
		var snreg=/^[a-zA-Z0-9]*$/;
		
		if(nullReg.test($("#title").val())){
			$("#titleError").html("公告标题必须填写！");
  			$("#title").select();
  			$("#title").bind("keyup",function (){if(event.keyCode!=13){$("#titleError").html("");}});
  			return false;
		}
		if(nullReg.test($("#content").val())){
			$("#contentError").html("公告内容必须填写！");
  			$("#content").select();
  			$("#content").bind("keyup",function (){if(event.keyCode!=13){$("#contentError").html("");}});
  			return false;
		}
		if(($("#content").val()).length >2000) {
			$("#contentError").html("输入的内容超过规定长度！");
			return false;		
		}
		
		myform.submit();
	}

	
	function check(){
		if(($("#content").val()).length >2000) {
			$("#contentError").html("输入的内容超过规定长度！");
			return false;		
		}else{
			$("#contentError").html("");
			return true;
		}
		
	}
	
</script>
</head>
	<body class="middlebody">
		<form  name="myform"  method="post" action="<%=request.getContextPath() %>/notice/add.action" enctype="multipart/form-data">
			<input type="hidden" name="issueTime" value="<fmt:formatDate value='${now}' type='both' dateStyle='long' pattern='yyyy-MM-dd hh:mm:ss '/>">
			<input type="hidden" name="notice.ifissue" value="0">
			<table align="center" class="table" border="1" width="100%"
				style="border-collapse: collapse;">
				<tr>
					<td class="edit_Title">
						<img src="<%=request.getContextPath() %>/images/xiushi_04.gif" width="13" height="13">
						<font style="font-weight:bold;font-size:13">公告信息新增</font>
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
						公告标题
					</td>
					<td class="content_L" width="80%">
						<input type="text"  name="notice.title" id="title" maxlength="40" style="width:95%" class="f_input"  title="公告标题">
						<font  color="red" title="必填项">*</font><br>
						<font color="red" ><span id="titleError"></span></font>
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						公告内容
					</td>
					<td class="content_L" width="80%">
						<textarea  name="notice.content" style="width:95%;height:430px;"  id="content" wrap=hard  onblur="check()" class="f_textarea" rows="5" cols="54" title="公告内容"></textarea>
						<font  color="red" title="必填项">*</font><br>
						<font color="red" ><span id="contentError"></span></font>
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						发布人
					</td>
					<td class="content_L" width="80%">
						<input type="text"  name="notice.issuePerson" id="issuePerson" value="${sessionScope.user.userName }" maxlength="40" style="width:95%" class="f_input" title="发布人" readonly="readonly">
					</td>
				</tr>
				
				<tr>
					<td width="20%" class="title" align="center">
						附件上传
					</td>
					<td class="content_L" width="80%" id="td">
						<input type="file" name="file" maxlength="100" id="doup" ><br>
						<input type="button" onclick="addMore()" class="f_btn01" value="更多文件">
					</td>
				</tr>
				
				
			</table>
</form>
</body>

</html>
