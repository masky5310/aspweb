<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
' �������������ʹ�õĴ���ҳ��ǣ��벻Ҫɾ����������ο������ļ���
'
' �������ƣ�manauser.asp
' ԭ�����ߣ�Lyn
' �����ʼ���lyn.ma@hotmail.com
' �������ڣ������գ�2010��06��27�� 19:52:55
' ��Ȩ����(C)Feng
'--------------------------------------------------------------%>

<!--#include file="md5.asp"-->
<!--#include file="../db/conn2.asp"-->

<HTML>
<HEAD>
	<Title>�����˺�</Title>
	<META http-equiv="Content-Type" content="text/html; charset=gb2312">
	<META name="Generator" content="Asp Studio 1.0">
	<script type="text/javascript">
	function checkpw()
	{
	 var newpw=document.getElementById("newpw");
	 var newpw2=document.getElementById("newpw2");
	 if(document.getElementById("newpw").value=="")
	 {
		 alert("�����������!");
		 return;
	 }
	 else
	 {
	  if(newpw.value!=newpw2.value)
		{
			alert("�������ȷ�����벻ͬ!");
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
			response.Write("<script language=javascript>alert('���ݲ�����!������!');history.go(-1)</script>")
	 else	  
	  set rs=server.createobject("adodb.recordset") 
		sql="select * from users where username='"&username&"'"
		rs.open sql,conn,1,3 
		
		if(rs("password")<>md5(oldpw)) then
		 response.write("<script language='javascript'>alert('�����벻��ȷ!');history.go(-1)</script>")		

		else		
			rs("password")=md5(newpw)
			rs.update 
		end if
		
	  rs.close 
	  set rs=nothing 
	  conn.close 
	  set conn=nothing 
	  response.write("<script language='javascript'>alert('�������޸ĳɹ�!');</script>")
	end if
end if
		
%>
	<form action="#" method="post">
		<input type="hidden" name="username" value="<%=session("username")%>">
	 <table>
			<tr><td align="center"><span>������:</span></td><td><input type="password" name="oldpw" id="oldpw"></td></tr>
			<tr><td  align="center"><span>������:</span></td><td><input type="password" name="newpw" id="newpw"></td></tr>
			<tr><td  align="center"><span>ȷ������:</span></td><td><input type="password" name="newpw2" id="newpw2" onBlur="checkpw()"></td></tr>
			<tr><td align="center" colspan="2"><input type="submit" name="submit" value="�� ��">&nbsp;&nbsp;&nbsp;<input type="reset" name="reset" value="�� ��"></td></tr>
	 </table>	
	</form>
</BODY>
</HTML>
