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
    
    <title>考场信息</title>
    
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
@media print{
INPUT {display:none}
.not_disp {display:none}
.p_break{page-break-after:always;}

}
.style9 {color: #FF0000}
.style10 {
	font-size: 36px;
	font-weight: bold;
}
.style11 {font-size: 18px}
-->
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
window.location.href="<%=request.getContextPath()%>/examinee/ks.action?kch="+kc;
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
<c:if test="${!empty list}">
	<c:forEach items="${list}" var="v" step="${xy:kcrs(1)}" >
			<table width="90%"  border="1"  align="center" cellspacing="0" bordercolor="#000000" style="border-collapse:collapse" class="p_break">
				<tr>
					<td>
						<table width="100%"  border="1"  align="center" cellspacing="0" bordercolor="#000000" style="border-collapse:collapse" >
							<tr>
								<td colspan="6" style="height:20px;">
									<div>考场号：<c:choose><c:when test="${v.roomId<10}">0${v.roomId}</c:when><c:otherwise>${v.roomId}</c:otherwise></c:choose></div>
								</td>
							</tr>
							<tr bgcolor="#E6E6E6" height="13">
							    <td  bgcolor="#E2E2E2" align="center" width="15%">考场号</td>
							    <td  bgcolor="#E2E2E2" align="center" width="12%">姓名</td>
							    <td  bgcolor="#E2E2E2" align="center" width="15%">准考证号</td>
							    <td  bgcolor="#E2E2E2" align="center" width="11%">身份证号</td>
							    <td  bgcolor="#E2E2E2" align="center" width="8%" >照片</td>
							    <td  bgcolor="#E2E2E2" align="center" width="20%">备注</td>
							</tr>
							<c:forEach items="${list}" var="z" begin="${(v.roomId-1)*30}" end="${(v.roomId-1)*30+9}">
							<tr height="8">
								<td align="center"><c:choose><c:when test="${v.roomId<10}">${v.roomId}</c:when><c:otherwise>${v.roomId}</c:otherwise></c:choose></td>
								<td align="center">${z.name}</td>
								<td align="center">${z.admissionId}</td>
								<td align="center">${z.IDCardNum}</td>
								<td align="center"><img src="<%=path%>/upload/${z.examineeNum}.jpg" name="pic_1" width="75" height="95" align="middle" id="pic_1" ></td>
								<td align="center">&nbsp;</td>
							</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
				</table>
				<br>
				<table width="90%"  border="1"  align="center" cellspacing="0" bordercolor="#000000" style="border-collapse:collapse" class="p_break" >
				<tr>
					<td>
						<table width="100%"  border="1"  align="center" cellspacing="0" bordercolor="#000000" style="border-collapse:collapse" >
							<tr>
								<td colspan="6" style="height:20px;">
									<div>考场号：<c:choose><c:when test="${v.roomId<10}">0${v.roomId}</c:when><c:otherwise>${v.roomId}</c:otherwise></c:choose></div>
								</td>
							</tr>
							<tr bgcolor="#E6E6E6" height="13">
							    <td  bgcolor="#E2E2E2" align="center" width="15%">考场号</td>
							    <td  bgcolor="#E2E2E2" align="center" width="12%">姓名</td>
							    <td  bgcolor="#E2E2E2" align="center" width="15%">准考证号</td>
							    <td  bgcolor="#E2E2E2" align="center" width="11%">身份证号</td>
							    <td  bgcolor="#E2E2E2" align="center" width="8%" >照片</td>
							    <td  bgcolor="#E2E2E2" align="center" width="20%">备注</td>
							</tr>
							<c:forEach items="${list}" var="z" begin="${(v.roomId-1)*30+10}" end="${(v.roomId-1)*30+19}">
							<tr height="8">
								<td align="center"><c:choose><c:when test="${v.roomId<10}">${v.roomId}</c:when><c:otherwise>${v.roomId}</c:otherwise></c:choose></td>
								<td align="center">${z.name}</td>
								<td align="center">${z.admissionId}</td>
								<td align="center">${z.IDCardNum}</td>
								<td align="center"><img src="<%=path%>/upload/${z.examineeNum}.jpg"  name="pic_1" width="75" height="95" align="middle" id="pic_1" ></td>
								<td align="center">&nbsp;</td>
							</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
				</table>
				<br>
				<table width="90%"  border="1"  align="center" cellspacing="0" bordercolor="#000000" style="border-collapse:collapse" class="p_break">
				<tr>
					<td>
						<table width="100%"  border="1"  align="center" cellspacing="0" bordercolor="#000000" style="border-collapse:collapse">
							<tr>
								<td colspan="6" style="height:20px;">
									<div>考场号：<c:choose><c:when test="${v.roomId<10}">0${v.roomId}</c:when><c:otherwise>${v.roomId}</c:otherwise></c:choose></div>
								</td>
							</tr>
							<tr bgcolor="#E6E6E6" height="13">
							    <td  bgcolor="#E2E2E2" align="center" width="15%">考场号</td>
							    <td  bgcolor="#E2E2E2" align="center" width="12%">姓名</td>
							    <td  bgcolor="#E2E2E2" align="center" width="15%">准考证号</td>
							    <td  bgcolor="#E2E2E2" align="center" width="11%">身份证号</td>
							    <td  bgcolor="#E2E2E2" align="center" width="8%" >照片</td>
							    <td  bgcolor="#E2E2E2" align="center" width="20%">备注</td>
							</tr>
							<c:forEach items="${list}" var="z" begin="${(v.roomId-1)*30+20}" end="${(v.roomId-1)*30+29}">
							<tr height="8">
								<td align="center"><c:choose><c:when test="${v.roomId<10}">${v.roomId}</c:when><c:otherwise>${v.roomId}</c:otherwise></c:choose></td>
								<td align="center">${z.name}</td>
								<td align="center">${z.admissionId}</td>
								<td align="center">${z.IDCardNum}</td>
								<td align="center"><img src="<%=path%>/upload/${z.examineeNum}.jpg"  name="pic_1" width="75" height="95" align="middle" id="pic_1" ></td>
								<td align="center">&nbsp;</td>
							</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
		</table>
		<br>
		<br>
 	</c:forEach>
</c:if>
</body>
</html>

