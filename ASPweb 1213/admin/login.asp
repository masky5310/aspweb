<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
'
' �������ƣ�login.asp
' ԭ�����ߣ�lyn_ma
' �����ʼ���lyn.ma@hotmail.com
' �������ڣ������壬2010��06��25�� 13:48:48
' ��Ȩ����(C)sagemwirless
'--------------------------------------------------------------%>

<!--#include file="../db/conn2.asp"-->
<!--#include file="md5.asp"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>ϵͳ��¼</title>
<style type="text/css">
#all {margin-left:auto; margin-right:auto; text-align: center;width: 540px;}
body {text-align:center;}
#main {background:url(images/login_mid.gif); height:240px; text-align:center;}
#title {height:66px;margin-top: 120px;}
#login { margin-top: 32px; width: 420px; margin-left: auto; margin-right:auto;}
#btm_left {background:url(images/login_btm_left.gif) no-repeat; width:21px; float:left;}
#btm_mid {background:url(images/login_btm_mid.gif); width:498px; float:left;}
#btm_right {background:url(images/login_btm_right.gif) no-repeat; width:21px; float:left;}
</style>
<script type="text/javascript" language="javascript">
function reset_form()
{
	document.getElementById('username').value = '';
	document.getElementById('password').value = '';
	return false;
}
					 
</script>
<link href="../Theme/style.css" rel="stylesheet" type="text/css" />
</head>

<BODY>
<%
dim username,password
if Request.Form("submit") <>"" then

'response.Write(Request.Form("submit"))
	username=Request.Form("username")
	password=md5(Request.Form("password"))
	
	if username="" or password="" then
		response.Write("<script language=javascript>alert('�������û�����������!');history.go(-1)</script>")
 else	
    set rs=Server.CreateObject("adodb.recordset")
		sql="select * from users where username='"&username&"'"
		rs.Open sql,conn,1,1
		if rs.RecordCount=1 then
		  if rs("password")=password then			
		   session("username")=username
       response.write("<script language='javascript'>alert('ϵͳ��½�ɹ�!��ӭ"&username&"����!');window.location.href='Management.asp';</script>")
		  else
				response.Write("<script language=javascript>alert('�������!');history.go(-1)</script>")
		  end if		
		else
			response.Write("<script language=javascript>alert('�޴��û���!');history.go(-1)</script>")
		end if
		rs.close 
	  set rs=nothing 
    conn.close 
    set conn=nothing 
 end if
end if
%>
<form action="login.asp" method="post" id="login_form">
<div id="loginDiv">
<center>
<table>
<tr><td colspan="2" align="center" ><span style="font-size:16px"><b>��վ��̨�����½</b></span></td></tr>
<tr><td><span>�� ��:</span></td><td><input type="text" size=20 name="username" style="background:url(images/username_bg.gif) left no-repeat #FFF; border:1px #ccc solid;height: 20px; font-family:Arial, Helvetica, sans-serif; font-size:14px; font-weight: 800; margin:0; padding-left: 24px;"></td></tr>
<tr><td><span>�� ��:</span></td><td><input type="password" size=20 name="password" style="background:url(images/password_bg.gif) left no-repeat #FFF; border:1px #ccc solid;height: 20px; font-family:Arial, Helvetica, sans-serif; font-size:14px; font-weight: 800; margin:0; padding-left: 24px;"></td></tr>
<tr><td  colspan="2" align="center">
<input type="submit" name="submit" value="�� ¼">&nbsp;&nbsp;
<input type="reset" name="cancel" value="ȡ ��" ></td></tr>
</table>
</div>
</center>
<!--<div id="all">
    <div id="title"><img src="images/login_title.gif" /></div>
    <div id="main">    	
        <table id="login">
        	<tr>
            	<td>�� �ţ� </td>
                <td><input type="text" name="username" id="username" size="32" style="background:url(images/username_bg.gif) left no-repeat #FFF; border:1px #ccc solid;height: 20px; font-family:Arial, Helvetica, sans-serif; font-size:14px; font-weight: 800; margin:0; padding-left: 24px;" /></td>
            </tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr>
            	<td>�� ��: </td>
                <td><input type="password" name="password" id="password" size="32" style="background:url(images/password_bg.gif) left no-repeat #FFF; border: 1px #ccc solid; height: 20px; font-family:Arial, Helvetica, sans-serif; font-size:14px; font-weight: 800; margin:0; padding-left: 24px;" /></td>
            </tr>
            <tr>
            	<td></td>
            	<td style="text-align: left; padding-top: 32px;">
                	<input type="image" src="images/login.gif" name="submit" onclick="javascript:document.getElementById('login_form').submit();" />&nbsp;&nbsp;&nbsp;
                    <input type="image" src="images/cancel.gif" name="cancel" onclick="reset_form();" />
                </td>
            </tr>
        </table>
    </div>
    <div id="btm">
        <div id="btm_left"></div>
        <div id="btm_mid"></div>
        <div id="btm_right"></div>
    </div>
</div>-->
</body>
</html>


