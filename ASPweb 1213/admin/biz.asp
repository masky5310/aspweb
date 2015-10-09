<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
'
' 档案名称：biz.asp
' 原创作者：lyn_ma
' 作者邮件：lyn.ma@hotmail.com
' 创建日期：星期四，2010年07月08日 15:49:31
' 版权所有(C)sagemwirless
'--------------------------------------------------------------%>

<!--#include file="../db/conn2.asp"-->

<HTML>
<HEAD>
	<Title>业务内容修改</Title>
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
	  response.write("<script language='javascript'>alert('新闻修改成功!');parent.location.reload();window.close();</script>")
	  
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
				<tr ><td  width="100%" colspan="2"align="center" style= "border:#E1E1E1 1px solid;"><b>修改业务内容</b></td></tr>
				<tr><td width="30%" align="center" style= "border:#E1E1E1 1px solid;">※业务主题:</td><td  align="left" style= "border:#E1E1E1 1px solid;"><input type="text" size="50" name="biz_title" value=<%=rs("biz_title")%>></td></tr>
				<tr><td width="30%" align="center" style= "border:#E1E1E1 1px solid;">※业务内容:</td><td  align="left" style= "border:#E1E1E1 1px solid;"><textarea rows=4  style="width:100%"  name="biz_content"><%=rs("biz_content")%></textarea></td></tr>
				<tr width="100%">
				    <td   colspan="2" align="center" style= "border:#E1E1E1 1px solid;">
					    <input type="submit" name="submit" value="修 改"  icon='icon-add'>&nbsp;&nbsp;&nbsp;&nbsp;
						  <input type="reset" name="cancel" value="取 消" icon='icon-reset'> 
						</td>
				</tr>					 
 </table>	
	  <input type="hidden" value="<%=Request.QueryString("id")%>" name="id">
	  <input type="hidden" value="<%=Request.QueryString("action")%>" name="action">
		<%
		 else 
		  rs.Delete()
		  rs.Update()
		  response.Write("<script language=javascript>alert('业务删除成功!');parent.location.reload();window.close();</script>")
		 end if
		 %>
		<%
		else 	
		  response.Write("<script language=javascript>alert('没有相应参数!');parent.location.reload();window.close();</script>")
		end if
 end if 		
		%>		
</form>	
</BODY>
</HTML>