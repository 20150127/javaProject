<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../pub/taglib.jsp"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>招生公告管理</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="<%=request.getContextPath()%>/css/methodfish.css"
			rel="stylesheet" type="text/css">
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script language="javascript"
			src="<%=request.getContextPath()%>/js/public.js" type="text/javascript"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/pagination.js" ></script>
		<script language="javascript" src="<%=request.getContextPath()%>/js/calender.js"></script>
		<script language="javascript">
		/*
		 * 打开发布窗口
		 */
		function openDeleteDialog1(url,confirmString){
			return window.showModalDialog(url,"window123","dialogHeight:234px;dialogWidth:271px;resizable:no;help:yes;status:no;scroll:no");
		}

		/*
		 * 发布
		 */
		function issue(url,info){
			if(openDeleteDialog1(url,info)){
				window.location.reload(true);
			}
		}
		</script>
	</head>

	<body class="middlebody">
		<form name="myform" method="post"
			action="<%=request.getContextPath()%>/notice/list.action">
			<table align="center" class="table" border="1" width="100%"
				style="border-collapse: collapse;">
				<tr>
					<td class="content_L" width="8%" align="center">
						公告标题

					</td>
					<td class="content_L" width="17%">
						<input type="text" name="notice.title"
							value="${notice.title }" class="f_input">
					</td>
					<td width="8%" align="center" class="content_L">
						发布时间

					</td>
					<td class="content_L" width="17%">
						<input type="text"  class="f_input" style="width:90%" onclick="setday(this,issueTime1,'yyyy-MM-dd HH:mm:ss')" name="issueTime1" id="issueTime1" value="${issueTime1}" readonly="readonly">
					</td>
					<td width="8%" align="center" class="content_L">
						--
					</td>
					<td class="content_L" width="17%">
						<input type="text"  class="f_input" style="width:90%" onclick="setday(this,issueTime2,'yyyy-MM-dd HH:mm:ss')" name="issueTime2" id="issueTime2" value="${issueTime2}" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td colspan="6" align="right" class="content_L">
						<c:if test="${xy:hasPermission(user.id,'notice',1)}">
							<input type="button" class="f_btn01" value="查询"
								onclick="submit()">
						</c:if>
						<c:if test="${xy:hasPermission(user.id,'notice',0)}">
							<input type="button" class="f_btn01" value="添加"
								onclick="openWin('<%=request.getContextPath()%>/notice/toAdd.action','添加供货商',800,650,1);">
						</c:if>
						
					</td>
				</tr>
			</table>

			<br>
			<table align="center" class="table" border="1" width="100%"
				style="border-collapse: collapse;">
				<tr>
					
					<td class="title" align="center" class="content_L">
						公告标题
					</td>
					<td class="title" align="center" class="content_L">
						发布时间
					</td>
					<td class="title" align="center" class="content_L">
						发布人




					</td>
					
					<td class="title" align="center" class="content_L">
						操作
					</td>
				</tr>

				<c:if test="${!empty page.datas}">
					<c:forEach items="${page.datas }" var="notice">
						<tr class="line">
							<td align="center" class="content_L">
								<c:choose>
									<c:when test="${xy:hasPermission(user.id,'notice',1)}">
										<a class="bb" href="javascript:void(0);"
											onclick="openWin('<%=request.getContextPath()%>/notice/show.action?notice.id=${notice.id }','专业信息',800,650);">${notice.title }</a>
									</c:when>
									<c:otherwise>
										${notice.title }
									</c:otherwise>
								</c:choose>
							</td>
							<td align="center" class="content_L">
								${notice.issueTime }
							</td>
							<td align="center" class="content_L">
								${notice.issuePerson }
							</td>
							
							<td align="center" class="content_L">
								<c:if test="${xy:hasPermission(user.id,'notice',3)}">
									<a class="bb" href="javascript:void(0);" onclick="del('<%=request.getContextPath()%>/notice/del.action?notice.id=${notice.id}'),'删除'">删除</a>
								</c:if>
								<c:if test="${notice.ifissue eq '0'}">
									<a class="bb" href="javascript:void(0);" onclick="issue('<%=request.getContextPath()%>/notice/release.action?notice.id=${notice.id}&notice.ifissue=1'),'发布'">发布</a>
								</c:if>
								<c:if test="${notice.ifissue eq '1'}">
									<a class="bb" href="javascript:void(0);" onclick="issue('<%=request.getContextPath()%>/notice/release.action?notice.id=${notice.id}&notice.ifissue=0'),'撤销'">撤销</a>
								</c:if>
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
							<pg:param name="notice.title" value="${notice.title}" />
							<pg:param name="issueTime1" value="${issueTime1}" />
							<pg:param name="issueTime2" value="${issueTime2}" />
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
