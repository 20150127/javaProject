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
		<script language="javascript"src="<%=request.getContextPath()%>/js/public.js" type="text/javascript"></script>
	</head>

	<body>
		<form name="myform" method="post" action="<%=request.getContextPath()%>/domain/list.action">
		<table align="center" class="table" border="1" width="100%" style="border-collapse:collapse;">
				<tr>
					<td width="20%" class="title" align="center">集合域名称</td>
					<td class="content_L" width="60%">
						<input type="text"  name="domain.domainName" readonly="readonly" value="${domain.domainName}" id="domainName" maxlength="40" style="width:95%" class="f_input" title="集合域名称">
					</td>
				</tr>
				<tr>
					<td width="20%" class="title" align="center">备注</td>
					<td class="content_L"  width="60%">
						<textarea readonly="readonly"  name="domain.remark" style="width:95%" id="remark" onblur="check()" class="f_textarea" rows="5" cols="50">${domain.remark }</textarea><br>
					</td>
				</tr>
			</table>
			<br>
			<table align="center" class="table" border="1" width="100%" style="border-collapse:collapse;">
				<tr>
					<td colspan="8" align="right" class="content_L">
						<input type="button"  class="f_btn01" value="添加" onclick="openWin('<%=request.getContextPath() %>/domain/toAddValue.action?domain.id=${domain.id }','添加域值',600,200);">
						<input type="hidden" name="domain.id" value="${domian.id }">
					</td> 
				</tr>
			</table>
			<table align="center" class="table" border="1" width="100%" style="border-collapse:collapse;">
				<tr>
					<td class="title" width="30%" align="center" class="content_L">域值</td>
					<td class="title" align="center" class="content_L">备注</td>
					<td class="title" width="10%" align="center" class="content_L">操作</td>
				</tr>

				<c:if test="${!empty domain.values}">
					<c:forEach items="${domain.values }" var="domainValue">
						<tr class="line">
							<td align="center" class="content_L">
								${domainValue.valueName}
							</td>
							<td align="center" class="content_L">
								${domainValue.remark }
							</td>
							<td align="center" class="content_L">
								<input type="button"  class="f_btn01" value="修改" onclick="openWin('<%=request.getContextPath() %>/domain/toUpdateValue.action?domainValue.id=${domainValue.id }','修改域值',600,200);">
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</form>
	</body>
</html>