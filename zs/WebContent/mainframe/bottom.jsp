<%@ page language="java"  pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>北京青年政治学院自主招生系统</title>
<link href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet" type="text/css" />
 <style type="text/css">
<!--
/* CSS Tabs */
A.leftmenu:link {
	DISPLAY: block; WIDTH: 100%; COLOR: #1785aa; LINE-HEIGHT: 30px; FONT-FAMILY: "宋体"; HEIGHT: 20px; TEXT-ALIGN: left; TEXT-DECORATION: none
}
A.leftmenu:visited {
	DISPLAY: block; WIDTH: 100%; COLOR: #1785aa; LINE-HEIGHT: 30px; FONT-FAMILY: "宋体"; HEIGHT: 20px; TEXT-ALIGN: left; TEXT-DECORATION: none
}
A.leftmenu:hover {
	DISPLAY: block; WIDTH: 100%; COLOR: #1785aa; LINE-HEIGHT: 30px; FONT-FAMILY: "宋体"; HEIGHT: 20px; background:url(images/cc.gif); TEXT-ALIGN: left; TEXT-DECORATION: none
}

#navcontainer { /* none needed */ }

ul#navlist {
        margin: 0;
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
        padding: 5px 0 4px 0;
        background-color: #eef4f1;
        border-top:3px solid #e0ede9;
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
		background:url(../images/bb.gif);
}
.mid {font-size: 14px; color: #000000; }
-->
</style>
</head>

<body>
<table width="101%" border="0" height="28" cellpadding="0" cellspacing="0" background="<%=request.getContextPath()%>/images/t4.jpg">
  <tr>
    <td align="center" class="mid">北京青年政治学院</td>
  </tr>
</table>

</body>
</html>
