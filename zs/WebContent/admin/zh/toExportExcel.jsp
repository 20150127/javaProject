<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../pub/taglib.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>选择导出属性</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="<%=request.getContextPath()%>/css/methodfish.css"
			rel="stylesheet" type="text/css">
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script type="text/javascript">
		function checkForm() {
			var checkboxs = $("input[name='properties'][checked]");
			if(checkboxs.length == 0){
				alert("至少导出一个属性!不能不选择导出属性!");
				return false;
			}
			return true;
		}
</script>
	</head>

	<body class="middlebody">
		<form action="<%=path%>/zh/export.action" method="post"
			onsubmit="return checkForm();">
			<input type="hidden" name="condition" value="${condition}">
			<input type="hidden" name="key" value="${key}">
			<table border="1" cellspacing="0" cellpadding="0" align="center"
				width="90%" style="margin-top: 10px;">
				<tr>
					<td class="edit_Title">
						<img src="<%=request.getContextPath()%>/images/xiushi_04.gif"
							width="13" height="13">
						<font style="font-weight: bold; font-size: 12px;">选择导出条件</font>
					</td>
					<td align="right" width="50%">
						<input type="submit" value="导出EXCEL" class="f_btn01">
						<input type="button"
							onClick=" if(!confirm('确定离开本页面吗？')) return false;window.close();"
							value="关闭" class="f_btn01">
					</td>
				</tr>
			</table>

			<table border="1" cellspacing="0" cellpadding="0" align="center"
				width="90%">
				
				<tr>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="姓名"
							checked="checked" id="a">
						<label for="a">
							姓名
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="考生号"
							checked="checked" id="b">
						<label for="b">
							考生号

						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="准考证号"
							checked="checked" id="c">
						<label for="c">
							准考证号

						</label>
					</td>
				</tr>
				<tr>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="考场号"
							checked="checked" id="d">
						<label for="d">
							考场号

						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="报考专业"
							checked="checked" id="e">
						<label for="e">
							报考专业

						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="评定成绩"
							checked="checked" id="f">
						<label for="f">
							评定成绩
						</label>
					</td>
				</tr>
				
			</table>
		</form>
	</body>
</html>