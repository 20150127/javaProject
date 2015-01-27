<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="cn.xyurp.system.bean.*"%>
<%@ page import="java.util.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>系统菜单</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/tree.js"></script>
<link href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet" type="text/css">
<style type=text/css>
	body  {
	
	 background:#89BFE3;
	 margin:0px;
	 font:normal 12px 宋体;
	}
	table  { border:0px; }
	td  { font:normal 12px 宋体; }
	img  { vertical-align:bottom; border:0px; }
	a  { font:normal 12px 宋体; color:#006699; text-decoration:none; }
	a:hover  { color:#FF9900; }
	.leftbg01 { background-color:#F3F3F5;  background-repeat: repeat-y; }
</style>
<SCRIPT LANGUAGE="JavaScript">
	var tree = new MzTreeView("tree");
	tree.setIconPath("<%=request.getContextPath()%>/images/tree2/");
	<%
	String topid="";
	String topname="";
	if(request.getParameter("topid")!=null && !"".equals(request.getParameter("topid"))){
		topid=request.getParameter("topid");
	}
	if(request.getAttribute("sm")!=null && !"".equals(request.getAttribute("sm"))){
		SysModule sm=(SysModule)request.getAttribute("sm");
		topname=sm.getSysModuleName();
	}
	%>
	tree.nodes['0_<%=topid%>'] = 'text: <%=topname%>';
	<%
		String url="";
		int id=0;
		int pid=0;
		int isleaf=0;
		String name="";
		SysModule sysModule=null;
		if(request.getAttribute("page")!=null && !"".equals(request.getAttribute("page"))){
		
		List<SysModule> list=(List<SysModule>)request.getAttribute("page");
		if (list != null && list.size() > 0) {
		for (int i = 0; i < list.size(); i++) {
		sysModule=(SysModule)list.get(i);
		id=sysModule.getId();
		pid=sysModule.getParentModule().getId();
		url=sysModule.getSysUrl();
		isleaf=sysModule.getIsLeaf();
		if(isleaf==1){
			url="/mainframe/main.htm";
		}
		if( "".equals(sysModule.getSysUrl()) || sysModule.getSysUrl() == null){
			url="/mainframe/main.htm";
		}
		name=sysModule.getSysModuleName();
	 %>
	
	tree.nodes['<%=pid%>_<%=id%>'] = 'text:<%=name%>;url:..<%=request.getContextPath()+url%>; target:leftinfo; method:tree_onclick(this)';
 	
	<%}}}%>
	
</SCRIPT>



</head>
<body    text="#000000" leftmargin="0" topMargin="10" marginwidth="0" marginheight="0" class="leftbg01"> 
<table  height="100%" border="0" cellpadding="0" cellspacing="0"  > 
  				<tr>
    				<td  valign="top"  style="padding-left:2px;">
			    		<div id="Tree_Div" style="PADDING-RIGHT: 2px; 
			               OVERFLOW-Y: hidden; PADDING-LEFT: 10px;
			               OVERFLOW-X: hidden; PADDING-LEFT: 10px;
			               SCROLLBAR-FACE-COLOR: #ffffff; FONT-SIZE: 11pt; PADDING-BOTTOM: 0px; 
			               SCROLLBAR-HIGHLIGHT-COLOR: #ffffff; OVERFLOW: hidden; WIDTH: 150px; 
			               SCROLLBAR-SHADOW-COLOR: #919192; COLOR: blue; 
			               SCROLLBAR-3DLIGHT-COLOR:#ffffff; LINE-HEIGHT: 100%; 
			               SCROLLBAR-ARROW-COLOR: #919192; PADDING-TOP: 0px; 
			               SCROLLBAR-TRACK-COLOR: #ffffff; FONT-FAMILY: 宋体; 
			               SCROLLBAR-DARKSHADOW-COLOR: #ffffff; LETTER-SPACING: 0pt; TEXT-ALIGN: left; background-repeat: no-repeat;">
    					</div>
    
   					</td>
  				</tr>
			</table>
	
 
 
 
</body>
<SCRIPT LANGUAGE="JavaScript">
	document.getElementById("Tree_Div").innerHTML = tree.toString();
	//tree.expandAll();

	function tree_onclick(obj){
		var navigation = top.frames["navigation"];
		var oSpan = navigation.document.getElementById("nav_SPAN");
		var o = obj.currentNode;
		
		if(!o.hasChild){
			var s = o.text;
			
			while(o.parentNode){
				o = o.parentNode;
				
				if(o.id && o.id != "0"){
					s = o.text + '-->' + s;
					break;
				}
			}
			oSpan.innerText = s;
		}
		return;
	}
	function onclick2(obj){
		var navigation = top.frames["navigation"];
		var oSpan = navigation.document.getElementById("nav_SPAN");
		
			oSpan.innerText = "首页";
	
		return;
	}
	
</script>
</html>