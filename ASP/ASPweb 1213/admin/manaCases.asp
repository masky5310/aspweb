<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
'
' �������ƣ�ManaCases.asp
' ԭ�����ߣ�lyn_ma
' �����ʼ���lyn.ma@hotmail.com
' �������ڣ������壬2010��06��25�� 15:41:13
' ��Ȩ����(C)sagemwirless
'--------------------------------------------------------------%>

<!--#include file="../db/conn2.asp"-->

<HTML>
<HEAD>
	<Title>�ɹ���������</Title>
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
  
 <script type="text/javascript">
 function display()
 {
  var addCase=document.getElementById("addcase");
  addcase.style.display="block"; 
 }
 </script>
</HEAD>
<BODY>
<form action="#" method="post">		
		<table width="100%">
		  <tr>
					<td align="left"><span style="font-size:14px">�ɹ���������</span></td><td align="right">					
					<a href="addcase.asp?keepThis=true&amp;TB_iframe=true&amp;height=310&amp;width=600" title="����һ���µİ���" class="thickbox"><input con='icon-add' type="button" name="newCase" value="��������" ></a>
					</td>
		  </tr>
		  <tr>
					<td  colspan="2">
						<table width="100%" border="0" cellspacing="1" cellpadding="5" style="margin-top:1px;">
								<tr bgcolor="#CCCCCC">
									<td  width="20%" align="center" bgcolor="#FF470E"><span class="STYLE1">��˾Logo</span></td>
            			<td  width="20%" align="center" bgcolor="#e27907" ><span class="STYLE1">�ͻ�����</span></td>
            			<td   width="25%" align="center" bgcolor="#E99800"><span class="STYLE1">������ҵ</span></td>
            			<td  width="25%" align="center" bgcolor="#2D4C9C" ><span >��Ŀ����</span></td>
							    <td  align="center"  ><span >�������</span></td>
                </tr> 
                <%
		            dim PageSize,RowCount,TotalPages,PageNo,Position,PageBegin,PageEnd
				        set rs=Server.CreateObject("adodb.recordset")
				        sql="select * from cases order by datetime desc"
				        rs.Open sql,conn,1,1
				        PageSize=3
				        if	rs.RecordCount=0 then				
				        %>
				        <tr >
                    <td colspan="5" height="600" align="center">��ǰû������!</td>            
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
            			<td  valign="middle"  align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;" ><span><img src="<%="../"&rs("custom_logo_path")%>" alt="<%=rs("custom_name")%>" width="115" height="77"></span></td>
            			<td  valign="middle" style="padding:5px; border:#E1E1E1 1px solid;" ><span><%=rs("custom_name")%></span></td>
								  <td valign="middle" style="padding:5px; border:#E1E1E1 1px solid;"><span><%=rs("biz_type")%></span></td>
						      <td  valign="middle"  style="padding:5px; border:#E1E1E1 1px solid;" ><span><%=rs("project_name")%></span></td>
								  <td   align="center" style="padding:5px; border:#E1E1E1 1px solid;" ><span><a href="case.asp?action=modify&id=<%=rs("id")%>"  target="main">�޸�</a>&nbsp;&nbsp;<a href="case.asp?action=delete&id=<%=rs("id")%>"  target="main">ɾ��</a></span></td>
						  </tr>
               <tr >
           			   <td colspan="5" height="10"></td>        
			 			   </tr> 						  
						   <%
						   RowCount=RowCount-1
						   rs.MoveNext
						   loop			 
						   end if			 
						   %>
						   <tr>
						     <td colspan="5" height="10" align="right">
									<span>
						  	 <%				 
				 			  if	rs.RecordCount<>0 then	
				 
				 			   For i=1 to TotalPages
								  	if CInt(PageNo) = CInt(i) then
                 response.write "["&i&"]"
                 else
						     response.write "&nbsp<a href=ManaCases.asp?PageNo="&i&">"&i&"</a>&nbsp"
                 end if
			   			   Next
									 
				 			   response.Write "ҳ: "&PageNo &" / "&TotalPages &" | ��¼: "&PageBegin &" - "&PageEnd & " �ܼ�¼��: "& rs.RecordCount&"&nbsp;"
				 			   if PageNo > 1 then
				    			    response.Write "<a href=ManaCases.asp?PageNo=1>��ҳ</a> &nbsp;<a href=ManaCases.asp?PageNo="& (PageNo -1) &">��ҳ</a>&nbsp;"
				  			  end if
				  			  if TotalPages >1 and CInt(PageNo)<> CInt(TotalPages) then
				     			   response.Write "<a href=ManaCases.asp?PageNo=" & (PageNo+1) & ">��ҳ</a>&nbsp;<a href=ManaCases.asp?PageNo=" & TotalPages & ">ĩҳ</a>&nbsp;"
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
		  <tr>
					<td colspan="2">
				  <div id="addcase">
			    </div>				  
					</td>
		  </tr>
		</table>	
     </form>	
</BODY>
</HTML>
