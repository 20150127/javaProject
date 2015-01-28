<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="../pub/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

    <title>修改密码</title>
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
			if(regNull.test($("#pwd1").val())){
				alert("请输入密码!!!");
				$("#pwd1").select();
				return false;
			}
			if(regNull.test($("#pwd0").val())){
				alert("请输入密码!!!");
				$("#pwd0").select();
				return false;
			}
			if($("#pwd1").val().length < 6){
				alert("新密码不得少于6位!!!!");
				$("#pwd1").select();
				return false;
			}
			if(regNull.test($("#pwd2").val())){
				alert("请再次输入密码!!!");
				$("#pwd2").select();
				return false;
			}
			if($("#pwd1").val() != $("#pwd2").val()){
				alert("两次密码输入不一致!,请重新输入!!!");
				return false;
			}
			return true;
		}

		function dropUpdate(){
			if(confirm("您确定要放弃修改,并返回信息页面?")){
				window.location.href = "<%=path%>/us/show.action";
			}else{
				return false;	
			}
		}
	</script>
  </head>
	
	<body bgcolor="#F3F3F5" >
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
	<form action="<%=path%>/us/updatepwd.action" method="post" onsubmit="return check();">
	
			<table width="387" cellspacing="0" cellpadding="0" border="1"
				 align="center" height="87" style="width: 387px; height: 87px;margin-bottom: 150px;margin-top: 100px;" class="table">
				<tbody>
					<tr>
						<td align="right" class="content_L">
							请输入旧密码:
						</td>
						<td align="left" class="content_L"><input type="password" name="oldPwd" id="pwd0"></td>
						<td align="left" class="content_L"><font color="red">${errorMsg }</font></td>
					</tr>
					<tr>
						<td align="right" class="content_L">
							请输入新密码:
						</td>
						<td align="left" class="content_L"><input type="password" name="o.password" id="pwd1"></td>
						<td align="left" class="content_L"></td>
					</tr>
					<tr>
						<td align="right" class="content_L">
							再次输入新密码:
						</td>
						<td align="left" class="content_L"><input type="password" id="pwd2"></td>
						<td align="left" class="content_L"></td>
					</tr>
					<tr>
						<td align="center" class="content_L">
							<input type="submit" value="保存" class="f_btn01">
							<input type="hidden" name="o.id" value="${sessionScope.o.id }"> 
						</td>
						<td align="center" class="content_L"><input type="button" value="放弃修改" onclick="dropUpdate()"  class="f_btn01"></td>
						<td align="center" class="content_L"></td>
					</tr>
				</tbody>
			</table>
			
		</form>

</td>
			</tr>
			</table>






    




<table width="1000px;" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="54" align="center" valign="middle" background="<%=request.getContextPath()%>/images/bubg.jpg">
    <p style=" color:#FFFFFF; line-height:20px;"><font style="font-size: 12px;">北京青年政治学院</font>
    </p>
    </td>
  </tr>
</table>
  </body>
</html>
