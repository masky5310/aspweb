<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
' �������������ʹ�õĴ���ҳ��ǣ��벻Ҫɾ����������ο������ļ���
'
' �������ƣ�leavemsg.asp
' ԭ�����ߣ�Lyn
' �����ʼ���lyn.ma@hotmail.com
' �������ڣ������ģ�2010��06��24�� 23:04:00
' ��Ȩ����(C)Feng
'--------------------------------------------------------------%>

<!--#include file="head1.asp"-->

<div class="cont_right">
  <table width="98%" border="0" cellspacing="0" cellpadding="0" id="cont_table">
			<tr>
        <td style="background:url(theme/img/position.gif) no-repeat 5px 0px; color:#B01F24; padding-left:15px; padding-bottom:7px">
		    &nbsp; �����ڵ�λ�ã�<span class="font5">��ҳ</span> ->><u>���Է���</u></td>
      </tr>
      <tr>
        <td  align="left" valign="top" style="border:#DFDFDF 1px solid; padding:10px 12px 15px 12px; background:#FDFDFD;">
		    <table width="98%" border="0" cellspacing="0" cellpadding="0" >
          <tr>
            <td>
				     <table width="100%" border="0" cellspacing="1" cellpadding="1" style="margin-top:5px;">
              <tr bgcolor="#CCCCCC">
                <td   align="center" bgcolor="#698cc3" ><span class="head_font">�� �� �� ��</span></td>           
              </tr> 
				      <tr>
                <td   align="right" >
								<span style="float:right">
								<input type="button" id="dispaly_msg" icon='icon-add-row' value="��������" onClick="displayOrClose('display')">
								<input type="button" icon='icon-close' id="close_msg" value="�ر�����" onClick="displayOrClose('close')" style="display:none">
								</span>
								</td>           
              </tr>
              <%
		          dim PageSize,RowCount,TotalPages,PageNo,Position,PageBegin,PageEnd
				      set rs=Server.CreateObject("adodb.recordset")
				      sql="select * from leaveMsg order by datetime_q desc"
				      rs.Open sql,conn,1,1
				      PageSize=3
				      if	rs.RecordCount=0 then				
				      %>
				      <tr >
               <td  height="600" align="center">��ǰû������!</td>            
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
              <td height="10"></td>        
			  		 </tr> 
						<tr >
						<td>
						<table width="100%" style="border:#CCCCCC dashed 1px">
							<tr width="100%">
								<td colspan="2">
								<img src="theme/img/line_2.jpg" width="630" height="20" /></td>								
							</tr>
							<tr width="100%" align="left">
								<td width="50%"><span><img src="theme/img/Msg_post.gif" width="12" height="12"> &nbsp;ʱ��:&nbsp;<%=rs("datetime_q")%></span></td>
							  <td  align="left"><span>������:&nbsp;<%=rs("name_q")%></span>
							  </td>
							</tr>
							<tr width="100%">
								<td colspan="2">
								<img src="theme/img/line_2.jpg" width="630" height="20" /><br />
								<span>����:&nbsp;<%=rs("title")%></span>
								<br />
								<img src="theme/img/line_2.jpg" width="630" height="20" /><br /></td>								
							</tr>
							<tr width="100%">
								<td colspan="2"><span>����:&nbsp;<%=rs("content")%></span>								
							</td>
							</tr>
							<% if rs("reply") <> "" then	%>
							<tr width="100%">
								<td colspan="2">
								<img src="theme/img/line_2.jpg" width="630" height="20" /></td>								
							</tr>
							<tr width="100%">	
								<td colspan="2"><span style="color: #0085CA;font-weight: bold; font-family: Arial, Helvetica, sans-serif"><img src="theme/img/Msg_reply.gif" width="15" height="15">�ظ�:&nbsp;<%=rs("reply")%></span></td>
							</tr>
							<% end if%>
							</tr>
						</table>
             </td>						
				    </tr>           
			 		  <%
			 		  RowCount=RowCount-1
			 		  rs.MoveNext
			 		  loop			 
			 		  end if			 
			 		  %>
			 		  <tr>
					  <table width="638" >
					   <tr>
			   		  <td  height="10" align="right" width="100%">
						  <span>
				 		  <%				 
				 		  if	rs.RecordCount<>0 then					 
				  		  For i=1 to TotalPages
								  if CInt(PageNo) = CInt(i) then
                 		  response.write "["&i&"]"
                 else
						     		  response.write "&nbsp<a href=feedback.asp?PageNo="&i&">"&i&"</a>&nbsp"
                 end if
			    		  Next
									 
				  		  response.Write "&nbsp;ҳ: "&PageNo &" / "&TotalPages &" | ��¼: "&PageBegin &" - "&PageEnd & " �ܼ�¼��: "& rs.RecordCount&"&nbsp;"
				  		  if PageNo > 1 then
				      		  response.Write "<a href=feedback.asp?PageNo=1>��ҳ</a> &nbsp;<a href=feedback.asp?PageNo="& (PageNo -1) &">��ҳ</a>&nbsp;"
				  		  end if
				  		  if TotalPages >1 and CInt(PageNo)<> CInt(TotalPages) then
				     		   response.Write "<a href=feedback.asp?PageNo=" & (PageNo+1) & ">��ҳ</a>&nbsp;<a href=feedback.asp?PageNo=" & TotalPages & ">ĩҳ</a>&nbsp;"
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
			     </tr>  
          </table>
			    </td>
			  </tr> 
		   </table>
		   </td>
      </tr>		 
 </table>	
 </div>
<div id="message" style="display:none">
		    <form name="form1" action="SaveMsg.asp" method="post"  enctype="application/x-www-form-urlencoded;hartset=utf-8">
			     <table width="100%" border="1" cellspacing="1" cellpadding="5" style="border:#DFDFDF 1px solid; padding:25px 12px 15px 12px; background:#FDFDFD; ">
						<tr ><td  colspan="2"align="center" style= "border:#E1E1E1 1px solid;  background:#698cc3"><span class="head_font"><b>�� �� �� ��</b></span></td></tr>
						<tr><td width="30%" align="center" style= "border:#E1E1E1 1px solid;"><span style="color:red">��</span> �� ��:</td><td  align="left" style= "border:#E1E1E1 1px solid;"><input type="text" size="20" name="name_q"></td></tr>
						<tr><td width="30%" align="center" style= "border:#E1E1E1 1px solid;"><span style="color:red">��</span> �� ��:</td><td  align="left" style= "border:#E1E1E1 1px solid;"><input type="text" size="50" name="title"></td></tr>
						<tr><td width="30%" align="center" style= "border:#E1E1E1 1px solid;"><span style="color:red">��</span> �� ��:</td><td  align="left" style= "border:#E1E1E1 1px solid;"><textarea name="content" rows="5" style="WIDTH: 400px"></textarea> </td></tr>
						</table>
						<table>
						<tr >
							<td width="50%"   align="right" style= "border:#E1E1E1 1px solid;">
									<input icon='icon-edit' type="submit" name="submit" value="�ύ����">						
							</td>
							<td  width="50%"  align="left" style= "border:#E1E1E1 1px solid;">							
									<input name="cancel" type="reset" value="ȡ������" icon='icon-reset'>
							</td>
					 	 </tr>					 
			     </table>
			    </form>
</div>
<script type="text/javascript">
  var msg=document.getElementById("message");
	function displayOrClose(choice)
	{
	  //alert(choice);	  
	  if(choice=="display")
		{		  
	    msg.style.display="block";
		  document.getElementById("dispaly_msg").style.display="none";
		  document.getElementById("close_msg").style.display="block";
		}
    else
		{
		  msg.style.display="none";
		  document.getElementById("dispaly_msg").style.display="block";
		  document.getElementById("close_msg").style.display="none";
		}	 
	}
</script>
 </div>
 
<!--#include file="foot.asp"-->
