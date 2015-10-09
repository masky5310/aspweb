<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
' 上面这行是软件使用的代码页标记，请不要删除。详情请参考帮助文件。
'
' 档案名称：case.asp
' 原创作者：Lyn
' 作者邮件：lyn.ma@hotmail.com
' 创建日期：星期四，2010年06月24日 23:00:01
' 版权所有(C)Feng
'--------------------------------------------------------------%>


<!--#include file="head1.asp"-->

<div class="cont_right">
 <table width="98%" border="0" cellspacing="0" cellpadding="0" id="cont_table">
      <tr>
        <td style="background:url(theme/img/position.gif) no-repeat 5px 0px; color:#B01F24; padding-left:15px; padding-bottom:7px">
		    &nbsp; 您所在的位置：<span class="font5">首页 </span>->><u>成功案例</u></td>
      </tr>
      <tr>
        <td height="580" align="left" valign="top" style="border:#DFDFDF 1px solid; padding:25px 12px 15px 12px; background:#FDFDFD;">
		    <table width="98%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>
				      <table width="96%" border="0" cellspacing="1" cellpadding="5" style="margin-top:1px;">
								<tr bgcolor="#CCCCCC">
									<td  width="25%" align="center" bgcolor="#FF470E"><span class="STYLE1">企业Logo</span></td>
            			<td  width="25%" align="center" bgcolor="#e27907" ><span class="STYLE1">客户名称</span></td>
            			<td   width="25%" align="center" bgcolor="#E99800"><span class="STYLE1">所属行业</span></td>
            			<td  width="25%" align="center" bgcolor="#2D4C9C" ><span style="color:#ffffff">项目名称</span></td><!-- 035489"-->
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
                    <td colspan="4" height="600" align="center">当前没有数据!</td>            
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
									 
				 			   response.Write "页: "&PageNo &" / "&TotalPages &" | 记录: "&PageBegin &" - "&PageEnd & " 总记录数: "& rs.RecordCount&"&nbsp;"
				 			   if PageNo > 1 then
				    			    response.Write "<a href=case.asp?PageNo=1>首页</a> &nbsp;<a href=case.asp?PageNo="& (PageNo -1) &">上页</a>&nbsp;"
				  			  end if
				  			  if TotalPages >1 and CInt(PageNo)<> CInt(TotalPages) then
				     			   response.Write "<a href=case.asp?PageNo=" & (PageNo+1) & ">下页</a>&nbsp;<a href=case.asp?PageNo=" & TotalPages & ">末页</a>&nbsp;"
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