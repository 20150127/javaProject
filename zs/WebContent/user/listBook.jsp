<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../pub/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>留言板</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
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
	<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
	<script type="text/javascript">
			function check(){
				var regNull = /^\s*$/;
				if(regNull.test($("#title").val())){
					alert("标题不能为空!");
					$("#title").select();
					return false;
				}
				return true;
			}
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
       欢迎<font color="#945678">${sessionScope.o.name}</font>登陆系统<br />
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
			
  
	
<table width="1000" align="center" cellspacing="0" cellpadding="0" border="0"  bgcolor="#FFFFFF">
		<tr valign="top">
			<td>
<table align="center" class="table" border="1" width="800"
				style="border-collapse: collapse;margin-top: 100px;">
			<c:choose><c:when test="${not empty gbs}">
			<c:forEach items="${gbs}" var="gb">
				<tr>
					<td>
						<table width="800" border="1" cellpadding="0" cellspacing="0" class="table">
							<tr>
								<td width="80%" style="font-size: 12px;" class="content_L">
								<font style="font-size: 13px;color:maroon">标题:&nbsp;&nbsp;&nbsp;</font>${gb.title }<br/>
								<font style="font-size: 13px;color:maroon">内容:&nbsp;&nbsp;&nbsp;</font>${gb.content }
								</td>
								<td width="20%" style="font-size: 12px;" class="content_L">
									<font style="font-size: 13px;color:maroon">提问时间:&nbsp;&nbsp;&nbsp;</font><br>${gb.askTime }
								</td>
							</tr>
							<c:choose>
								<c:when test="${gb.ifanswer eq '1'}">
									<tr>
										<td style="font-size: 12px;" class="content_L"> 
											<font style="font-size: 13px;color:maroon">回复:</font>&nbsp;&nbsp;&nbsp;${gb.answer }
										</td >
										<td style="font-size: 12px;color: black;" class="content_L">
											<font style="font-size: 13px;color:maroon">回复时间:</font>&nbsp;&nbsp;&nbsp;<br/>${gb.answerTime }
										</td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="2" align="left" class="content_L">
											<font style="font-size: 13px;color:maroon">回复:</font>&nbsp;&nbsp;&nbsp;<font style="color: red;font-size: 12;">未答复</font>
										</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</table>
					</td>
				</tr>
				<tr>
		<td colspan="2" style="height: 10px;" class="content_L">&nbsp;</td>		
	</tr>

			</c:forEach>
</c:when><c:otherwise>
<tr>
					<td align="center" style="color: red;font-size: 13;" class="content_L">当前您没有留言信息!</td>
</tr>
</c:otherwise>
</c:choose>
		</table>
		<form action="<%=path%>/us/addGB.action" onsubmit="return check();">
		
			<table width="800" border="1" cellpadding="0" cellspacing="0" height="200" style="margin-bottom: 150px" align="center" class="table">
				<tr>
					<td align="left" style="padding: 10px;" class="content_L">
						<font style="font-size: 13;">标题:&nbsp;</font><input type="text" name="title" id="title" size="64">	<br/><br/>
						<font style="font-size: 13;">内容:&nbsp;</font><textarea rows="5" cols="50" name="content"></textarea><br/><br/>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="我要留言" class="f_btn01">
					</td>
				</tr>
			</table>
		
		</form>




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
