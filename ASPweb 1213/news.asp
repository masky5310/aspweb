
<!--#include file="head1.asp"-->

<div class="cont_right">
 <table width="98%" border="0" cellspacing="0" cellpadding="0"  id="cont_table">
      <tr>
        <td style="background:url(theme/img/position.gif) no-repeat 5px 0px; color:#B01F24; padding-left:15px; padding-bottom:7px">
		   &nbsp; 您所在的位置：<span class="font5">首页</span> ->> <u>新闻中心</u></td>
      </tr>
      <tr>
        <td height="590" align="left" valign="top" style="border:#DFDFDF 1px solid; padding:25px 12px 15px 12px; background:#FDFDFD;">
		    <table width="98%" border="0" cellspacing="0" cellpadding="0" >
          <tr>
            <td >
				    <% 
					   dim news_id
						news_id=Request.QueryString("id")
						if news_id = "" then					  
					  %>
				       <table width="100%" border="0" cellspacing="1" cellpadding="5" style="margin-top:1px;" class="tcontent">
							
                <%
		            dim PageSize,RowCount,TotalPages,PageNo,Position,PageBegin,PageEnd
				        set rs=Server.CreateObject("adodb.recordset")
				        sql="select * from news order by datetime desc"
				        rs.Open sql,conn,1,1
				        PageSize=15
				        if	rs.RecordCount=0 then				
				        %>
				        <tr >
                    <td height="600" align="center">当前没有数据!</td>            
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
								 row_num=0
						  	 do while not rs.EOF and RowCount > 0
								 row_num=row_num+1
							  %>							 
			 			   <tr >
            			<td><span><img src="theme/img/ico.gif"> &nbsp;&nbsp;<%'=row_num%></span>
							    <!-- </td>style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;"
            			<td > --><span><a href="news.asp?id=<%=rs("id")%>" title="<%=rs("title")%>" class="vtip1">
								<%
   	 						if len(rs("title"))>=40 then
		 						%>			
									<span><%=left(rs("title"),40)&"..."	%></span>
									<%			
		 						else
		 						%>
									<span><%=rs("title")%></span>
									<%	
    						end if		
									%></a></span>
									<span style="float:right"> <%=Year(rs("datetime"))%>/<%																						  
																						                       if Month(rs("datetime"))>0 and Month(rs("datetime"))<10 then																																   
																																		response.Write "0"&Month(rs("datetime"))
																																	else
																																		response.Write Month(rs("datetime"))
																																	end if
																																%>/<%																																
																																 if Day(rs("datetime"))>0 and Day(rs("datetime"))<10		then																														   
																																		response.Write "0"&Day(rs("datetime"))
																																	else
																																		response.Write Day(rs("datetime"))
																																	end if																																
																																%></span>
									</td>						      
						  </tr>
							<tr style="height: 1px;">
								<td>
									<div class="titleseparate" />
								</td>
							</tr>
						   <%
						   RowCount=RowCount-1
						   rs.MoveNext
						   loop			 
						   end if			 
						   %>
						   <tr>
						     <td  height="1" align="right">
									<span>
						  	 <%				 
				 			  if	rs.RecordCount<>0 then	
				 
				 			   For i=1 to TotalPages
								  	if CInt(PageNo) = CInt(i) then
                 response.write "["&i&"]"
                 else
						     response.write "&nbsp<a href=news.asp?PageNo="&i&">"&i&"</a>&nbsp"
                 end if
			   			   Next
									 
				 			   response.Write "页: "&PageNo &" / "&TotalPages &" | 记录: "&PageBegin &" - "&PageEnd & " 总记录数: "& rs.RecordCount&"&nbsp;"
				 			   if PageNo > 1 then
				    			    response.Write "<a href=news.asp?PageNo=1>首页</a> &nbsp;<a href=news.asp?PageNo="& (PageNo -1) &">上页</a>&nbsp;"
				  			  end if
				  			  if TotalPages >1 and CInt(PageNo)<> CInt(TotalPages) then
				     			   response.Write "<a href=news.asp?PageNo=" & (PageNo+1) & ">下页</a>&nbsp;<a href=news.asp?PageNo=" & TotalPages & ">末页</a>&nbsp;"
			    			  end if
				 			  end if			
				 			  %>
				 			  </span>				 			  
							  </td>
						  </tr>  
             </table>
				 <%
				  else 
				  
         		set rs=Server.CreateObject("adodb.recordset")
				    sql="select * from news where id="&news_id
				     rs.Open sql,conn,1,1
					  
					  do while not rs.EOF
				 %>
				 <table width="90%"  height="50px" >
						<tr>
						  <td width="100%" align="center"><span style="FONT-SIZE: 12px"><b><%=rs("title")%></span></b></td>
						</tr>
						<tr>
							<td width="100%"align="right"><span>时间:&nbsp;<span> <%=Year(rs("datetime"))%>-<%																						  
																						                       if Month(rs("datetime"))>0 and Month(rs("datetime"))<10 then																																   
																																		response.Write "0"&Month(rs("datetime"))
																																	else
																																		response.Write Month(rs("datetime"))
																																	end if
																																%>-<%																																
																																 if Day(rs("datetime"))>0 and Day(rs("datetime"))<10		then																														   
																																		response.Write "0"&Day(rs("datetime"))
																																	else
																																		response.Write Day(rs("datetime"))
																																	end if																																
																																%></span></span><span>&nbsp;&nbsp;发布人:<%=rs("author")%></span></td>
						</tr>
						<tr>
						  <td width="100%" valign="center" style="line-height:3"><p><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=rs("content")%></p></span></td>
						</tr>
				 </table>				 
				 <%
					   rs.MoveNext
						 loop	
				  end if 				
					  set rs=nothing					 
				   %>
				    </td>
            </tr> 
        </table>
        </td>
      </tr>
</table>
</div>
</div>

<!--#include file="foot.asp"-->