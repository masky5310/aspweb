
<%
if session("username")="" then
	 response.write("<script language='javascript'>alert('请登录系统!');window.location.href='login.asp';</script>")
else
  'response.write("<script language='javascript'>alert('"&session("username")&"');</script>")
end if
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>网站系统后台管理</title>
</head>
<frameset rows="20%,*" frameborder="0" border="0" framespacing="2" bordercolor="#0000FF" scrolling="auto">  
	<frame src="head.asp" name="top" noresize ></frame>
	<frameset  cols="15%,*" scrolling="auto">
		<frame src="menu.asp" name="menu"  scrolling="auto"></frame>
		<frame src="main.asp" name="main" scrolling="auto"></frame>
	</frameset>
 <noframes>
		<body> 
		很抱歉，阁下使用的浏览器不支援框架功能，请转用新的浏览器。 
	 </body> 
	</noframes>	
</frameset>	
</html>
	 
