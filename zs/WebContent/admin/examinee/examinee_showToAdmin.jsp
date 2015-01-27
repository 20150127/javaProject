<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../pub/taglib.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>查看学生页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
  </head>
  <body bgcolor="#FFFFFF">
  <table width="628" border="1" align="center" cellpadding="0"
			cellspacing="0">
			<caption>	
							         <h2><strong><br><br>${sysv.registerTitle }年首钢工学院<br>高等职业教育自主招生报名表</strong></h2>
						    <div align="left">考生号：${o.examineeNum }</div>
						</caption>
			<tr>
				<td colspan="2">
					<table width="628" height="689" border="1" align="center"
						cellpadding="4" cellspacing="0" bordercolor="#000000"
						style="border-collapse: collapse">
						<tr align="center">
							<td width="88" height="29" nowrap>
								姓名
							</td>
							<td width="60" height="29" nowrap>
								${o.name }
							</td>
							<td width="92" height="29" nowrap>
								性别
							</td>
							<td width="57" height="29" nowrap>
								${xy:sex(o.sex)}
							</td>
							<td width="100" height="29" nowrap>
								民族
							</td>
							<td width="72" height="29" nowrap>
								${xy:mz(o.nationality)}
							</td>
							<td width="87" height="150" rowspan="5" align="center"
								valign="middle">
								<img src="<%=path%>/upload/${o.examineeNum}.jpg"
									 name="pic_1"
									width="120" height="150" border="1" align="middle" id="pic_1">
							</td>
						</tr>
						<tr align="center">
							<td height="29" nowrap>
								出生日期
							</td>
							<td height="29" nowrap>
								${o.birthday }
							</td>
							<td height="29" nowrap>
								政治面貌
							</td>
							<td height="29" nowrap>
								${xy:zzmm(o.politics)}
							</td>
							<td height="29" nowrap>
								考生类别
							</td>
							<td height="29" nowrap>
								${xy:kslb(o.examineeType)}
							</td>
						</tr>
						<tr align="center">
							<td height="29" colspan="2" align="center" nowrap>
								身份证号
							</td>
							<td height="29" colspan="4" align="left">
								${o.IDCardNum }
							</td>
						</tr>
						<tr align="center">
							<td height="29" colspan="2" align="center" nowrap>
							所在（或毕业学校）
							</td>
							<td height="29" colspan="2" nowrap>
								${o.school }
							</td>
							<td height="29" align="center" nowrap>
								毕业时间
							</td>
							<td height="29" align="center" nowrap>
								${o.graduationDate }
							</td>
						</tr>
						<tr align="center">
							<td height="29" colspan="2" nowrap>
								家庭住址
							</td>
							<td height="29" colspan="4" align="left" nowrap>
								${o.address }
							</td>
						</tr>
						<tr align="center">
							<td height="30" colspan="2" nowrap>
								户口所在街道






							</td>
							<td height="30" colspan="5" align="left" nowrap>
								${o.street }
							</td>
						</tr>
						<tr align="center">
							<td height="30" colspan="2" nowrap>
								住址电话:
							</td>
							<td height="30" colspan="3" align="left" nowrap>
								${o.homePhone }
							</td>
							<td height="30"  align="left" nowrap>
								手　机:
							</td>
							<td height="30"  align="left" nowrap>
								${o.mobilePhone }
							</td>
						</tr>
						<tr align="center">
							<td height="30" colspan="2" nowrap>
								邮寄录取通知书地址
							</td>
							<td height="30" colspan="5" align="left" nowrap>
								${o.letterAddress }
							</td>
						</tr>
						<tr align="center">
							<td height="30" colspan="2" nowrap>
								收件人姓名






							</td>
							<td height="30" nowrap>
								${o.letterName }
							</td>
							<td height="30" nowrap>
								联系电话
							</td>
							<td height="30" nowrap>
								${o.linkPhone }
							</td>
							<td height="30" nowrap>
								邮　编






							</td>
							<td height="30" nowrap>
								${o.postCode }
							</td>
						</tr>
						<tr align="center">
							<td height="55" colspan="2" nowrap>
								在校担任社会工作
							</td>
							<td colspan="5" align="left">
								${o.works }
							</td>
						</tr>
						
						<tr align="center">
					    <td height="56" colspan="2">中学阶段获奖情况</td>
					     <td colspan="5" align="left">&nbsp;${o.rewards }</td>
						  </tr>
						  <tr>
					  	<td height="56" colspan="2">获得各类证书情况</td>  
					    <td colspan="5" align="left">&nbsp;${o.cerificate }</td>
					    </tr>
						<tr align="center">
							<td height="52" colspan="2" nowrap>
								个人兴趣爱好及特长


							</td>
							<td colspan="5" align="left">
								&nbsp;${o.hobby }
							</td>
						</tr>
						<tr align="center">
					    	<td height="52" colspan="2">自我鉴定</td>
					   	 <td colspan="5" align="left">&nbsp;${o.zwjd }</td>
					    </tr>
						<tr align="center">
							<td height="30" colspan="2"  nowrap>
							报考专业第一志愿


							</td>
							<td height="30" colspan="5" align="left" nowrap>
							${o.specialtyId.name }
							</td>
							
						</tr>
						<tr align="center">
							<td height="30" colspan="2"  nowrap>
							报考专业第二志愿


							</td>
							<td height="30" colspan="5" align="left" nowrap>
							${o.specialtyId2.name }
							</td>
							
						</tr>
						
						<!--tr align="center">
							<td height="30" colspan="2" nowrap>
								是否同意调剂
							</td>
							<td height="30" colspan="5" nowrap>
								 <c:choose>
									<c:when test="${o.ifAdjust == 1}">
										同意 (&nbsp;&nbsp;&nbsp;√&nbsp;&nbsp;&nbsp;)&nbsp;&nbsp;&nbsp;&nbsp;不同意 (&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)
									</c:when>
									<c:otherwise>
										同意 (&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)&nbsp;&nbsp;&nbsp;&nbsp;不同意 (&nbsp;&nbsp;&nbsp;&nbsp;√&nbsp;&nbsp;&nbsp;&nbsp;)
									</c:otherwise>	
								</c:choose>
							</td>
						</tr-->
					</table>
				</td>
			</tr>
		</table>
  </body>
</html>
