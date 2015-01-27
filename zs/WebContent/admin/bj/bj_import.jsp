<%@ page language="java"  pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>导入笔试成绩</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="<%=request.getContextPath()%>/css/methodfish.css" rel="stylesheet" type="text/css">
  </head>
  <body>
    <form action="<%=request.getContextPath()%>/bj/importExcel.action" method="post" enctype="multipart/form-data">
		<table  cellspacing="0" border="0" cellpadding="0">
			<tr>
				<td>
				<input type="file" name="excel"  style="width:360px;" >
				</td>
			</tr>
			<tr>
				<td>
				&nbsp;
				</td>
			</tr>
			<tr>
				<td align="center">
				<input type="button" class="MyButton" class="f_btn01" onclick="submit()" value="导入笔试成绩">
				</td>
			</tr>
		</table>
	</form>
 </body>
</html>