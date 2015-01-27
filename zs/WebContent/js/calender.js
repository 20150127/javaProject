
 //==================================================== 参数设定部分 =======================================================
var bMoveable=true;  //设置日历是否可以拖动
var _VersionInfo="" //版本信息
 
//==================================================== WEB 页面显示部分 =====================================================
var strFrame;  //存放日历层的HTML代码
document.writeln('<iframe id=meizzDateLayer Author=wayx frameborder=0 style="position: absolute; width: 195px; height: 215px; z-index: 9998; display: none"></iframe>');
strFrame='<style>';
strFrame+='INPUT.button{BORDER-RIGHT: #96C8FF 1px solid;BORDER-TOP: #96C8FF 1px solid;BORDER-LEFT: #96C8FF 1px solid;';
strFrame+='BORDER-BOTTOM: #96C8FF 1px solid;BACKGROUND-COLOR: #96C8FF;font-family:宋体;}';
strFrame+='TD{FONT-SIZE: 9pt;font-family:宋体;}';
strFrame+='</style>';
strFrame+='<scr' + 'ipt>';
strFrame+='var datelayerx,datelayery; /*存放日历控件的鼠标位置*/';
strFrame+='var bDrag; /*标记是否开始拖动*/';
strFrame+='function document.onmousemove() /*在鼠标移动事件中，如果开始拖动日历，则移动日历*/';
strFrame+='{if(bDrag && window.event.button==1)';
strFrame+=' {var DateLayer=parent.document.all.meizzDateLayer.style;';
strFrame+='  DateLayer.posLeft += window.event.clientX-datelayerx;/*由于每次移动以后鼠标位置都恢复为初始的位置，因此写法与div中不同*/';
strFrame+='  DateLayer.posTop += window.event.clientY-datelayery;}}';
strFrame+='function DragStart()  /*开始日历拖动*/';
strFrame+='{var DateLayer=parent.document.all.meizzDateLayer.style;';
strFrame+=' datelayerx=window.event.clientX;';
strFrame+=' datelayery=window.event.clientY;';
strFrame+=' bDrag=true;}';
strFrame+=' function SetHMSZero(objH,objM,objS)/*同时置小时、分、秒为00*/';
strFrame+=' {';
strFrame+='   objH.value="00";';
strFrame+='   objM.value="00";';
strFrame+='   objS.value="00";';
strFrame+=' }';
strFrame+=' function KeyUp(objSour,objDest)/*KeyUp事件*/';
strFrame+=' {';
strFrame+='   if(objSour.value.length == 2){';
strFrame+='   objDest.focus();';
strFrame+='   }';
strFrame+=' }';
strFrame+='function DragEnd(){  /*结束日历拖动*/';
strFrame+=' bDrag=false;}';
strFrame+='</scr' + 'ipt>';
strFrame+='<div style="z-index:9999;position: absolute; left:0; top:0;" onselectstart="return false"><span id=tmpSelectYearLayer Author=wayx style="z-index: 9999;position: absolute;top: 3; left: 19;display: none"></span>';
strFrame+='<span id=tmpSelectMonthLayer Author=wayx style="z-index: 9999;position: absolute;top: 3; left: 106;display: none"></span>';
strFrame+='<table border=1 cellspacing=0 cellpadding=0 width=190 height=160 bordercolor=#96C8FF bgcolor=#4199EE Author="wayx">';
strFrame+='  <tr Author="wayx" ><td width=190 height=20 Author="wayx" bgcolor=#FFFFFF>';
strFrame+=' <table border=0 cellspacing=1 cellpadding=0 width=190 Author="wayx" height=18>';
strFrame+='      <tr align=center Author="wayx">';
strFrame+='<td width=16 align=center bgcolor=#96C8FF style="font-size:12px;cursor: hand;color: #ffffff" ';
strFrame+='        onclick="parent.meizzPrevM()" title="向前翻 1 月" Author=meizz><b Author=meizz>&lt;</b>';
strFrame+='        </td><td width=88 align=center style="font-size:12px;cursor:default" Author=meizz ';
strFrame+='onmouseover="style.backgroundColor=\'#FFefcc\'" onmouseout="style.backgroundColor=\'white\'" ';
strFrame+='onclick="parent.tmpSelectYearInnerHTML(this.innerText.substring(0,4))" title="点击这里选择年份"><span Author=meizz id=meizzYearHead></span></td>';
strFrame+='<td width=70 align=center style="font-size:12px;cursor:default" Author=meizz onmouseover="style.backgroundColor=\'#FFefcc\'" ';
strFrame+=' onmouseout="style.backgroundColor=\'white\'" onclick="parent.tmpSelectMonthInnerHTML(this.innerText.length==3?this.innerText.substring(0,1):this.innerText.substring(0,2))"';
strFrame+='        title="点击这里选择月份"><span id=meizzMonthHead Author=meizz></span></td>';
strFrame+='        <td width=16 bgcolor=#96C8FF align=center style="font-size:12px;cursor: hand;color: #ffffff" ';
strFrame+='         onclick="parent.meizzNextM()" title="向后翻 1 月" Author=meizz><b Author=meizz>&gt;</b></td></tr>';
strFrame+='    </table></td></tr>';
strFrame+='  <tr Author="wayx"><td width=190 height=22 Author="wayx">';
strFrame+='<table border=1 cellspacing=0 cellpadding=0 bgcolor=#4199EE ' + (bMoveable? 'onmousedown="DragStart()" onmouseup="DragEnd()"':'');
strFrame+=' BORDERCOLORLIGHT=#96C8FF BORDERCOLORDARK=#FFFFFF Author="wayx" style="font-weight:bold;cursor:' + (bMoveable ? 'move':'default') + '">';
strFrame+='<tr Author="wayx" align=center><td width=25 height=18 style="font-size:12px;color:#FFFFFF" Author=meizz>日</td>';
strFrame+='<td width=25 height=18 style="font-size:12px;color:#FFFFFF" Author=meizz>一</td><td width=25 height=18 style="font-size:12px;color:#FFFFFF" Author=meizz>二</td>';
strFrame+='<td width=25 height=18 style="font-size:12px;color:#FFFFFF" Author=meizz>三</td><td width=25 height=18 style="font-size:12px;color:#FFFFFF" Author=meizz>四</td>';
strFrame+='<td width=25 height=18 style="font-size:12px;color:#FFFFFF" Author=meizz>五</td><td width=25 height=18 style="font-size:12px;color:#FFFFFF" Author=meizz>六</td></tr>';
strFrame+='</table></td></tr>';
strFrame+='  <tr Author="wayx"><td width=190 height=122 Author="wayx">';
strFrame+='    <table border=1 cellspacing=2 cellpadding=0 BORDERCOLORLIGHT=#96C8FF BORDERCOLORDARK=#FFFFFF bgcolor=#ffffff width=190 height=122 Author="wayx">';
var n=0; for (j=0;j<5;j++){ strFrame+= ' <tr align=center Author="wayx">'; for (i=0;i<7;i++){
strFrame+='<td width=28 height=18 id=meizzDay'+n+' style="font-size:12px,border-style:none;" Author=meizz onclick=parent.meizzDayClick(this.innerText,0)></td>';n++;}
strFrame+='</tr>';}
strFrame+='      <tr align=center Author="wayx">';
for (i=35;i<39;i++)strFrame+='<td width=28 height=18 id=meizzDay'+i+' style="font-size:12px" Author=wayx onclick="parent.meizzDayClick(this.innerText,0)"></td>';
strFrame+='        <td colspan=3 align=right Author=meizz></td></tr>';
strFrame+='    </table></td></tr><tr Author="wayx"><td Author="wayx">';
strFrame+='<div style="font-size:9pt;color:white;font-weight:bold;height:20px">';
strFrame+='<table width=100% border=0 cellSpacing=0 cellpadding=0 bgcolor=#ffffff><tr>';
strFrame+='<td><img src="../images/clock/clock.gif" width="20" height="20" border="0" alt="时间" /></td>';
strFrame+='<td><input id="ClockH" name="ClockH" style="height:18px;width:20px; font-size:12px;border-style:none;" maxlength = 2 ></td>';
strFrame+='<td><input type="image" name="btnHadd" src="../images/clock/spl_up.gif" style="width:15px;height:8px;border:0px;padding:0px" onclick="ClockH.value =(Number(ClockH.value)+1)%24;if(Number(document.all.ClockH.value)<10){ document.all.ClockH.value=\'0\'+document.all.ClockH.value;}"><br>';
strFrame+='<input type="image" name="btnHsub" src="../images/clock/spl_down.gif" style="width:15px;height:8px;border:0px;padding:0px" onclick="ClockH.value =(Number(ClockH.value)-1+24)%24;if(Number(document.all.ClockH.value)<10){ document.all.ClockH.value=\'0\'+document.all.ClockH.value;}"></td>';
strFrame+='<td><b>:</b><input id="ClockM" name="ClockM" style="height:18px;width:20px; font-size:12px;border-style:none;" maxlength = 2 onkeyup="KeyUp(ClockM,ClockS)"></td>';
strFrame+='<td><input type="image" name="btnHadd" src="../images/clock/spl_up.gif" style="width:15px;height:8px;border:0px;padding:0px" onclick="ClockM.value =(Number(ClockM.value)+1)%60;if(Number(document.all.ClockM.value)<10){ document.all.ClockM.value=\'0\'+document.all.ClockM.value;}"><br>';
strFrame+='<input type="image" name="btnHsub" src="../images/clock/spl_down.gif" style="width:15px;height:8px;border:0px;padding:0px" onclick="ClockM.value =(Number(ClockM.value)-1+60)%60;if(Number(document.all.ClockM.value)<10){ document.all.ClockM.value=\'0\'+document.all.ClockM.value;}"></td>';
strFrame+='<td><b>:</b><input id="ClockS" name="ClockS" style="height:18px;width:20px; font-size:12px;border-style:none;" maxlength = 2></td>';
strFrame+='<td><input type="image" name="btnHadd" src="../images/clock/spl_up.gif" style="width:15px;height:8px;border:0px;padding:0px" onclick="ClockS.value =(Number(ClockS.value)+1)%60;if(Number(document.all.ClockS.value)<10){ document.all.ClockS.value=\'0\'+document.all.ClockS.value;}"><br>';
strFrame+='<input type="image" name="btnHsub" src="../images/clock/spl_down.gif" style="width:15px;height:8px;border:0px;padding:0px" onclick="ClockS.value =(Number(ClockS.value)-1+60)%60;if(Number(document.all.ClockS.value)<10){ document.all.ClockS.value=\'0\'+document.all.ClockS.value;}"></td>';
strFrame+='<td><input type="button" style="width:40px;height:20px;border: 1px outset;  BACKGROUND-COLOR: #4199EE;color:#ffffff" onclick="SetHMSZero(ClockH,ClockM,ClockS)" value="归零"/></td>';
strFrame+='</tr></table>';
strFrame+='</div>';
strFrame+='<div style="font-size:9pt;color:white;font-weight:bold;width:190px">';
strFrame+='<input type="button" style="width:90px;height:20px; border: 1px outset;  BACKGROUND-COLOR: #4199EE;color:#ffffff;font:bold;cursor:hand" onclick="parent.clearObj()" value="空值返回"/>';
strFrame+='<input type="button" style="width:50px;height:20px; border: 1px outset;  BACKGROUND-COLOR: #4199EE;color:#ffffff;font:bold;cursor:hand" onclick="parent.ok()" value="确定"/>';
strFrame+='<input type="button" style="width:50px;height:20px; border: 1px outset;  BACKGROUND-COLOR: #4199EE;color:#ffffff;font:bold;cursor:hand" onclick=\"parent.closeLayer();\" value="取消"/>';
strFrame+='</div>';
strFrame+='</td></tr></table></div>';
window.frames.meizzDateLayer.document.writeln(strFrame);
window.frames.meizzDateLayer.document.close();  //解决ie进度条不结束的问题

//==================================================== WEB 页面显示部分 ======================================================
var outObject;      //存放对象
var outButton;  //点击的按钮
var outDate="";  //存放对象的日期
var odatelayer=window.frames.meizzDateLayer.document.all;  //存放日历对象
var outFormat="";      //返回日期格式
var selDay; //选择的日期
var selDayEx;//选择的月份偏移值

function setday(tt,obj,format) //主调函数
{
 if (arguments.length >  3){alert("对不起！传入本控件的参数太多！");return;}
 if (arguments.length == 0){alert("对不起！您没有传回本控件任何参数！");return;}
 
 if(format != "yyyy" && format != "yyyy-MM" && format != "yyyy-MM-dd"
     && format != "yyyy-MM-dd HH"
     && format != "yyyy-MM-dd HH:mm"
     && format != "yyyy-MM-dd HH:mm:ss")
  {
      format = "yyyy-MM-dd HH:mm:ss";
  }
  
  if (arguments.length == 1)
  {
      setDay0(format,tt);
  }
  else if (arguments.length == 2)
  {
      setDay0(format,tt,obj);
  }
  else 
  {
      setDay0(format,tt,obj);
  }
}

function getAbsolutePos(el) {
 var SL = 0, ST = 0;
 var is_div = /^div$/i.test(el.tagName);
 if (is_div && el.scrollLeft)
  SL = el.scrollLeft;
 if (is_div && el.scrollTop)
  ST = el.scrollTop;
 var r = { x: el.offsetLeft - SL, y: el.offsetTop - ST };
 if (el.offsetParent) {
  var tmp = this.getAbsolutePos(el.offsetParent);
  r.x += tmp.x;
  r.y += tmp.y;
 }
 return r;
};

function setOnlyDay(tt,obj,format) //主调函数
{
 if (arguments.length >  3){alert("对不起！传入本控件的参数太多！");return;}
  if (arguments.length == 0){alert("对不起！您没有传回本控件任何参数！");return;}
  if(format != "yyyy" && format != "yyyy-MM" && format != "yyyy-MM-dd")
  {
      format = "yyyy-MM-dd";
  }

  if (arguments.length == 1)
  {
      setDay0(format,tt);
  }
  else if (arguments.length == 2)
  {
      setDay0(format,tt,obj);
  
  }else
  {
      setDay0(format,tt,obj);
  }
}

function setDay0(format,tt,obj) //(点击的按钮,存放对象,日期格式串)
{
    if (arguments.length !=  2 && arguments.length !=  3 ){alert("致命错误：传入本方法的参数只能为3！");return;}
    
 var dads  = document.all.meizzDateLayer.style;
 var th = tt;
 var r = getAbsolutePos(tt);
 var ttop  = r.y//tt.offsetTop;     //TT控件的定位点高
 var thei  = tt.clientHeight;  //TT控件本身的高
 var tleft = r.x//tt.offsetLeft;    //TT控件的定位点宽
 var ttyp  = tt.type;          //TT控件的类型
 //while (tt = tt.offsetParent){ttop+=tt.offsetTop; tleft+=tt.offsetLeft;}
 
 dads.top  = (ttyp=="text")? ttop+thei + 6: ttop+thei;
 dads.left = tleft;
 outObject = (arguments.length == 2) ? th : obj;
 outButton = (arguments.length == 2) ? null : th; //设定外部点击的按钮
    outFormat = format;

 //根据当前输入框的日期显示日历的年月
 var reg = /^(\d+)-(\d{1,2})-(\d{1,2})(.*)$/; 
 var r = outObject.value.match(reg); 
 
 if(r!=null){
  r[2]=r[2]-1; 
  var d= new Date(r[1], r[2],r[3]); 
  if(d.getFullYear()==r[1] && d.getMonth()==r[2] && d.getDate()==r[3]){
   outDate=d;  //保存外部传入的日期
  }
  else outDate="";
  meizzSetDay(r[1],r[2]+1);
  var hms = r[4].substr(1,r[4].length-1).split(":");
  if (hms != null && hms.length >= 1 && hms[0].length > 0)
  {
    window.frames.meizzDateLayer.document.all.ClockH.value = hms[0];
  }
  else
  {
    window.frames.meizzDateLayer.document.all.ClockH.value = "00";
  }
  if (hms != null && hms.length >= 2)
  {
    window.frames.meizzDateLayer.document.all.ClockM.value = hms[1];
  }
  else
  {
    window.frames.meizzDateLayer.document.all.ClockM.value = "00";
  }
  if (hms != null && hms.length >= 3)
  {
    window.frames.meizzDateLayer.document.all.ClockS.value = hms[2];
  }
  else
  {
    window.frames.meizzDateLayer.document.all.ClockS.value = "00";
  }
  //window.frames.meizzDateLayer.document.all.Clock.value = r[4].substr(1,r[4].length-1);
 }
 else
 {
  outDate=new Date();

  var intHours = outDate.getHours();
  var intMinutes = outDate.getMinutes();
  var intSeconds = outDate.getSeconds();
  
  var hours = intHours;
  var minutes;
  var seconds;
  
  if (intMinutes < 10) {
  minutes = "0"+intMinutes;
  } else {
  minutes = intMinutes;
  }
  if (intSeconds < 10)
  {
   seconds = "0" + intSeconds;
  } else {
   seconds = intSeconds;
  }

  window.frames.meizzDateLayer.document.all.ClockH.value=hours;
  window.frames.meizzDateLayer.document.all.ClockM.value=minutes;
  window.frames.meizzDateLayer.document.all.ClockS.value=seconds;
  
  meizzSetDay(outDate.getFullYear(), outDate.getMonth() + 1);
  
 }
 dads.display = '';

 event.returnValue=false;
}

var MonHead = new Array(12);         //定义阳历中每个月的最大天数
    MonHead[0] = 31; MonHead[1] = 28; MonHead[2] = 31; MonHead[3] = 30; MonHead[4]  = 31; MonHead[5]  = 30;
    MonHead[6] = 31; MonHead[7] = 31; MonHead[8] = 30; MonHead[9] = 31; MonHead[10] = 30; MonHead[11] = 31;

var meizzTheYear=new Date().getFullYear(); //定义年的变量的初始值
var meizzTheMonth=new Date().getMonth()+1; //定义月的变量的初始值
var meizzWDay=new Array(39);               //定义写日期的数组

function document.onclick() //任意点击时关闭该控件 ;ie6的情况可以由下面的切换焦点处理代替{ 
  with(window.event)
  { if (srcElement.getAttribute("Author")==null && srcElement != outObject && srcElement != outButton)
    closeLayer();
  }
}

function document.onkeyup()  //按Esc键关闭，切换焦点关闭
  {
    if (window.event.keyCode==27){
  if(outObject)outObject.blur();
  closeLayer();
 }
 else if(document.activeElement)
  if(document.activeElement.getAttribute("Author")==null && document.activeElement != outObject && document.activeElement != outButton)
  {
   closeLayer();
  }
  }

function meizzWriteHead(yy,mm)  //往 head 中写入当前的年与月
  {
 odatelayer.meizzYearHead.innerText  = yy + " 年";
    odatelayer.meizzMonthHead.innerText = mm + " 月";
  }

function tmpSelectYearInnerHTML(strYear) //年份的下拉框
{
  if (strYear.match(/\D/)!=null){alert("年份输入参数不是数字！");return;}
  var m = (strYear) ? strYear : new Date().getFullYear();
  if (m < 1000 || m > 9999) {alert("年份值不在 1000 到 9999 之间！");return;}
  var n = m - 10;
  if (n < 1000) n = 1000;
  if (n + 26 > 9999) n = 9974;
  var s = "<select Author=meizz name=tmpSelectYear style='width:80;font-size: 12px' "
     s += "onblur='document.all.tmpSelectYearLayer.style.display=\"none\"' "
     s += "onchange='document.all.tmpSelectYearLayer.style.display=\"none\";"
     s += "parent.meizzTheYear = this.value; parent.meizzSetDay(parent.meizzTheYear,parent.meizzTheMonth)'>\r\n";
  var selectInnerHTML = s;
  for (var i = n; i < n + 26; i++)
  {
    if (i == m)
       {selectInnerHTML += "<option Author=wayx value='" + i + "' selected>" + i + "年" + "</option>\r\n";}
    else {selectInnerHTML += "<option Author=wayx value='" + i + "'>" + i + "年" + "</option>\r\n";}
  }
  selectInnerHTML += "</select>";
  odatelayer.tmpSelectYearLayer.style.display="";
  odatelayer.tmpSelectYearLayer.innerHTML = selectInnerHTML;
  odatelayer.tmpSelectYear.focus();
}

function tmpSelectMonthInnerHTML(strMonth) //月份的下拉框
{
  if (strMonth.match(/\D/)!=null){alert("月份输入参数不是数字！");return;}
  var m = (strMonth) ? strMonth : new Date().getMonth() + 1;
  var s = "<select Author=meizz name=tmpSelectMonth style='width:60;font-size: 12px' "
     s += "onblur='document.all.tmpSelectMonthLayer.style.display=\"none\"' "
     s += "onchange='document.all.tmpSelectMonthLayer.style.display=\"none\";"
     s += "parent.meizzTheMonth = this.value; parent.meizzSetDay(parent.meizzTheYear,parent.meizzTheMonth)'>\r\n";
  var selectInnerHTML = s;
  for (var i = 1; i < 13; i++)
  {
    if (i == m)
       {selectInnerHTML += "<option Author=wayx value='"+i+"' selected>"+i+"月"+"</option>\r\n";}
    else {selectInnerHTML += "<option Author=wayx value='"+i+"'>"+i+"月"+"</option>\r\n";}
  }
  selectInnerHTML += "</select>";
  odatelayer.tmpSelectMonthLayer.style.display="";
  odatelayer.tmpSelectMonthLayer.innerHTML = selectInnerHTML;
  odatelayer.tmpSelectMonth.focus();
}

function closeLayer()               //这个层的关闭
  {
    document.all.meizzDateLayer.style.display="none";
  }

function IsPinYear(year)            //判断是否闰平年
  {
    if (0==year%4&&((year%100!=0)||(year%400==0))) return true;else return false;
  }

function GetMonthCount(year,month)  //闰年二月为29天
  {
    var c=MonHead[month-1];if((month==2)&&IsPinYear(year)) c++;return c;
  }

function GetDOW(day,month,year)     //求某天的星期几
  {
    var dt=new Date(year,month-1,day).getDay()/7; return dt;
  }

function meizzPrevY()  //往前翻 Year
  {
    if(meizzTheYear > 999 && meizzTheYear <10000){meizzTheYear--;}
    else{alert("年份超出范围（1000-9999）！");}
    meizzSetDay(meizzTheYear,meizzTheMonth);
  }
function meizzNextY()  //往后翻 Year
  {
    if(meizzTheYear > 999 && meizzTheYear <10000){meizzTheYear++;}
    else{alert("年份超出范围（1000-9999）！");}
    meizzSetDay(meizzTheYear,meizzTheMonth);
  }
function meizzToday()  //Today Button
  {
 var today;
    meizzTheYear = new Date().getFullYear();
    meizzTheMonth = new Date().getMonth()+1;
    today=new Date().getDate();
    //meizzSetDay(meizzTheYear,meizzTheMonth);
    if(outObject){
  outObject.value=meizzTheYear + "-" + meizzTheMonth + "-" + today;
    }
    closeLayer();
  }
function meizzPrevM()  //往前翻月份
  {
    if(meizzTheMonth>1){meizzTheMonth--}else{meizzTheYear--;meizzTheMonth=12;}
    meizzSetDay(meizzTheYear,meizzTheMonth);
  }
function meizzNextM()  //往后翻月份
  {
    if(meizzTheMonth==12){meizzTheYear++;meizzTheMonth=1}else{meizzTheMonth++}
    meizzSetDay(meizzTheYear,meizzTheMonth);
  }

function meizzSetDay(yy,mm)   //主要的写程序**********
{
  meizzWriteHead(yy,mm);
  //设置当前年月的公共变量为传入值
  meizzTheYear=yy;
  meizzTheMonth=mm;
  
  for (var i = 0; i < 39; i++){meizzWDay[i]=""};  //将显示框的内容全部清空
  var day1 = 1,day2=1,firstday = new Date(yy,mm-1,1).getDay();  //某月第一天的星期几
  for (i=0;i<firstday;i++)meizzWDay[i]=GetMonthCount(mm==1?yy-1:yy,mm==1?12:mm-1)-firstday+i+1 //上个月的最后几天
  for (i = firstday; day1 < GetMonthCount(yy,mm)+1; i++){meizzWDay[i]=day1;day1++;}
  for (i=firstday+GetMonthCount(yy,mm);i<39;i++){meizzWDay[i]=day2;day2++}
  for (i = 0; i < 39; i++)
  { var da = eval("odatelayer.meizzDay"+i)     //书写新的一个月的日期星期排列
    if (meizzWDay[i]!="")
      { 
  //初始化边框
  da.borderColorLight="#96C8FF";
  da.borderColorDark="#FFFFFF";
  if(i<firstday)  //上个月的部分
  {
   da.innerHTML="<b><font color=gray>" + meizzWDay[i] + "</font></b>";
   da.title=(mm==1?12:mm-1) +"月" + meizzWDay[i] + "日";
   da.onclick=Function("meizzDayClick(this.innerText,-1)");
   if(!outDate)
    da.style.backgroundColor = ((mm==1?yy-1:yy) == new Date().getFullYear() && 
     (mm==1?12:mm-1) == new Date().getMonth()+1 && meizzWDay[i] == new Date().getDate()) ?
      "#F9C1C2":"#f0f0f0";
   else
   {
    da.style.backgroundColor =((mm==1?yy-1:yy)==outDate.getFullYear() && (mm==1?12:mm-1)== outDate.getMonth() + 1 && 
    meizzWDay[i]==outDate.getDate())? "#F6C1CB" :
    (((mm==1?yy-1:yy) == new Date().getFullYear() && (mm==1?12:mm-1) == new Date().getMonth()+1 && 
    meizzWDay[i] == new Date().getDate()) ? "#F9C1C2":"#f0f0f0");
    //将选中的日期显示为凹下去
    if((mm==1?yy-1:yy)==outDate.getFullYear() && (mm==1?12:mm-1)== outDate.getMonth() + 1 && 
    meizzWDay[i]==outDate.getDate())
    {
     da.borderColorLight="#FFFFFF";
     da.borderColorDark="#F9C1C2";
    }
   }
  }
  else if (i>=firstday+GetMonthCount(yy,mm))  //下个月的部分
  {
   da.innerHTML="<b><font color=gray>" + meizzWDay[i] + "</font></b>";
   da.title=(mm==12?1:mm+1) +"月" + meizzWDay[i] + "日";
   da.onclick=Function("meizzDayClick(this.innerText,1)");
   if(!outDate)
    da.style.backgroundColor = ((mm==12?yy+1:yy) == new Date().getFullYear() && 
     (mm==12?1:mm+1) == new Date().getMonth()+1 && meizzWDay[i] == new Date().getDate()) ?
      "#96C8FF":"#e0e0e0";
   else
   {
    da.style.backgroundColor =((mm==12?yy+1:yy)==outDate.getFullYear() && (mm==12?1:mm+1)== outDate.getMonth() + 1 && 
    meizzWDay[i]==outDate.getDate())? "#00ffff" :
    (((mm==12?yy+1:yy) == new Date().getFullYear() && (mm==12?1:mm+1) == new Date().getMonth()+1 && 
    meizzWDay[i] == new Date().getDate()) ? "#96C8FF":"#f0f0f0");
    //将选中的日期显示为凹下去
    if((mm==12?yy+1:yy)==outDate.getFullYear() && (mm==12?1:mm+1)== outDate.getMonth() + 1 && 
    meizzWDay[i]==outDate.getDate())
    {
     da.borderColorLight="#FFFFFF";
     da.borderColorDark="#96C8FF";
    }
   }
  }
  else  //本月的部分
  {
   da.innerHTML="<b>" + meizzWDay[i] + "</b>";
   da.title=mm +"月" + meizzWDay[i] + "日";
   da.onclick=Function("meizzDayClick(this.innerText,0)");  //给td赋予onclick事件的处理
   //如果是当前选择的日期，则显示亮蓝色的背景；如果是当前日期，则显示暗黄色背景
   if(!outDate)
    da.style.backgroundColor = (yy == new Date().getFullYear() && mm == new Date().getMonth()+1 && meizzWDay[i] == new Date().getDate())?
     "#FCB2C0":"#f0f0f0";
   else
   {
    da.style.backgroundColor =((meizzWDay[i]==outDate.getDate())||(GetMonthCount(yy,mm)<outDate.getDate() && meizzWDay[i]==GetMonthCount(yy,mm)))?
     "#00ffff":((yy == new Date().getFullYear() && mm == new Date().getMonth()+1 && meizzWDay[i] == new Date().getDate())?
     "#96C8FF":"#f0f0f0");
    //将选中的日期显示为凹下去
    //if(yy==outDate.getFullYear() && mm== outDate.getMonth() + 1 && meizzWDay[i]==outDate.getDate())
    if((meizzWDay[i]==outDate.getDate())||(GetMonthCount(yy,mm)<outDate.getDate() && meizzWDay[i]==GetMonthCount(yy,mm)))
    {
     outDate.setDate(meizzWDay[i]);
     selDay = meizzWDay[i];
     selDayEx = 0;
     da.borderColorLight="#FA0300";
     da.borderColorDark="#FA0300";
    }
   }
  }
        da.style.cursor="hand"
      }
    else{da.innerHTML="";da.style.backgroundColor="";da.style.cursor="default"}
  }
}


function meizzDayClick(n,ex)  //点击显示框选取日期，主输入函数*************
{
 selDayEx = ex;
        selDay = n;
 var yy=meizzTheYear;
  var mm = parseInt(meizzTheMonth)+ex; //ex表示偏移量，用于选择上个月份和下个月份的日期
 
var d= new Date(yy, mm-1,n); 
 outDate=d;
 meizzSetDay(yy,mm);

}

function clearObj()//清除显示框内容
{
   if (outObject)
  {
    outObject.value = "";
  }
   closeLayer();
}
function ok()
{
    var h = window.frames.meizzDateLayer.document.all.ClockH.value;

 if(h !="")
 {
//     if(!(new RegExp("^((0?[0-9])|(1[0-9])|(2[0-3])):[0-5][0-9]:[0-5][0-9]$","i")).test(t)){
     if(!(new RegExp("^((0?[0-9])|(1[0-9])|(2[0-3]))$","i")).test(h)){
  alert("您输入的小时值不对！");
  window.frames.meizzDateLayer.document.all.ClockH.focus();
  return;
  }
 }
    
    var m = window.frames.meizzDateLayer.document.all.ClockM.value;
 if(m !="")
 {
     if(!(new RegExp("^[0-5][0-9]$","i")).test(m)){
  alert("您输入的分钟值不对！");
  window.frames.meizzDateLayer.document.all.ClockM.focus();
  return;
  }
 }
 
    var s = window.frames.meizzDateLayer.document.all.ClockS.value;
 if(s !="")
 {
     if(!(new RegExp("^[0-5][0-9]$","i")).test(s)){
  alert("您输入的秒值不对！");
  window.frames.meizzDateLayer.document.all.ClockS.focus();
  return;
  }
 }
 
  var yy=meizzTheYear;
  var mm = parseInt(meizzTheMonth)+selDayEx; //selDayEx表示偏移量，用于选择上个月份和下个月份的日期
 //判断月份，并进行对应的处理
 if(mm<1){
  yy--;
  mm=12+mm;
 }
 else if(mm>12){
  yy++;
  mm=mm-12;
 }
 
  if (mm < 10){mm = "0" + mm;}
  if (outObject)
  {
    if (!selDay) {//outObject.value=""; 
      return;}
    if ( selDay < 10){selDay = "0" + selDay;}
    if(outFormat == "yyyy")
        outObject.value= yy;
    else if(outFormat == "yyyy-MM")
        outObject.value= yy + "-" + mm;
    else if(outFormat == "yyyy-MM-dd")
        outObject.value= yy + "-" + mm + "-" + selDay;
    else  if(outFormat == "yyyy-MM-dd HH")
        outObject.value= yy + "-" + mm + "-" + selDay +" " +window.frames.meizzDateLayer.document.all.ClockH.value; 
    else  if(outFormat == "yyyy-MM-dd HH:mm")
        outObject.value= yy + "-" + mm + "-" + selDay 
            +" " +window.frames.meizzDateLayer.document.all.ClockH.value
            +":" +window.frames.meizzDateLayer.document.all.ClockM.value; 
    else
        outObject.value= yy + "-" + mm + "-" + selDay 
            +" " +window.frames.meizzDateLayer.document.all.ClockH.value
            +":" +window.frames.meizzDateLayer.document.all.ClockM.value
            +":" +window.frames.meizzDateLayer.document.all.ClockS.value;
 closeLayer(); 
  }
  else {closeLayer(); 
alert("您所要输出的控件对象并不存在！");}
}



