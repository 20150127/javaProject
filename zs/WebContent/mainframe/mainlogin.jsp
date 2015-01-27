<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../pub/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
	<HEAD>
		<TITLE>北京青年政治学院网管中心设备管理系统</TITLE>
		<META http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<META HTTP-EQUIV="Expires" CONTENT="Tue, 01 Jan 1980 1:00:00 GMT">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<META content="MSHTML 6.00.2800.1106" name=GENERATOR>
		<META content=ISTblPrn.ISTblOut.HtmlDocument name=ProgId>
	    <style type="text/css">
<!--
.unnamed1 {
	background-image: url(../images/main_leader1.jpg);
	background-repeat: no-repeat;
	background-color:#ffffff;
}
-->
        </style>
        <script language="javascript">
	function relogin(){
		window.open("<%=request.getContextPath()%>/index.jsp","newwindow");
		window.close();
		window.parent.window = null;
		window.parent.window.close();
	}
	window.onload=function(){
		alert("登录超时或者您使用的是非法账号，请重新登陆!");
		relogin();
	}
</script>
	</HEAD>
	<LINK REL="stylesheet" TYPE="text/css" HREF="../mainframe/methodfish.css">
	
	<BODY bottomMargin=0 leftMargin=0 topMargin=0 rightMargin=0 class="unnamed1" style="OVERFLOW:hidden;background-color:#FFFFFF">
		
	</BODY>
</HTML>
