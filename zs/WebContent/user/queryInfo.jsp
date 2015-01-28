<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="../pub/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>录取查询</title>
		<link href="<%=request.getContextPath()%>/css/methodfish.css"
			rel="stylesheet" type="text/css">
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
      欢迎<font color="#945678">${sessionScope.o.name}</font>登陆系统<br />
       <span  id="time"><script>document.getElementById('time').innerHTML=new Date().toLocaleString()+'<br/>&nbsp;&nbsp;'+' 星期'+'日一二三四五六'.charAt(new Date().getDay());setInterval("document.getElementById('time').innerHTML=new Date().toLocaleString()+'<br/>&nbsp;&nbsp;'+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
</script>
      </span>
        </div>
       </div></td>
  </tr>
</table>

</td>
  </tr>
</table>
<table width="1000" align="center" cellspacing="0" cellpadding="0" border="0"  bgcolor="#FFFFFF">
		<tr valign="top">
			<td>
			<table align="center" class="table" border="1" width="600"
				style="border-collapse: collapse;margin-top: 100px;margin-bottom: 150px;">
			<tr>
				<td width="20%" align="center" class="title" colspan="2">考 生 号</td>
				<td class="content_L">&nbsp;${o.examineeNum}</td>
			</tr>
			<tr>
				<td align="center" class="title" colspan="2">姓　　名</td>
				<td class="content_L">&nbsp;${o.name}</td>
			</tr>
			<tr>
				<td align="center" class="title" colspan="2">身份证号</td>
				<td class="content_L">&nbsp;${o.IDCardNum}</td>
			</tr>
			<tr>
				<td align="center" class="title" colspan="2">准考证号</td>
				<td class="content_L" colspan="2">&nbsp;${o.admissionId}</td>
			</tr>
			<tr>
				<td align="center" class="title" colspan="2">考 场 号</td>
				<td class="content_L" colspan="2">&nbsp;${o.roomId}</td>
			</tr>
			
		<c:choose>
			<c:when test="${sysv.ifPreliminary eq 1}">
			<tr>
				<td align="center" class="title" rowspan="6">录<br/>取<br/>结<br/>果</td>
				<td align="center" class="title">笔试成绩</td>
				<td class="content_L">&nbsp;${o.bjyw+o.bjsx+o.bjyy}</td>
			</tr>
			<tr>
				<td align="center" class="title" width="20%">会考成绩</td>
				<td class="content_L">&nbsp;${o.hkzongfen}</td>
			</tr>
			<tr>
				<td align="center" class="title">综合成绩</td>
				<td class="content_L">&nbsp;${o.zonghecj}</td>
			</tr>
			<tr>
				<td align="center" class="title">特长成绩</td>
				<td class="content_L">&nbsp;${o.techangcj}</td>
			</tr>
			<tr>
				<td align="center" class="title">测试成绩</td>
				<td class="content_L">&nbsp;${o.cs}</td>
			</tr>
			<tr>
				<td align="center" class="title">初试总分</td>
				<td class="content_L">&nbsp;${o.cs+o.techangcj+o.zonghecj+o.bjyw+o.bjsx+o.bjyy+o.hkzongfen}</td>
			</tr>
				
					<c:choose>
						<c:when test="${o.ifAdmit eq 1}">
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${o.ifRetrial eq 1}">
									<tr id="preSu">
									<td align="center" class="title" colspan="2">初试查询结果</td>
									<td class="content_L"><font color="red">
									您已顺利通过初试，请按要求时间准时到校参加复试！！



									</font></td></tr>
										
								</c:when>
								<c:otherwise>
										<tr><td align="center" class="title" colspan="2">初试查询结果</td>
										<td class="content_L"><font color="red">
										很抱歉，您的初试成绩未通过，不要灰心，继续努力，祝您考入理想大学!
										</font></td></tr>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
			
			</c:when>
			<c:otherwise>
				<tr>
					<td align="center" class="title" colspan="2">初试查询结果</td>
					<td class="content_L"><font color="red">初试成绩未公布，请关注学校网站通知!</font></td>
				</tr>
			</c:otherwise>
		</c:choose>
			

			<c:choose>
				<c:when test="${o.ifRetrial eq 1}">
					<c:choose>
						<c:when test="${sysv.ifRetrial eq 1}">
							<tr>
								<td align="center" class="title" colspan="2">复试成绩</td>
								<td class="content_L">&nbsp;${o.fushicj}</td>
							</tr>
							<tr>
								<td align="center" class="title" colspan="2">总　　分</td>
								<td class="content_L">&nbsp;<fmt:formatNumber value="${o.cs+o.techangcj+o.zonghecj+o.bjyw+o.bjsx+o.bjyy+o.hkzongfen+o.fushicj}" pattern="0.00"/></td>
							</tr>
							<tr>
								<td align="center" class="title" colspan="2">复试查询结果</td>
								<td class="content_L"><font color="red">
									<c:choose>
										<c:when test="${o.ifAdmit eq 1}">
											恭喜您，您被我院<font color="blue">${o.specialtyId.name }</font>专业录取,请按时到校报到!
										</c:when>
										<c:otherwise>
											很抱歉，您的成绩未通过，不要灰心，继续努力，祝您考入理想大学!
									<script>
										window.onload = function () {
											var tr = document.getElementById("preSu");
											var body = tr.parentNode;
											body.removeChild(tr);
											}																		
									</script>
										</c:otherwise>
									</c:choose>
								</font></td>
							</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td align="center" class="title" colspan="2">复试查询结果</td>
							<td class="content_L"><font color="red">录取结果未公布，请关注学校网站通知!</font></td>
						</tr>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				
			</c:otherwise>
		</c:choose>
			<tr>
				<td align="center" class="title" colspan="2">录取方法:</td>
				<td class="content_L"><font color="red">总分 = 笔试成绩 + 高中会考成绩 + 综合素质特长加分 + 复试成绩</font></td>
			</tr>
		</table>
  
	</td>
			</tr>
			</table>








<table width="1000px;" align="center" border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td height="54" align="center" valign="middle" background="<%=request.getContextPath()%>/images/bubg.jpg">
    <p style=" color:#FFFFFF; line-height:20px;"><font style="font-size: 12px;">北京青年政治学院</font> 
    </p>
    </td>
  </tr>
</table>
  </body>
</html>
