<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../pub/taglib.jsp"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>单位详细信息</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	     <link href="<%=request.getContextPath() %>/css/methodfish.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script language="javascript" src="<%=request.getContextPath() %>/js/public.js"></script>
</head>
	<body>
			<table align="center" class="table" border="1" width="100%" style="border-collapse:collapse;">
				<tr>
					<td class="edit_Title">
						<img src="<%=request.getContextPath() %>/images/xiushi_04.gif" width="13" height="13">
						<font style="font-weight:bold;font-size:13">集合域详细</font>
					</td>
					<td align="right" width="50%">
						<input type="button" id="MLKZ_GuanBi" name="MLKZ_GuanBi" class="f_btn01" onClick=" if(!confirm('确定离开本页面吗？')) return false;window.close();" value="关闭">
					</td>
				</tr>
			</table>
			<table align="center" class="table" border="1" width="100%" style="border-collapse:collapse;">
				<tr>
					<td width="20%" class="title" align="center">
						集合域名称



					</td>
					<td class="content_L" width="60%">
						<input type="text"  name="domain.domainName" value="${domain.domainName}" id="domainName" maxlength="40" style="width:95%" class="f_input" title="集合域名称">
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">
						备注
					</td>
					<td class="content_L"  width="60%">
						<textarea  name="domain.remark" style="width:95%" id="remark" onblur="check()" class="f_textarea" rows="5" cols="50">${domain.remark }</textarea><br>
					</td>
				</tr>
			</table>
</body>

</html>
