<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../pub/taglib.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>录取通知书</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
	<style type="text/css">
<!--
.anjian{
	cursor: hand;
}
body,td,th {
	font-size: 30px;
	font-family: 楷体_GB2312;
}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url();
}
.bround {
	background-image: url(images/jxl.gif);
	background-repeat: no-repeat;
	background-position: left bottom;
}
.bottom_line {
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: #000000;
}
table {
	line-height: 58px;
}
.jiao {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 18px;
	line-height: normal;
}
.style7 {
	font-weight: bold;
	font-size: 28px;
	line-height: 28px;
}
.style8 {
	font-size: 12px;
	font-family: "Times New Roman", Times, serif;
}
.style9 {color: #FF0000}

-->
</style>
<style media="print">  
.Noprint{display:none;}<!--用本样式在打印时隐藏非打印项目-->  
.PageNext{page-break-after: always;}<!--控制分页-->  
</style>  
<script language="javascript"> 
　　function printsetup(){ 
	　　wb.execwb(8,1); 
　　} 
　　function printpreview(){ 
　　	   wb.execwb(7,1); 
　　} 
　　function printit() 
　　{ 
　　if (confirm('确定打印吗？')) {
 		PageSetup_Null();
　　		window.print();
　　} 
　　} 

　　</script> 
<script  language="JavaScript">   
var HKEY_Root,HKEY_Path,HKEY_Key; 
HKEY_Root="HKEY_CURRENT_USER"; 
HKEY_Path="\\Software\\Microsoft\\Internet Explorer\\PageSetup\\"; 
//设置网页打印的页眉页脚为空 
function PageSetup_Null() 
{ 
 try 
 { 
         var Wsh=new ActiveXObject("WScript.Shell"); 
  HKEY_Key="header"; 
  Wsh.RegWrite(HKEY_Root+HKEY_Path+HKEY_Key,""); 
  HKEY_Key="footer"; 
  Wsh.RegWrite(HKEY_Root+HKEY_Path+HKEY_Key,""); 
 } 
 catch(e){} 
} 
//设置网页打印的页眉页脚为默认值 
function  PageSetup_Default() 
{   
 try 
 { 
  var Wsh=new ActiveXObject("WScript.Shell"); 
  HKEY_Key="header"; 
  Wsh.RegWrite(HKEY_Root+HKEY_Path+HKEY_Key,"&w&b页码,&p/&P"); 
  HKEY_Key="footer"; 
  Wsh.RegWrite(HKEY_Root+HKEY_Path+HKEY_Key,"&u&b&d"); 
 } 
 catch(e){} 
} 

</script>
</head>
<body>
    
<center class="Noprint" > 
<input type="button" value="打印录取通知书" onclick="javascript:printit()">  
</center> 
 <br>
 <table width="650" border="0" align="center" cellpadding="0" cellspacing="0" class="p_break">
  <tr>
    <td height="28" valign="top" nowrap class="style7">${obj.examineeNum}</td>
  </tr>
  <tr>
    <td height="56" valign="top" nowrap><strong>${obj.name}</strong>你好！</td>
  </tr>
  <tr>
    <td height="180">&nbsp;&nbsp;&nbsp;&nbsp;经北京市高校招生办公室批准，你已被我院《<strong>${obj.specialtyId.name}</strong>》专业录取，请仔细阅读新生入学须知，${xy:bdsj(1)}。</td>
  </tr>
  <tr align="right">
    <td height="90"><table width="323" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="303" align="right" nowrap class="jiao">首钢工学院招生与就业指导办公室<br>${xy:fzsj(1)}</td>
        <td width="20" align="right" nowrap class="jiao">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
 
 
</body>
</html>
