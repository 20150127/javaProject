var me = jQuery.noConflict();
//更改每页显示记录数
function selectPagesize(field) {
	var url = document.all.firstpageurl.href + "&pagesize=" + field.value;
	document.location.href = url;
}
// 下拉框跳转

function selectNowPage(field) {
	var offset = (field.value - 1) * me("#tmpPZ").val();
	var url = document.all.firstpageurl.href;
	var perUrl = ""; 
	var endUrl ="";
	if(url.indexOf("&pager.offset") == -1){
		perUrl= url.substring(0, url.indexOf("?pager.offset"));
		endUrl = perUrl + "?pager.offset=" + offset + "&pagesize=" + me("#tmpPZ").val();
	}else{
		perUrl= url.substring(0, url.indexOf("&pager.offset"));
		endUrl = perUrl + "&pager.offset=" + offset + "&pagesize=" + me("#tmpPZ").val();
	}
	document.location.href = endUrl; 
}

//拿到总记录数
me(function(){
	var tmp = me("#tmp").val();
	var tmpstring = tmp.toString();
	var totalPage = 0;
	var array = tmpstring.split(".");
	if(array[1]>0.000001){
		totalPage = parseInt(array[0])+1;
	} else {
		totalPage = parseInt(array[0]);
	}
	me("#totalPage").html(totalPage);
	pageSelect(totalPage);
	pageDefault();
});


//生成下拉框		
function pageSelect(totalPage){
	var selectOption = document.getElementById("nowPage");
	var colls = selectOption.options;
	if(totalPage == 1){
		var aa = new Option();
		aa.value=1;
		aa.text=1;
		colls.add(aa);
	}else {
		for(var i=1;i<=totalPage; i++) {
			var aa = new Option();
			aa.value=i;
			aa.text=i;
			colls.add(aa);
		}
	}
}
//下拉框value显示	
function pageDefault(){
	var selectOption = document.getElementById("nowPage");
	var colls = selectOption.options;
	var nowPage = me("#tmpNP").val();
	for(var i=1;i<=colls.length;i++) {
		if(parseInt(nowPage) == colls[i-1].value) {
		selectOption.options[i-1].selected = true;
	} else {
		selectOption.options[i-1].selected = false;
	}
}
}
