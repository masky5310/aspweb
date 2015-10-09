
<!-- #include file="db/conn.asp" -->

<html>
<head>
<title>留言成功</title>
<link href="style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="refresh" content="2;URL=leaveMsg.asp">
</head>
<body>
<%
'response.codepage=936
'response.charset="UTF-8"
'response.AddHeader("ContentType","application/x-www-form-urlencoded;charset=UTF-8")

user=request.form("name_q") 
title=request.form("title") 
content=request.form("content")

if content="" or title="" or user="" then
	response.Write("<script language=javascript>alert('请填写留言标题或者内容!');history.go(-1)</script>")
else
	set rs=server.createobject("adodb.recordset") 
	sql="select name_q,title,content,datetime_q from leaveMsg" 
	rs.open sql,conn,1,3 
	rs.addnew 
	

	rs("name_q")=user
	rs("title")=title
	rs("content")=content
	rs("datetime_q")=now()
	rs.update 
	rs.close 
	set rs=nothing 
	conn.close 
	set conn=nothing 
	response.write("<script language='javascript'>alert('留言成功！');window.location.href='feedback.asp';</script>")
'response.Write "this is the end"
end if
%>
<!--<div align="center">添加成功，2秒钟后自动跳转到<a href="leaveMsg.asp">留言本首页</a></div>-->
</body>
</html>
