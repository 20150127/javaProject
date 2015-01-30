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
						<input type="checkbox" name="properties" value="考生号"
							checked="checked" id="a">
						<label for="a">
							考生号 
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="准考证号"
							checked="checked" id="b">
						<label for="b">
							准考证号 
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="姓名"
							checked="checked" id="c">
						<label for="c">
							姓名 
						</label>
					</td>
				</tr>
				<tr>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="性别"
							checked="checked" id="d">
						<label for="d">
							性别
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="出生年月"
							checked="checked" id="e">
						<label for="e">
							出生年月 
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="政治面貌"
							checked="checked" id="f">
						<label for="f">
							政治面貌
						</label>
					</td>
				</tr>
				<tr>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="民族"
							checked="checked" id="g">
						<label for="g">
							民族
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="考生类别"
							checked="checked" id="h">
						<label for="h">
							考生类别
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="毕业类别"
							checked="checked" id="i">
						<label for="i">
							毕业类别
						</label>
					</td>
				</tr>
				<tr>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="科类"
							checked="checked" id="j">
						<label for="j">
							科类
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="中学"
							checked="checked" id="k">
						<label for="k">
							中学名称
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="地区"
							checked="checked" id="l">
						<label for="l">
							地区
						</label>
					</td>
				</tr>
				<tr>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="身份证号"
							checked="checked" id="m">
						<label for="m">
							身份证号 
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="家庭地址"
							checked="checked" id="n">
						<label for="n">
							家庭地址 
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="邮政编码"
							checked="checked" id="o">
						<label for="o">
							邮政编码 
						</label>
					</td>
				</tr>
				<tr>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="联系电话"
							checked="checked" id="p">
						<label for="p">
							联系电话
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="会考考号"
							checked="checked" id="HKKH">
						<label for="HKKH">
							会考考号
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="考生特长"
							checked="checked" id="q">
						<label for="q">
							考生特长
						</label>
					</td>
				</tr>
				<tr>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="考生奖励或处罚"
							checked="checked" id="r">
						<label for="r">
							考生奖励或处罚
						</label>
					</td>

					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="自我鉴定"
							checked="checked" id="ZWJD">
						<label for="ZWJD">
							自我鉴定
						</label>
					</td>

					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="考试类型"
							checked="checked" id="KSLX">
						<label for="KSLX">
							考试类型
						</label>
					</td>
				</tr>
				<tr>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="收件人"
							checked="checked" id="s">
						<label for="s">
							收件人
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="总成绩"
							checked="checked" id="CJ">
						<label for="CJ">
							总成绩
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="录取专业"
							checked="checked" id="LQZY">
						<label for="LQZY">
							录取专业
						</label>
					</td>
				<tr>
				<tr>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="专业代码"
							checked="checked" id="ZYDH1">
						<label for="ZYDH1">
							专业代码
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="语文"
							checked="checked" id="YUWEN">
						<label for="YUWEN">
							语文
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="数学"
							checked="checked" id="SHUXUE">
						<label for="SHUXUE">
							数学
						</label>
					</td>
				</tr>	
				<tr>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="英语"
							checked="checked" id="YINGYU">
						<label for="YINGYU">
							英语
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="报考专业第一志愿"
							checked="checked" id="DYZY">
						<label for="DYZY">
							报考专业第一志愿
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="报考专业第二志愿"
							checked="checked" id="DEZY">
						<label for="DEZY">
							报考专业第二志愿
						</label>
					</td>
				</tr>
				<tr>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="笔试总成绩"
							checked="checked" id="BSZCJ">
						<label for="BSZCJ">
							笔试总成绩
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="笔试计算成绩"
							checked="checked" id="BSJSCJ">
						<label for="BSJSCJ">
							笔试计算成绩
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="面试成绩"
							checked="checked" id="MSCJ">
						<label for="MSCJ">
							面试成绩
						</label>
					</td>
				</tr>
				<tr>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="证书成绩"
							checked="checked" id="ZSCJ">
						<label for="ZSCJ">
							证书成绩
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="高级中等教育阶段成绩"
							checked="checked" id="GJCJ">
						<label for="GJCJ">
							高级中等教育阶段成绩
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="推介及证明材料加分成绩"
							checked="checked" id="TJCJ">
						<label for="TJCJ">
							推介及证明材料加分成绩
						</label>
					</td>
				</tr>
<!-- 					<td width="25%" class="content_L">
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
					</td> -->
				<tr>
				<!-- 	<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="复试成绩"
							checked="checked" id="FSCJ">
						<label for="FSCJ">
							复试成绩
						</label>
					</td> -->
					
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="申请"
							checked="checked" id="SQ">
						<label for="SQ">
							申请
						</label>
					</td>
					<td width="25%" class="content_L">
						<input type="checkbox" name="properties" value="特长测试成绩"
							checked="checked" id="TCCSCJ">
						<label for="TCCSCJ">
							特长测试成绩
						</label>
					</td>
					<td width="25%" class="content_L">
						&nbsp;
					</td>
				</tr>
				<!-- <tr>
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
				</tr> -->
			</table>
		</form>
	</body>
</html>