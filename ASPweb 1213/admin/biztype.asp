<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
'
' �������ƣ�biz.asp
' ԭ�����ߣ�lyn_ma
' �����ʼ���lyn.ma@hotmail.com
' �������ڣ������ģ�2010��07��08�� 15:49:31
' ��Ȩ����(C)sagemwirless
'--------------------------------------------------------------%>

<!--#include file="../db/conn2.asp"-->

<HTML>
<HEAD>
	<Title>����ҵ������</Title>
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
    alert("��ѡ��ҵ�����ͣ�");
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
 action=Request.Form("action") 
 
 if submit<> "" then  
	
	if action="add" then
	  biz_type_name=Request.Form("biz_type_name")		   
	  set rs=server.createobject("adodb.recordset") 
		sql="select * from biz_type" 
		rs.open sql,conn,1,3 	
    rs.addnew
	 
		rs("biz_type_name")=biz_type_name
		
    rs.update 
	  rs.close 
	  set rs=nothing 	  
	  response.write("<script language='javascript'>alert('�����ɹ�!');parent.location.reload();window.close();</script>")	  
	  end if
	  
	  if action="mod" then
	  
	  biz_type_id=Request.Form("biz_type_id")			
			if biz_type_id=0 then
				response.Write("<script language=javascript>alert('��ѡ��ҵ������!');history.go(-1)</script>")
			else
				biz_type_name=Request.Form("biz_type_name")		   
				set rs=server.createobject("adodb.recordset") 
				sql="select * from biz_type where biz_type_id="&biz_type_id
				rs.open sql,conn,1,3 	
				rs("biz_type_name")=biz_type_name
		
				rs.update 
				rs.close 
				set rs=nothing 	  
				response.write("<script language='javascript'>alert('�޸ĳɹ�!');parent.location.reload();window.close();</script>")	  
				end if
	  end if
	  
	  if action="del" then
			biz_type_id=Request.Form("biz_type_id")
			
			if biz_type_id=0 then
				response.Write("<script language=javascript>alert('��ѡ��ҵ������!');history.go(-1)</script>")
			else
				set rs=Server.CreateObject("adodb.recordset")
				sql="select * from biz_type where biz_type_id="&biz_type_id
				rs.Open sql,conn,1,3	
				rs.Delete()
				rs.Update()
		  
				set rs2=Server.CreateObject("adodb.recordset")
				sql="select * from biz where biz_type_id="&biz_type_id
				rs2.Open sql,conn,1,3
				
				if	rs.RecordCount<>0 then
				
				do while not rs.EOF
				
				rs2.Delete()
				rs2.Update()	
				
				rs.MoveNext				
				loop
       end if				
				response.Write("<script language=javascript>alert('ɾ���ɹ�!');parent.location.reload();window.close();</script>")
			end if
	  end if
	  
else
		action=Request.QueryString("action")
		
		if action <>"" then			
     if action="add" then
		%>
	<table  width="100%" border="1" cellspacing="1" cellpadding="5" style="border:#DFDFDF 1px solid; padding:25px 12px 15px 12px; background:#FDFDFD; ">
				<tr ><td  width="100%" colspan="2"align="center" style= "border:#E1E1E1 1px solid;"><b>����ҵ������</b></td></tr>						
				<tr><td width="30%" align="center" style= "border:#E1E1E1 1px solid;">��ҵ����������:</td><td  align="left" style= "border:#E1E1E1 1px solid;"><input type="text" size="50" name="biz_type_name" ></td></tr>
				<tr width="100%">
				    <td   colspan="2" align="center" style= "border:#E1E1E1 1px solid;">
					    <input type="submit" name="submit" value="�� ��"  icon='icon-add'>&nbsp;&nbsp;&nbsp;&nbsp;
						  <input type="reset" name="cancel" value="ȡ ��" icon='icon-reset'> 
						</td>
				</tr>					 
 </table>		  
		<%
		 end if

    if action="del" then
		 %>
		 <table  width="100%" border="1" cellspacing="1" cellpadding="5" style="border:#DFDFDF 1px solid; padding:25px 12px 15px 12px; background:#FDFDFD; ">
				<tr ><td  width="100%" colspan="2"align="center" style= "border:#E1E1E1 1px solid;"><b>ɾ��ҵ������</b></td></tr>						
				<tr>
				<td width="30%" align="center" style= "border:#E1E1E1 1px solid;">��ѡ��ҵ����������:</td>
				<%
				       set rs=Server.CreateObject("adodb.recordset")
				        sql="select * from biz_type" 
				        rs.Open sql,conn,1,1				       
				        if	rs.RecordCount<>0 then	
				%>
				<td>
				<select name="biztype" id="biztype" onchange="postback()">
								<option value="0">��ѡ��ҵ������:</option>
						  	<% 
							 do while not rs.EOF
							  %>							 
									<option value="<%=rs("biz_type_id")%>"><%=rs("biz_type_name")%></option>											
						   <%						  
						   rs.MoveNext
						   loop			 
						   end if
							%>							
							 </select><input type="hidden" size="50" name="biz_type_id" id="biz_type_id"></td></tr>
				<tr width="100%">
				    <td   colspan="2" align="center" style= "border:#E1E1E1 1px solid;">
					    <input type="submit" name="submit" value="ɾ ��"  icon='icon-add'>&nbsp;&nbsp;&nbsp;&nbsp;
						  <input type="reset" name="cancel" value="ȡ ��" icon='icon-reset'> 
						</td>
				</tr>					 
			</table>			 
		<%
		end if
		if action="mod" then%>
		 <table  width="100%" border="1" cellspacing="1" cellpadding="5" style="border:#DFDFDF 1px solid; padding:25px 12px 15px 12px; background:#FDFDFD; ">
				<tr ><td  width="100%" colspan="2"align="center" style= "border:#E1E1E1 1px solid;"><b>�޸�ҵ������</b></td></tr>						
				<tr>
				<td width="30%" align="center" style= "border:#E1E1E1 1px solid;">��ѡ��ҵ����������:</td>
				<%
				       set rs=Server.CreateObject("adodb.recordset")
				        sql="select * from biz_type" 
				        rs.Open sql,conn,1,1				       
				        if	rs.RecordCount<>0 then	
				%>
				<td>
				<select name="biztype" id="biztype" onchange="postback()">
								<option value="0">��ѡ��ҵ������:</option>
						  	<% 
							 do while not rs.EOF
							  %>							 
									<option value="<%=rs("biz_type_id")%>"><%=rs("biz_type_name")%></option>											
						   <%						  
						   rs.MoveNext
						   loop			 
						   end if
							%>							
							 </select><input type="hidden" size="50" name="biz_type_id" id="biz_type_id"><br><input type="text" size="50" name="biz_type_name" id="biz_type_name"></td></tr>
				<tr width="100%">
				    <td   colspan="2" align="center" style= "border:#E1E1E1 1px solid;">
					    <input type="submit" name="submit" value="�� ��"  icon='icon-add'>&nbsp;&nbsp;&nbsp;&nbsp;
						  <input type="reset" name="cancel" value="ȡ ��" icon='icon-reset'> 
						</td>
				</tr>					 
			</table>
		<%
		end if
		else 	
		  response.Write("<script language=javascript>alert('û����Ӧ����!');parent.location.reload();window.close();</script>")
   end if
	end if
 
    conn.close 
	  set conn=nothing  
		%>		
		<input type="hidden" value="<%=Request.QueryString("action")%>" name="action">
</form>	
</BODY>
</HTML>
