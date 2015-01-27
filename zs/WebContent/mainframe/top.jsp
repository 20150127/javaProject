<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="../pub/taglib.jsp"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
		    + request.getServerName() + ":" + request.getServerPort()
		    + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>系统导航</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/public.js" ></script>
		
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
				DISPLAY: block; WIDTH: 100%; COLOR: #1785aa; LINE-HEIGHT: 30px; FONT-FAMILY: "宋体"; HEIGHT: 20px; background:url(<%=request.getContextPath()%>/images/cc.gif); TEXT-ALIGN: left; TEXT-DECORATION: none
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
			        font-family: "Freestyle Script";
			        font-size: 14px;
			        font-weight: bold;
			        margin: 0;
			        padding: 3px 10px 2px 0;
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
					background:url(<%=request.getContextPath()%>/images/bb.gif);
			}
			-->
		</style>
		<script language="javascript">
			window.onload=function(){
				parent.mid.cols='0,0,*';parent.leftinfo.location='<%=request.getContextPath()%>/mainframe/main.htm';
			}
		
		</script>
	</head>
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td> 
      <table width="100%" border="0" cellspacing="0" height="82" cellpadding="0" background="<%=request.getContextPath()%>/images/tbg.jpg">
        <tr> 
          <td><img src="<%=request.getContextPath()%>/images/logo.jpg" ></td>
          <td valign="bottom" align="right"> 
            <table width="248" height="28" border="0"  cellspacing="0" cellpadding="0"  background="<%=request.getContextPath()%>/images/t2.jpg">
                <tr>
				    <td width="38" align="right"><img src="<%=request.getContextPath()%>/images/re.gif" /></td>
				    <td width="60" valign="middle" style="font-size:14px">&nbsp;<b>${user.userName}</b></td>
				    <td width="9"><img src="<%=request.getContextPath()%>/images/line.gif" /></td>
				    <td width="63" style="font-size:14px;background-image: "><img src="<%=request.getContextPath()%>/images/bt2.gif" width="63" " height="21" onclick="javascript:openWin('<%=request.getContextPath()%>/user/toUpdateMM.action','个人设置',400,200,1)"/></td>
				    <td width="9"><img src="<%=request.getContextPath()%>/images/line.gif" /></td>
				    <td width="63" style="font-size:14px"><img src="<%=request.getContextPath()%>/images/bt.gif" width="63" " height="21" onclick="if(confirm('您确认要离开系统吗？')){top.location.href='<%=request.getContextPath()%>/login/logout.action';}"/></td>
				    <td width="10">&nbsp;</td>
  			  	</tr>
            </table>
          </td>
        </tr>
      </table>
      </td>
      </tr>
      <tr>
      <td>
      <table width="100%" height="59" border="0" cellpadding="0" cellspacing="0" background="<%=request.getContextPath()%>/images/t1.jpg">
  		<tr>
		    <td align="left" valign="top">
		   		<div id="navcontainer"  style="margin-left:20px;">
		        <ul id="navlist">
				<c:if test="${!empty page.datas}">
			    <c:forEach items="${page.datas }" var="top" >
			    	<li><a href="#" onClick="parent.mid.cols='172,10,*';parent.leftinfo.location='<%=request.getContextPath()%>/mainframe/main.htm';parent.leftTree.location.href='<%=request.getContextPath()%>/acl/list.action?topid=${top.id}'">${top.sysModuleName}</a></li>
				</c:forEach>
				</c:if>
				</ul>
				</div>
		    </td>
 		 </tr>
	</table>
    </td>
  </tr>
	    
     <!--  
  <tr> 
    <td> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0" background="<%=request.getContextPath()%>/images/top_navigation_01.gif">
        <tr> 
          
          <td width="20%">&nbsp;</td>
          <td width="80%"> 
            <table align="left" border="0" cellspacing="0" cellpadding="0" background="<%=request.getContextPath()%>/images/top_navigation_07.gif">
              <tr> 
                <td ><img  src="<%=request.getContextPath()%>/images/top_navigation_04.gif" width="36" height="28"></td>
                
				<td width="95" height="28" align="center" >
				<a href="#" onClick="parent.mid.cols='0,0,*';parent.fs.rows='0,*';parent.leftinfo.location='<%=request.getContextPath()%>/mainframe/main.htm'">系统首页</a></td>
				<c:if test="${!empty page.datas}">
			    <c:forEach items="${page.datas }" var="top" >
			    <td align="right" ><img src="<%=request.getContextPath()%>/images/top_navigation_06.gif" width="33" height="28"></td>
			    <td width="95"  height="28" align="center" >
			    	<a href="#" onClick="parent.mid.cols='172,10,*';parent.fs.rows='39,*';parent.leftinfo.location='<%=request.getContextPath()%>/mainframe/main.htm';parent.leftTree.location.href='<%=request.getContextPath()%>/acl/list.action?topid=${top.id}'">${top.sysModuleName}</a>
			    </td>
				</c:forEach>
				</c:if>
              </tr>
            </table>
          </td>
          
        </tr>
      </table>
    </td>
  </tr>
     -->
  <!--  
  <tr> 
    <td class="topbg01"></td>
  </tr>
  -->
</table>
</body>
</html>