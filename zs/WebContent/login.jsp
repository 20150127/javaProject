<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="pub/taglib.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>北京青年政治学院自主招生管理系统</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<style type="text/css">
a:link {
	font-size: 9pt;
	text-align: center;
	line-height: 150%;
	color: #000000;
	text-decoration: none
}

a:visited {
	color: #000000;
	text-decoration: none
}

a:hover {
	color: #FF9900;
	text-decoration: underline
}

a:active {
	color: #FF0000;
	text-decoration: none
}
a.bb:link, a.bb:active, a.bb:visited{Color:#000000;}/*左边导航连接*/
a.cc:link, a.cc:active, a.cc:visited{Color:#D72222;}/*左边导航连接*/
a.dd:link, a.dd:active, a.dd:visited{Color:#2E01FE;}/*左边导航连接*/
</style>
		<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
		<script type="text/javascript">
			function check() {
				var regNull = /^\s*$/;
				if(regNull.test($("#idcard").val())){
					alert("登录请输入身份证号!");
					$("#idcard").select();
					return false;
				}

				if(regNull.test($("#pwd").val())){
					alert("密码不能为空!");
					$("#idcard").select();
					return false;
				}
				if(regNull.test($("#yzm").val())){
					alert("验证码不能为空!");
					$("#yzm").select();
					return false;
				}
				return true;
			}

			function chageImage(obj){	
				obj.src = "<%=path%>/user/image.jsp?t=" + new Date();
			}
</script>

	</head>
	<body>
		<form action="<%=path%>/us/login.action" method="post"
			onsubmit="return check();">
			<table width="1000" height="144" border="0" cellpadding="0"
				cellspacing="0" background="<%=path%>/images/top1.jpg"
				align="center">
				<tr>
					<td>
						<img src="<%=path%>/images/top1.jpg" />
					</td>
				</tr>
			</table>
			<table width="1000" border="0" cellspacing="0" cellpadding="0"
				background="<%=path%>/images/sean4.jpg" align="center">
				<tr>
					<td width="56%" height="302" rowspan="2" align="left" valign="top"
						style="background:url(<%=path%>/images/mleft2.jpg); background-repeat:no-repeat">
						<table width="46%" border="0" cellspacing="0" cellpadding="0"
							style="margin-left: 12px; margin-top: 1px;float:left">
							<tr>
								<td height="55"  align="left" valign="top">
									<img src="<%=path%>/images/gonggao1.jpg" />
								</td>
								<td style="font-size: 12px;" align="left">
										<a href="<%=path%>/notice/moreNotice.action" class="cc">更多...</a>
								</td>
							</tr>

							<c:forEach items="${page.datas}" var="note">
								<tr>
									<td height="21" style="font-size: 12px; color: #434683;" align="left" colspan="2">
										<a href="<%=path%>/notice/showNotice.action?notice.id=${note.id}" title="${note.title }" class="bb">${my:substring(note.title,0,30)}</a>
									</td>
									<!--  
									<td style="font-size: 12px;" align="left">
										${my:substring(note.issueTime,0,10)}
									</td>
									-->
								</tr>
							</c:forEach>
						</table>
						
						<table width="48%" border="0" cellspacing="0" cellpadding="0"
							style=" margin-top: 1px; float:right">
							<tr>
								<td height="55"  align="left" valign="top">
									<img src="<%=path%>/images/baokao1.jpg" />
								</td>
								<td style="font-size: 12px;" align="right">
										<a href="<%=path%>/link/moreLink.action" class="cc">更多...&nbsp;&nbsp;</a>
								</td>
					    	</tr>
								<c:forEach items="${page2.datas}" var="link">
									<tr>
										<td height="21" style="font-size: 12px; color: #434683;" colspan="2" align="left">
											<a href="${link.path }" target="_blank" title="${link.title }" class="dd">
											
											${my:substring(link.title,0,30) }
											</a>
										</td>
										
									</tr>
								</c:forEach>
					  </table>
					</td>
					<td width="34%" height="242" align="left" valign="top">
						<table width="62%" border="0" cellspacing="0" cellpadding="0"
							style="margin-top: 1px; margin-left:60px;">
							<tr>
								<td colspan="3" align="left" valign="top">
									<img src="<%=path%>/images/shuru.jpg" />
								</td>
							</tr>
							<tr>
								<td width="20%" height="28" align="left" valign="bottom">
									<img src="<%=path%>/images/shenfen.jpg" />
								</td>
								<td width="32%" height="28" align="left" valign="bottom">
									<table width="209" border="0" cellspacing="0" cellpadding="0" >
										<tr height="22">
											<td width="25" align="left" valign="middle">
												<table  border="0" cellspacing="0" cellpadding="0" >
												<tr>
												<td><img src="<%=path%>/images/ren1.jpg" height="24" /></td>
												</tr>
											</table>
											</td>
											<td width="269" align="left" valign="top">
												<input type="text" name="o.IDCardNum" id="idcard"
													maxlength="18"
													style="background:url(<%=path%>/images/k1.jpg); border-top:none; border-bottom:none; border-left:none; border-right:none; width:187px; height:24px;" />
											</td>
										</tr>
									</table>
								</td>
								<td width="10%" align="left" valign="bottom">
									&nbsp;
								</td>
							</tr>
							<tr>
								<td width="20%" height="28" align="left" valign="bottom">
									<img src="<%=path%>/images/mima.jpg" />
								</td>
								<td width="32%" height="28" align="left" valign="bottom">
									<table width="209" border="0" cellspacing="0" cellpadding="0">
										<tr height="22">
											<td width="25" align="left" valign="middle">
											<table  border="0" cellspacing="0" cellpadding="0" >
												<tr>
												<td><img src="<%=path%>/images/suo1.jpg" height="24"/></td>
												</tr>
											</table>
											</td>
											<td width="269" align="left" valign="top">
												<input type="password" name="o.password" id="pwd"
													maxlength="20"
													style="background:url(<%=path%>/images/k1.jpg); border-top:none; border-bottom:none; border-left:none; border-right:none; width:187px; height:24px;" />
											</td>
										</tr>
									</table>
								</td>
								<td width="10%" align="left" valign="bottom">
									&nbsp;
								</td>
							</tr>
							<tr>
								<td width="20%" height="28" align="left" valign="bottom">
									<img src="<%=path%>/images/yanzhen.jpg" />
								</td>
								<td width="32%" height="28" align="left" valign="bottom">
									<table width="209" border="0" cellspacing="0" cellpadding="0">
										<tr height="22">
											<td width="25"  align="left" valign="middle">
											<table  border="0" cellspacing="0" cellpadding="0" >
												<tr>
												<td><img src="<%=path%>/images/yan1.jpg" height="24"/></td>
												</tr>
											</table>
											</td>
											<td width="269" align="left"  valign="bottom">
												<input type="text" name="yzm" id="yzm" maxlength="4"
													style="background:url(<%=path%>/images/yan4.jpg); border-top:none; border-bottom:none; border-left:none; border-right:none; width:110px; height:24px;" />
												<img src="<%=path%>/user/image.jsp" alt="看不清楚，点击换一张"
													title="看不清，点击换一张"
													style="border: 0px; cursor: hand; cursor: pointer;"
													onclick="chageImage(this)">
											</td>
										</tr>
									</table>
								</td>
								<td width="10%" align="left" valign="bottom">
									&nbsp;
								</td>
							</tr>
							<tr>
								<td height="25" colspan="3" align="center" valign="bottom">
								</td>
							</tr>
							<tr>
								<td height="46" colspan="3">
									<input name="imageField1" type="image"
										src="<%=path%>/images/bt4.gif" width="140" " height="30"
										border="0">
									
									<!-- <input name="button1" type="button" style="background-image: url('<%=request.getContextPath()%>/images/bt1.gif');width: 140px;height:30px;">  -->
									<img src="<%=request.getContextPath()%>/images/bt1.gif" style="cursor: pointer;cursor: hand;" onclick="location.href='<%=request.getContextPath()%>/us/toRegisterCheck.action'">			
									
								</td>
							</tr>
						</table>

					</td>
				</tr>
				
				<tr>
					<td height="60" align="left" valign="bottom" colspan="2" >
					<table  border="0" cellspacing="0" cellpadding="0" >
						<tr>
						<td><img src="<%=path%>/images/midse2.jpg" /></td>
						</tr>
						
					</table>
					</td>
				</tr>
			</table>

			<table width="1000" border="0" cellspacing="0" cellpadding="0"
				background="<%=path%>/images/sean1bg2.jpg" align="center">
				<tr>
					<td width="320" align="left" valign="top">
						<img src="<%=path%>/images/bleft.jpg" width="368" height="154"/>
					</td>
					<td width="470" align="center" valign="middle"
						style="color: #FFFFFF">
						<font style="font-size: 16px;">Copyright&copy;2010&nbsp;KuanMingXingYe&nbsp;All&nbsp;Right&nbsp;reserverd </font>
						<br><br>
						<font style="font-size: 16px;">北京青年政治学院</font>
					</td>
					<td width="320" align="left" valign="top">
						<img src="<%=path%>/images/bright.jpg" width="232" height="154"/>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
