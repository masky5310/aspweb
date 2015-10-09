<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
'
' 档案名称：test.asp
' 原创作者：lyn_ma
' 作者邮件：lyn.ma@hotmail.com
' 创建日期：星期五，2010年06月25日 17:03:19
' 版权所有(C)sagemwirless
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
			response.Write("<script language=javascript>alert('内容不完整!请完善!')</script>")
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
	  response.write("<script language='javascript'>alert('留言成功！');window.history.go(-1)';</script>")
	end if
end if

%>
<form action="#" method="post" >
 <table  width="100%" border="1" cellspacing="1" cellpadding="5" style="border:#DFDFDF 1px solid; padding:25px 12px 15px 12px; background:#FDFDFD; ">
				<tr ><td  width="100%" colspan="2"align="center" style= "border:#E1E1E1 1px solid;"><b>新 增 案 例</b></td></tr>
				<tr><td width="30%" align="center" style= "border:#E1E1E1 1px solid;">※客户名称:</td><td  align="left" style= "border:#E1E1E1 1px solid;"><input type="text" size="40" name="custom_name"></td></tr>
				<tr><td width="30%" align="center" style= "border:#E1E1E1 1px solid;">※所属行业:</td><td  align="left" style= "border:#E1E1E1 1px solid;"><input type="text" size="40" name="biz_type"></td></tr>
				<tr><td width="30%" align="center" style= "border:#E1E1E1 1px solid;">※项目名称:</td><td  align="left" style= "border:#E1E1E1 1px solid;"><input type="text" size="40" name="project_name"></td> </td></tr>
				<tr><td width="30%" align="center" style= "border:#E1E1E1 1px solid;">※客户Logo:</td><td  align="left" style= "border:#E1E1E1 1px solid;"><input type="text" size="50" name="custom_logo_path"></td></tr>
				<tr width="100%">
				    <td   colspan="2" align="center" style= "border:#E1E1E1 1px solid;">
					    <input type="submit" name="submit" value="增加案例"  icon='icon-add'>&nbsp;&nbsp;&nbsp;&nbsp;
						  <input type="reset" name="cancel" value="取消案例" icon='icon-reset'> 
						</td>
				</tr>					 
 </table>	
</form>	
</BODY>
</HTML>
