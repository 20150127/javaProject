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
					window.opener.document.getElementById("moduleId").value=oid;
					window.opener.document.all.pmoduleName.value = oname;
					window.close();
				}
			}
		function check(){
		document.myform.action="<%=request.getContextPath() %>/module/selectList.action?lookup=1";
		myform.submit();		
		}
		
		</script>
	</head>
	
	<body>
		<form name="myform" method="post" action="<%=request.getContextPath() %>/module/selectList.action">
			  <table align="center" class="table" border="1" width="100%" style="border-collapse:collapse;">
					<tr>
						<td class="content_L" width="8%" align="center">模块名称</td>
						<td class="content_L" width="17%"><input type="text"  class="f_input" name="sysModule.sysModuleName" id="sysModuleName" value="${sysModule.sysModuleName}"></td>
						<td width="8%" align="center" class="content_L">唯一标识</td>
						<td class="content_L" width="17%"><input type="text"  class="f_input" name="sysModule.sn" id="sn" value="${sysModule.sn}"></td>
						<td width="8%" align="center" class="content_L">所在层次</td>
						<td class="content_L" width="17%"><input type="text"  class="f_input" name="sysModule.sysLevel" id="sysLevel" value="${sysModule.sysLevel}" ></td>
				  	</tr>
					<tr>
						<td colspan="8" align="right" class="content_L">
						
							<c:if test="${isTop==0}">
							<input type="button"  class="f_btn01" value="返回上层" onclick="submit()">
							</c:if>
							<input type="button"  class="f_btn01" value="查询" onclick="check()">
							<input type="button"  class="f_btn01" onClick=" if(!confirm('确定离开本页面吗？')) return false;window.close();" value="关闭">
						</td>		
					</tr>
			</table>
			
<br>
	<table align="center" class="table" border="1" width="100%" style="border-collapse:collapse;">
			<tr>
		      	<td  class="title" align="center" class="content_L">选择</td>
		        <td  class="title" align="center" class="content_L">模块名称</td>
		        <td  class="title" align="center" class="content_L">唯一标示</td>
		        <td  class="title" align="center" class="content_L">模块地址</td>
		        <td  class="title" align="center" class="content_L">是否叶子</td>
		        <td  class="title" align="center" class="content_L">所在层次</td>
			</tr>
		<c:if test="${!empty page.datas}">
          <c:forEach items="${page.datas }" var="module" >
	      	<tr>
	      	
	          <td align="center" class="content_L"><input type="radio" name="orgid" onclick="selectOrg('${module.id}','${module.sysModuleName}')"></td>
	         <c:choose>
	         <c:when test="${module.isLeaf==1}">
	         
	         <td align="center" class="content_L"><A href="<%=request.getContextPath()%>/module/selectList.action?id=${module.id}">${module.sysModuleName}</A></td>
	         </c:when>
	         <c:otherwise>
	         <td align="center" class="content_L">${module.sysModuleName}</td>
	         </c:otherwise>
	         </c:choose>
	          
	          <td align="center" class="content_L">${module.sn}<input type="hidden" name="level" value="${module.id}"></td>
	          <td align="center" class="content_L">${module.sysUrl}</td>
	          <td align="center" class="content_L">${module.isLeaf }</td>
	          <td align="center" class="content_L">${module.sysLevel }</td>
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
				<pg:pager url="module/selectList.action" items="${page.total}"  maxPageItems="${ps}" export="currentPageNumber=pageNumber">
				<pg:param name="sysModule.sysModuleName" value="${sysModule.sysModuleName}"/>
				<pg:param name="sysModule.sn" value="${sysModule.sn}"/>
				<pg:param name="sysModule.sysLevel" value="${sysModule.sysLevel}"/>
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