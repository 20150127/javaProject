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
<%--			var radios = $("input[name='exportFW'][checked]");--%>
<%--			var checkboxs = $("input[name='properties'][checked]");--%>
<%--			if(radios.length == 0){--%>
<%--				alert("请选择导出范围!");--%>
<%--				return false;--%>
<%--			}--%>
<%--			--%>
<%--			if(checkboxs.length == 0){--%>
<%--				alert("至少导出一个属性!不能不选择导出属性!");--%>
<%--				return false;--%>
<%--			}--%>
			var radios = document.getElementsByName("exportFW");
			var checkboxs = document.getElementsByName("properties");
			var isSel=false;//判断是否有选中项，默认为无
			var isSel1=false;//判断是否有选中项，默认为无
			for(var i=0;i<radios.length;i++){
				if(radios.item(i).checked==true){
					isSel=true;
					break;
				}
			}
			if(isSel==false){
				alert("请选择导出范围!");
				return false;
			}
			for(var j=0;j<checkboxs.length;j++){
				if(checkboxs.item(j).checked==true){
					isSel1=true;
					break;
				}
			}
			if(isSel1==false){
				alert("至少导出一个属性!不能不选择导出属性!");
				return false;
			}
			return true;
		}
</script>
	</head>

	<body class="middlebody">
		<form action="<%=path%>/export/export.action" method="post"
			onsubmit="return checkForm();">
			<input type="hidden" name="condition" value="${condition}">
			<input type="hidden" name="key" value="${key}">
			<table border="1" cellspacing="0" cellpadding="0" align="center"
				width="90%">
				<tr>
					<td class="edit_Title">
						<img src="<%=request.getContextPath()%>/images/xiushi_04.gif"
							width="13" height="13">
						<font style="font-weight: bold; font-size: 12px;">选择导出条件</font>
					</td>
					<td align="right" width="50%">
						<input type="submit" value="导出Excel" class="f_btn01">
						<input type="button"
							onClick=" if(!confirm('确定离开本页面吗？')) return false;window.close();"
							value="关闭" class="f_btn01">
					</td>
				</tr>
			</table>

			<table border="1" cellspacing="0" cellpadding="0" align="center"
				width="90%">
				<tr>
					<td colspan="3" class="content_L">
						&nbsp;
						<font style="font-weight: bold; font-size: 12px;">导出范围</font>:
						<input type="radio" name="exportFW" value="1" id="fw1">
						<label for="fw1">
							全部考生
						</label>
						<input type="radio" name="exportFW" value="2" id="fw2">
						<label for="fw2">
							发准考证考生
						</label>
						<input type="radio" name="exportFW" value="4" id="fw4">
						<label for="fw4">
							复试考生
						</label>
						<input type="radio" name="exportFW" value="3" id="fw3">
						<label for="fw3">
							录取考生
						</label>
					</td>
				</tr>
				<tr>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="KSH"
							checked="checked" id="a">
						<label for="a">
							考生号 (KSH)
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="ZKZH"
							checked="checked" id="b">
						<label for="b">
							准考证号 (ZKZH)
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="XM"
							checked="checked" id="c">
						<label for="c">
							姓名 (XM)
						</label>
					</td>
				</tr>
				<tr>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="XBDM"
							checked="checked" id="d">
						<label for="d">
							性别代码 (XBDM)
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="CSNY"
							checked="checked" id="e">
						<label for="e">
							出生年月 (CSNY)
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="ZZMMDM"
							checked="checked" id="f">
						<label for="f">
							政治面貌代码 (ZZMMDM)
						</label>
					</td>
				</tr>
				<tr>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="MZDM"
							checked="checked" id="g">
						<label for="g">
							民族代码 (MZDM)
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="KSLBDM"
							checked="checked" id="h">
						<label for="h">
							考生类别代码 (KSLBDM)
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="BYLBDM"
							checked="checked" id="i">
						<label for="i">
							毕业类别代码 (BYLBDM)
						</label>
					</td>
				</tr>
				<tr>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="KLDM"
							checked="checked" id="j">
						<label for="j">
							科类代码 (KLDM)
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="ZXMC"
							checked="checked" id="k">
						<label for="k">
							中学名称 (ZXMC)
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="DQDM"
							checked="checked" id="l">
						<label for="l">
							地区代码 (DQDM)
						</label>
					</td>
				</tr>
				<tr>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="SFZH"
							checked="checked" id="m">
						<label for="m">
							身份证号 (SFZH)
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="JTDZ"
							checked="checked" id="n">
						<label for="n">
							家庭地址 (JTDZ)
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="YZBM"
							checked="checked" id="o">
						<label for="o">
							邮政编码 (YZBM)
						</label>
					</td>
				</tr>
				<tr>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="LXDH"
							checked="checked" id="p">
						<label for="p">
							联系电话 (LXDH)
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="HKKH"
							checked="checked" id="HKKH">
						<label for="HKKH">
							会考考号 (HKKH)
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="KSTC"
							checked="checked" id="q">
						<label for="q">
							考生特长 (KSTC)
						</label>
					</td>
				</tr>
				<tr>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="KSJLHCF"
							checked="checked" id="r">
						<label for="r">
							考生奖励或处罚 (KSJLHCF)
						</label>
					</td>

					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="ZWJD"
							checked="checked" id="ZWJD">
						<label for="ZWJD">
							自我鉴定 (ZSYJ)
						</label>
					</td>

					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="KSLX"
							checked="checked" id="KSLX">
						<label for="KSLX">
							考试类型 (KSLX)
						</label>
					</td>
				</tr>
				<tr>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="CJR"
							checked="checked" id="s">
						<label for="s">
							收件人 (CJR)
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="CJ"
							checked="checked" id="CJ">
						<label for="CJ">
							总成绩 (CJ)
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="LQZY"
							checked="checked" id="LQZY">
						<label for="LQZY">
							录取专业 (LQZY)
						</label>
					</td>
				<tr>
				<tr>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="ZYDH1"
							checked="checked" id="ZYDH1">
						<label for="ZYDH1">
							专业代码 (ZYDH1)
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="YUWEN"
							checked="checked" id="YUWEN">
						<label for="YUWEN">
							语文 (YUWEN)
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="SHUXUE"
							checked="checked" id="SHUXUE">
						<label for="SHUXUE">
							数学 (SHUXUE)
						</label>
					</td>
				</tr>	
				<tr>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="YINGYU"
							checked="checked" id="YINGYU">
						<label for="YINGYU">
							英语 (YINGYU)
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="HKCJ"
							checked="checked" id="HKCJ">
						<label for="HKCJ">
							会考成绩(HKCJ)
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="ZHCJ"
							checked="checked" id="ZHCJ">
						<label for="ZHCJ">
							综合成绩 (ZHCJ)
						</label>
					</td>
				</tr>
				<tr>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="TCCJ"
							checked="checked" id="TCCJ">
						<label for="TCCJ">
							特长成绩 (TCCJ)
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="CSCJ"
							checked="checked" id="CSCJ">
						<label for="CSCJ">
							测试成绩(CSCJ)
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="FSCJ"
							checked="checked" id="FSCJ">
						<label for="FSCJ">
							复试成绩 (FSCJ)
						</label>
					</td>
				</tr>
				<tr>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="CSCJHZ"
							checked="checked" id="CSCJHZ">
						<label for="CSCJHZ">
							初试成绩汇总(CSCJHZ)
						</label>
					</td>
					<td width="25%" class="content_L">
						&nbsp;
					</td>
					<td width="25%" class="content_L">
						&nbsp;
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>