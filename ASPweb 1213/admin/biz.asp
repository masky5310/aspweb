<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
'
' �������ƣ�biz.asp
' ԭ�����ߣ�lyn_ma
' �����ʼ���lyn.ma@hotmail.com
' �������ڣ������ģ�2010��07��08�� 15:49:31
' ��Ȩ����(C)sagemwirless
'--------------------------------------------------------------%>

<!--#include file="../db/conn2.asp"-->

<HTML>
<HEAD>
	<Title>ҵ�������޸�</Title>
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
	  
	  title=Request.Form("biz_title")
		content=Request.Form("biz_content")			
	   
	  set rs=server.createobject("adodb.recordset") 
		sql="select * from biz where id="&id 
		rs.open sql,conn,1,3 	

		rs("biz_title")=title
		rs("biz_content")=content	
		
    rs.update 
	  rs.close 
	  set rs=nothing 
	  conn.close 
	  set conn=nothing 
	  response.write("<script language='javascript'>alert('�����޸ĳɹ�!');parent.location.reload();window.close();</script>")
	  
else
	  
	  dim id,action
		id=Request.QueryString("id")
		action=Request.QueryString("action")
		
		if id<>"" or action <>"" then			
		  set rs=Server.CreateObject("adodb.recordset")
			sql="select * from biz where id="&id
			rs.Open sql,conn,1,3				
      if action="modify" then			
		
		%>
		
		<table  width="100%" border="1" cellspacing="1" cellpadding="5" style="border:#DFDFDF 1px solid; padding:25px 12px 15px 12px; background:#FDFDFD; ">
				<tr ><td  width="100%" colspan="2"align="center" style= "border:#E1E1E1 1px solid;"><b>�޸�ҵ������</b></td></tr>
				<tr><td width="30%" align="center" style= "border:#E1E1E1 1px solid;">��ҵ������:</td><td  align="left" style= "border:#E1E1E1 1px solid;"><input type="text" size="50" name="biz_title" value=<%=rs("biz_title")%>></td></tr>
				<tr><td width="30%" align="center" style= "border:#E1E1E1 1px solid;">��ҵ������:</td><td  align="left" style= "border:#E1E1E1 1px solid;"><textarea rows=4  style="width:100%"  name="biz_content"><%=rs("biz_content")%></textarea></td></tr>
				<tr width="100%">
				    <td   colspan="2" align="center" style= "border:#E1E1E1 1px solid;">
					    <input type="submit" name="submit" value="�� ��"  icon='icon-add'>&nbsp;&nbsp;&nbsp;&nbsp;
						  <input type="reset" name="cancel" value="ȡ ��" icon='icon-reset'> 
						</td>
				</tr>					 
 </table>	
	  <input type="hidden" value="<%=Request.QueryString("id")%>" name="id">
	  <input type="hidden" value="<%=Request.QueryString("action")%>" name="action">
		<%
		 else 
		  rs.Delete()
		  rs.Update()
		  response.Write("<script language=javascript>alert('ҵ��ɾ���ɹ�!');parent.location.reload();window.close();</script>")
		 end if
		 %>
		<%
		else 	
		  response.Write("<script language=javascript>alert('û����Ӧ����!');parent.location.reload();window.close();</script>")
		end if
 end if 		
		%>		
</form>	
</BODY>
</HTML>