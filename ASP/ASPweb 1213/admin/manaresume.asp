<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
' �������������ʹ�õĴ���ҳ��ǣ��벻Ҫɾ����������ο������ļ���
'
' �������ƣ�manaresume.asp
' ԭ�����ߣ�Lyn
' �����ʼ���lyn.ma@hotmail.com
' �������ڣ������գ�2010��06��27�� 19:47:16
' ��Ȩ����(C)Feng
'--------------------------------------------------------------%>

<!--#include file="../db/conn2.asp"-->

<HTML>
<HEAD>
	<Title>��˾���ܹ���</Title>
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
					<td align="left"><span style="font-size:14px">��˾���ܹ���</span></td>
		  </tr>
		  <tr>
					<td  >
						<table width="100%" border="0" cellspacing="1" cellpadding="5" style="margin-top:1px;">								
                <%		            
				        set rs=Server.CreateObject("adodb.recordset")
				        sql="select * from resume  where id=1"
				        rs.Open sql,conn,1,1				       
				        if	rs.RecordCount=0 then				
				        %>
				        <tr >
                    <td  height="600" align="center">��ǰû������!</td>            
							  </tr> 
			 			  <%
			 			   else 			  		
						  	 do while not rs.EOF
							  %>							 
			 			   <tr >
								<td>
							    <table>
										<tr>							 
											<td   width="10%" align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;" ><span>�޸�ʱ��:</span></td>
											<td   align="left" style="padding:5px; border:#E1E1E1 1px solid;" ><span><%=rs("edit_date")%></span></td>											
										</tr>	
										<tr>
											<td width="10%" align="center" style="padding:5px; border:#E1E1E1 1px solid;"><span>�޸���:</span></td>
											<td   align="left" style="padding:5px; border:#E1E1E1 1px solid;" ><span><%=rs("editor")%></span></td></tr>
										<tr>
											<td width="10%" align="center" style="padding:5px; border:#E1E1E1 1px solid;"><span>�� ��:</span></td>
											<td  align="left" style="padding:5px; border:#E1E1E1 1px solid;" ><span><%=rs("resume")%></span></td></tr>
										<tr>	
												<td   colspan="2" align="right" style="padding:5px; border:#E1E1E1 1px solid;" ><span><a href="resume.asp?action=modify&id=1"  target="main">�� ��</a></span></td>
										</tr>
									</table>
								</td>
            	</tr>					
						   <%						  
						   rs.MoveNext
						   loop			 
						   end if		 
						   conn.Close
			  			 set rs=nothing
			  			 set conn=nothing				 
							 %>
             </table>
					</td>
		  </tr>	
		</table>	
     </form>	
</BODY>
</HTML>