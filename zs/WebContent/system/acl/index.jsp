<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../pub/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <META   HTTP-EQUIV="pragma"   CONTENT="no-cache">  
<META   HTTP-EQUIV="Cache-Control"   CONTENT="no-cache,   must-revalidate">  
<style>
body{font-size:12px; /*主体内元素*/
     margin-left: 0px;
     margin-top: 0px; 
	 margin-right: 0px;
	 margin-bottom: 0px; 
	 }
.eee{ background:#ebf6fa;}
.ddd{ background:#cde2f3;}
</style>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript" src="/zs/dwr/engine.js"></script>
<script type="text/javascript" src="/zs/dwr/util.js"></script>
<script type="text/javascript" src="/zs/dwr/interface/sysACLService.js"></script>
<script type="text/javascript">

//授权
function addOrUpdatePermission(field){
	dwr.engine.setAsync(false);
	
	//如果被选择上，则同时选择其"不继承"和"启用"checkbox
	if(field.checked){
		$(field.moduleId+"_USE").checked = true;
		<c:if test="${principalType eq 'User' }">
		$(field.moduleId+"_EXT").checked = true;
		addOrUpdateExtends(field);
		</c:if>
	}

	sysACLService.addOrUpdatePermission(
		"${principalType}",
		${principalId},
		field.moduleId,
		field.permission,
		field.checked
	);
}

//设置用户的继承特性

function addOrUpdateExtends(field){

	sysACLService.addOrUpdateUserExtends(
		${principalId},
		field.moduleId,
		!field.checked
	);
}

//点击启用checkbox
function usePermission(field){
	//如果checkbox被选中，意味着需要更新ACL的状态

	//更新C/R/U/D以及Extends状态

	
	//设置为同步方式，以便DWR依次发出下列请求
	dwr.engine.setAsync(false);
	
	if(field.checked){
		addOrUpdatePermission($(field.moduleId+"_C"));
		addOrUpdatePermission($(field.moduleId+"_R"));
		addOrUpdatePermission($(field.moduleId+"_U"));
		addOrUpdatePermission($(field.moduleId+"_D"));
		<c:if test="${principalType eq 'User' }">
		addOrUpdateExtends($(field.moduleId+"_EXT"));
		</c:if>
	}else{
		sysACLService.delPermission(
			"${principalType}",
			${principalId},
			field.moduleId		
		);
		$(field.moduleId+"_C").checked = false;
		$(field.moduleId+"_R").checked = false;
		$(field.moduleId+"_U").checked = false;
		$(field.moduleId+"_D").checked = false;
		<c:if test="${principalType eq 'User' }">
		$(field.moduleId+"_EXT").checked = false;
		</c:if>
	}
}

function initTable(){
	sysACLService.searchAclRecord(
		"${principalType}",
		${principalId},
		
		function(datas){
			for(var i=0; i < datas.length; i++){
				var moduleId = datas[i][0];
				var state = datas[i][1];
				var extState = datas[i][2];
				if(state%2==1){
					$(moduleId+"_C").checked=true;
				}
				if(state==2 || state==3 || state==6 || state==7 || state==10 || state==11 || state==14 || state==15){
					$(moduleId+"_R").checked =true;
				}
				if(state==4 || state==5 || state==6 || state==7 || state==12 || state==13 || state==14 || state==15){
					$(moduleId+"_U").checked =true;
				}
				if(state >=8){
					$(moduleId+"_D").checked =true;
				}
				
				<c:if test="${principalType eq 'User' }">	
				$(moduleId+"_EXT").checked = extState == 0 ? true : false;
				</c:if>
				$(moduleId+"_USE").checked = true;
			}
		}
	);
}

function changecolor(){
	var trs = document.getElementsByTagName('tr');
	for(var i=0; i<trs.length; i++){
		if(i%2==0){
			trs[i].className="eee";
		}else{
			trs[i].className="ddd";
		}
	}
}
</script>
<c:choose>
	<c:when test="${principalType eq 'Role' }">
		<c:set var="title" value="请给角色【${roles.roleName }】授权"/>
	</c:when>
	<c:otherwise>
		<c:set var="title" value="请给用户【${users.userName }】授权"/>
	</c:otherwise>
</c:choose>
<title>${title }</title>

</head>
<body onload="initTable(),changecolor();">
<center>
<TABLE class="tableEdit" border="0" cellspacing="1" cellpadding="0" style="width:400px;">
	<TBODY>
		<TR>
			<!-- 这里是添加、编辑界面的标题 -->
			<td align="center" style=" font-size: 9pt; width:100%;line-height: 150%; cellspacing:1; border:0; cellpadding:0; background-color:#88bad1"><p style="height:22px;">${title }</p></TD>
		</TR>
		<TR>
			<td>
			<!-- 主输入域开始 -->

<table class="tableEdit" style="width:600px;" cellspacing="0" border="0" cellpadding="4" >
	
	<tr >
		<td class="tdEditLabel" >顶级模块</td>			
		<td class="tdEditLabel">二级模块</td>
		
		<td class="tdEditLabel" >权限</td>
	<c:if test="${principalType eq 'User' }">
		<td class="tdEditLabel" >不继承</td>
	</c:if>
		<td class="tdEditLabel" >启用</td>
	</tr>
	
	<!-- 输出模块树 
	style=" background-color:#ebf6fa"
	style="background-color:#cde2f3"
	-->
	<c:forEach items="${modules }" var="module">
	<c:if test="${module.sysLevel==1}">
		<tr >
		<td>${module.sysModuleName }</td>
		<td></td>
		
		<td>
			<input type="checkbox" id="${module.id}_R" onclick="addOrUpdatePermission(this)" moduleId="${module.id }" permission="1">只读
			<input type="checkbox" id="${module.id}_C" onclick="addOrUpdatePermission(this)" moduleId="${module.id }" permission="0">增加
			<input type="checkbox" id="${module.id}_U" onclick="addOrUpdatePermission(this)" moduleId="${module.id }" permission="2">更新
			<input type="checkbox" id="${module.id}_D" onclick="addOrUpdatePermission(this)" moduleId="${module.id }" permission="3">删除
		</td>
	<c:if test="${principalType eq 'User' }">
		<td><input type="checkbox" id="${module.id }_EXT"  onclick="addOrUpdateExtends(this)" moduleId="${module.id }"></td>
	</c:if>
		<td><input type="checkbox" id="${module.id }_USE" onclick="usePermission(this)" moduleId="${module.id }"></td>
	</tr>
	
	
	</c:if>	
	
	
	<c:forEach items="${module.childModules }" var="child">
	<c:if test="${child.sysLevel==2}">
	<tr>
		<td></td>
		<td>${child.sysModuleName }</td>
		
		<td>
			<input type="checkbox" id="${child.id }_R" onclick="addOrUpdatePermission(this)" moduleId="${child.id }" permission="1">只读
			<input type="checkbox" id="${child.id }_C" onclick="addOrUpdatePermission(this)" moduleId="${child.id }" permission="0">增加
			<input type="checkbox" id="${child.id }_U" onclick="addOrUpdatePermission(this)" moduleId="${child.id }" permission="2">更新
			<input type="checkbox" id="${child.id }_D" onclick="addOrUpdatePermission(this)" moduleId="${child.id }" permission="3">删除
		</td>
	<c:if test="${principalType eq 'User' }">
		<td><input type="checkbox" id="${child.id }_EXT" onclick="addOrUpdateExtends(this)" moduleId="${child.id }"></td>
	</c:if>
		<td><input type="checkbox" id="${child.id }_USE" onclick="usePermission(this)" moduleId="${child.id }"></td>
	</tr>
	</c:if>
	
	
	</c:forEach>
	</c:forEach>
</table>

			<!-- 主输入域结束 -->
			</td>
		</TR>
	</TBODY>
</TABLE>

<TABLE class="tableEdit" border="0" cellspacing="1" cellpadding="0" style="width:600px;">
		
		<TR>
			<!-- 这里是添加、编辑界面的标题 -->
			<td colspan="6" align="center" style="width:100%;line-height: 150%; cellspacing:1; border:0; cellpadding:0; background-color:#88bad1"><input type="button" class="MyButton"
				value="保存关闭" onclick="window.close()"></TD>
		</TR>
</TABLE>
</center>
</body>
</html>