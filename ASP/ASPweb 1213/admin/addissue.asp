<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
' �������������ʹ�õĴ���ҳ��ǣ��벻Ҫɾ����������ο������ļ���
'
' �������ƣ�addissue.asp
' ԭ�����ߣ�Lyn
' �����ʼ���lyn.ma@hotmail.com
' �������ڣ���������2010��06��26�� 18:34:48
' ��Ȩ����(C)Feng
'--------------------------------------------------------------%>

<!--#include file="../db/conn2.asp"-->

<HTML>
<HEAD>
	<Title>AddCase.asp</Title>
	<META http-equiv="Content-Type" content="text/html; charset=gb2312">
	<META name="Generator" content="Asp Studio 1.0">
</HEAD>
<BODY>
<%
dim submit,issue_name,issue_result,issue_reason,issue_solution

submit=Request.Form("submit")

if submit<> "" then
    issue_name=Request.Form("issue_name")
		issue_result=Request.Form("issue_result")
		issue_reason=Request.Form("issue_reason")
		issue_solution=Request.Form("issue_solution")
		
	 if issue_name ="" or issue_result="" or issue_reason =""or issue_solution ="" then
			response.Write("<script language=javascript>alert('���ݲ�����!������!');history.go(-1)</script>")
	 else	  
	  set rs=server.createobject("adodb.recordset") 
		sql="select * from issues" 
		rs.open sql,conn,1,3 
		rs.addnew 

		rs("issue_name")=issue_name
		rs("issue_result")=issue_result
		rs("issue_reason")=issue_reason
		rs("issue_solution")=issue_solution	 

    rs.update 
	  rs.close 
	  set rs=nothing 
	  conn.close 
	  set conn=nothing 
	  response.write("<script language='javascript'>alert('�������ӳɹ�!');parent.location.reload();window.close();</script>")
	end if
end if

%>
<form action="#" method="post" >
 <table  width="100%" border="1" cellspacing="1" cellpadding="5" style="border:#DFDFDF 1px solid; padding:25px 12px 15px 12px; background:#FDFDFD; ">
			<tr ><td  width="100%" colspan="2"align="center" style= "border:#E1E1E1 1px solid;"><b>������ҵ��������</b></td></tr>
			<tr><td   width="30%" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;"><span>��������:</span></td><td><textarea rows=4  style="width:90%" name="issue_name"></textarea></td></tr>
			 <tr><td  width="30%" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;"><span>����Σ��:</span></td><td><textarea rows=4  style="width:90%" name="issue_result"></textarea></td></tr>
			 <tr><td  width="30%" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;"><span>����ԭ��:</span></td><td><textarea rows=4  style="width:90%" name="issue_reason"></textarea></td></tr>
			 <tr><td  width="30%" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;"><span>�������:</span></td><td><textarea rows=4  style="width:90%" name="issue_solution"></textarea></td></tr>
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