<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ include file="../pub/taglib.jsp" %>
<html>
  <head><title>北京青年政治学院IT基础架构</title>
   	<link href="methodfish.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
		function openWin(f,n,w,h,s){
			sb = s == "1" ? "1" : "0";
			l = (screen.width - w)/2;
			t = (screen.height - h)/2;
			sFeatures = "left="+ l +",top="+ t +",height="+ h +",width="+w+ ",center=1,scrollbars=1,status=0,resizable=yes,directories=0,channelmode=0";
			openwin = window.open(f , n , sFeatures );
			if (!openwin.opener)
				openwin.opener = self;
			openwin.focus();
			return openwin;
		}
	</script>

<style type="text/css">
	.mid {font-size: 9pt; line-height: 150%; color: #333333; text-decoration: none}
	a.mid:link {font-size: 9pt; line-height: 150%; color: #333333; text-decoration: none}
	a.mid:visited {font-size: 9pt; line-height: 150%; color: #333333; text-decoration: none}
	a.mid:hover {font-size: 9pt; line-height: 150%; color: #F50D0D; text-decoration: underline}
	a.mid:active {font-size: 9pt; line-height: 150%; color: #F50D0D; text-decoration: none}
</style>
  </head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td class="topbg01">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="top02">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

<table width="96%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="../images/kong.gif" width="1" height="2"></td>
  </tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    
         
          <td width="200" valign="top"> 
            <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#8BB0E4">
	              <tr> 
		                <td bgcolor="#6B8FC0"> 
		                  <table width="100%" border="0" cellspacing="0" cellpadding="0" background="../images/left_01.gif" height="22" class="left">
		                    <tr> 
		                      <td width="18%" align="center"><img src="../images/adorn_02.gif" width="13" height="13"></td>
		                      <td width="82%"><font style="color:purple;font-size: 13px;">温馨提示</font></td>
		                    </tr>
		                  </table>
		                </td>
	              </tr>
        
		              <tr> 
		                <td bgcolor="#F2F6FB"> 
		                  <table width="96%" border="0" cellspacing="0" cellpadding="0">
		                    <tr> 
		                      <td><img src="../images/kong.gif" width="1" height="10"></td>
		                    </tr>
		                  </table>
				              <marquee id="wxts" direction=up behavior="scroll" scrollamount="4"  onMouseOver=this.stop() onMouseOut=this.start() style="width:96%;height:300;">
				                  <table width="96%" height="300" border="0" cellspacing="0" cellpadding="2" align="center">                
									<tr><td>&nbsp;</td></tr>
									<tr><td>&nbsp;</td></tr>
				                  </table>
						                  </marquee>
				                  <table width="96%" border="0" cellspacing="0" cellpadding="0" align="center">
				                    <tr> 
				                      <td align="right"><a href="#" onClick="tiaozhuan('CD009','CD009_CD007_CD00703')"><img border="0" src="../images/more_03.gif" width="40" height="10"></a></td>
				                    </tr>
				                    <tr> 
				                      <td align="right"><img src="../images/kong.gif" width="1" height="10"></td>
				                    </tr>
				                  </table>
		                </td>
		              </tr>
            </table>
          </td>
      
      

    <td valign="top">
	      <table width="100%" border="0" cellspacing="10" cellpadding="0">
	        <tr>
	          <td valign="top"> 
	            <table width="96%" border="0" cellspacing="0" cellpadding="0">
	              <tr> 
	                <td><img src="../images/kong.gif" width="1" height="16"></td>
	              </tr>
	       		</table>
            	<table width="96%" border="0" cellspacing="0" cellpadding="0" align="center">
	              <tr> 
	                <td background="../images/mid_bg_01.gif" height="34"> 
	                  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mid03">
	                    <tr> 
	                      <td width="9%"><img src="../images/mid_pic_01.gif" width="46" height="34"></td>
	                      <td width="82%">公告</td>
	                      <td width="9%"><a href="#" onClick="tiaozhuan('CD009','CD009_CD006_CD00602')"><img border="0" src="../images/more_02.gif" width="40" height="10"></a></td>
	                    </tr>
	                  </table>
	                 </td>
	              </tr>
              	  <tr> 
                	<td> 
                  		<table width="100%" border="0" cellspacing="1" cellpadding="0">
		                    <tr> 
		                      <td background="../images/xiushi_05.gif"><img src="../images/xiushi_05.gif" width="5" height="1"></td>
		                    </tr>
                    		<tr> 
		                      <td> 
		                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mid">
								<c:forEach items="${page.datas}" var="notice" begin="0" end="10">
		                          <tr> 
		                            <td width="2%" align="center" class="orange"><img alt="" src="<%=request.getContextPath()%>/images/top_adorn_01.gif"></td>
		                            <td width="46%"><a href="#" class="mid" onclick="openWin('<%=request.getContextPath()%>/notice/homeDetail.action?notice.id=${notice.id}','详细信息',650,330);"">${notice.title}</a> 
		                            </td>   
		                          </tr>
								</c:forEach>
		                          <tr>
		                          </tr>
		                        </table>
		                      </td>
		                    </tr>
		                    <tr> 
		                      <td background="../images/xiushi_05.gif"><img src="../images/xiushi_05.gif" width="5" height="1"></td>
		                    </tr>  
						    <tr><td>&nbsp;</td></tr>
						    <tr><td>&nbsp;</td></tr>
						    <tr><td>&nbsp;</td></tr>
						    <tr><td>&nbsp;</td></tr>
						    <tr><td>&nbsp;</td></tr>
						    <tr><td>&nbsp;</td></tr>
						    <tr><td>&nbsp;</td></tr>
						    <tr><td>&nbsp;</td></tr>
						    <tr><td>&nbsp;</td></tr>
						    <tr><td>&nbsp;</td></tr>
                  		</table>
                	</td>
              	</tr>
            </table>
            <table width="96%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><img src="../images/kong.gif" width="1" height="16"></td>
              </tr>
            </table>
         </td>
          
          
         
          
          
       <td width="400" valign="top"> 
     <%-- <table width="100%" border="0" cellspacing="10" cellpadding="0" >
        <tr> 
          <td> 
            <table width="100%" border="0" cellspacing="1" cellpadding="0" >
	            
	              <tr>
						<td>
	              		<div>
	              		<jsp:include page="../js/wnl-nl/calendar.jsp"></jsp:include>
	              		</div>
	              		</td>
	              		</tr>
	          
            </table>
         --%>  </td>
        </tr>
      </table>
    </td>
          
        </tr>
      </table>
    </td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bot01">
  <tr>
    <td width="18%" valign="top"><img src="../images/kong.gif" width="1" height="2"></td>
  </tr>
  <tr> 
    <td width="18%" valign="top" background="images/bot_01.gif"><img src="../images/bot_01.gif" width="2" height="12"></td>
  </tr>
 
</table>
</body>
</html>
