<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../pub/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>用户管理</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <link href="<%=request.getContextPath() %>/css/methodfish.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script  type="text/javascript" src="<%=request.getContextPath() %>/js/public.js"></script>
		<script type="text/javascript"  src="<%=request.getContextPath()%>/js/pagination.js"></script>
	</head>
	
	<body class="middlebody">
		<form name="myform" method="post" action="<%=request.getContextPath() %>/user/list.action">
			  <table align="center" class="table" border="1" width="100%" style="border-collapse:collapse;">
					<tr>
						<td class="content_L" width="8%" align="center">用户姓名</td>
						<td class="content_L" width="17%"><input type="text"  class="f_input" name="sysUser.userName" value="<s:property value="#request.sysUser.userName"/>"></td>
						<td width="8%" align="center" class="content_L">用户账号</td>
						<td class="content_L" width="17%"><input type="text"  class="f_input" name="sysUser.account" value="<s:property value="#request.sysUser.account"/>"></td>
						<td width="8%" align="center" class="content_L">&nbsp;</td>
						<td class="content_L" width="17%">&nbsp;</td>
						<td width="8%" align="center" class="content_L">&nbsp;</td>
						<td class="content_L" width="17%">&nbsp;</td>
				  	</tr>
				  	<tr>					
						<td colspan="8" align="right" class="content_L">
							<!-- <input type="button"  id="moreQuery"   class="f_btn01" value="&lt;&lt;">-->
							<c:if test="${xy:hasPermission(user.id,'user',1)}">
							<input type="button"  class="f_btn01" value="查询" onclick="submit()">
							</c:if>
							<c:if test="${xy:hasPermission(user.id,'user',0)}">
							<input type="button"  class="f_btn01" value="添加" onclick="openWin('<%=request.getContextPath() %>/user/addUI.action','添加用户',650,400);">
							</c:if>
							<c:if test="${xy:hasPermission(user.id,'user',3)}">
							<input type="button"  class="f_btn01" value="删除" onclick="delBatch('<%=request.getContextPath() %>/user/del.action',${ps},${page.offset});">
							</c:if>
						</td>		
					</tr>
			</table>
			<br>

	<table align="center" class="table" border="1" width="100%" style="border-collapse:collapse;">
			<tr>
				<td  class="title"  align="center" class="content_L">用户姓名</td>
				<td  class="title"  align="center" class="content_L">用户账号</td>
				<td  class="title"  align="center" class="content_L">用户电话</td>
				<td  class="title"  align="center" class="content_L">创建时间</td>
				<td  class="title"  align="center" class="content_L">失效时间</td>
				<td  class="title"  align="center" class="content_L" width="140">授权操作</td>
				<td  class="title"  align="center" class="content_L">选择<input type="checkbox" name="checkboxs" class="f_checkbox" onClick="quanxuan(document.myform,'delId',this);"></td>
			</tr>
	
		<c:if test="${!empty page.datas}">
          <c:forEach items="${page.datas }" var="users" >
	      	<tr>
		      <td align="center" class="content_L">
		      <c:choose>
		      <c:when test="${xy:hasPermission(user.id,'user',1)}">
		      <a href="#" onclick="openWin('<%=request.getContextPath() %>/user/update.action?sysUser.id=${users.id}','修改用户',650,300);">${users.userName }</a>
		      </c:when>
		      <c:otherwise>
		      ${users.userName }
		      </c:otherwise>
		      </c:choose>
		      </td>
	          <td align="center" class="content_L">${users.account }</td>
	          <td align="center" class="content_L">${users.tel}</td>
	          <td align="center" class="content_L"><fmt:formatDate value="${users.createTime }" pattern="yyyy-MM-dd"/></td>
	          <td align="center" class="content_L"><fmt:formatDate value="${users.expireTime }" pattern="yyyy-MM-dd"/></td>
	          <td align="center" class="content_L">
	          <c:choose>
	          <c:when test="${users.account eq 'admin' }">
	          ...     ...
	          </c:when>
	          <c:otherwise>
		           <c:choose>
				      <c:when test="${xy:hasPermission(user.id,'user',2)}">
			          <a href="#" onclick="openWin('<%=request.getContextPath() %>/user/getRoles.action?sysUser.id=${users.id}','分配角色',650,500);">分配角色</a>
			          </c:when>
				      <c:otherwise>
				      分配角色
				      </c:otherwise>
			      </c:choose>
		          &nbsp;
		          <c:choose>
			      <c:when test="${xy:hasPermission(user.id,'user',2)}">
		          <a href="#" onclick="openWin('<%=request.getContextPath() %>/acl/useracl.action?principalType=User&principalId=${users.id}','roleauth',630,590,1);">用户授权</a>
		         </c:when>
			      <c:otherwise>
			      用户授权
			      </c:otherwise>
		      </c:choose>
	         </c:otherwise>
	         </c:choose>
	           </td>
	          <td align="center" class="content_L"><input type="checkbox"  name="delId" id="sid" class="f_checkbox" value="${users.id}"></td>
        	</tr>
        	</c:forEach>
		</c:if>

		<c:forEach  var="j" begin="${my:length(page.datas)}" end="${ps-1}">
	      	<tr>
		      <td align="center" class="content_L">&nbsp;</td>
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
		<tr align="center">
			<td class="content_L">
			共<span id="totalPage"></span>页/共${page.total}条记录
				<input type="hidden" value="${page.total/ps}" id="tmp">
				<input type="hidden" value="${page.offset/ps+1}" id="tmpNP">
				<pg:pager url="user/list.action" items="${page.total}"  maxPageItems="${ps}" export="currentPageNumber=pageNumber">
				<pg:param name="sysUser.userName" value="${sysUser.userName}"/>
				<pg:param name="sysUser.account" value="${sysUser.account}"/>
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