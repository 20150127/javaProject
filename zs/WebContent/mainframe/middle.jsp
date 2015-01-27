<%@ page language="java"  pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
		<!--
		body {margin: 0px;}
		-->
	</style>
	<script language="javascript">
		var displayCol=top.document.getElementById("mid").cols;
		var visabledCol="";
		var index = displayCol.indexOf(",");
		if(displayCol.length>0 ){
			visabledCol = "0"+displayCol.substring(index,displayCol.length);
		}
		
		function ctrlLeft(obj){
			if(obj.src.indexOf("images/left_04.gif")==-1){
				obj.src = obj.src.replace(/left_04_new/,"left_04");
			}
			else{
				obj.src = obj.src.replace(/left_04/,"left_04_new");
			}
			var o = top.document.getElementById("mid");
			
			o.cols = (o.cols==visabledCol?displayCol:visabledCol);
		}
	</script>
</head>

<body>
<table width="10" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="middle" background="<%=request.getContextPath()%>/images/left_03.gif"><img src="<%=request.getContextPath()%>/images/left_04.gif" width="10" height="20" style="cursor: hand; " onClick="ctrlLeft(this)"></td>
  </tr>
</table>
</body>
</html>
