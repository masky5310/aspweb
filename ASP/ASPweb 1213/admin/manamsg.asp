<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
'
' �������ƣ�ManaMsg.asp
' ԭ�����ߣ�lyn_ma
' �����ʼ���lyn.ma@hotmail.com
' �������ڣ������壬2010��06��25�� 15:11:10
' ��Ȩ����(C)sagemwirless
'--------------------------------------------------------------%>

<!--#include file="../db/conn2.asp"-->

<HTML>
<HEAD>
	<Title>���Իظ�����</Title>
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
</HEAD>
<BODY>
<form action="#" method="post">		
		<table width="100%">
		  <tr>
					<td align="left"><span>���Իظ�����</span></td><td align="right">	
					</td>
		  </tr>
		  <tr>
					<td  colspan="2">
						<table width="100%" border="0" cellspacing="1" cellpadding="5" style="margin-top:1px;">
								<tr bgcolor="#CCCCCC">
									<td  width align="center" bgcolor="#FF470E"><span class="STYLE1">ʱ��</span></td>
            			<td  width align="center" bgcolor="#e27907" ><span class="STYLE1">����</span></td>
            			<td  width align="center" bgcolor="#E99800"><span class="STYLE1">����</span></td>
									<td  width align="center" bgcolor="#E99800"><span class="STYLE1">������</span></td>
									<td  width align="center" bgcolor="#E99800"><span class="STYLE1">�Ƿ�ظ�?</span></td>									
							    <td  align="center"  ><span >�������</span></td>
                </tr> 
                <%
		            dim PageSize,RowCount,TotalPages,PageNo,Position,PageBegin,PageEnd
				        set rs=Server.CreateObject("adodb.recordset")
				        sql="select * from leaveMsg  order by datetime_q desc"
				        rs.Open sql,conn,1,1
				        PageSize=10
				        if	rs.RecordCount=0 then				
				        %>
				        <tr >
                    <td colspan="6" height="600" align="center">��ǰû������!</td>            
							  </tr> 
			 			  <%
			 			   else 
			  			   rs.PageSize=CInt(PageSize)
							  TotalPages=rs.PageCount
							  PageNo= Request.QueryString("PageNo")
							  if PageNo="" or PageNo<1 then
							    PageNo=1
							  end if
							  rs.AbsolutePage=PageNo
		  			    Position=rs.PageSize * PageNo
			 			   PageBegin=Position - rs.PageSize+1
			 			   if Position < rs.RecordCount then
						      PageEnd=Position
							  else
       			     PageEnd=rs.RecordCount
						    end if
						    %>			         
					  	   <%
							   RowCount=rs.PageSize
						  	 do while not rs.EOF and RowCount > 0
							  %>							 
			 			   <tr >
            			<td  valign="middle"  align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;" ><span><%=rs("datetime_q")%></span></td>
            			<td  valign="middle" style="padding:5px; border:#E1E1E1 1px solid;" ><span><%=rs("title")%></span></td>
								  <td valign="middle" style="padding:5px; border:#E1E1E1 1px solid;"><span><%=rs("content")%></span></td>
						      <td  valign="middle"  style="padding:5px; border:#E1E1E1 1px solid;" ><span><%=rs("name_q")%></span></td>
								   <%
									 if rs("isreply") then									
									%>
								  <td  valign="middle"  style="padding:5px; border:#E1E1E1 1px solid;" ><span>�ѻظ�</span></td>
								  <td   align="center" style="padding:5px; border:#E1E1E1 1px solid;" ><span><a href="message.asp?action=modify&id=<%=rs("id")%>"  target="main">�� ��</a>&nbsp;&nbsp;<a href="message.asp?action=delete&id=<%=rs("id")%>"  target="main">ɾ ��</a></span></td>
						     <%
							   else
							   %>
								  <td  valign="middle"  style="padding:5px; border:#E1E1E1 1px solid;background:red" ><font ><span>δ�ظ�</span></font></td>
								  <td   align="center" style="padding:5px; border:#E1E1E1 1px solid;" ><span><a href="message.asp?action=reply&id=<%=rs("id")%>"  target="main">�� ��</a>&nbsp;&nbsp;<a href="message.asp?action=delete&id=<%=rs("id")%>"  target="main">ɾ ��</a></span></td>
								<%
								 end if
								%>
						  </tr>
               <tr >
           			   <td colspan="6" height="10"></td>        
			 			   </tr> 						  
						   <%
						   RowCount=RowCount-1
						   rs.MoveNext
						   loop			 
						   end if			 
						   %>
						   <tr>
						     <td colspan="6" height="10" align="right">
									<span>
						  	 <%				 
				 			  if	rs.RecordCount<>0 then	
				 
				 			   For i=1 to TotalPages
								  	if CInt(PageNo) = CInt(i) then
                 response.write "["&i&"]"
                 else
						     response.write "&nbsp<a href=Manamsg.asp?PageNo="&i&">"&i&"</a>&nbsp"
                 end if
			   			   Next
									 
				 			   response.Write "ҳ: "&PageNo &" / "&TotalPages &" | ��¼: "&PageBegin &" - "&PageEnd & " �ܼ�¼��: "& rs.RecordCount&"&nbsp;"
				 			   if PageNo > 1 then
				    			    response.Write "<a href=Manamsg.asp?PageNo=1>��ҳ</a> &nbsp;<a href=Manamsg.asp?PageNo="& (PageNo -1) &">��ҳ</a>&nbsp;"
				  			  end if
				  			  if TotalPages >1 and CInt(PageNo)<> CInt(TotalPages) then
				     			   response.Write "<a href=Manamsg.asp?PageNo=" & (PageNo+1) & ">��ҳ</a>&nbsp;<a href=Manamsg.asp?PageNo=" & TotalPages & ">ĩҳ</a>&nbsp;"
			    			  end if
				 			  end if			
				 			  %>
				 			  </span>
				 			  <%
				 			  conn.Close
			  			   set rs=nothing
			  			   set conn=nothing				 
							   %>
							  </td>
						  </tr>  
             </table>
					</td>
		  </tr>		 
		</table>	
     </form>	
</BODY>
</HTML>