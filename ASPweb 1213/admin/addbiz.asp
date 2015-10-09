<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
'
' 档案名称：addbiz.asp
' 原创作者：lyn_ma
' 作者邮件：lyn.ma@hotmail.com
' 创建日期：星期四，2010年07月08日 16:50:09
' 版权所有(C)sagemwirless
'--------------------------------------------------------------%>
<!--#include file="../db/conn2.asp"-->

<HTML>
<HEAD>
	<Title>业务内容修改</Title>
	<META http-equiv="Content-Type" content="text/html; charset=gb2312">
	<META name="Generator" content="Asp Studio 1.0">
	<script language="javascript">
	function GetSelectValue(id)
{
	var tt = document.getElementById(id);	
	return	tt.options[tt.selectedIndex].value
}

function postback()
{
  var selectValue=GetSelectValue("biztype");
  if(selectValue==0)
  {
    alert("请选择业务类型！");
	  return;
  } 
  else
  {
		 var hidden=document.getElementById("biz_type_id");
    hidden.value=selectValue;
  }  
}
	
	</script>
</HEAD>
<BODY>
<form action="#" method="post">
<%
dim submit,title,content

submit=Request.Form("submit")

if submit<> "" then
		biz_type_id=Request.Form("biz_type_id")
    biz_title=Request.Form("biz_title")
		biz_content=Request.Form("biz_content")		
		
	 if biz_type_id="" or biz_title ="" or biz_content=""  then
			response.Write("<script language=javascript>alert('内容不完整!请完善!');history.go(-1)</script>")
	 else	  
	  set rs=server.createobject("adodb.recordset") 
		sql="select * from biz" 
		rs.open sql,conn,1,3 
		rs.addnew 

		rs("biz_type_id")=biz_type_id
		rs("biz_title")=biz_title	
		rs("biz_content")=biz_content		

    rs.update 
	  rs.close 
	  set rs=nothing 	 
	  response.write("<script language='javascript'>alert('新增成功!');parent.location.reload();window.close();</script>")
	end if
end if

%>		
		<table  width="100%" border="1" cellspacing="1" cellpadding="5" style="border:#DFDFDF 1px solid; padding:25px 12px 15px 12px; background:#FDFDFD; ">
				<tr ><td  width="100%" colspan="2"align="center" style= "border:#E1E1E1 1px solid;"><b>新增业务内容</b></td></tr>
				<tr><td width="30%" align="center" style= "border:#E1E1E1 1px solid;">※业务分类:</td><td  align="left" style= "border:#E1E1E1 1px solid;">
				 <%		            
				        set rs=Server.CreateObject("adodb.recordset")
				        sql="select * from biz_type"
				        rs.Open sql,conn,1,1				       
				        if	rs.RecordCount<>0 then				
				        %>
						  <select name="biztype" id="biztype" onchange="postback()">
									<option value="0">请选择业务类型:</option>
						  	<% 
							 do while not rs.EOF
							  %>							 
									<option value="<%=rs("biz_type_id")%>"><%=rs("biz_type_name")%></option>											
						   <%						  
						   rs.MoveNext
						   loop			 
						   end if
							 conn.close 
							set conn=nothing 
							%>							
							 </select>
				<input type="hidden" size="50" name="biz_type_id" id="biz_type_id"></td></tr>				
				<tr><td width="30%" align="center" style= "border:#E1E1E1 1px solid;">※业务主题:</td><td  align="left" style= "border:#E1E1E1 1px solid;"><input type="text" size="50" name="biz_title" ></td></tr>
				<tr><td width="30%" align="center" style= "border:#E1E1E1 1px solid;">※业务内容:</td><td  align="left" style= "border:#E1E1E1 1px solid;"><textarea rows=4  style="width:100%"  name="biz_content"></textarea></td></tr>
				<tr width="100%">
				    <td   colspan="2" align="center" style= "border:#E1E1E1 1px solid;">
					    <input type="submit" name="submit" value="修 改"  icon='icon-add'>&nbsp;&nbsp;&nbsp;&nbsp;
						  <input type="reset" name="cancel" value="取 消" icon='icon-reset'> 
						</td>
				</tr>					 
 </table>	
</form>	
</BODY>
</HTML>



