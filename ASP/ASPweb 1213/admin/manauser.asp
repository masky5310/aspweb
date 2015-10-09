<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
' 上面这行是软件使用的代码页标记，请不要删除。详情请参考帮助文件。
'
' 档案名称：manauser.asp
' 原创作者：Lyn
' 作者邮件：lyn.ma@hotmail.com
' 创建日期：星期日，2010年06月27日 19:52:55
' 版权所有(C)Feng
'--------------------------------------------------------------%>

<!--#include file="md5.asp"-->
<!--#include file="../db/conn2.asp"-->

<HTML>
<HEAD>
	<Title>管理账号</Title>
	<META http-equiv="Content-Type" content="text/html; charset=gb2312">
	<META name="Generator" content="Asp Studio 1.0">
	<script type="text/javascript">
	function checkpw()
	{
	 var newpw=document.getElementById("newpw");
	 var newpw2=document.getElementById("newpw2");
	 if(document.getElementById("newpw").value=="")
	 {
		 alert("请输入旧密码!");
		 return;
	 }
	 else
	 {
	  if(newpw.value!=newpw2.value)
		{
			alert("新密码和确认密码不同!");
			return;
		}	
	 }
	}	
	</script>
</HEAD>
<BODY>
<%
	submit=Request.Form("submit")
	
	if submit<> "" then
    oldpw=Request.Form("oldpw")
		newpw=Request.Form("newpw")
		newpw2=Request.Form("newpw2")
		username=Request.Form("username")			
		
	 if oldpw ="" or newpw="" or newpw2 ="" or username="" then
			response.Write("<script language=javascript>alert('内容不完整!请完善!');history.go(-1)</script>")
	 else	  
	  set rs=server.createobject("adodb.recordset") 
		sql="select * from users where username='"&username&"'"
		rs.open sql,conn,1,3 
		
		if(rs("password")<>md5(oldpw)) then
		 response.write("<script language='javascript'>alert('旧密码不正确!');history.go(-1)</script>")		

		else		
			rs("password")=md5(newpw)
			rs.update 
		end if
		
	  rs.close 
	  set rs=nothing 
	  conn.close 
	  set conn=nothing 
	  response.write("<script language='javascript'>alert('新密码修改成功!');</script>")
	end if
end if
		
%>
	<form action="#" method="post">
		<input type="hidden" name="username" value="<%=session("username")%>">
	 <table>
			<tr><td align="center"><span>旧密码:</span></td><td><input type="password" name="oldpw" id="oldpw"></td></tr>
			<tr><td  align="center"><span>新密码:</span></td><td><input type="password" name="newpw" id="newpw"></td></tr>
			<tr><td  align="center"><span>确认密码:</span></td><td><input type="password" name="newpw2" id="newpw2" onBlur="checkpw()"></td></tr>
			<tr><td align="center" colspan="2"><input type="submit" name="submit" value="提 交">&nbsp;&nbsp;&nbsp;<input type="reset" name="reset" value="清 空"></td></tr>
	 </table>	
	</form>
</BODY>
</HTML>
