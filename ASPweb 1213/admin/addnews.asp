<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
' �������������ʹ�õĴ���ҳ��ǣ��벻Ҫɾ����������ο������ļ���
'
' �������ƣ�addnews.asp
' ԭ�����ߣ�Lyn
' �����ʼ���lyn.ma@hotmail.com
' �������ڣ���������2010��06��26�� 19:19:54
' ��Ȩ����(C)Feng
'--------------------------------------------------------------%>

<!--#include file="../db/conn2.asp"-->

<HTML>
<HEAD>
	<Title>��������</Title>
	<META http-equiv="Content-Type" content="text/html; charset=gb2312">
	<META name="Generator" content="Asp Studio 1.0">
</HEAD>
<BODY>
<%
dim submit,title,content

submit=Request.Form("submit")

if submit<> "" then
    title=Request.Form("title")
		content=Request.Form("content")		
		
	 if title ="" or content=""  then
			response.Write("<script language=javascript>alert('���ݲ�����!������!');history.go(-1)</script>")
	 else	  
	  set rs=server.createobject("adodb.recordset") 
		sql="select * from news" 
		rs.open sql,conn,1,3 
		rs.addnew 

		rs("title")=title
		rs("content")=content
		rs("datetime")=now()
		rs("author")=session("username")	'"test" ' 

    rs.update 
	  rs.close 
	  set rs=nothing 
	  conn.close 
	  set conn=nothing 
	  response.write("<script language='javascript'>alert('���ŷ����ɹ�!');parent.location.reload();window.close();</script>")
	end if
end if

%>
<form action="#" method="post" >
 <table  width="100%" border="1" cellspacing="1" cellpadding="5" style="border:#DFDFDF 1px solid; padding:25px 12px 15px 12px; background:#FDFDFD; ">
				<tr ><td  width="100%" colspan="2"align="center" style= "border:#E1E1E1 1px solid;"><b>�� �� �� ��</b></td></tr>
				<tr><td width="30%" align="center" style= "border:#E1E1E1 1px solid;">����������:</td><td  align="left" style= "border:#E1E1E1 1px solid;"><input type="text" size="40" name="title"></td></tr>
				<tr><td width="30%" align="center" style= "border:#E1E1E1 1px solid;">����������:</td><td  align="left" style= "border:#E1E1E1 1px solid;"><textarea rows=4  style="width:100%"  name="content"></textarea></td></tr>
				<tr width="100%">
				    <td   colspan="2" align="center" style= "border:#E1E1E1 1px solid;">
					    <input type="submit" name="submit" value="��������"  icon='icon-add'>&nbsp;&nbsp;&nbsp;&nbsp;
						  <input type="reset" name="cancel" value="ȡ������" icon='icon-reset'> 
						</td>
				</tr>					 
 </table>	
</form>	
</BODY>
</HTML>
