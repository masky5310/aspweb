
<!-- #include file="db/conn.asp" -->

<html>
<head>
<title>���Գɹ�</title>
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
	response.Write("<script language=javascript>alert('����д���Ա����������!');history.go(-1)</script>")
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
	response.write("<script language='javascript'>alert('���Գɹ���');window.location.href='feedback.asp';</script>")
'response.Write "this is the end"
end if
%>
<!--<div align="center">��ӳɹ���2���Ӻ��Զ���ת��<a href="leaveMsg.asp">���Ա���ҳ</a></div>-->
</body>
</html>
