<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
' 上面这行是软件使用的代码页标记，请不要删除。详情请参考帮助文件。
'
' 档案名称：manaissue.asp
' 原创作者：Lyn
' 作者邮件：lyn.ma@hotmail.com
' 创建日期：星期六，2010年06月26日 18:44:42
' 版权所有(C)Feng
'--------------------------------------------------------------%>

<!--#include file="../db/conn2.asp"-->

<HTML>
<HEAD>
	<Title>常见问题管理</Title>
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
					<td align="left"><span style="font-size:14px">常见问题管理</span></td><td align="right">					
					<a href="addissue.asp?keepThis=true&amp;TB_iframe=true&amp;height=400&amp;width=550" title="增加一个新的问题" class="thickbox"><input con='icon-add' type="button" name="newCase" value="新增问题" ></a>
					</td>
		  </tr>
		  <tr>
					<td  colspan="2">
						<table width="100%" border="0" cellspacing="1" cellpadding="5" style="margin-top:1px;">
								<tr bgcolor="#CCCCCC">
									<td  width align="center" bgcolor="#FF470E"><span class="STYLE1">常见问题</span></td>
            			<td  width align="center" bgcolor="#e27907" ><span class="STYLE1">产生危害</span></td>
            			<td  width align="center" bgcolor="#E99800"><span class="STYLE1">问题原因</span></td>
									<td  width align="center" bgcolor="#E99800"><span class="STYLE1">解决方案</span></td>															
							    <td  align="center"  ><span >管理操作</span></td>
                </tr> 
                <%
		            dim PageSize,RowCount,TotalPages,PageNo,Position,PageBegin,PageEnd
				        set rs=Server.CreateObject("adodb.recordset")
				        sql="select * from issues  order by id "
				        rs.Open sql,conn,1,1
				        PageSize=5
				        if	rs.RecordCount=0 then				
				        %>
				        <tr >
                    <td colspan="5" height="600" align="center">当前没有数据!</td>            
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
            			<td  valign="middle"  align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;" ><span><%=rs("issue_name")%></span></td>
            			<td  valign="middle" style="padding:5px; border:#E1E1E1 1px solid;" ><span><%=rs("issue_result")%></span></td>
								  <td valign="middle" style="padding:5px; border:#E1E1E1 1px solid;"><span><%=rs("issue_reason")%></span></td>
						      <td  valign="middle"  style="padding:5px; border:#E1E1E1 1px solid;" ><span><%=rs("issue_solution")%></span></td>
								  <td   align="center" style="padding:5px; border:#E1E1E1 1px solid;" ><span><a href="issue.asp?action=modify&id=<%=rs("id")%>"  target="main">修 改</a>&nbsp;&nbsp;<a href="issue.asp?action=delete&id=<%=rs("id")%>"  target="main">删 除</a></span></td>
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
						     response.write "&nbsp<a href=Manaissue.asp?PageNo="&i&">"&i&"</a>&nbsp"
                 end if
			   			   Next
									 
				 			   response.Write "页: "&PageNo &" / "&TotalPages &" | 记录: "&PageBegin &" - "&PageEnd & " 总记录数: "& rs.RecordCount&"&nbsp;"
				 			   if PageNo > 1 then
				    			    response.Write "<a href=Manaissue.asp?PageNo=1>首页</a> &nbsp;<a href=Manaissue.asp?PageNo="& (PageNo -1) &">上页</a>&nbsp;"
				  			  end if
				  			  if TotalPages >1 and CInt(PageNo)<> CInt(TotalPages) then
				     			   response.Write "<a href=Manaissue.asp?PageNo=" & (PageNo+1) & ">下页</a>&nbsp;<a href=Manaissue.asp?PageNo=" & TotalPages & ">末页</a>&nbsp;"
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