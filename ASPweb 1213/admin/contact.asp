<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
'
' 档案名称：contact.asp
' 原创作者：lyn_ma
' 作者邮件：lyn.ma@hotmail.com
' 创建日期：星期六，2010年07月10日 14:40:17
' 版权所有(C)sagemwirless
'--------------------------------------------------------------%>

<!--#include file="../db/conn2.asp"-->

<HTML>
<HEAD>
	<Title>公司联系人管理</Title>
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
			response.Write("<script language=javascript>alert('内容不完整!请完善!');history.go(-1)</script>")
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
	  response.write("<script language='javascript'>alert('修改成功!');</script>")
	end if
end if
%>
<BODY>
<form action="contact.asp" method="post">		
		<table width="100%">
		  <tr>
					<td align="left"><span style="font-size:16px">公司联系人管理</span></td>
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
											<td   width="10%" align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;" ><span>公司联系人:</span></td>
											<td   align="left" style="padding:5px; border:#E1E1E1 1px solid;" ><input  name="contacter" type="text" value="<%=rs("contacter")%>" size="30"></td>											
										</tr>	
										<tr>							 
											<td   width="10%" align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;" ><span>公司地址:</span></td>
											<td   align="left" style="padding:5px; border:#E1E1E1 1px solid;" ><input name="address" type="text" value="<%=rs("address")%>" size="30"></td>											
										</tr>	
										<tr>							 
											<td   width="10%" align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;" ><span>公司电话:</span></td>
											<td   align="left" style="padding:5px; border:#E1E1E1 1px solid;" ><input name="tel" type="text" value="<%=rs("tel")%>" size="30"></td>											
										</tr>
										<tr>							 
											<td   width="10%" align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;" ><span>公司传真:</span></td>
											<td   align="left" style="padding:5px; border:#E1E1E1 1px solid;" ><input name="fax" type="text" value="<%=rs("fax")%>" size="30"></td>											
										</tr>
										<tr>							 
											<td   width="10%" align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;" ><span>手 机:</span></td>
											<td   align="left" style="padding:5px; border:#E1E1E1 1px solid;" ><input name="cell" type="text" value="<%=rs("cell")%>" size="30"></td>											
										</tr>
										<tr>							 
											<td   width="10%" align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;" ><span>QQ 号码:</span></td>
											<td   align="left" style="padding:5px; border:#E1E1E1 1px solid;" ><input name="qq" type="text" value="<%=rs("qq")%>" size="30"></td>											
										</tr>
										<tr>							 
											<td   width="10%" align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;" ><span>淘宝账号:</span></td>
											<td   align="left" style="padding:5px; border:#E1E1E1 1px solid;" ><input name="taobao" type="text" value="<%=rs("taobao")%>" size="30"></td>											
										</tr>
										<tr>							 
											<td   width="10%" align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;" ><span>Skype ID:</span></td>
											<td   align="left" style="padding:5px; border:#E1E1E1 1px solid;" ><input name="skype" type="text" value="<%=rs("skype")%>" size="30"></td>											
										</tr>										
										<tr>							 
											<td   width="10%" align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;" ><span>邮政编码:</span></td>
											<td   align="left" style="padding:5px; border:#E1E1E1 1px solid;" ><input name="postcode" type="text" value="<%=rs("postcode")%>" size="30"></td>											
										</tr>										
										<tr>							 
											<td   width="10%" align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;" ><span>E-mail:</span></td>
											<td   align="left" style="padding:5px; border:#E1E1E1 1px solid;" ><input name="email" type="text" value="<%=rs("email")%>" size="30"></td>											
										</tr>
										<tr>							 
											<td   width="10%" align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;" ><span>入网许可证:</span></td>
											<td   align="left" style="padding:5px; border:#E1E1E1 1px solid;" ><input name="permitcode" type="text" value="<%=rs("permitcode")%>" size="30"></td>											
										</tr>
										
										<tr>	
												<td   colspan="2" align="right" style="padding:5px; border:#E1E1E1 1px solid;" ><input type="submit" name="submit" value="修 改"></td>
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
