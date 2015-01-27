<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../pub/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>集合域管理</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 		<link href="<%=request.getContextPath() %>/css/methodfish.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script  type="text/javascript" src="<%=request.getContextPath() %>/js/public.js"></script>
		<script type="text/javascript"  src="<%=request.getContextPath()%>/js/pagination.js"></script>
	</head>

	<body>
		<form name="myform" method="post"
			action="<%=request.getContextPath()%>/domain/list.action">
			<table align="center" class="table" border="1" width="100%" style="border-collapse:collapse;">
				<tr>
					<td class="content_L" width="10%" align="center">
						集合域名称
					</td>
					<td class="content_L" width="17%">
						<input type="text" name="domain.domainName"
							value="${domain.domainName}" id="search1" class="f_input">
					</td>
					<td width="8%" align="center" class="content_L">
						&nbsp;
					</td>
					<td class="content_L" width="17%">
						&nbsp;
					</td>
					<td width="8%" align="center" class="content_L">
						&nbsp;
					</td>
					<td class="content_L" width="17%">
						&nbsp;
					</td>
					<td width="8%" align="center" class="content_L">
						&nbsp;
					</td>
					<td class="content_L" width="17%">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td colspan="8" align="right" class="content_L">
				
						<input type="button" class="f_btn01" value="查询" onclick="submit()">
			
					</td>
				</tr>
			</table>
			<br>
			<table align="center" class="table" border="1" width="100%" style="border-collapse:collapse;">
				<tr>
					<td class="title" width="18%" align="center" class="content_L">
						集合域名称
					</td>
					<td class="title" align="center" class="content_L">
						集合域备注
					</td>
					<td class="title" width="10%" align="center" class="content_L">
						操作
					</td>
				</tr>

				<c:if test="${!empty page.datas}">
					<c:forEach items="${page.datas }" var="domain">
						<tr class="line">
							<td align="center" class="content_L">
						
								<a href="javascript:void(0);"
									onclick="openWin('<%=request.getContextPath()%>/domain/showDomain.action?domain.id=${domain.id}','域名详细信息',650,200);">${domain.domainName
									}</a>
							
							</td>
							<td align="center" class="content_L">
								${domain.remark }
							</td>
							<td align="center" class="content_L">
							
								<a href="javascript:void(0);"
									onclick="openWin('<%=request.getContextPath()%>/domain/listValue.action?domain.id=${domain.id}','域值管理',650,500);">查看域值</a>
							
							</td>
						</tr>
					</c:forEach>
				</c:if>

				<c:forEach var="i" begin="${my:length(page.datas)}" end="${ps-1}">
					<tr>
						<td align="center" class="content_L">
							&nbsp;
						</td>
						<td align="center" class="content_L">
							&nbsp;
						</td>
						<td align="center" class="content_L">
							&nbsp;
						</td>
					</tr>
				</c:forEach>
				
			</table>
			<br>
			<table align="center" class="table" border="1" width="100%" style="border-collapse:collapse;">
				<tr>
					<td class="content_L" align="center">
						共
						<span id="totalPage"></span>页/共${page.total}条记录
						<input type="hidden" value="${page.total/ps}" id="tmp">
						<input type="hidden" value="${page.offset/ps+1}" id="tmpNP">
						<pg:pager url="domain/list.action" items="${page.total}"
							maxPageItems="${ps}" export="currentPageNumber=pageNumber">
							<pg:param name="domain.domainName" value="${domain.domainName}" />

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
				</tr>
			</table>
		</form>

	</body>
</html>