<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
'
' �������ƣ�head.asp
' ԭ�����ߣ�lyn_ma
' �����ʼ���lyn.ma@hotmail.com
' �������ڣ������壬2010��06��25�� 15:07:48
' ��Ȩ����(C)sagemwirless
'--------------------------------------------------------------%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>����ҳ��ͷ��</title>
<style type="text/css">
body {background: #686868; font-family:Arial, Helvetica, sans-serif; font-size:12px; margin:0px; margin-bottom:2px;border-bottom: 1px #ccc solid;}
h1 {color: #FFF;}
a {color: #FFF; text-decoration: none;/*��ֹ�˾�������ʧЧ*/position:relative;}
ul { list-style:none;}
#all {width: 100%;}
#banner {margin-top: 8px; margin-left: 32px;}
#main {width: 100%; margin-bottom: 2px; background:#eeeeee; margin-left: 0px; margin-right:0px; height: 30px; color: #000; line-height: 2.4;overflow: auto;}
#main a {color:#000;}
#welcome { float:left; width: 40%; font-weight: 800; padding-left: 8px; position:relative;}
#adminop { float:left; width: 59%; position:relative; text-align:right; line-height:1; *line-height:2.2;}
#adminop ul li {float: right; width: 80px;}
#nav {width: 100%; clear: both;}
#nav ul li {float: right; width:82px; height:25px; line-height: 2.1; text-align: center;}
.inactive { background-image/**/:url(images/admin/nav_bg_inactive2.png) !important;background: none; margin-left: 2px; margin-right:2px;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src=images/admin/nav_bg_inactive2.png);}
.inactive a {color: #000;}
.active {background:url(images/admin/nav_bg_active2.png) !important;background: none; margin-left: 2px; margin-right:2px;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src=images/admin/nav_bg_active2.png);}
.active a {color:#fff;}
.blankgray {background:#bbb; height:2px; width:100%; margin:0; padding:0; clear:both; font-size:2px;}
</style>
<script type="text/javascript" language="javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript">
var oplist = new Array('message', 'news', 'cases', 'issues');
$(document).ready(function() {
	$('#nav').find("a").click(function() {
		var id = $(this).attr('id');
		$.each(oplist, function(i, n) {
			$('#'+n).attr('class', 'inactive');
		});
		$(this).parents("li").attr('class', 'active');
	});
});
</script>
</head>
<body>
<div id="all">
	<div id="banner"><h1>��վ��̨����ϵͳ</h1></div>
    <div id="nav">
    	<ul>
        	<li class="inactive" id="message"><a href="manaMsg.asp" target="main">��������</a></li>
            <li class="inactive" id="news"><a href="mananews.asp" target="main">��������</a></li>
            <li class="inactive" id="cases"><a href="manacases.asp" target="main">������</a></li>
            <li class="inactive" id="issues"><a href="manaissue.asp" target="main">����������</a></li>
        </ul>
    </div>
    <div id="main">
    	<div id="welcome">��ӭ�����,<%=session("username")%>! <img src="images/clock.gif" /> ����ʱ��: <span id="time"></span></div>
        <div id="adminop">
            <ul>
					     <li><a href="quit.asp" target="_parent">�˳�����</a></li>
					     <li><a href="javascript:parent.location.reload();">������ҳ</a></li>
               <li><a href="../default.asp" target="_parent">վ����ҳ</a></li>					 
            </ul>
        </div>
    </div>
</div>
<script type="text/javascript" language="javascript" src="js/tick.js"></script>
</body>
</html>

