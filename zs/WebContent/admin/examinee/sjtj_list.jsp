<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../pub/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>数据统计</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="<%=request.getContextPath()%>/css/methodfish.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/public.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/pagination.js"></script>
		
	</head>

	<body class="middlebody">
		<form name="myform" method="post" action="<%=request.getContextPath()%>/examinee/export.action">
			<table align="center" class="table" border="1" width="100%"	style="border-collapse: collapse;">
				
				<tr>
					<td class="content_L"  align="center">
						总报考人数：${bkrs}人

					</td>
					<td class="content_L"  align="center">
						总发证人数：${fzrs}人

					</td>
					<td class="content_L"  align="center">
						总录取人数：${lqrs}人

					</td>
					<td colspan="" align="right" class="content_L">
						
						<c:if test="${xy:hasPermission(user.id,'specialty',1)}">
							<input type="submit"  class="f_btn01" value="导出Excel">
						</c:if>
					</td>
				</tr>
			</table>
			<br>
			<table align="center" class="table" border="1" width="100%"	style="border-collapse: collapse;">
				<tr>
					<td class="title" align="center" >专业名称</td>
					<td class="title" align="center" >报考人数</td>
					<td class="title" align="center" >准考证发放人数</td>
					<td class="title" align="center" >录取人数</td>
				</tr>

				<c:if test="${!empty page.datas}">
					<c:forEach items="${page.datas }" var="obj">
						<tr>
							<td class="content_L" align="center">${obj.name}</td>
							<td class="content_L" align="center">${obj.bkrs}</td>
							<td class="content_L" align="center">${obj.fzrs}</td>
							<td class="content_L" align="center">${obj.lqrs}</td>
						</tr>
					</c:forEach>
				</c:if>

				<c:forEach var="i" begin="${my:length(page.datas)}" end="${ps-1}">
					<tr>
						<td align="center" class="content_L">&nbsp;</td>
						<td align="center" class="content_L">&nbsp;</td>
						<td align="center" class="content_L">&nbsp;</td>
						<td align="center" class="content_L">&nbsp;</td>
					</tr>
				</c:forEach>
			</table>
			<br>
			<table align="center" class="table" border="1" width="100%"
				style="border-collapse: collapse;">
				<tr>
					<td class="content_L" align="center">
						共<span id="totalPage"></span>页/共${page.total}条记录


						<input type="hidden" value="${page.total/ps}" id="tmp">
						<input type="hidden" value="${page.offset/ps+1}" id="tmpNP">
						<pg:pager url="sjtj.action" items="${page.total}"
							maxPageItems="${ps}" export="currentPageNumber=pageNumber">
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
						第

						<select class="sel1" name="nowPage" id="nowPage" onchange="selectNowPage(this)">
						</select>
						页 每页显示
						<input class="input1" size="2" maxlength="3" name="pagesize"
							id="tmpPZ" value="${ps}" 	onkeyup="javascript:if(event.keyCode ==13 ){selectPagesize(this)}">
						条

					</td>
				</tr>
			</table>
		</form>

	</body>
</html>
