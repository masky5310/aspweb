<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
'
' �������ƣ�test.asp
' ԭ�����ߣ�lyn_ma
' �����ʼ���lyn.ma@hotmail.com
' �������ڣ������壬2010��06��25�� 17:03:19
' ��Ȩ����(C)sagemwirless
'--------------------------------------------------------------%>

<!--#include file="../db/conn2.asp"-->

<HTML>
<HEAD>
	<Title>AddCase.asp</Title>
	<META http-equiv="Content-Type" content="text/html; charset=gb2312">
	<META name="Generator" content="Asp Studio 1.0">
	<link rel="stylesheet" type="text/css" href="../theme/style/button.css">
  <link rel="stylesheet" type="text/css" href="../theme/style/icon.css"> 
  <script language="javascript" src="../js/jquery-1.3.2.min.js"></script>
	<script language="javascript" src="../js/pico-button.js"></script>
</HEAD>
<BODY>
<%
'dim submita,custom_name,biz_type,project_name,custom_logo_path

submita=Request.Form("submit")

response.Write(submita)

if submita<> "" then
response.Write(submita)
    custom_name=Request.Form("custom_name")
		biz_type=Request.Form("biz_type")
		project_name=Request.Form("project_name")
		custom_logo_path=Request.Form("custom_logo_path")
		
	 if custom_name ="" or biz_type="" or project_name =""or custom_logo_path ="" then
			response.Write("<script language=javascript>alert('���ݲ�����!������!')</script>")
	 else	  
	  set rs=server.createobject("adodb.recordset") 
		sql="select custom_name,biz_type,project_name,custom_logo_path from cases" 
		rs.open sql,conn,1,3 
		rs.addnew 

		rs("custom_name")=custom_name
		rs("biz_type")=biz_type
		rs("project_name")=project_name
		rs("custom_logo_path")=custom_logo_path	 

    rs.update 
	  rs.close 
	  set rs=nothing 
	  conn.close 
	  set conn=nothing 
	  response.write("<script language='javascript'>alert('���Գɹ���');window.history.go(-1)';</script>")
	end if
end if

%>
<form action="#" method="post" >
 <table  width="100%" border="1" cellspacing="1" cellpadding="5" style="border:#DFDFDF 1px solid; padding:25px 12px 15px 12px; background:#FDFDFD; ">
				<tr ><td  width="100%" colspan="2"align="center" style= "border:#E1E1E1 1px solid;"><b>�� �� �� ��</b></td></tr>
				<tr><td width="30%" align="center" style= "border:#E1E1E1 1px solid;">���ͻ�����:</td><td  align="left" style= "border:#E1E1E1 1px solid;"><input type="text" size="40" name="custom_name"></td></tr>
				<tr><td width="30%" align="center" style= "border:#E1E1E1 1px solid;">��������ҵ:</td><td  align="left" style= "border:#E1E1E1 1px solid;"><input type="text" size="40" name="biz_type"></td></tr>
				<tr><td width="30%" align="center" style= "border:#E1E1E1 1px solid;">����Ŀ����:</td><td  align="left" style= "border:#E1E1E1 1px solid;"><input type="text" size="40" name="project_name"></td> </td></tr>
				<tr><td width="30%" align="center" style= "border:#E1E1E1 1px solid;">���ͻ�Logo:</td><td  align="left" style= "border:#E1E1E1 1px solid;"><input type="text" size="50" name="custom_logo_path"></td></tr>
				<tr width="100%">
				    <td   colspan="2" align="center" style= "border:#E1E1E1 1px solid;">
					    <input type="submit" name="submit" value="���Ӱ���"  icon='icon-add'>&nbsp;&nbsp;&nbsp;&nbsp;
						  <input type="reset" name="cancel" value="ȡ������" icon='icon-reset'> 
						</td>
				</tr>					 
 </table>	
</form>	
</BODY>
</HTML>
