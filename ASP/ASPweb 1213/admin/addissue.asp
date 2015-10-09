<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
' 上面这行是软件使用的代码页标记，请不要删除。详情请参考帮助文件。
'
' 档案名称：addissue.asp
' 原创作者：Lyn
' 作者邮件：lyn.ma@hotmail.com
' 创建日期：星期六，2010年06月26日 18:34:48
' 版权所有(C)Feng
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
			response.Write("<script language=javascript>alert('内容不完整!请完善!');history.go(-1)</script>")
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
	  response.write("<script language='javascript'>alert('问题增加成功!');parent.location.reload();window.close();</script>")
	end if
end if

%>
<form action="#" method="post" >
 <table  width="100%" border="1" cellspacing="1" cellpadding="5" style="border:#DFDFDF 1px solid; padding:25px 12px 15px 12px; background:#FDFDFD; ">
			<tr ><td  width="100%" colspan="2"align="center" style= "border:#E1E1E1 1px solid;"><b>新增企业常见问题</b></td></tr>
			<tr><td   width="30%" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;"><span>常见问题:</span></td><td><textarea rows=4  style="width:90%" name="issue_name"></textarea></td></tr>
			 <tr><td  width="30%" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;"><span>产生危害:</span></td><td><textarea rows=4  style="width:90%" name="issue_result"></textarea></td></tr>
			 <tr><td  width="30%" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;"><span>问题原因:</span></td><td><textarea rows=4  style="width:90%" name="issue_reason"></textarea></td></tr>
			 <tr><td  width="30%" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;"><span>解决方案:</span></td><td><textarea rows=4  style="width:90%" name="issue_solution"></textarea></td></tr>
			 <tr width="100%">
				    <td   colspan="2" align="center" style= "border:#E1E1E1 1px solid;">
					    <input type="submit" name="submit" value="增加问题"  icon='icon-add'>&nbsp;&nbsp;&nbsp;&nbsp;
						  <input type="reset" name="cancel" value="取消问题" icon='icon-reset'> 
						</td>
				</tr>					 
 </table>	
</form>	
</BODY>
</HTML>