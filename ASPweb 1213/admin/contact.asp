<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
'
' �������ƣ�contact.asp
' ԭ�����ߣ�lyn_ma
' �����ʼ���lyn.ma@hotmail.com
' �������ڣ���������2010��07��10�� 14:40:17
' ��Ȩ����(C)sagemwirless
'--------------------------------------------------------------%>

<!--#include file="../db/conn2.asp"-->

<HTML>
<HEAD>
	<Title>��˾��ϵ�˹���</Title>
	<META http-equiv="Content-Type" content="text/html; charset=gb2312">
	<META name="Generator" content="Asp Studio 1.0">	
  <link rel="stylesheet" type="text/css" href="css.css"> 
</HEAD>
<%
submit=Request.Form("submit")

if submit<> "" then
    contacter=Request.Form("contacter")
		address=Request.Form("address")
		tel=Request.Form("tel")		
		cell=Request.Form("cell")		
		fax=Request.Form("fax")		
		qq=Request.Form("qq")		
		email=Request.Form("email")		
		permitcode=Request.Form("permitcode")		
		postcode=Request.Form("postcode")
		skype=Request.Form("skype")	
		taobao=Request.Form("taobao")	
		
	 if contacter ="" or address="" or tel ="" or cell="" or qq ="" or email=""or fax ="" or permitcode="" or  postcode="" then
			response.Write("<script language=javascript>alert('���ݲ�����!������!');history.go(-1)</script>")
	 else	  
	  set rs=server.createobject("adodb.recordset") 
		sql="select * from resume where id=1" 
		rs.open sql,conn,1,3 	

		rs("contacter")=contacter
		rs("address")=address
		rs("tel")=tel
		rs("fax")=fax
 	  rs("cell")=cell
		rs("qq")=qq
		rs("email")=email
		rs("permitcode")=permitcode
		rs("postcode")=postcode
		rs("skype")=skype
		rs("taobao")=taobao
		
    rs.update 
	  rs.close 
	  set rs=nothing 	  
	  response.write("<script language='javascript'>alert('�޸ĳɹ�!');</script>")
	end if
end if
%>
<BODY>
<form action="contact.asp" method="post">		
		<table width="100%">
		  <tr>
					<td align="left"><span style="font-size:16px">��˾��ϵ�˹���</span></td>
		  </tr>
		  <tr>
					<td  >
						<table width="100%" border="0" cellspacing="1" cellpadding="5" style="margin-top:1px;">								
                <%		            
				        set rs=server.CreateObject("adodb.recordset")
								sql="select top 1 * from resume"
								rs.open sql,conn,1,1
								if rs.RecordCount=1 then					
				        %>	 
			 			   <tr >
								<td>
							    <table>
										<tr>							 
											<td   width="10%" align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;" ><span>��˾��ϵ��:</span></td>
											<td   align="left" style="padding:5px; border:#E1E1E1 1px solid;" ><input  name="contacter" type="text" value="<%=rs("contacter")%>" size="30"></td>											
										</tr>	
										<tr>							 
											<td   width="10%" align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;" ><span>��˾��ַ:</span></td>
											<td   align="left" style="padding:5px; border:#E1E1E1 1px solid;" ><input name="address" type="text" value="<%=rs("address")%>" size="30"></td>											
										</tr>	
										<tr>							 
											<td   width="10%" align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;" ><span>��˾�绰:</span></td>
											<td   align="left" style="padding:5px; border:#E1E1E1 1px solid;" ><input name="tel" type="text" value="<%=rs("tel")%>" size="30"></td>											
										</tr>
										<tr>							 
											<td   width="10%" align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;" ><span>��˾����:</span></td>
											<td   align="left" style="padding:5px; border:#E1E1E1 1px solid;" ><input name="fax" type="text" value="<%=rs("fax")%>" size="30"></td>											
										</tr>
										<tr>							 
											<td   width="10%" align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;" ><span>�� ��:</span></td>
											<td   align="left" style="padding:5px; border:#E1E1E1 1px solid;" ><input name="cell" type="text" value="<%=rs("cell")%>" size="30"></td>											
										</tr>
										<tr>							 
											<td   width="10%" align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;" ><span>QQ ����:</span></td>
											<td   align="left" style="padding:5px; border:#E1E1E1 1px solid;" ><input name="qq" type="text" value="<%=rs("qq")%>" size="30"></td>											
										</tr>
										<tr>							 
											<td   width="10%" align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;" ><span>�Ա��˺�:</span></td>
											<td   align="left" style="padding:5px; border:#E1E1E1 1px solid;" ><input name="taobao" type="text" value="<%=rs("taobao")%>" size="30"></td>											
										</tr>
										<tr>							 
											<td   width="10%" align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;" ><span>Skype ID:</span></td>
											<td   align="left" style="padding:5px; border:#E1E1E1 1px solid;" ><input name="skype" type="text" value="<%=rs("skype")%>" size="30"></td>											
										</tr>										
										<tr>							 
											<td   width="10%" align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;" ><span>��������:</span></td>
											<td   align="left" style="padding:5px; border:#E1E1E1 1px solid;" ><input name="postcode" type="text" value="<%=rs("postcode")%>" size="30"></td>											
										</tr>										
										<tr>							 
											<td   width="10%" align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;" ><span>E-mail:</span></td>
											<td   align="left" style="padding:5px; border:#E1E1E1 1px solid;" ><input name="email" type="text" value="<%=rs("email")%>" size="30"></td>											
										</tr>
										<tr>							 
											<td   width="10%" align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;" ><span>�������֤:</span></td>
											<td   align="left" style="padding:5px; border:#E1E1E1 1px solid;" ><input name="permitcode" type="text" value="<%=rs("permitcode")%>" size="30"></td>											
										</tr>
										
										<tr>	
												<td   colspan="2" align="right" style="padding:5px; border:#E1E1E1 1px solid;" ><input type="submit" name="submit" value="�� ��"></td>
										</tr>
									</table>
								</td>
            	</tr>					
						   <%	
						   end if	 
			  			 rs.close 
	  	  			set rs=nothing 
	  	  			conn.close 
	  	  			set conn=nothing 		  							 
							 %>
             </table>
					</td>
		  </tr>	
		</table>	
     </form>	
</BODY>
</HTML>
