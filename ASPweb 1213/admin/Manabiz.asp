<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
' �������������ʹ�õĴ���ҳ��ǣ��벻Ҫɾ����������ο������ļ���
'
' �������ƣ�Manabiz.asp.asp
' ԭ�����ߣ�Lyn
' �����ʼ���lyn.ma@hotmail.com
' �������ڣ������գ�2010��06��27�� 19:52:24
' ��Ȩ����(C)Feng
'--------------------------------------------------------------%>

<!--#include file="../db/conn2.asp"-->

<HTML>
<HEAD>
	<Title>ҵ��Χ����</Title>
	<META http-equiv="Content-Type" content="text/html; charset=gb2312">
	<META name="Generator" content="Asp Studio 1.0">
	<link rel="stylesheet" type="text/css" href="../theme/style/button.css">
  <link rel="stylesheet" type="text/css" href="../theme/style/icon.css"> 
  <script language="javascript" src="../js/jquery-1.3.2.min.js"></script>
	<script language="javascript" src="../js/pico-button.js"></script>
	<link rel="stylesheet" href="path-to-file/thickbox.css" type="text/css" media="screen" />
  <script type="text/javascript" src="path-to-file/jquery-latest.pack.js"></script>
  <script type="text/javascript" src="path-to-file/thickbox.js"></script>
  <link rel="stylesheet" type="text/css" href="css.css"> 
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
   //alert(selectValue);
   window.location.href='manabiz.asp?id='+selectValue;
  }  
}

function check()
{
	var selectValue=GetSelectValue("biztype");
  if(selectValue==0)
  {
   alert("��ѡ��ҵ�����ͣ�");
	  return;
  } 
  else
  {
   //alert(selectValue);
   window.location.href='addbiz.asp?bizid='+selectValue;
  }  
}
 </script>
</HEAD>
<BODY >
<form action="#" method="post">		
		<table width="100%">
		  <tr>
					<td align="left"><span style="font-size:14px">ҵ��Χ����</span></td>
		  </tr>
		  <tr>
					<td  >
						<table width="100%" border="0" cellspacing="1" cellpadding="5" style="margin-top:1px;">								
                <%		            
				        set rs=Server.CreateObject("adodb.recordset")
				        sql="select * from biz_type"
				        rs.Open sql,conn,1,1				       
				        if	rs.RecordCount=0 then				
				        %>
				        <tr >
                    <td  colspan="3" height="600" align="center">
										<select name="biztype" id="biztype">
											<option value="0">��ǰû������!</option>
										</select>
									</td>            
							  </tr> 
			 			  <%
			 			   else 
							%>		
							<tr >
								<td width="10%" style="padding:5px; border:#E1E1E1 1px solid;" >	
										ҵ������:
								</td>
								<td  align="center" style="padding:5px; border:#E1E1E1 1px solid;" >
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
							 </select>
								</td>				    
								<td   style="padding:5px; border:#E1E1E1 1px solid;">
								<span>								
									<a href="biztype.asp?action=add&keepThis=true&amp;TB_iframe=true&amp;height=200&amp;width=520" title="����һ���µ�ҵ������" class="thickbox"><input con='icon-add' type="button" name="newbiz" value="����ҵ������" ></a>
									<a href="biztype.asp?action=mod&keepThis=true&amp;TB_iframe=true&amp;height=200&amp;width=520" title="�޸�һ���µ�ҵ������" class="thickbox"><input con='icon-add' type="button" name="newbiz" value="�޸�ҵ������" ></a>
									<a href="biztype.asp?action=del&keepThis=true&amp;TB_iframe=true&amp;height=200&amp;width=520" title="ɾ��һ���µ�ҵ������" class="thickbox"><input con='icon-del' type="button" name="newbiz" value="ɾ��ҵ������" ></a>
							    <a href="addbiz.asp?action=add&keepThis=true&amp;TB_iframe=true&amp;height=300&amp;width=520" title="����һ���µ�ҵ������" class="thickbox" ><input con='icon-add' type="button" id="addbiz" value="����ҵ������" ></a>
							  </span>
								</td>
					  </tr>
					  <tr>
								<td colspan="3" style="padding:5px; border:#E1E1E1 1px solid;" ><span>ҵ�����ݷ�Χ:</span></td>
					  </tr>
					  <tr>
								<td colspan="3" style="padding:5px; border:#E1E1E1 1px solid;" >
								<table>
								  <tr bgcolor="#CCCCCC">
										<td align="center" style="padding:5px; border:#E1E1E1 1px solid;" ><span>�� ��:</span></td>
									 <td align="center" style="padding:1px; border:#E1E1E1 1px solid;" ><span>�� ��:</span></td>
									 <td align="center" style="padding:1px; border:#E1E1E1 1px solid;" ><span>�� ��:</span></td>	
									 <td align="center" style="padding:1px; border:#E1E1E1 1px solid;" ><span>�� ��</span></td>	
									</tr>									 
									<%
									 biztype=Request.QueryString("id")
									 if biztype<> "" then		
									 
										set rs=Server.CreateObject("adodb.recordset")
										sql="select * from biz where biz_type_id="&biztype
										rs.Open sql,conn,1,1
										
										i=0
				            do while not rs.EOF	
								    i=i+1
									 %>
									 <tr>
										<td  align="center" style="padding:1px; border:#E1E1E1 1px solid;" ><span><%=i %></span></td>
									 <td style="padding:1px; border:#E1E1E1 1px solid;" ><span><%=rs("biz_title") %></span></td>
									 <td style="padding:1px; border:#E1E1E1 1px solid;" ><span><%=rs("biz_content") %></span></td>
									 <td style="padding:1px; border:#E1E1E1 1px solid;" >
											<a href="biz.asp?action=del&id=<%=rs("id")%>&keepThis=true&amp;TB_iframe=true&amp;height=200&amp;width=520" title="ɾ��ҵ������" class="thickbox"><input con='icon-del' type="button" name="newbiz" value="ɾ��" ></a>
											<a href="biz.asp?action=modify&id=<%=rs("id")%>&keepThis=true&amp;TB_iframe=true&amp;height=200&amp;width=520" title="�༭ҵ������" class="thickbox"><input con='icon-add' type="button" name="newbiz" value="�޸�" ></a>
									 </td>
									</tr>		
									 <%
										rs.MoveNext
										loop	
										end if
									%>
								</table>
								</td>
					  </tr>
             </table>
					</td>
		  </tr>	
		  <tr>
				<td style="padding:5px; border:#E1E1E1 1px solid;" >
						<%	
						   conn.Close
			  			 set rs=nothing
			  			 set conn=nothing				 
							 %>
				</td>
			</tr>
		</table>	
     </form>	
</BODY>
</HTML>
