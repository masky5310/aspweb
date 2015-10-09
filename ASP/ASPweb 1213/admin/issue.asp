<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
' 上面这行是软件使用的代码页标记，请不要删除。详情请参考帮助文件。
'
' 档案名称：issue.asp
' 原创作者：Lyn
' 作者邮件：lyn.ma@hotmail.com
' 创建日期：星期六，2010年06月26日 18:38:40
' 版权所有(C)Feng
'--------------------------------------------------------------%>

<!--#include file="../db/conn2.asp"-->

<HTML>
<HEAD>
	<Title>常见问题修改</Title>
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
	  response.write("<script language='javascript'>alert('问题修改成功!');window.location.href='manaissue.asp';</script>")
	  
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
		   <tr><td  width="100%" colspan="2" align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;""><span>企业常见问题修改</span> </td></tr>
			 <tr><td   width="30%" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;"><span>常见问题:</span></td><td><textarea rows=4 style="width:80%" name="issue_name"><%=rs("issue_name")%></textarea></td></tr>
			 <tr><td  width="30%" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;"><span>产生危害:</span></td><td><textarea rows=4  style="width:80%" name="issue_result"><%=rs("issue_result")%></textarea></td></tr>
			 <tr><td  width="30%" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;"><span>问题原因:</span></td><td><textarea rows=4 style="width:80%" name="issue_reason"><%=rs("issue_reason")%></textarea></td></tr>
			 <tr><td  width="30%" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;"><span>解决方案:</span></td><td><textarea rows=4 style="width:80%" name="issue_solution"><%=rs("issue_solution")%></textarea></td></tr>
			 <tr><td   colspan="2" align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;"><input icon='icon-edit' type="submit" name="submit" value="修 改">&nbsp;&nbsp;&nbsp;&nbsp;<input name="cancel" type="reset" value="取 消" icon='icon-reset'></td></tr>
		</table>
	  <input type="hidden" value="<%=Request.QueryString("id")%>" name="id">
	  <input type="hidden" value="<%=Request.QueryString("action")%>" name="action">
		<%
		 else 
		  rs.Delete()
		  rs.Update()
		  response.Write("<script language=javascript>alert('问题删除成功!');window.location.href='Manaissue.asp';</script>")
		 end if
		 %>
		<%
		else 	
		  response.Write("<script language=javascript>alert('没有相应参数!');window.location.href='Manaissue.asp';</script>")
		end if
 end if 		
		%>		
</form>
	
</BODY>

</HTML>
