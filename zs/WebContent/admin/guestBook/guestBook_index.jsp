<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../pub/taglib.jsp"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>留言板管理</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="<%=request.getContextPath()%>/css/methodfish.css"
			rel="stylesheet" type="text/css">
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script language="javascript"
			src="<%=request.getContextPath()%>/js/public.js" type="text/javascript"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/pagination.js" ></script>
		<script language="javascript" src="<%=request.getContextPath()%>/js/calender.js"></script>
	</head>

	<body class="middlebody">
		<form name="myform" method="post"
			action="<%=request.getContextPath()%>/guestBook/list.action">
			<table align="center" class="table" border="1" width="100%"
				style="border-collapse: collapse;">
				<tr>
					<td width="8%" align="center" class="content_L">
						提问时间

					</td>
					<td class="content_L" width="17%">
						<input type="text"  class="f_input" style="width:90%" onclick="setday(this,askTime1,'yyyy-MM-dd HH:mm:ss')" name="askTime1" id="askTime1" value="${askTime1}" readonly="readonly">
					</td>
					<td width="8%" align="center" class="content_L">
						--
					</td>
					<td class="content_L" width="17%">
						<input type="text"  class="f_input" style="width:90%" onclick="setday(this,askTime2,'yyyy-MM-dd HH:mm:ss')" name="askTime2" id="askTime2" value="${askTime2}" readonly="readonly">
					</td>
					<td class="content_L" width="8%" align="center">
						问题状态


					</td>
					<td class="content_L" width="17%">
						<select name="guestBook.ifanswer" style="f_select">
							<option value=""></option>
							<option value="0" <c:if test="${guestBook.ifanswer eq '0'}">selected</c:if>>未回答</option>
							<option value="1" <c:if test="${guestBook.ifanswer eq '1'}">selected</c:if>>已回答</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="6" align="right" class="content_L">
						<c:if test="${xy:hasPermission(user.id,'guestBook',1)}">
							<input type="button" class="f_btn01" value="查询"
								onclick="submit()">
						</c:if>
						
						<c:if test="${xy:hasPermission(user.id,'guestBook',3)}">
							<input type="button" class="f_btn01" value="删除"
								onclick="delBatch('<%=request.getContextPath()%>/guestBook/del.action',${ps},${page.offset});">
						</c:if>
					</td>
				</tr>
			</table>

			<br>
			<table align="center" class="table" border="1" width="100%"
				style="border-collapse: collapse;">
				<tr>
					<td class="title" align="right" class="content_L" colspan="6">
						选择
						<input type="checkbox" name="checkboxs" class="f_checkbox"
							onClick="quanxuan(document.myform,'id',this);">
					</td>
				</tr>

				<c:if test="${!empty page.datas}">
					<c:forEach items="${page.datas }" var="guestBook">
						<tr class="line">
							<td align="left" class="title">
								<c:choose>
									<c:when test="${xy:hasPermission(user.id,'guestBook',1)}">
										标题：<a class="bb" href="javascript:void(0);"
											onclick="openWin('<%=request.getContextPath()%>/guestBook/show.action?guestBook.id=${guestBook.id }','newwindow',650,300,1);">${guestBook.title }</a>
									</c:when>
									<c:otherwise>
										标题：${guestBook.title }
									</c:otherwise>
								</c:choose>
							</td>
							<td align="left" class="title">
								提问人：${guestBook.asker.name }
							</td>
							<td align="right" class="title">
								提问时间：${guestBook.askTime }<nobr><input type="checkbox" name="id" id="delId" class="f_checkbox" value="${guestBook.id}"></nobr>
							</td>
						</tr>
						<tr>
							<td align="left" class="background-color:#FFFFFF" colspan="3">
								<c:choose>
									<c:when test="${my:length(guestBook.answer)>50}">
										${my:substring((guestBook.answer),0,50) }...
									</c:when>
									<c:otherwise>
										${guestBook.answer }
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</c:if>

				<c:forEach var="i" begin="${my:length(page.datas)}" end="${ps-1}">
					<tr id="tr_DHSJZ_ChaXunJG_0" >
						<td class="title"  align="left">标题：</td>
						<td class="title"  align="left">提问人：</td>	
						<td class="title" align="right">提问时间：</td>	
					</tr>
					<tr>
						<td  style="background-color:#FFFFFF" colspan="3">&nbsp;</td>
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
							<pg:param name="askTime1" value="${askTime1}" />
							<pg:param name="askTime2" value="${askTime2}" />
							<pg:param name="guestBook.ifanswer" value="${guestBook.ifanswer}" />
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
							id="tmpPZ" value="${ps}" onblur="selectPagesize(this)"
							onkeyup="javascript:if(event.keyCode ==13 ){selectPagesize(this)}">
						条






					</td>
				</tr>
			</table>
		</form>

	</body>
</html>
