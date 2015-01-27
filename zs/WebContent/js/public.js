//去掉左边空格
function LTrim(str) {
	var whitespace = new String(" \t\n\r");
	var s = new String(str);
	if (whitespace.indexOf(s.charAt(0)) != -1) {
		var j = 0, i = s.length;
		while (j < i && whitespace.indexOf(s.charAt(j)) != -1) {
			j += 1;
		}
		s = s.substring(j, i);
	}
	return s;
}
//去掉右边空格
function RTrim(str) {
	var whitespace = new String(" \t\n\r");
	var s = new String(str);
	if (whitespace.indexOf(s.charAt(s.length - 1)) != -1) {
		var i = s.length - 1;
		while (i >= 0 && whitespace.indexOf(s.charAt(i)) != -1) {
			i -= 1;
		}
		s = s.substring(0, i + 1);
	}
	return s;
}
//去掉两边空格
function Trim(str) {
	return RTrim(LTrim(str));
}
//checkbox全选	
function quanxuan(frm,nodeName,referNode) {
    for (var i=0;i<frm.elements.length;i++) {
        var e = frm.elements[i];
        if (e.name != nodeName) continue;
        else e.checked = referNode.checked;
    }
}

/*
 * 打开新窗口
 * f:链接地址
 * n:窗口的名称
 * w:窗口的宽度
 * h:窗口的高度
 * s:窗口是否有滚动条，1：有滚动条；0：没有滚动条
 */
function openWin(f,n,w,h,s){
	sb = s == "1" ? "1" : "0";
	l = (screen.width - w)/2;
	t = (screen.height - h)/2;
	sFeatures = "left="+ l +",top="+ t +",height="+ h +",width="+ w
			+ ",center=1,scrollbars=" + sb + ",status=1,directories=0,channelmode=0,resizable=1";
	openwin = window.open(f , n , sFeatures );
	if (!openwin.opener)
		openwin.opener = self;
	openwin.focus();
	return openwin;
}
function openWin2(f,n,w,h,s){
			sb = s == "1" ? "1" : "0";
			l = (screen.width - w)/2;
			t = (screen.height - h)/2;
			sFeatures = "left="+ l +",top="+ t +",height="+ h +",width="+ w
					+ ",center=1,scrollbars=" + sb + ",menubar=yes,status=1,directories=0,channelmode=0,resizable=1";
			openwin = window.open(f , n , sFeatures );
			if (!openwin.opener)
				openwin.opener = self;
			openwin.focus();
			return openwin;
		}
/*
 * 打开删除窗口
 */
function openDeleteDialog(url,confirmString){
	var c = confirmString;
	if(c == null || c == ''){
		c = "你确认要删除记录吗？";
	}
	if(confirm(c)){
		return window.showModalDialog(url,"window123","dialogHeight:234px;dialogWidth:271px;resizable:no;help:yes;status:no;scroll:no");
	}
	return false;
}
/*
 * 打开fs窗口
 */
function openfsDialog(url,confirmString){
	var c = confirmString;
	if(c == null || c == ''){
		c = "你确认要批量操作吗？";
	}
	if(confirm(c)){
		return window.showModalDialog(url,"window123","dialogHeight:234px;dialogWidth:271px;resizable:no;help:yes;status:no;scroll:no");
	}
	return false;
}


/*
 * 删除记录
 */
function del(url,info){
	if(openDeleteDialog(url,info)){
		window.location.reload(true);
	}
}
//删除上传文件
function delFile(url,ps,offset,info,url2){
		if(openDeleteDialog(url,'')){
		//window.location.reload(true);
		location.href=url2;
	}
}
/*
 * 删除记录
 */
function delBatch(url,ps,offset,info){
    var CId = document.getElementsByName("delId");
    var ids = "";
	for(var i=0; i<CId.length; i++){
		if(CId[i].checked==true&&CId[i].value!=""){
				if(ids == "") {
					ids = CId[i].value;
				}else{
					ids = ids+"&ids="+CId[i].value;
				}
		}
	}
	if(ids==""){
		alert("请选择要操作的行！");
	}else{
		url=url+"?ids="+ids;
		if(openDeleteDialog(url,info)){
			window.location.reload(true);
		}
	}
	
}
/*
 * 批量操作
 */
function updateBatch(url,ps,offset,info){
    var CId = document.getElementsByName("delId");
    var ids = "";
	for(var i=0; i<CId.length; i++){
		if(CId[i].checked==true&&CId[i].value!=""){
				if(ids == "") {
					ids = CId[i].value;
				}else{
					ids = ids+"&ids="+CId[i].value;
				}
		}
	}
	if(ids==""){
		alert("请选择要操作的行！");
	}else{
		url=url+"?ids="+ids;
		if(openfsDialog(url,info)){
			window.location.reload(true);
		}
	}
	
}
/*
 * 批量打印
 */
function printBatch(url,ps,offset,info){
    var CId = document.getElementsByName("delId");
    var ids = "";
	for(var i=0; i<CId.length; i++){
		if(CId[i].checked==true&&CId[i].value!=""){
				if(ids == "") {
					ids = CId[i].value;
				}else{
					ids = ids+"&ids="+CId[i].value;
				}
		}
	}
	if(ids==""){
		alert("请选择要操作的行！");
	}else{
		url=url+"?ids="+ids;
		openWin2(url,'打印页面',800,750,1)
	}
	
}

//格式化数字（要转换的值，小数点位数）
function FormatNumber(srcStr,nAfterDot){
	　　var srcStr,nAfterDot;
	　　var resultStr,nTen;
	　　srcStr = ""+srcStr+"";
	　　strLen = srcStr.length;
	　　dotPos = srcStr.indexOf(".",0);
	　　if (dotPos == -1){
	　　　　resultStr = srcStr+".";
	　　　　for (i=0;i<nAfterDot;i++){
	　　　　　　resultStr = resultStr+"0";
	　　　　}
	　　　　return parseFloat(resultStr);
	　　}
	　　else{
	　　　　if ((strLen - dotPos - 1) >= nAfterDot){
	　　　　　　nAfter = dotPos + nAfterDot + 1;
	　　　　　　nTen =1;
	　　　　　　for(j=0;j<nAfterDot;j++){
	　　　　　　　　nTen = nTen*10;
	　　　　　　}
	　　　　　　resultStr = Math.round(parseFloat(srcStr)*nTen)/nTen;
	　　　　　　return parseFloat(resultStr);
	　　　　}
	　　　　else{
	　　　　　　resultStr = srcStr;
	　　　　　　for (i=0;i<(nAfterDot - strLen + dotPos + 1);i++){
	　　　　　　　　resultStr = resultStr+"0";
	　　　　　　}
	　　　　　　return parseFloat(resultStr);
	　　　　}
	　　}
	}
	




function StringBuffer()//自定义一个StringBuffer类。以便提高String的连接字符串性能
{
       this._strings = new Array;
}

StringBuffer.prototype.append = function(str){
                                       this._strings.push(str);
                                    };
StringBuffer.prototype.toString = function(){
                                       return this._strings.join("");//join()用参数里面的字符串连接Array里面的值

                                    };  
                                    
                                 