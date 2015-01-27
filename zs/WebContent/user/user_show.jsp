<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../pub/taglib.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>注册信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
 <style type="text/css">
<!--
/* CSS Tabs */
A.leftmenu:link {
	DISPLAY: block; WIDTH: 100%; COLOR:#000000; LINE-HEIGHT: 44px; FONT-FAMILY: "宋体"; HEIGHT: 20px; TEXT-ALIGN:center; TEXT-DECORATION: none
}
a.bb:link, a.bb:active, a.bb:visited{TEXT-DECORATION:none ;Color:#000000;}/*ߵ*/

a.bb:hover{TEXT-DECORATION:underline ;Color:#945678;}
table{
	font-size: 15px;font-family: "宋体";
}
.f_btn01 {
BORDER-RIGHT: #7b9ebd 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #7b9ebd 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 12px; FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ffffff, EndColorStr=#cecfde); BORDER-LEFT: #7b9ebd 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #7b9ebd 1px solid
}
A.leftmenu:link {
	DISPLAY: block; WIDTH: 100%; COLOR: #1785aa; LINE-HEIGHT: 30px; FONT-FAMILY: "宋体"; HEIGHT: 20px; TEXT-ALIGN: left; TEXT-DECORATION: none
}
A.leftmenu:visited {
	DISPLAY: block; WIDTH: 100%; COLOR: #1785aa; LINE-HEIGHT: 30px; FONT-FAMILY: "宋体"; HEIGHT: 20px; TEXT-ALIGN: left; TEXT-DECORATION: none
}
A.leftmenu:hover {
	DISPLAY: block; WIDTH: 100%; COLOR: #1785aa; LINE-HEIGHT: 30px; FONT-FAMILY: "宋体"; HEIGHT: 20px; background:url(<%=request.getContextPath()%>/images/cc.gif); TEXT-ALIGN: left; TEXT-DECORATION: none
}
#apDiv1 {
	position:absolute;
	width:714px;
	height:33px;
	z-index:1;
	left: 284px;
	top: 197px;
	float:right;
}
#navcontainer { 
}
			
ul#navlist {
	margin: 1px 0 0 0;
	padding: 0;
	list-style-type: none;
	white-space: nowrap;
}
			
ul#navlist li {
	float: left;
	font-family: verdana, arial, sans-serif;
	font-size: 14px;
	font-weight: bold;
	margin: 0;
	padding: 3px 0 2px 0;
	border-top:0px solid #e0ede9;
	border-bottom: 0px solid #e0ede9;
}
			
#navlist a, #navlist a:link {
	margin: 0;
	padding: 5px 9px 4px 9px;
	color:#333333;
	border-right: 0px dashed #d1e3db;
	text-decoration: none;
}
			
ul#navlist li#active {
	color: #95bbae;
	background-color: #deebe5;
}
			
#navlist a:hover {
	color:#FFFFFF; 
	background:url(<%=request.getContextPath()%>/images/bb.gif);
}
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
 		var d=document.getElementById("pr");
 		var t=document.getElementById("t");
 		//alert(d);
 		d.style.display='';
 		t.style.display='none';
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
    

  
	<table width="1000px;" align="center" border="0" cellspacing="0" cellpadding="0" background="<%=request.getContextPath()%>/images/logobg3.jpg" class="Noprint">
  <tr>
    <td height="230" align="center" valign="top">
    <table width="88%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="44%" align="left" valign="bottom"><img src="<%=request.getContextPath()%>/images/logos.jpg" /></td>
    <td width="8%">&nbsp;</td>
    <td width="48%" align="left" valign="bottom"><img src="<%=request.getContextPath()%>/images/logos1.jpg" /></td>
  </tr>
</table>
<table width="88%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left" valign="middle">
      <div class="1" id="1" style="margin-top:8px; height:44px; background:url(<%=request.getContextPath()%>/images/logobgs.jpg)">
      <table width="729" height="44" border="0" cellpadding="0" cellspacing="0" background="<%=request.getContextPath()%>/images/logobgs.jpg" style="font-size:14px;
    font-weight:bold;">
  <tr>
    
    <td width="106" align="center"><div id="navcontainer"  style="margin-left:8px;"><ul id="navlist"><li><a href="<%=path%>/us/toUpdate.action" class="bb">修改报名信息</a></li></ul></div></td>
    <td width="5" align="center"><img src="<%=request.getContextPath()%>/images/lines1.jpg" alt="" /></td>
    <td width="106" align="center"><div id="navcontainer"  style="margin-left:0px;"><ul id="navlist"><li><a href="#" class="bb">打印报名信息</a></li></ul></div></td>
    <td width="5" align="center"><img src="<%=request.getContextPath()%>/images/lines1.jpg" alt="" /></td>
    <td width="106" align="center"><div id="navcontainer"  style="margin-left:0px;"><ul id="navlist"><li><a href="<%=path%>/us/queryInfo.action" class="bb">查询录取通知</a></li></ul></div></td>
    <td width="5" align="center"><img src="<%=request.getContextPath()%>/images/lines1.jpg" alt="" /></td>
	 <td width="86" align="center"><div id="navcontainer"  style="margin-left:0px;"><ul id="navlist"><li><a href="<%=path%>/us/listBook.action" class="bb">留言板</a></li></ul></div></td>
    <td width="5" align="center"><img src="<%=request.getContextPath()%>/images/lines1.jpg" alt="" /></td>
    <td width="76" height="44" align="center"><div id="navcontainer"  style="margin-left:0px;"><ul id="navlist"><li><a href="<%=path%>/us/toUpdatepwd.action" class="bb">修改密码</a></li></ul></div></td>
    <td width="5" align="center"><img src="<%=request.getContextPath()%>/images/lines1.jpg" alt="" /></td>
    <td width="106" align="center"><div id="navcontainer"  style="margin-left:0px;"><ul id="navlist"><li><a href="<%=path%>/us/exit.action" class="bb">退出系统</a></li></ul></div></td>
<td width="11"><img src="<%=request.getContextPath()%>/images/lines1.jpg" alt="" /></td>
<td width="106" align="center">&nbsp;</td>
  </tr>
</table>
      </div>  
      
        <div class="2" id="2" style="float:right; margin-top:-56px;">
        <div id="xixi" style="width:268px; height:122px; background:url(<%=request.getContextPath()%>/images/gga.jpg); line-height:22px; font-size:16px;">
      <p style=" margin-top:24px; margin-left:20px;font-size: 13px;font-weight: bold">
      欢迎<font color="#945678"><c:choose><c:when test="${not empty sessionScope.o}">${sessionScope.o.name}</c:when><c:otherwise>您</c:otherwise></c:choose></font>登陆系统<br />
       <span  id="time"><script>document.getElementById('time').innerHTML=new Date().toLocaleString()+'<br/>&nbsp;&nbsp;'+' 星期'+'日一二三四五六'.charAt(new Date().getDay());setInterval("document.getElementById('time').innerHTML=new Date().toLocaleString()+'<br/>&nbsp;&nbsp;'+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
</script>
      </span>
        </div>
        

 
       </td>
  </tr>
</table>

</td>
  </tr>
</table>

<div id="pr" style="display: none;" >

<table width="628px" height="600px;"  align="center" border="0" cellspacing="0" cellpadding="0"  >
  <tr valign="middle" >
    <td align="center" valign="middle" >
					    <table width="650px" height="573" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#333333" style="margin-top:4px;background-color: #FFFFFF;">
					  	<caption>	
							         <h1><strong><br><br>${sysv.registerTitle }年北京青年政治学院<br>高等职业教育自主招生报名表</strong></h1>
						    <div align="left">考生号：${o.examineeNum }</div>
						</caption>
						
					  <tr>
					    <td width="20%" height="33" align="middle">姓名</td>
					    <td width="14%" align="middle">${o.name }</td>
					    <td width="14%" align="middle">性别</td>
					    <td width="12%" align="middle">${xy:sex(o.sex)}</td>
					    <td width="14%" align="middle">民族</td>
					    <td width="14%" align="middle">${xy:mz(o.nationality)}</td>
					    <td width="87" height="150" rowspan="5" align="center" width="14%" rowspan="5"
													valign="middle">
													<img src="<%=path%>/upload/${o.examineeNum}.jpg" name="pic_1" width="120" height="150" border="1" align="middle" id="pic_1">
												</td>
					  </tr>
					  <tr>
					    <td height="17" height="33" align="middle">出生日期</td>
					    <td align="middle">${o.birthday }</td>
					    <td align="middle">政治面貌</td>
					    <td align="middle">${xy:zzmm(o.politics)}</td>
					    <td align="middle">考生类别</td>
					    <td align="middle">${xy:kslb(o.examineeType)}</td>
					    </tr>
					  <tr>
					    <td align="middle" height="33">身份证号 </td>
					    <td align="left" colspan="5">${o.IDCardNum }</td>
					    </tr>
					   <tr>
					    <td align="middle" height="33">所在(或毕业)学校</td>
					    <td colspan="3" align="left">${o.school }</td>
					    <td align="middle">毕业时间</td>
					    <td align="left">${o.graduationDate }</td>
					    </tr>
					  <tr>
					    <td align="middle" height="33">家庭住址</td>
					    <td colspan="5" align="left">${o.address }</td>
					    </tr>
					     <tr>
					    <td align="middle" height="33">户口所在街道</td>
					    <td colspan="6" align="left">${o.street }</td>
					    </tr> 	
					  <tr>
					    <td align="middle" height="33">住址电话</td>
					    <td colspan="3" align="left">${o.homePhone }</td>
					    <td align="middle">手机</td>
					    <td colspan="2" align="left">${o.mobilePhone }</td>
					  </tr>
					  <tr>
					    <td align="middle" height="33">邮寄录取通知书地址</td>
					    <td colspan="6" align="left">${o.letterAddress }</td>
					    </tr>
					  <tr>
					    <td align="middle" height="33">收件人</td>
					    <td align="left">${o.letterName }</td>
					    <td align="middle">联系电话</td>
					    <td align="middle" colspan="2">${o.linkPhone }</td>
					    <td align="middle">邮编</td>
					    <td align="middle">${o.postCode }</td>
					    </tr>
					  <tr>
					    <td align="middle" height="33">在校担任社会工作</td>
					    <td colspan="6" align="left">&nbsp;${o.works }</td>
					    </tr>
					   <tr>
					    <td align="middle">中学阶段获奖情况</td>
					     <td colspan="6" align="left">&nbsp;${o.rewards }</td>
					  </tr>
					  <tr>
					  	<td align="middle">获得各类证书情况</td>  
					    <td colspan="6" align="left">&nbsp;${o.cerificate }</td>
					    </tr>
					  <tr>
					    <td align="middle">个人兴趣爱好及特长</td>
					    <td colspan="6" align="left">&nbsp;${o.hobby }</td>
					    </tr>
					  <tr>
					    <td align="middle">自我鉴定</td>
					    <td colspan="6" align="left">&nbsp;${o.zwjd }</td>
					    </tr>
					  <tr>
					    <td  align="middle" height="33">报考专业第一志愿</td>
					    <td  align="left" colspan="6">${o.specialtyId.name }</td>
					    
					    </tr>
					     <tr>
					    <td  align="middle" height="33">报考专业第二志愿</td>
					    <td  align="left" colspan="6">${o.specialtyId2.name }</td>
					    
					    </tr>
					  
					    
					    
					  
						  <!--tr>
						    <td align="middle" height="33">是否同意调剂</td>
						    <td colspan="6" align="left">
						    <c:choose>
															<c:when test="${o.ifAdjust == 1}">
																同意 (&nbsp;&nbsp;&nbsp;√&nbsp;&nbsp;&nbsp;)&nbsp;&nbsp;&nbsp;&nbsp;不同意 (&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)
															</c:when>
															<c:otherwise>
																同意 (&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)&nbsp;&nbsp;&nbsp;&nbsp;不同意 (&nbsp;&nbsp;&nbsp;&nbsp;√&nbsp;&nbsp;&nbsp;&nbsp;)
															</c:otherwise>	
														</c:choose></td>
						    </tr-->
					  	<tr>
					    	<td colspan="7" align="left" height="70">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我已阅读《首钢工学院${sysv.registerTitle }年自主招生章程》和《首钢工学院${sysv.registerTitle }年自主招生简章》，遵循上述文件的规定，我愿意报考首钢工学院自主招生专业，并接受测试。<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我本着诚实的态度填写了以上内容，并对其真实性和准确性负责。<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;考生（签字）：&nbsp;&nbsp;&nbsp;　　　　 家长（签字）：　　&nbsp;&nbsp;&nbsp;　　 填表日期：&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</p><br></td>
					    </tr>
					
					</table>



			    <table width="650" border="0" cellspacing="4" cellpadding="8" style="clear:both;" >
					 	<tr valign="middle">
					    	<td align="left">
								<p>
									注意事项：











									<br />
									1、本报名表必须由考生本人和家长签字有效。








									<br />
									2、考生若有获奖或取得证书情况，报名时必须携带证书原件和证书复印件（A4纸）。








						        </p>
						        <center class="Noprint" > 
									<input type="button" class="f_btn01" value="打印" onclick="javascript:printit()">  
								</center> 
							</td>
					  	</tr>
				</table>
    </tr>
</table>


</div>


<table width="1000px;" align="center" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" class="Noprint" id="t">
  <tr>
    <td align="center" valign="top" >
					    <table width="650px" height="573" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#333333" style="margin-top:4px;background-color: #FFFFFF;">
					  	<caption>	
							         <h1><strong>${sysv.registerTitle }年首钢工学院<br>高等职业教育自主招生报名表</strong></h1>
						    <div align="left">考生号：${o.examineeNum }</div>
						</caption>
						
					  <tr>
					    <td width="20%" align="middle">姓名</td>
					    <td width="16%" align="middle">${o.name }</td>
					    <td width="14%" align="middle">性别</td>
					    <td width="12%" align="middle">${xy:sex(o.sex)}</td>
					    <td width="14%" align="middle">民族</td>
					    <td width="14%" align="middle">${xy:mz(o.nationality)}</td>
					    <td width="87" height="150" rowspan="5" align="center" width="14%" rowspan="5"
													valign="middle">
													<img src="<%=path%>/upload/${o.examineeNum}.jpg" name="pic_1" width="120" height="150" border="1" align="middle" id="pic_1">
												</td>
					  </tr>
					  <tr>
					    <td height="17" align="middle">出生日期</td>
					    <td align="middle">${o.birthday }</td>
					    <td align="middle">政治面貌</td>
					    <td align="middle">${xy:zzmm(o.politics)}</td>
					    <td align="middle">考生类别</td>
					    <td align="middle">${xy:kslb(o.examineeType)}</td>
					    </tr>
					  <tr>
					    <td align="middle">身份证号 </td>
					    <td align="left" colspan="5">${o.IDCardNum }</td>
					    </tr>
					  <tr>
					    <td align="middle">所在(或毕业)学校</td>
					    <td colspan="3" align="left">${o.school }</td>
					    <td align="middle">毕业时间</td>
					    <td align="left">${o.graduationDate }</td>
					    </tr>
					  <tr>
					    <td align="middle">家庭住址</td>
					    <td colspan="5" align="left">${o.address }</td>
					    </tr>
					     <tr>
					    <td align="middle">户口所在街道</td>
					    <td colspan="6" align="left">${o.street }</td>
					    </tr> 	
					  <tr>
					    <td align="middle">住址电话</td>
					    <td colspan="3" align="left">${o.homePhone }</td>
					    <td align="middle">手机</td>
					    <td colspan="2" align="left">${o.mobilePhone }</td>
					  </tr>
					  <tr>
					    <td align="middle">邮寄录取通知书地址</td>
					    <td colspan="6" align="left">${o.letterAddress }</td>
					    </tr>
					  <tr>
					    <td align="middle">收件人</td>
					    <td align="left">${o.letterName }</td>
					    <td align="middle">联系电话</td>
					    <td align="left" colspan="2">${o.linkPhone }</td>
					    <td align="middle">邮编</td>
					    <td align="left">${o.postCode }</td>
					    </tr>
					  <tr>
					    <td align="middle">在校担任社会工作</td>
					    <td colspan="6" align="left">&nbsp;${o.works }</td>
					    </tr>
					  <tr>
					    <td align="middle">中学阶段获奖情况</td>
					     <td colspan="6" align="left">&nbsp;${o.rewards }</td>
					  </tr>
					  <tr>
					  	<td align="middle">获得各类证书情况</td>  
					    <td colspan="6" align="left">&nbsp;${o.cerificate }</td>
					    </tr>
					  <tr>
					    <td align="middle">个人兴趣爱好及特长</td>
					    <td colspan="6" align="left">&nbsp;${o.hobby }</td>
					    </tr>
					    <tr>
					    <td align="middle">自我鉴定</td>
					    <td colspan="6" align="left">&nbsp;${o.zwjd }</td>
					    </tr>
					  <tr>
					    <td  align="middle">报考专业第一志愿</td>
					    <td  align="left" colspan="6">${o.specialtyId.name }</td>
					    
					    </tr>
					    <tr>
					    <td  align="middle">报考专业第二志愿</td>
					    <td  align="left" colspan="6">${o.specialtyId2.name }</td>
					    
					    </tr>
					  
					    
					    
					  
						  <!--tr>
						    <td align="middle">是否同意调剂</td>
						    <td colspan="6" align="left">
						    <c:choose>
															<c:when test="${o.ifAdjust == 1}">
																同意 (&nbsp;&nbsp;&nbsp;√&nbsp;&nbsp;&nbsp;)&nbsp;&nbsp;&nbsp;&nbsp;不同意 (&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)
															</c:when>
															<c:otherwise>
																同意 (&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)&nbsp;&nbsp;&nbsp;&nbsp;不同意 (&nbsp;&nbsp;&nbsp;&nbsp;√&nbsp;&nbsp;&nbsp;&nbsp;)
															</c:otherwise>	
														</c:choose></td>
						    </tr-->
					  	<tr>
					    	<td colspan="7" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我已阅读《首钢工学院${sysv.registerTitle }年自主招生章程》和《首钢工学院${sysv.registerTitle }年自主招生简章》，遵循上述文件的规定，我愿意报考首钢工学院自主招生专业，并接受测试。<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我本着诚实的态度填写了以上内容，并对其真实性和准确性负责。<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;考生（签字）：&nbsp;&nbsp;&nbsp;　　　　 家长（签字）：　　&nbsp;&nbsp;&nbsp;　　 填表日期：&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</p><br></td>
					    </tr>
					
					</table>



			    <table width="650" border="0" cellspacing="4" cellpadding="8" style="clear:both">
					 	<tr>
					    	<td align="left">
								<p>
									注意事项：







									<br />
									1、本报名表必须由考生本人和家长签字有效。








									<br />
									2、考生若有获奖或取得证书情况，报名时必须携带证书原件和证书复印件（A4纸）。








						        </p>
						        <center class="Noprint" > 
									<input type="button" class="f_btn01" value="打印" onclick="javascript:printit()">  
									 
								</center> 
							</td>
					  	</tr>
				</table>
    </tr>
</table>







		<table width="1000px;" align="center" border="0" cellspacing="0" cellpadding="0" class="Noprint">
		  <tr>
		    <td height="30" align="center" valign="middle" background="<%=request.getContextPath()%>/images/bubg.jpg">
		    <p style=" color:#FFFFFF; line-height:20px;"><font style="font-size: 12px;">北京青年政治学院</font>
		    </p>
		    </td>
		  </tr>
		</table>
 </body>
</html>
