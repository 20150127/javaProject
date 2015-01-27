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
    
    <title>准考证预览</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
		.anjian{
			cursor: hand;
		}
		body,td,th {
			font-size: 11px;
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
		.style8 {font-size: 18px}
		.style9 {
			font-size: 24px;
			font-weight: bold;
		}
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
<input type="button" value="打印准考证" onclick="javascript:printit()"><br>
<font style="font-size: 12px;color: red;">请打印前先进行页面设置，选择A6纸张，并设置合适的页边距</font>  
</center> 
  
<table width="100"  height="180" border="1" align="center" cellpadding="0" cellspacing="5" bordercolor="#000000">
  <tr>
    <td bordercolor="#FFFFFF">
     	<table    border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#000000">
	      	<tr align="center" valign="middle" bordercolor="#FFFFFF">
	        	<td height="30" colspan="5" nowrap><span class="style8"><br>${xy:zkzbt(1)}</span><br>
	             	<br>
	           			<span class="style9">准　考　证 </span> 
	            	<br>
	        	</td>
	      	</tr>
		      <tr valign="bottom" bordercolor="#FFFFFF" height="10">
		        <td   valign="bottom" nowrap>考生号</td>
		        <td  valign="bottom" nowrap class="bottom_line">&nbsp;&nbsp;${obj.examineeNum}</td>
		        <td  valign="bottom" nowrap>准考证号</td>
		        <td  valign="bottom" nowrap class="bottom_line">&nbsp;&nbsp;${obj.admissionId }</td>
		        <td  rowspan="4" align="right" valign="bottom" nowrap ><img src="<%=path%>/upload/${obj.examineeNum}.jpg" alt=
		"
		
		
		　　考　　
		
		　　生　　
		
		　　照　　
		
		　　片　　
		
		" name="pic_1" width="62" height="78" align="middle" id="pic_1" ></td>
		      </tr>
	      <tr valign="bottom" bordercolor="#FFFFFF">
	        <td  valign="bottom" nowrap>姓&nbsp;&nbsp;&nbsp;名</td>
	        <td valign="bottom" nowrap class="bottom_line" >&nbsp;&nbsp;${obj.name}</td>
	        <td valign="bottom" nowrap>性　　别</td>
	        <td valign="bottom" nowrap class="bottom_line" >&nbsp;&nbsp;${xy:sex(obj.sex)}</td>
	      </tr>
	      <tr valign="bottom" bordercolor="#FFFFFF">
	        <td  valign="bottom" nowrap>身份证号</td>
	        <td valign="bottom" nowrap class="bottom_line">${obj.IDCardNum}</td>
	        <td valign="bottom" nowrap>考 场 号</td>
	        <td valign="bottom" nowrap class="bottom_line">&nbsp;&nbsp;${obj.roomId}</td>
	      </tr>
	      <tr valign="bottom" bordercolor="#FFFFFF">
	        <td  valign="bottom" nowrap>所报专业</td>
	        <td colspan="3" valign="bottom" nowrap class="bottom_line">&nbsp;&nbsp;${obj.specialtyId.name}</td>
	      </tr>
	      <tr valign="bottom" bordercolor="#FFFFFF" height="20px;">
	        <td  nowrap>笔试时间</td>
	        <td colspan="4" nowrap class="bottom_line">&nbsp;&nbsp;${xy:bjsj(1)}</td>
	      </tr>
	      <tr valign="bottom" bordercolor="#FFFFFF" height="20px;">
	        <td  nowrap>复试时间</td>
	        <td colspan="4" nowrap class="bottom_line">&nbsp;&nbsp;${xy:fjsj(1)}</td>
	      </tr>
	      <tr valign="bottom" bordercolor="#FFFFFF" height="20px;">
	        <td  colspan="5" nowrap>
	        	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
		            <tr valign="bottom">
		              <td width="32%"  nowrap>笔试、复试及复试备考地点</td>
		              <td width="68%" class="bottom_line">${xy:ksdd(1)}</td>
		            </tr>
	        	</table>
	       </td>
	      </tr>
      <tr bordercolor="#FFFFFF">
        <td height="50" colspan="5"><br>
      <font style="font-size: 12px;">考生须知：</font><br>
      <font style="font-size: 11px;">1、考生必须持准考证和身份证进入考场，参加考试。</font><br>
      <font style="font-size: 11px;">2、考生须在考前40分钟到达考试地点，于开考前30分钟进入考场。</font><br>
      <font style="font-size: 11px;">3、笔试开考后15分钟考生不得进入考场，考试开始60分钟后考生方可交卷出场。</font><br>
      <font style="font-size: 11px;">4、考生需携带考试用具参加考试，2B铅笔、橡皮、蓝、黑色墨迹钢笔、签字笔或圆珠笔。</font><br>
      <font style="font-size: 11px;">5、严禁携带手机等通讯工具进入考场,不得使用计算器。</font><br>
      <font style="font-size: 11px;">6、此准考证笔试、复试均需使用，敬请保留到自主招生录取结束。</font>
      </td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
