<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../pub/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>分配角色</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="<%=request.getContextPath() %>/css/methodfish.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script  type="text/javascript" src="<%=request.getContextPath() %>/js/public.js"></script>
		<script type="text/javascript"  src="<%=request.getContextPath()%>/js/pagination.js"></script>
	</head>
	
	<body class="middlebody">
		<form name="myform" method="post" action="">
			  <table align="center" class="table" border="1" width="100%" style="border-collapse:collapse;">
				  	<tr>					
						<td colspan="8" align="right" class="content_L">
						<c:if test="${xy:hasPermission(user.id,'user',2)}">
							<input type="button"  class="f_btn01" value="分配角色" onclick="openWin('<%=request.getContextPath() %>/user/addRoles.action?userId=${sysUser.id}','分配角色',650,500);">
						</c:if>
						<c:if test="${xy:hasPermission(user.id,'user',3)}">
						<input type="button"  class="f_btn01" value="删除关联" onclick="delBatch('<%=request.getContextPath() %>/role/delUserRole.action',${ps},${page.offset});">
						</c:if>
						</td>		
					</tr>
			</table>
			<br>

	<table align="center" class="table" border="1" width="100%" style="border-collapse:collapse;">
			<tr>
				<td  class="title"  align="center" class="content_L" width="25%">角色名称</td>
				<td  class="title"  align="center" class="content_L" width="15%">优先级</td>
				<td  class="title"  align="center" class="content_L" width="50%">备注</td>
				<td  class="title"  align="center" class="content_L" width="10%">选择<input type="checkbox" name="checkboxs" class="f_checkbox" onClick="quanxuan(document.myform,'delId',this);"></td>
			</tr>
	
		<c:if test="${!empty page.datas}">
          <c:forEach items="${page.datas}" var="role" >
	      	<tr>
		      <td align="center" class="content_L"><a href="#" onclick="openWin('<%=request.getContextPath() %>/role/findRole.action?sysRole.id=${role.id}','修改角色',650,500);">${role.sysRoles.roleName }</a></td>
	          <td align="center" class="content_L">${role.priority }</td>
	          <td align="center" class="content_L">${role.sysRoles.remark }</td>
	          <td align="center" class="content_L"><input type="checkbox"  name="delId" id="sid" class="f_checkbox" value="${role.id}"></td>
	          
        	</tr>
        	</c:forEach>
		</c:if>

		<c:forEach  var="j" begin="${my:length(page.datas)}" end="${ps-1}">
	      	<tr>
		      <td align="center" class="content_L">&nbsp;</td>
	          <td align="center" class="content_L">&nbsp;</td>
	          <td align="center" class="content_L">&nbsp;</td>
	          <td align="center" class="content_L">&nbsp;</td>
        	</tr>
		</c:forEach>
        
	</table>
	<br>
	<table align="center" class="table" border="1" width="100%" style="border-collapse:collapse;">
		<tr align="center">
			<td class="content_L">
			共<span id="totalPage"></span>页/共${page.total}条记录
				<input type="hidden" value="${page.total/ps}" id="tmp">
				<input type="hidden" value="${page.offset/ps+1}" id="tmpNP">
				<pg:pager url="role/getRoles.action" items="${page.total}"  maxPageItems="${ps}" export="currentPageNumber=pageNumber">
				<pg:param name="sysUser.id" value="${userId}"/>
				<pg:first>
					<a href="${pageUrl}" id="firstpageurl">首页</a>
				</pg:first>
				<pg:prev>
				<a href="${pageUrl }">前页</a>
				</pg:prev>
			
				
				<pg:next>
				<a href="${pageUrl }">后页</a>
				</pg:next>
				<pg:last>
				<a href="${pageUrl }">尾页</a>
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