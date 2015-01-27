<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../pub/taglib.jsp"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>专业管理</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="<%=request.getContextPath()%>/css/methodfish.css"
			rel="stylesheet" type="text/css">
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/pagination.js" ></script>
		<script language="javascript"
			src="<%=request.getContextPath()%>/js/public.js" type="text/javascript"></script>
	</head>

	<body class="middlebody">
		<form name="myform" method="post"
			action="<%=request.getContextPath()%>/specialty/list.action">
			<table align="center" class="table" border="1" width="100%"
				style="border-collapse: collapse;">
				<tr>
					<td class="content_L" width="8%" align="center">
						专业名称

					</td>
					<td class="content_L" width="17%">
						<input type="text" name="specialty.name"
							value="${specialty.name }" class="f_input">
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
						<c:if test="${xy:hasPermission(user.id,'specialty',1)}">
							<input type="button" class="f_btn01" value="查询"
								onclick="submit()">
						</c:if>
						<c:if test="${xy:hasPermission(user.id,'specialty',0)}">
							<input type="button" class="f_btn01" value="添加"
								onclick="openWin('<%=request.getContextPath()%>/specialty/toAdd.action','添加专业',480,200);">
						</c:if>
						<c:if test="${xy:hasPermission(user.id,'specialty',3)}">
							<input type="button" class="f_btn01" value="删除"
								onclick="delBatch('<%=request.getContextPath()%>/specialty/del.action',${ps},${page.offset});">
						</c:if>
					</td>
				</tr>
			</table>

			<br>
			<table align="center" class="table" border="1" width="100%"
				style="border-collapse: collapse;">
				<tr>
					
					<td class="title" align="center" class="content_L">
						专业编号

					</td>
					<td class="title" align="center" class="content_L">
						专业名称

					</td>
					<td class="title" align="center" class="content_L">
						选择
						<input type="checkbox" name="checkboxs" class="f_checkbox"
							onClick="quanxuan(document.myform,'id',this);">
					</td>
				</tr>

				<c:if test="${!empty page.datas}">
					<c:forEach items="${page.datas }" var="specialty">
						<tr class="line">
							
							<td align="center" class="content_L">
								<c:choose>
									<c:when test="${xy:hasPermission(user.id,'specialty',1)}">
										<a class="bb" href="javascript:void(0);"
											onclick="openWin('<%=request.getContextPath()%>/specialty/show.action?specialty.id=${specialty.id }','专业信息',480,200);">${specialty.code }</a>
									</c:when>
									<c:otherwise>
${specialty.code }
	</c:otherwise>
								</c:choose>


							</td>
							<td align="center" class="content_L">
								${specialty.name }
							</td>
							<td align="center" class="content_L">
								<input type="checkbox" name="delId" id="delId" class="f_checkbox"
									value="${specialty.id}">
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
			<table align="center" class="table" border="1" width="100%"
				style="border-collapse: collapse;">
				<tr>
					<td class="content_L" align="center">
						共

						<span id="totalPage"></span>页/共${page.total}条记录


						<input type="hidden" value="${page.total/ps}" id="tmp">
						<input type="hidden" value="${page.offset/ps+1}" id="tmpNP">
						<pg:pager url="list.action" items="${page.total}"
							maxPageItems="${ps}" export="currentPageNumber=pageNumber">
							<pg:param name="specialty.name" value="${specialty.name}" />
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
						第



						<select class="sel1" name="nowPage" id="nowPage"
							onchange="selectNowPage(this)">
						</select>
						页 每页显示
						<input class="input1" size="2" maxlength="3" name="pagesize"
							id="tmpPZ" value="${ps}" onkeyup="javascript:if(event.keyCode ==13 ){selectPagesize(this)}">
						条







					</td>
				</tr>
			</table>
		</form>

	</body>
</html>
