<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../pub/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
		<title>日志管理</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <link href="<%=request.getContextPath() %>/css/methodfish.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script language="javascript" src="<%=request.getContextPath()%>/js/public.js" type="text/javascript"></script>
		<script type="text/javascript"  src="<%=request.getContextPath()%>/js/pagination.js"></script>
		<script language="javascript" src="<%=request.getContextPath()%>/js/calender.js"></script>
		<script type="text/javascript">
			function dis(){
				if(document.getElementById("condition").value=="<<") {
					document.getElementById("hideRowOne").style.display="";
					document.getElementById("condition").value=">>";
				} else {
					document.getElementById("hideRowOne").style.display="none";
					document.getElementById("condition").value="<<";
				}	
			}

			function emptyCondition(){
				document.getElementById("search1").value="";
				document.getElementById("search2").value="";
				document.getElementById("search3").value="";
				document.getElementById("search4").value="";
				document.getElementById("search5").value="";
				document.getElementById("search6").value="";
			}
		</script>
	</head>
	
	<body class="middlebody">
		<form name="myform" method="post" action="<%=request.getContextPath()%>/sysLog/list.action">
			  <table align="center" class="table" border="1" width="100%" style="border-collapse:collapse;">
					<tr>
						<td class="content_L" width="8%" align="center">用户</td>
						<td class="content_L" width="17%"><input type="text" name="sysLog.sysUser" value="${sysLog.sysUser }" style="width: 95%;" id="search1"  class="f_input"></td>
						<td width="8%" align="center" class="content_L">模块</td>
						<td class="content_L" width="17%"><input type="text" name="sysLog.sysModule" value="${sysLog.sysModule}" class="f_input" id="search2" style="width: 95%;"></td>
						<td width="8%" align="center" class="content_L">方法</td>
						<td class="content_L" width="17%"><input type="text" name="sysLog.sysMethod" value="${sysLog.sysMethod}"  class="f_input" id="search3" style="width: 95%;"></td>
						<td width="8%" align="center" class="content_L">IP地址</td>
						<td class="content_L" width="17%"><input type="text" name="sysLog.ip" value="${sysLog.ip}" class="f_input" id="search4" style="width: 95%;"></td>
				  	</tr>
					<tr id="hideRowOne" style="display: none;">
						<td class="content_L" width="8%" align="center">时间</td>
						<td class="content_L" width="17%"><input type="text" name="beginTime" value="${beginTime}" id="search5"  class="f_input" style="width: 95%;" onclick="setday(this,document.all.beginTime,'yyyy-MM-dd HH:mm:ss')"></td>
						<td width="8%" align="center" class="content_L">至</td>
						<td class="content_L" width="17%"><input type="text" name="endTime" value="${endTime}" id="search6"  class="f_input" style="width: 95%;" onclick="setday(this,document.all.endTime,'yyyy-MM-dd HH:mm:ss')"></td>
						<td width="8%" align="center" class="content_L">&nbsp;</td>
						<td class="content_L" width="17%">&nbsp;</td>
						<td width="8%" align="center" class="content_L">&nbsp;</td>
						<td class="content_L" width="17%">&nbsp;</td>
				  	</tr>
					
				  	<tr>					
						<td colspan="8" align="right" class="content_L">
							<input type="button"  class="f_btn01" value="&lt;&lt;" id="condition" onclick="dis()">	
							<c:if test="${xy:hasPermission(user.id,'sysLog',1)}">
								<input type="button"  class="f_btn01" value="查询" onclick="submit()">
							</c:if>
							<c:if test="${xy:hasPermission(user.id,'sysLog',3)}">
								<input type="button" class="f_btn01" value="删除" onclick="delBatch('<%=request.getContextPath() %>/sysLog/del.action',${ps},${page.offset});">
							</c:if>
						</td>		
					</tr>
			</table>
			<br>

	<table align="center" class="table" border="1" width="100%" style="border-collapse:collapse;">
			<tr>
				<td  class="title"  align="center" class="content_L">用户</td>
				<td  class="title"  align="center" class="content_L">模块</td>
				<td  class="title"  align="center" class="content_L">方法</td>
				<td  class="title"  align="center" class="content_L">IP地址</td>
				<td  class="title"  align="center" class="content_L">时间</td>
				<td  class="title"  align="center" class="content_L">选择<input type="checkbox" name="checkboxs" class="f_checkbox" onClick="quanxuan(document.myform,'delId',this);"></td>
			</tr>
	
		<c:if test="${!empty page.datas}">
          <c:forEach items="${page.datas }" var="item" >
	      	<tr class="line">
	          <td align="center" class="content_L">${item.sysUser }</td>
	          <td align="center" class="content_L">${item.sysModule}</td>
	          <td align="center" class="content_L">${item.sysMethod}</td>
	          <td align="center" class="content_L">${item.ip}</td>
		      <td align="center" class="content_L">${item.sysTime }</td>
  			  <td align="center" class="content_L"><input type="checkbox" name="delId" id="sid" class="f_checkbox" value="${item.id}"></td>
        	</tr>
        	</c:forEach>
		</c:if>

		<c:forEach  var="i" begin="${my:length(page.datas)}" end="${ps-1}">
	      	<tr>
		      <td align="center" class="content_L">&nbsp;</td>
	          <td align="center" class="content_L">&nbsp;</td>
	          <td align="center" class="content_L">&nbsp;</td>
	          <td align="center" class="content_L">&nbsp;</td>
	          <td align="center" class="content_L">&nbsp;</td>
	          <td align="center" class="content_L">&nbsp;</td>
        	</tr>
		</c:forEach>
        
	</table>
	<br>
	<table align="center" class="table" border="1" width="100%" style="border-collapse:collapse;">
		<tr>
			<td class="content_L" align="center">
			共<span id="totalPage"></span>页/共${page.total}条记录

				<input type="hidden" value="${page.total/ps}" id="tmp">
				<input type="hidden" value="${page.offset/ps+1}" id="tmpNP">
				<pg:pager url="sysLog/list.action" items="${page.total}"  maxPageItems="${ps}" export="currentPageNumber=pageNumber">
				<pg:param name="sysLog.sysUser" value="${sysLog.sysUser}"/>
				<pg:param name="sysLog.sysModule" value="${sysLog.sysModule}"/>
				<pg:param name="sysLog.sysMethod" value="${sysLog.sysMethod}"/>
				<pg:param name="sysLog.ip" value="${sysLog.ip}"/>
				<pg:param name="beginTime" value="${beginTime}"/>
				<pg:param name="endTime" value="${endTime}"/>

				<pg:first>
					<a href="${pageUrl}" id="firstpageurl" class="bb">首页</a>
				</pg:first>
				<pg:prev>
				<a href="${pageUrl }" class="bb">前页</a>
				</pg:prev>
				<pg:next>
				<a href="${pageUrl }" class="bb">后页</a>
				</pg:next>
				<pg:last>
				<a href="${pageUrl }" class="bb">尾页</a>
				</pg:last>
			</pg:pager>
				第<select class="sel1" name="nowPage" id="nowPage" onchange="selectNowPage(this)"></select>页 每页显示
				<input class="input1" size="2" maxlength="3" name="pagesize" id="tmpPZ" value="${ps}" onkeyup="javascript:if(event.keyCode ==13 ){selectPagesize(this);}">条

			</td>
		</tr>
	</table>
</form>

</body>
</html>