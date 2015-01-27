<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="../../pub/taglib.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>会考成绩管理</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="description" content="会考成绩管理">
		<link rel="stylesheet" type="text/css" href="css/Application.css">
		<link rel="stylesheet" type="text/css" href="css/methodfish.css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/public.js"></script>
		<script type="text/javascript">
		
		function checkForm(){
			var cjReg= /^\d+(\.\d)?$/;
				//if(${score.kl==9}){
				
				//}else{
				if(!cjReg.test($("#yuwen").val())){
					$("#yuwenError").html("语文成绩填写不正确！");
		  			$("#yuwen").select();
		  			$("#yuwen").bind("keyup",function (){if(event.keyCode!=13){$("#yuwenError").html("");}});
		  			return false;
				}
				if(!cjReg.test($("#shuxu").val())){
					$("#shuxuError").html("数学成绩填写不正确！");
		  			$("#shuxu").select();
		  			$("#shuxu").bind("keyup",function (){if(event.keyCode!=13){$("#shuxuError").html("");}});
		  			return false;
				}
				if(!cjReg.test($("#yingyu").val())){
					$("#yingyuError").html("英语成绩填写不正确！");
		  			$("#yingyu").select();
		  			$("#yingyu").bind("keyup",function (){if(event.keyCode!=13){$("#yingyuError").html("");}});
		  			return false;
				}
				if(!cjReg.test($("#lishi").val())){
					$("#lishiError").html("历史成绩填写不正确！");
		  			$("#lishi").select();
		  			$("#lishi").bind("keyup",function (){if(event.keyCode!=13){$("#lishiError").html("");}});
		  			return false;
				}
				if(!cjReg.test($("#zhengzhi").val())){
					$("#zhengzhiError").html("政治成绩填写不正确！");
		  			$("#zhengzhi").select();
		  			$("#zhengzhi").bind("keyup",function (){if(event.keyCode!=13){$("#zhengzhiError").html("");}});
		  			return false;
				}
				if(!cjReg.test($("#dili").val())){
					$("#diliError").html("地理成绩填写不正确！");
		  			$("#dili").select();
		  			$("#dili").bind("keyup",function (){if(event.keyCode!=13){$("#diliError").html("");}});
		  			return false;
				}
				if(!cjReg.test($("#wuli").val())){
					$("#wuliError").html("物理成绩填写不正确！");
		  			$("#wuli").select();
		  			$("#wuli").bind("keyup",function (){if(event.keyCode!=13){$("#wuliError").html("");}});
		  			return false;
				}
				if(!cjReg.test($("#huaxue").val())){
					$("#huaxueError").html("化学成绩填写不正确！");
		  			$("#huaxue").select();
		  			$("#huaxue").bind("keyup",function (){if(event.keyCode!=13){$("#huaxueError").html("");}});
		  			return false;
				}
				if(!cjReg.test($("#shengwu").val())){
					$("#shengwuError").html("生物成绩填写不正确！");
		  			$("#shengwu").select();
		  			$("#shengwu").bind("keyup",function (){if(event.keyCode!=13){$("#shengwuError").html("");}});
		  			return false;
				}
				if(!cjReg.test($("#xinxijishu").val())){
					$("#xinxijishuError").html("信息技术成绩填写不正确！");
		  			$("#xinxijishu").select();
		  			$("#xinxijishu").bind("keyup",function (){if(event.keyCode!=13){$("#xinxijishuError").html("");}});
		  			return false;
				}
				if(!cjReg.test($("#tongyongjishu").val())){
					$("#tongyongjishuError").html("通用技术成绩填写不正确！");
		  			$("#tongyongjishu").select();
		  			$("#tongyongjishu").bind("keyup",function (){if(event.keyCode!=13){$("#tongyongjishuError").html("");}});
		  			return false;
				}
				if(!cjReg.test($("#hkzongfen").val())){
					$("#hkzongfenError").html("会考总分填写不正确！");
		  			$("#hkzongfen").select();
		  			$("#hkzongfen").bind("keyup",function (){if(event.keyCode!=13){$("#hkzongfenError").html("");}});
		  			return false;
				}
				
				//}
			myform.submit();
		}
		
		</script>
    		
	</head>
	<body>
		<form name="myform" method="post" action="<%=request.getContextPath()%>/hk/update.action" >
			<table cellspacing="1" class="table" width="90%" align="center">
				<tr>
					<td class="content_L">
					<div align="left" style="float: left;width: 50%;">
						<img src="<%=request.getContextPath() %>/images/xiushi_04.gif" width="13" height="13"><b>编辑成绩</b>
					</div>
					<div  align="right">
						<c:if test="${xy:hasPermission(user.id,'hk',2)}">
							<input type="button" class="f_btn01" value="保存" onclick="checkForm()">&nbsp;
						</c:if>
							<input type="button" class="f_btn01" value="关闭" onclick="javascript:if(!confirm('您确定要退出并关闭窗口吗')){return false;}else{window.close();}">
					</div>
					</td>
				</tr>
			</table>
			<table cellspacing="1" class="table" width="90%" align="center">
				<tr>
					<td class="title" width="15%" align="center">
						姓名<font color="red">*</font>
					</td>
					<td class="content_L" width="35%" >
						<input type="text" name="score.name" value="${score.name}" readonly style="width:95%" maxlength="50" id="name"><br><font color="red"><span id="nameError"></span></font>
						<input type="hidden" name="score.id" value="${score.id}">
					</td>
				
				</tr>
				<tr>
					<td class="title" width="15%" align="center">
						考生号<font color="red">*</font>
					</td>
					<td class="content_L" width="35%" >
						<input type="text" name="score.examineeNum" value="${score.examineeNum}" readonly style="width:95%" maxlength="50" >
					</td>
				</tr>
				<tr>
					<td class="title" width="15%" align="center">
						身份证号<font color="red">*</font>
					</td>
					<td class="content_L" width="35%" >
						<input type="text"  value="${score.IDCardNum}" style="width:95%" readonly maxlength="50" >
					</td>
				</tr>
				<!--
				<tr>
					<td class="title" width="15%" align="center">
						考场号


					</td>
					<td class="content_L" width="35%" >
						<input type="text"  value="${score.roomId}" style="width:95%" readonly maxlength="50" >
					</td>
				</tr>
				 -->
				
					
					<tr>	
					<td class="title" width="15%" align="center">
						语文
					</td>
					<td class="content_L">
					<c:choose>
						<c:when test="${my:endsWith(score.yuwen,'.0')}">
							<input type="text" name="score.yuwen" style="width:95%"  value="<fmt:formatNumber value="${score.yuwen}" pattern="0"/>"  maxlength="50" id="yuwen">
						</c:when>
						<c:otherwise>
							<input type="text" name="score.yuwen" style="width:95%" value="${score.yuwen}"  maxlength="50" id="yuwen">
						</c:otherwise>
					</c:choose><br><font color="red"><span id="yuwenError"></span></font>
					</td>
				</tr>
				<tr>	
					<td class="title" width="15%" align="center">
						数学
					</td>
					<td class="content_L">
					<c:choose>
						<c:when test="${my:endsWith(score.shuxu,'.0')}">
							<input type="text" name="score.shuxu" style="width:95%" value="<fmt:formatNumber value="${score.shuxu}" pattern="0"/>"  maxlength="50" id="shuxu">
						</c:when>
						<c:otherwise>
							<input type="text" name="score.shuxu" style="width:95%" value="${score.shuxu}"  maxlength="50" id="shuxu">
						</c:otherwise>
					</c:choose><br><font color="red"><span id="shuxuError"></span></font>
					</td>
				</tr>
				<tr>	
					<td class="title" width="15%" align="center">
						英语
					</td>
					<td class="content_L">
					<c:choose>
						<c:when test="${my:endsWith(score.yingyu,'.0')}">
							<input type="text" name="score.yingyu" style="width:95%" value="<fmt:formatNumber value="${score.yingyu}" pattern="0"/>"  maxlength="50" id="yingyu">
						</c:when>
						<c:otherwise>
							<input type="text" name="score.yingyu" style="width:95%" value="${score.yingyu}"  maxlength="50" id="yingyu">
						</c:otherwise>
					</c:choose><br><font color="red"><span id="yingyuError"></span></font>
					</td>
				</tr>
				<tr>	
					<td class="title" width="15%" align="center">
						历史
					</td>
					<td class="content_L">
					<c:choose>
						<c:when test="${my:endsWith(score.lishi,'.0')}">
							<input type="text" name="score.lishi" style="width:95%" value="<fmt:formatNumber value="${score.lishi}" pattern="0"/>"  maxlength="50" id="lishi">
						</c:when>
						<c:otherwise>
							<input type="text" name="score.lishi" style="width:95%" value="${score.lishi}"  maxlength="50" id="lishi">
						</c:otherwise>
					</c:choose><br><font color="red"><span id="lishiError"></span></font>
					</td>
				</tr>
				<tr>	
					<td class="title" width="15%" align="center">
						政治
					</td>
					<td class="content_L">
					<c:choose>
						<c:when test="${my:endsWith(score.zhengzhi,'.0')}">
							<input type="text" name="score.zhengzhi" style="width:95%" value="<fmt:formatNumber value="${score.zhengzhi}" pattern="0"/>"  maxlength="50" id="zhengzhi">
						</c:when>
						<c:otherwise>
							<input type="text" name="score.zhengzhi" style="width:95%" value="${score.zhengzhi}"  maxlength="50" id="zhengzhi">
						</c:otherwise>
					</c:choose><br><font color="red"><span id="zhengzhiError"></span></font>
					</td>
				</tr>
				<tr>	
					<td class="title" width="15%" align="center">
						地理
					</td>
					<td class="content_L">
					<c:choose>
						<c:when test="${my:endsWith(score.dili,'.0')}">
							<input type="text" name="score.dili" style="width:95%" value="<fmt:formatNumber value="${score.dili}" pattern="0"/>"  maxlength="50" id="dili">
						</c:when>
						<c:otherwise>
							<input type="text" name="score.dili" style="width:95%" value="${score.dili}"  maxlength="50" id="dili">
						</c:otherwise>
					</c:choose><br><font color="red"><span id="diliError"></span></font>
					</td>
				</tr>
				<tr>	
					<td class="title" width="15%" align="center">
						物理
					</td>
					<td class="content_L">
					<c:choose>
						<c:when test="${my:endsWith(score.wuli,'.0')}">
							<input type="text" name="score.wuli" style="width:95%" value="<fmt:formatNumber value="${score.wuli}" pattern="0"/>"  maxlength="50" id="wuli">
						</c:when>
						<c:otherwise>
							<input type="text" name="score.wuli" style="width:95%" value="${score.wuli}"  maxlength="50" id="wuli">
						</c:otherwise>
					</c:choose><br><font color="red"><span id="wuliError"></span></font>
					</td>
				</tr>
				<tr>	
					<td class="title" width="15%" align="center">
						化学
					</td>
					<td class="content_L">
					<c:choose>
						<c:when test="${my:endsWith(score.huaxue,'.0')}">
							<input type="text" name="score.huaxue" style="width:95%" value="<fmt:formatNumber value="${score.huaxue}" pattern="0"/>"  maxlength="50" id="huaxue">
						</c:when>
						<c:otherwise>
							<input type="text" name="score.huaxue" style="width:95%" value="${score.huaxue}"  maxlength="50" id="huaxue">
						</c:otherwise>
					</c:choose><br><font color="red"><span id="huaxueError"></span></font>
					</td>
				</tr>
				<tr>	
					<td class="title" width="15%" align="center">
						生物
					</td>
					<td class="content_L">
					<c:choose>
						<c:when test="${my:endsWith(score.shengwu,'.0')}">
							<input type="text" name="score.shengwu" style="width:95%" value="<fmt:formatNumber value="${score.shengwu}" pattern="0"/>"  maxlength="50" id="shengwu">
						</c:when>
						<c:otherwise>
							<input type="text" name="score.shengwu" style="width:95%" value="${score.shengwu}"  maxlength="50" id="shengwu">
						</c:otherwise>
					</c:choose><br><font color="red"><span id="shengwuError"></span></font>
					</td>
				</tr>
				<tr>	
					<td class="title" width="15%" align="center">
						信息技术


					</td>
					<td class="content_L">
					<c:choose>
						<c:when test="${my:endsWith(score.xinxijishu,'.0')}">
							<input type="text" name="score.xinxijishu" style="width:95%" value="<fmt:formatNumber value="${score.xinxijishu}" pattern="0"/>"  maxlength="50" id="xinxijishu">
						</c:when>
						<c:otherwise>
							<input type="text" name="score.xinxijishu" style="width:95%" value="${score.xinxijishu}"  maxlength="50" id="xinxijishu">
						</c:otherwise>
					</c:choose><br><font color="red"><span id="xinxijishuError"></span></font>
					</td>
				</tr>
				<tr>	
					<td class="title" width="15%" align="center">
						通用技术


					</td>
					<td class="content_L">
					<c:choose>
						<c:when test="${my:endsWith(score.tongyongjishu,'.0')}">
							<input type="text" name="score.tongyongjishu" style="width:95%" value="<fmt:formatNumber value="${score.tongyongjishu}" pattern="0"/>"  maxlength="50" id="tongyongjishu">
						</c:when>
						<c:otherwise>
							<input type="text" name="score.tongyongjishu" style="width:95%" value="${score.tongyongjishu}"  maxlength="50" id="tongyongjishu">
						</c:otherwise>
					</c:choose><br><font color="red"><span id="tongyongjishuError"></span></font>
					</td>
				</tr>
				
						<tr>	
					<td class="title" width="15%" align="center">
						会考总分
					</td>
					<td class="content_L">
					<c:choose>
						<c:when test="${my:endsWith(score.hkzongfen,'.0')}">
							<input type="text" name="score.hkzongfen" style="width:95%" value="<fmt:formatNumber value="${score.hkzongfen}" pattern="0"/>"  maxlength="50" id="hkzongfen">
						</c:when>
						<c:otherwise>
							<input type="text" name="score.hkzongfen" style="width:95%" value="${score.hkzongfen}"  maxlength="50" id="hkzongfen">
						</c:otherwise>
					</c:choose><br><font color="red"><span id="hkzongfenError"></span></font>
					</td>
				</tr>
				
				
			</table>
		</form>
	</body>
</html>
