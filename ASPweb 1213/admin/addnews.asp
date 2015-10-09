<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
' 上面这行是软件使用的代码页标记，请不要删除。详情请参考帮助文件。
'
' 档案名称：addnews.asp
' 原创作者：Lyn
' 作者邮件：lyn.ma@hotmail.com
' 创建日期：星期六，2010年06月26日 19:19:54
' 版权所有(C)Feng
'--------------------------------------------------------------%>

<!--#include file="../db/conn2.asp"-->

<HTML>
<HEAD>
	<Title>发布新闻</Title>
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
			response.Write("<script language=javascript>alert('内容不完整!请完善!');history.go(-1)</script>")
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
	  response.write("<script language='javascript'>alert('新闻发布成功!');parent.location.reload();window.close();</script>")
	end if
end if

%>
<form action="#" method="post" >
 <table  width="100%" border="1" cellspacing="1" cellpadding="5" style="border:#DFDFDF 1px solid; padding:25px 12px 15px 12px; background:#FDFDFD; ">
				<tr ><td  width="100%" colspan="2"align="center" style= "border:#E1E1E1 1px solid;"><b>发 布 新 闻</b></td></tr>
				<tr><td width="30%" align="center" style= "border:#E1E1E1 1px solid;">※新闻主题:</td><td  align="left" style= "border:#E1E1E1 1px solid;"><input type="text" size="40" name="title"></td></tr>
				<tr><td width="30%" align="center" style= "border:#E1E1E1 1px solid;">※新闻内容:</td><td  align="left" style= "border:#E1E1E1 1px solid;"><textarea rows=4  style="width:100%"  name="content"></textarea></td></tr>
				<tr width="100%">
				    <td   colspan="2" align="center" style= "border:#E1E1E1 1px solid;">
					    <input type="submit" name="submit" value="发布新闻"  icon='icon-add'>&nbsp;&nbsp;&nbsp;&nbsp;
						  <input type="reset" name="cancel" value="取消新闻" icon='icon-reset'> 
						</td>
				</tr>					 
 </table>	
</form>	
</BODY>
</HTML>
