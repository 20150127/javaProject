<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../pub/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>请选择所属模块</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	   <link href="<%=request.getContextPath() %>/css/methodfish.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script  type="text/javascript" src="<%=request.getContextPath() %>/js/public.js"></script>
		<script type="text/javascript"  src="<%=request.getContextPath()%>/js/pagination.js"></script>
		<script type="text/javascript">
			function selectOrg(oid,oname){
				if(window.opener){
					window.opener.document.getElementById("roleId").value=oid;
					window.opener.document.all.roleName.value = oname;
					window.close();
				}
			}
		</script>
	</head>
	
	<body>
		<form name="myform" method="post" action="">
			  <table align="center" class="table" border="1" width="100%" style="border-collapse:collapse;">
					<tr>
						<td colspan="8" align="right" class="content_L">
							<input type="button"  class="f_btn01" onClick=" if(!confirm('确定离开本页面吗？')) return false;window.close();" value="关闭">
						</td>		
					</tr>
			</table>
			<br>

	<table align="center" class="table" border="1" width="100%" style="border-collapse:collapse;">
			<tr>
		      	<td  class="title" align="center" class="content_L" width="20%">选择</td>
		        <td  class="title" align="center" class="content_L" width="30%">角色名称</td>
		        <td  class="title" align="center" class="content_L" width="50%">备注</td>
			</tr>

		<c:if test="${!empty page.datas}">
          <c:forEach items="${page.datas }" var="role" >
	      	<tr>
	          <td align="center" class="content_L"><input type="radio" name="orgid" onclick="selectOrg('${role.id}','${role.roleName}')"></td>
	          <td align="center" class="content_L">${role.roleName}</td>
	          <td align="center" class="content_L">${role.remark}</td>
        	</tr>
        	</c:forEach>
		</c:if>
		

		<c:forEach  var="j" begin="${my:length(page.datas)}" end="${ps-1}">
	      	<tr>
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
				<pg:pager url="role/select.action" items="${page.total}"  maxPageItems="${ps}" export="currentPageNumber=pageNumber">
				<pg:param name="sysModuleName" value=""/>
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