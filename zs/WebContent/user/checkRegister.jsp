<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="../pub/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
		<title>北京青年政治学院自主招生管理系统</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
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
		<script type="text/javascript">
			$(function(){
				$("#next").bind("click",function(){
					if($("#accept").attr("checked") == true){
						document.myform.submit();
					}
				});
			});
		</script>
</head>
	<body bgcolor="#F3F3F5">
<table width="1000px" align="center" border="0" cellspacing="0" cellpadding="0" background="<%=request.getContextPath()%>/images/logobg3.jpg" >
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
    <td width="106" align="center"><div id="navcontainer"  style="margin-left:0px;"><ul id="navlist"><li><a href="<%=path%>/us/show.action" class="bb">打印报名信息</a></li></ul></div></td>
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
        </div>

 
       </td>
  </tr>
</table>

</td>
  </tr>
</table>
			<center>
			<table align="center"  class="table" border="0" width="1000px;"
				style="border-collapse: collapse;margin-top: 30px;margin-bottom: 20px;background-color: #dae7f0">
				<tr>
					<td class="content_L" width="70%" align="left">
						<div class=Section1 style="margin-left: 50px;">
							<p align=center style='text-align:center'><span style='font-size:22.0pt;font-family:黑体'>报 名 须 知</span></p>
							<p><span style='font-size:10.0pt'>一、考生使用我院“自主招生网上报名系统”进行报名前，应仔细阅读《招生章程》、《招生简章》、《考生问答》等有关资料。</span></p>
							<p><span style='font-size:10.0pt'>二、考生进行网上报名时，应按规定填写各项信息，不得遗漏。</span></p>
							<p><span style='font-size:10.0pt'>三、考生应认真、如实填写本人信息，由于错误信息或与实际不符的信息引起的一切后果由考生本人负责。</span></p>
							<p><span style='font-size:10.0pt'>四、请按照网上提示，依次准确填写报名信息，如发现提供虚假信息者，一律取消报名资格并通知考生所在学校。</span></p>
							<p><span style='font-size:10.0pt'>五、考生请使用自己的身份证号作为报名注册的账号，务必牢记自己的注册密码。 </span></p>
							<p><span style='font-size:10.0pt'>六、考生姓名栏所填姓名应与本人身份证、户口本的姓名一致。</span></p>
							<p><span style='font-size:10.0pt'>七、请准备近期一寸免冠数码照片<span lang=EN-US>,</span>大小在<span lang=EN-US>200K</span>以内（格式<span lang=EN-US>*.jpg</span>）<span lang=EN-US>120*150</span>像素，用于上传。</span></p>
							<p><span style='font-size:10.0pt'>八、“家庭详细地址”，<span class=GramE>不</span>得用简称或写“本市”、“本省”等字样。</span></p>
							<p><span style='font-size:10.0pt'>九、<b>考生网上报名后，须到我院进行现场信息确认，并领取准考证，否则无效。</b></span></p>
							<p><span style='font-size:10.0pt'>十、在网上报名的过程中遇到任何问题，请电话咨询：<span lang=EN-US>64724789</span>，<span lang=EN-US>84778264</span>，<span lang=EN-US>84778254</span>。</span></p>
						</div>
					</td>
				</tr>
			</table>
			<form action="<%=path%>/us/toRegister.action" method="post" name="myform">
				<table width="1000px;" border="0" align="center" cellpadding="0" >
					<tr>
						<td align="right" width="50%">
							<label for="accept">
								<input type="checkbox" name="accept" id="accept" value="1">
								我已阅读完毕
							</label>
						</td>
						<td align="left" width="50%" >
							<input type="button" id="next" value=" 下一步 " class="f_btn01">
						</td>
					</tr>
				</table>
			</form>
		</center>
  
	







<table width="1000px;" align="center" border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td height="30" align="center" valign="middle" background="<%=request.getContextPath()%>/images/bubg.jpg">
    <p style=" color:#FFFFFF; line-height:20px;"><font style="font-size: 12px;">北京青年政治学院</font>
    </p>
    </td>
  </tr>
</table>
  </body>
</html>
