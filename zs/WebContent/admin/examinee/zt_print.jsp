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
    
    <title>考场桌贴</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
	<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style9 {color: #FF0000}
.p_break {page-break-after:always;}
.style10 {
	font-size: 34px;
	font-weight: bold;
}
.style11 {font-size: 16px}
.style12 {font-size: 14px}
-->
@media print{
INPUT {display:none}
.not_disp {display:none}
.p_break{page-break-after:always;}

}
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
function KC(){
var kc=$("#kc").val();
window.location.href="<%=request.getContextPath()%>/examinee/zt.action?kch="+kc;
}
</script>
</head>
<body>
    
    
<center class="not_disp" > 
<input type="button" value="打印" onclick="javascript:printit()">  
<select name="kc" id="kc" onchange="KC()">
	<option value="0">全部</option>
	<c:forEach items="${kc}" var="i">
	<c:choose>
		<c:when test="${kch==i}">
			<c:choose>
				<c:when test="${i==0}"></c:when>
				<c:otherwise><option value="${i}" selected>第${i}考场</option></c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
		<c:choose>
				<c:when test="${i==0}"></c:when>
				<c:otherwise><option value="${i}">第${i}考场</option></c:otherwise>
			</c:choose>
		
		</c:otherwise>
	
	</c:choose>
	</c:forEach>
</select>
</center> 
 <br>
	<table width="100%"  border="0"  cellpadding="0" cellspacing="1">
		<c:if test="${!empty list}">
				<tr >
					<td valign="top" align="left" width="35%">
						<c:forEach items="${list}" var="z" begin="0" step="3" varStatus="index">
								<c:choose>
								<c:when test="${(index.index+3)/5==3 || (index.index+3)%5==0}">
									<BR>
									<BR>
									<BR>
									<table width="100%"  border="0" cellspacing="0" cellpadding="0" class="p_break">
										<tr><td><span class="style10">第${z.roomId}考场</span></td></tr>
						        		<tr><td><span class="style11"><strong>姓　　名：</strong></span><span class="style12">${z.name}</span></td></tr>
						        		<tr><td><span class="style11"><strong>性　　别：</strong></span><span class="style12">${xy:sex(z.sex)}</span></td></tr>
						        		<tr><td nowrap><span class="style11"><strong>身份证号：</strong></span><span class="style12">${z.IDCardNum}</span></td></tr>
						        		<tr><td><span class="style11"><strong>准考证号：</strong></span><span class="style12">${z.admissionId}</span></td></tr>
									</table>
								</c:when>
								<c:otherwise>
									<BR>
									<BR>
									<BR>
									<table width="100%"  border="0" cellspacing="0" cellpadding="0">
										<tr><td><span class="style10">第${z.roomId}考场</span></td></tr>
						        		<tr><td><span class="style11"><strong>姓　　名：</strong></span><span class="style12">${z.name}</span></td></tr>
						        		<tr><td><span class="style11"><strong>性　　别：</strong></span><span class="style12">${xy:sex(z.sex)}</span></td></tr>
						        		<tr><td nowrap><span class="style11"><strong>身份证号：</strong></span><span class="style12">${z.IDCardNum}</span></td></tr>
						        		<tr><td><span class="style11"><strong>准考证号：</strong></span><span class="style12">${z.admissionId}</span></td></tr>
									</table>
								</c:otherwise>
								</c:choose>
								<BR>
								<BR>
								<BR>
						</c:forEach>
					</td>
					<td valign="top" align="center" width="35%">
						<c:forEach items="${list}" var="z" begin="1" step="3" varStatus="index" >
						<c:choose>
							<c:when test="${(index.index+2)/5==3 || (index.index+2)%5==0}">
									<BR>
									<BR>
									<BR>
								<table width="100%"  border="0" cellspacing="0" cellpadding="0" class="p_break">
									<tr><td><span class="style10">第${z.roomId}考场</span></td></tr>
					        		<tr><td><span class="style11"><strong>姓　　名：</strong></span><span class="style12">${z.name}</span></td></tr>
					        		<tr><td><span class="style11"><strong>性　　别：</strong></span><span class="style12">${xy:sex(z.sex)}</span></td></tr>
					        		<tr><td><span class="style11"><strong>身份证号：</strong></span><span class="style12">${z.IDCardNum}</span></td></tr>
					        		<tr><td><span class="style11"><strong>准考证号：</strong></span><span class="style12">${z.admissionId}</span></td></tr>
								</table>
							</c:when>
							<c:otherwise>
									<BR>
									<BR>
									<BR>
								<table width="100%"  border="0" cellspacing="0" cellpadding="0">
									<tr><td><span class="style10">第${z.roomId}考场</span></td></tr>
					        		<tr><td><span class="style11"><strong>姓　　名：</strong></span><span class="style12">${z.name}</span></td></tr>
					        		<tr><td><span class="style11"><strong>性　　别：</strong></span><span class="style12">${xy:sex(z.sex)}</span></td></tr>
					        		<tr><td><span class="style11"><strong>身份证号：</strong></span><span class="style12">${z.IDCardNum}</span></td></tr>
					        		<tr><td><span class="style11"><strong>准考证号：</strong></span><span class="style12">${z.admissionId}</span></td></tr>
								</table>
							</c:otherwise>
							</c:choose>
							<BR>
							<BR>
							<BR>
						</c:forEach>
					</td>
					<td valign="top" align="right" width="30%">
						<c:forEach items="${list}" var="z"  begin="2" step="3"  varStatus="index">
						<c:choose>
							<c:when test="${(index.index+1)/5==3 || (index.index+1)%5==0}">
									<BR>
									<BR>
									<BR>
								<table width="100%"  border="0" cellspacing="0" cellpadding="0" class="p_break">
									<tr><td ><span class="style10">第${z.roomId}考场</span></td></tr>
					        		<tr><td ><span class="style11"><strong>姓　　名：</strong></span><span class="style12">${z.name}</span></td></tr>
					        		<tr><td><span class="style11"><strong>性　　别：</strong></span><span class="style12">${xy:sex(z.sex)}</span></td></tr>
					        		<tr><td><span class="style11"><strong>身份证号：</strong></span><span class="style12">${z.IDCardNum}</span></td></tr>
					        		<tr><td><span class="style11"><strong>准考证号：</strong></span><span class="style12">${z.admissionId}</span></td></tr>
								</table>
							</c:when>
							<c:otherwise>
									<BR>
									<BR>
									<BR>
								<table width="100%"  border="0" cellspacing="0" cellpadding="0">
									<tr><td ><span class="style10">第${z.roomId}考场</span></td></tr>
					        		<tr><td ><span class="style11"><strong>姓　　名：</strong></span><span class="style12">${z.name}</span></td></tr>
					        		<tr><td><span class="style11"><strong>性　　别：</strong></span><span class="style12">${xy:sex(z.sex)}</span></td></tr>
					        		<tr><td><span class="style11"><strong>身份证号：</strong></span><span class="style12">${z.IDCardNum}</span></td></tr>
					        		<tr><td><span class="style11"><strong>准考证号：</strong></span><span class="style12">${z.admissionId}</span></td></tr>
								</table>
							</c:otherwise>
							</c:choose>
							<BR>
							<BR>
							<BR>
						</c:forEach>
				
					</td>
				</tr>
		</c:if>
	</table>
</body>
</html>
