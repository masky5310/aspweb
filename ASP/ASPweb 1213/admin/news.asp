<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
' �������������ʹ�õĴ���ҳ��ǣ��벻Ҫɾ����������ο������ļ���
'
' �������ƣ�news.asp
' ԭ�����ߣ�Lyn
' �����ʼ���lyn.ma@hotmail.com
' �������ڣ���������2010��06��26�� 19:22:49
' ��Ȩ����(C)Feng
'--------------------------------------------------------------%>

<!--#include file="../db/conn2.asp"-->

<HTML>
<HEAD>
	<Title>���������޸�</Title>
	<META http-equiv="Content-Type" content="text/html; charset=gb2312">
	<META name="Generator" content="Asp Studio 1.0">
</HEAD>
<BODY>
<form action="#" method="post">
<%
 dim submit,title,content
 
 submit=Request.Form("submit") 
 if submit<> "" then  
   
	  id=Request.Form("id")
	  action=Request.Form("action")
	  
	  title=Request.Form("title")
		content=Request.Form("content")			
	   
	  set rs=server.createobject("adodb.recordset") 
		sql="select * from news where id="&id 
		rs.open sql,conn,1,3 	

		rs("title")=title
		rs("content")=content	
		
    rs.update 
	  rs.close 
	  set rs=nothing 
	  conn.close 
	  set conn=nothing 
	  response.write("<script language='javascript'>alert('�����޸ĳɹ�!');window.location.href='mananews.asp';</script>")
	  
else
	  
	  dim id,action
		id=Request.QueryString("id")
		action=Request.QueryString("action")
		
		if id<>"" or action <>"" then			
		  set rs=Server.CreateObject("adodb.recordset")
			sql="select * from news where id="&id
			rs.Open sql,conn,1,3				
      if action="modify" then			
		
		%>
		
		<table  width="100%" border="1" cellspacing="1" cellpadding="5" style="border:#DFDFDF 1px solid; padding:25px 12px 15px 12px; background:#FDFDFD; ">
				<tr ><td  width="100%" colspan="2"align="center" style= "border:#E1E1E1 1px solid;"><b>�� �� �� ��</b></td></tr>
				<tr><td width="30%" align="center" style= "border:#E1E1E1 1px solid;">����������:</td><td  align="left" style= "border:#E1E1E1 1px solid;"><input type="text" size="50" name="title" value=<%=rs("title")%>></td></tr>
				<tr><td width="30%" align="center" style= "border:#E1E1E1 1px solid;">����������:</td><td  align="left" style= "border:#E1E1E1 1px solid;"><textarea rows=4  style="width:100%"  name="content"><%=rs("content")%></textarea></td></tr>
				<tr width="100%">
				    <td   colspan="2" align="center" style= "border:#E1E1E1 1px solid;">
					    <input type="submit" name="submit" value="�޸�����"  icon='icon-add'>&nbsp;&nbsp;&nbsp;&nbsp;
						  <input type="reset" name="cancel" value="ȡ������" icon='icon-reset'> 
						</td>
				</tr>					 
 </table>	
	  <input type="hidden" value="<%=Request.QueryString("id")%>" name="id">
	  <input type="hidden" value="<%=Request.QueryString("action")%>" name="action">
		<%
		 else 
		  rs.Delete()
		  rs.Update()
		  response.Write("<script language=javascript>alert('����ɾ���ɹ�!');window.location.href='Mananews.asp';</script>")
		 end if
		 %>
		<%
		else 	
		  response.Write("<script language=javascript>alert('û����Ӧ����!');window.location.href='Mananews.asp';</script>")
		end if
 end if 		
		%>		
</form>	
</BODY>
</HTML>
