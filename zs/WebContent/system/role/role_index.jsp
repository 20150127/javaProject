<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../pub/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>角色管理</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	  	<link href="<%=request.getContextPath() %>/css/methodfish.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script  type="text/javascript" src="<%=request.getContextPath() %>/js/public.js"></script>
		<script type="text/javascript"  src="<%=request.getContextPath()%>/js/pagination.js"></script>

	</head>
	
	<body>
		<form name="myform" method="post" action="<%=request.getContextPath() %>/role/list.action">
			  <table align="center" class="table" border="1" width="100%" style="border-collapse:collapse;">
					<tr>
						<td class="content_L" width="8%" align="center">角色名称</td>
						<td class="content_L" width="17%"><input type="text"  class="f_input" name="sysRole.roleName" id="roleName" value="<s:property value="#request.sysRole.roleName"/>"></td>
						<td width="8%" align="center" class="content_L">&nbsp;</td>
						<td class="content_L" width="17%">&nbsp;</td>
						<td width="8%" align="center" class="content_L">&nbsp;</td>
						<td class="content_L" width="17%">&nbsp;</td>
						<td width="8%" align="center" class="content_L">&nbsp;</td>
						<td class="content_L" width="17%">&nbsp;</td>
				  	</tr>
				  	<tr>					
						<td colspan="8" align="right" class="content_L">
							<!-- <input type="button"  id="moreQuery"   class="f_btn01" value="&lt;&lt;">-->
							<c:if test="${xy:hasPermission(user.id,'role',1)}">
							<input type="button"  class="f_btn01" value="查询" onclick="submit()">
							</c:if>
							<c:if test="${xy:hasPermission(user.id,'role',0)}">
							<input type="button"  class="f_btn01" value="添加" onclick="openWin('<%=request.getContextPath() %>/role/addUI.action','添加角色',650,300);">
							</c:if>
							<c:if test="${xy:hasPermission(user.id,'role',3)}">
							<input type="button"  class="f_btn01" value="删除" onclick="delBatch('<%=request.getContextPath() %>/role/del.action',${ps},${page.offset});">
							</c:if>
						</td>		
					</tr>
			</table>
			<br>

	<table align="center" class="table" border="1" width="100%" style="border-collapse:collapse;">
			<tr>
				<td  class="title"  align="center" class="content_L" width="20%">角色名称</td>
				<td  class="title"  align="center" class="content_L" width="50%">备注</td>
				<td  class="title"  align="center" class="content_L" width="20%">操作</td>
				<td  class="title"  align="center" class="content_L" width="10%">选择<input type="checkbox" name="checkboxs" class="f_checkbox" onClick="quanxuan(document.myform,'delId',this);"></td>
			</tr>
	
		<c:if test="${!empty page.datas}">
          <c:forEach items="${page.datas }" var="role" >
	      	<tr>
		      <td align="center" class="content_L">
		     <c:choose>
		      <c:when test="${xy:hasPermission(user.id,'role',1)}">
		      <a href="#" onclick="openWin('<%=request.getContextPath() %>/role/findRole.action?sysRole.id=${role.id}','修改角色',650,300);">${role.roleName }</a>
		      </c:when>
		      <c:otherwise>
		      ${role.roleName }
		       </c:otherwise>
		      </c:choose>
		      </td>
	         	
	          <td align="center" class="content_L">${role.remark }</td>
	          <td align="center" class="content_L">
	          <c:choose>
		      <c:when test="${xy:hasPermission(user.id,'role',1)}">
	          <a href="#" onclick="openWin('<%=request.getContextPath() %>/role/findUsers.action?sysRole.id=${role.id}','查看用户',650,500);">查看用户</a>
	          </c:when>
		      <c:otherwise>
		      查看用户
		       </c:otherwise>
		      </c:choose>
	          &nbsp;
	         <c:choose>
		      	<c:when test="${xy:hasPermission(user.id,'role',2)}">
	          		<a href="#" onclick="openWin('<%=request.getContextPath() %>/acl/useracl.action?principalType=Role&principalId=${role.id}','roleauth',630,590,1);">角色授权</a>
	          	</c:when>
		      	<c:otherwise>
		      角色授权
		       </c:otherwise>
		      </c:choose>
		      
	          </td>
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
				<pg:pager url="role/list.action" items="${page.total}"  maxPageItems="${ps}" export="currentPageNumber=pageNumber">
				<pg:param name="sysRole.roleName" value="${sysRole.roleName}"/>
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