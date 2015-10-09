<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
' 上面这行是软件使用的代码页标记，请不要删除。详情请参考帮助文件。
'
' 档案名称：reply.asp
' 原创作者：Lyn
' 作者邮件：lyn.ma@hotmail.com
' 创建日期：星期六，2010年06月26日 17:36:33
' 版权所有(C)Feng
'--------------------------------------------------------------%>

<!--#include file="../db/conn2.asp"-->

<HTML>
<HEAD>
	<Title>modicase.asp</Title>
	<META http-equiv="Content-Type" content="text/html; charset=gb2312">
	<META name="Generator" content="Asp Studio 1.0">
</HEAD>
<BODY>
<form action="#" method="post">
<%
 dim submit,action,id,reply
 
 submit=Request.Form("submit") 
 if submit<> "" then  
   
	  id=Request.Form("id")
	  action=Request.Form("action")
	  reply=Request.Form("reply")		
	   
	  set rs=server.createobject("adodb.recordset") 
		sql="select * from leavemsg where id="&id 
		rs.open sql,conn,1,3 	

		rs("reply")=reply
		rs("name_r")=session("username")'"test" '
		rs("datetime_r")=now
		rs("isreply")=true
		
    rs.update 
	  rs.close 
	  set rs=nothing 
	  conn.close 
	  set conn=nothing 
	  if  action="reply" then
	   response.write("<script language='javascript'>alert('留言回复成功!');window.location.href='manamsg.asp';</script>")
	  else
	   response.write("<script language='javascript'>alert('留言修改成功!');window.location.href='manamsg.asp';</script>")
	  end if
	  
else	  
	
		id=Request.QueryString("id")
		action=Request.QueryString("action")
		
		if id<>"" or action <>"" then			
		  set rs=Server.CreateObject("adodb.recordset")
			sql="select * from leavemsg where id="&id
			rs.Open sql,conn,1,3				
      if action="reply" or action="modify" then	
		%>
		
		 <table width="100%">
		   <tr><td  width="100%" colspan="2" align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;""><span>留言回复</span> </td></tr>
			 <tr> <td  style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;"><span>时   间:</span></td><td><span><%=rs("datetime_q")%></span></td></tr>
			 <tr><td  style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;"><span>主  题:</span></td><td><span><%=rs("title")%></span></td></tr>
			 <tr><td  style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;"><span>内  容:</span></td><td><span><%=rs("content")%></span></td></tr>
			 <tr><td  style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;"><span>留言人:</span></td><td><span><%=rs("name_q")%></span></td></tr>
			  <%
			 if action="modify" then
			 %>
			  <tr><td  style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;"><span>回 复:</span></td><td><span>原回复内容:<br><textarea rows=4 style="width:80%"  readonly disabled="true"><%=rs("reply")%></textarea></span><br><textarea rows=4 style="width:80%" name="reply"></textarea></td></tr>
			  <%else%>	
			   <tr><td  style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;"><span>回 复:</span></td><td><textarea rows=4  style="width:80%" name="reply"></textarea> </td></tr>
			  <%end if%>
			 <tr><td   colspan="2" align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;"><input icon='icon-edit' type="submit" name="submit" value="修 改">&nbsp;&nbsp;&nbsp;&nbsp;<input name="cancel" type="reset" value="取 消" icon='icon-reset'></td></tr>
		</table>
	  <input type="hidden" value="<%=Request.QueryString("id")%>" name="id">
	  <input type="hidden" value="<%=Request.QueryString("action")%>" name="action">
		<%
		 else 
		  rs.Delete()
		  rs.Update()
		  response.Write("<script language=javascript>alert('留言删除成功!');window.location.href='Manamsg.asp';</script>")
		 end if
		 %>
		<%
		else 	
		  response.Write("<script language=javascript>alert('没有相应参数!');window.location.href='Manamsg.asp';</script>")
		end if
 end if 		
		%>		
</form>
	
</BODY>

</HTML>

