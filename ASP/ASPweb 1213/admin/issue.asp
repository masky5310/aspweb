<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
' �������������ʹ�õĴ���ҳ��ǣ��벻Ҫɾ����������ο������ļ���
'
' �������ƣ�issue.asp
' ԭ�����ߣ�Lyn
' �����ʼ���lyn.ma@hotmail.com
' �������ڣ���������2010��06��26�� 18:38:40
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
 dim submit,issue_name,issue_result,issue_reason,issue_solution
 
 submit=Request.Form("submit") 
 if submit<> "" then  
   
	  id=Request.Form("id")
	  action=Request.Form("action")
	  
	  issue_name=Request.Form("issue_name")
		issue_result=Request.Form("issue_result")
		issue_reason=Request.Form("issue_reason")
		issue_solution=Request.Form("issue_solution")		
	   
	  set rs=server.createobject("adodb.recordset") 
		sql="select * from issues where id="&id 
		rs.open sql,conn,1,3 	

		rs("issue_name")=issue_name
		rs("issue_result")=issue_result
		rs("issue_reason")=issue_reason
		rs("issue_solution")=issue_solution	
		
    rs.update 
	  rs.close 
	  set rs=nothing 
	  conn.close 
	  set conn=nothing 
	  response.write("<script language='javascript'>alert('�����޸ĳɹ�!');window.location.href='manaissue.asp';</script>")
	  
else
	  
	  dim id,action
		id=Request.QueryString("id")
		action=Request.QueryString("action")
		
		if id<>"" or action <>"" then			
		  set rs=Server.CreateObject("adodb.recordset")
			sql="select * from issues where id="&id
			rs.Open sql,conn,1,3				
      if action="modify" then			
		
		%>
		
		 <table width="100%">
		   <tr><td  width="100%" colspan="2" align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;""><span>��ҵ���������޸�</span> </td></tr>
			 <tr><td   width="30%" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;"><span>��������:</span></td><td><textarea rows=4 style="width:80%" name="issue_name"><%=rs("issue_name")%></textarea></td></tr>
			 <tr><td  width="30%" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;"><span>����Σ��:</span></td><td><textarea rows=4  style="width:80%" name="issue_result"><%=rs("issue_result")%></textarea></td></tr>
			 <tr><td  width="30%" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;"><span>����ԭ��:</span></td><td><textarea rows=4 style="width:80%" name="issue_reason"><%=rs("issue_reason")%></textarea></td></tr>
			 <tr><td  width="30%" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;"><span>�������:</span></td><td><textarea rows=4 style="width:80%" name="issue_solution"><%=rs("issue_solution")%></textarea></td></tr>
			 <tr><td   colspan="2" align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;"><input icon='icon-edit' type="submit" name="submit" value="�� ��">&nbsp;&nbsp;&nbsp;&nbsp;<input name="cancel" type="reset" value="ȡ ��" icon='icon-reset'></td></tr>
		</table>
	  <input type="hidden" value="<%=Request.QueryString("id")%>" name="id">
	  <input type="hidden" value="<%=Request.QueryString("action")%>" name="action">
		<%
		 else 
		  rs.Delete()
		  rs.Update()
		  response.Write("<script language=javascript>alert('����ɾ���ɹ�!');window.location.href='Manaissue.asp';</script>")
		 end if
		 %>
		<%
		else 	
		  response.Write("<script language=javascript>alert('û����Ӧ����!');window.location.href='Manaissue.asp';</script>")
		end if
 end if 		
		%>		
</form>
	
</BODY>

</HTML>
