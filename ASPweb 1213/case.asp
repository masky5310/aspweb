<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
' �������������ʹ�õĴ���ҳ��ǣ��벻Ҫɾ����������ο������ļ���
'
' �������ƣ�case.asp
' ԭ�����ߣ�Lyn
' �����ʼ���lyn.ma@hotmail.com
' �������ڣ������ģ�2010��06��24�� 23:00:01
' ��Ȩ����(C)Feng
'--------------------------------------------------------------%>


<!--#include file="head1.asp"-->

<div class="cont_right">
 <table width="98%" border="0" cellspacing="0" cellpadding="0" id="cont_table">
      <tr>
        <td style="background:url(theme/img/position.gif) no-repeat 5px 0px; color:#B01F24; padding-left:15px; padding-bottom:7px">
		    &nbsp; �����ڵ�λ�ã�<span class="font5">��ҳ </span>->><u>�ɹ�����</u></td>
      </tr>
      <tr>
        <td height="580" align="left" valign="top" style="border:#DFDFDF 1px solid; padding:25px 12px 15px 12px; background:#FDFDFD;">
		    <table width="98%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>
				      <table width="96%" border="0" cellspacing="1" cellpadding="5" style="margin-top:1px;">
								<tr bgcolor="#CCCCCC">
									<td  width="25%" align="center" bgcolor="#FF470E"><span class="STYLE1">��ҵLogo</span></td>
            			<td  width="25%" align="center" bgcolor="#e27907" ><span class="STYLE1">�ͻ�����</span></td>
            			<td   width="25%" align="center" bgcolor="#E99800"><span class="STYLE1">������ҵ</span></td>
            			<td  width="25%" align="center" bgcolor="#2D4C9C" ><span style="color:#ffffff">��Ŀ����</span></td><!-- 035489"-->
                </tr> 
                <%
		            dim PageSize,RowCount,TotalPages,PageNo,Position,PageBegin,PageEnd
				        set rs=Server.CreateObject("adodb.recordset")
				        sql="select * from cases order by datetime desc"
				        rs.Open sql,conn,1,1
				        PageSize=5
				        if	rs.RecordCount=0 then				
				        %>
				        <tr >
                    <td colspan="4" height="600" align="center">��ǰû������!</td>            
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
            			<td  valign="middle"  align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;" ><span><img src="<%=rs("custom_logo_path")%>" alt="<%=rs("custom_name")%>" width="115" height="77"></span></td>
            			<td  valign="middle" style="padding:5px; border:#E1E1E1 1px solid;" ><span><%=rs("custom_name")%></span></td>
								  <td valign="middle" style="padding:5px; border:#E1E1E1 1px solid;"><span><%=rs("biz_type")%></span></td>
						      <td  valign="middle"  style="padding:5px; border:#E1E1E1 1px solid;" ><span><%=rs("project_name")%></span></td>
						  </tr>
               <tr >
           			   <td colspan="4" height="1"></td>        
			 			   </tr> 						  
						   <%
						   RowCount=RowCount-1
						   rs.MoveNext
						   loop			 
						   end if			 
						   %>
						   <tr>
						     <td colspan="4" height="1" align="right">
									<span>
						  	 <%				 
				 			  if	rs.RecordCount<>0 then	
				 
				 			   For i=1 to TotalPages
								  	if CInt(PageNo) = CInt(i) then
                 response.write "["&i&"]"
                 else
						     response.write "&nbsp<a href=case.asp?PageNo="&i&">"&i&"</a>&nbsp"
                 end if
			   			   Next
									 
				 			   response.Write "ҳ: "&PageNo &" / "&TotalPages &" | ��¼: "&PageBegin &" - "&PageEnd & " �ܼ�¼��: "& rs.RecordCount&"&nbsp;"
				 			   if PageNo > 1 then
				    			    response.Write "<a href=case.asp?PageNo=1>��ҳ</a> &nbsp;<a href=case.asp?PageNo="& (PageNo -1) &">��ҳ</a>&nbsp;"
				  			  end if
				  			  if TotalPages >1 and CInt(PageNo)<> CInt(TotalPages) then
				     			   response.Write "<a href=case.asp?PageNo=" & (PageNo+1) & ">��ҳ</a>&nbsp;<a href=case.asp?PageNo=" & TotalPages & ">ĩҳ</a>&nbsp;"
			    			  end if
				 			  end if			
				 			  %>
				 			  </span>
				 			  <%				 			
			  			  set rs=nothing			  					 
							   %>
							  </td>
						  </tr>  
             </table>
				    </td>
            </tr> 
        </table>
        </td>
      </tr>
</table>
</div>
</div>
<!--#include file="foot.asp"-->