<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
' 上面这行是软件使用的代码页标记，请不要删除。详情请参考帮助文件。
'
' 档案名称：Manabiz.asp.asp
' 原创作者：Lyn
' 作者邮件：lyn.ma@hotmail.com
' 创建日期：星期日，2010年06月27日 19:52:24
' 版权所有(C)Feng
'--------------------------------------------------------------%>

<!--#include file="../db/conn2.asp"-->

<HTML>
<HEAD>
	<Title>业务范围管理</Title>
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
 <script language="javascript">
 
function GetSelectValue(id)
{
	var tt = document.getElementById(id);	
	return	tt.options[tt.selectedIndex].value
}

function postback()
{
  var selectValue=GetSelectValue("biztype");
  if(selectValue==0)
  {
   alert("请选择业务类型！");
	  return;
  } 
  else
  {
   //alert(selectValue);
   window.location.href='manabiz.asp?id='+selectValue;
  }  
}

function check()
{
	var selectValue=GetSelectValue("biztype");
  if(selectValue==0)
  {
   alert("请选择业务类型！");
	  return;
  } 
  else
  {
   //alert(selectValue);
   window.location.href='addbiz.asp?bizid='+selectValue;
  }  
}
 </script>
</HEAD>
<BODY >
<form action="#" method="post">		
		<table width="100%">
		  <tr>
					<td align="left"><span style="font-size:14px">业务范围管理</span></td>
		  </tr>
		  <tr>
					<td  >
						<table width="100%" border="0" cellspacing="1" cellpadding="5" style="margin-top:1px;">								
                <%		            
				        set rs=Server.CreateObject("adodb.recordset")
				        sql="select * from biz_type"
				        rs.Open sql,conn,1,1				       
				        if	rs.RecordCount=0 then				
				        %>
				        <tr >
                    <td  colspan="3" height="600" align="center">
										<select name="biztype" id="biztype">
											<option value="0">当前没有数据!</option>
										</select>
									</td>            
							  </tr> 
			 			  <%
			 			   else 
							%>		
							<tr >
								<td width="10%" style="padding:5px; border:#E1E1E1 1px solid;" >	
										业务类型:
								</td>
								<td  align="center" style="padding:5px; border:#E1E1E1 1px solid;" >
								<select name="biztype" id="biztype" onchange="postback()">
									<option value="0">请选择业务类型:</option>
						  	<% 
							 do while not rs.EOF
							  %>							 
									<option value="<%=rs("biz_type_id")%>"><%=rs("biz_type_name")%></option>											
						   <%						  
						   rs.MoveNext
						   loop			 
						   end if
							%>							
							 </select>
								</td>				    
								<td   style="padding:5px; border:#E1E1E1 1px solid;">
								<span>								
									<a href="biztype.asp?action=add&keepThis=true&amp;TB_iframe=true&amp;height=200&amp;width=520" title="增加一个新的业务类型" class="thickbox"><input con='icon-add' type="button" name="newbiz" value="增加业务类型" ></a>
									<a href="biztype.asp?action=mod&keepThis=true&amp;TB_iframe=true&amp;height=200&amp;width=520" title="修改一个新的业务类型" class="thickbox"><input con='icon-add' type="button" name="newbiz" value="修改业务类型" ></a>
									<a href="biztype.asp?action=del&keepThis=true&amp;TB_iframe=true&amp;height=200&amp;width=520" title="删除一个新的业务类型" class="thickbox"><input con='icon-del' type="button" name="newbiz" value="删除业务类型" ></a>
							    <a href="addbiz.asp?action=add&keepThis=true&amp;TB_iframe=true&amp;height=300&amp;width=520" title="增加一个新的业务内容" class="thickbox" ><input con='icon-add' type="button" id="addbiz" value="增加业务内容" ></a>
							  </span>
								</td>
					  </tr>
					  <tr>
								<td colspan="3" style="padding:5px; border:#E1E1E1 1px solid;" ><span>业务内容范围:</span></td>
					  </tr>
					  <tr>
								<td colspan="3" style="padding:5px; border:#E1E1E1 1px solid;" >
								<table>
								  <tr bgcolor="#CCCCCC">
										<td align="center" style="padding:5px; border:#E1E1E1 1px solid;" ><span>序 号:</span></td>
									 <td align="center" style="padding:1px; border:#E1E1E1 1px solid;" ><span>主 题:</span></td>
									 <td align="center" style="padding:1px; border:#E1E1E1 1px solid;" ><span>内 容:</span></td>	
									 <td align="center" style="padding:1px; border:#E1E1E1 1px solid;" ><span>操 作</span></td>	
									</tr>									 
									<%
									 biztype=Request.QueryString("id")
									 if biztype<> "" then		
									 
										set rs=Server.CreateObject("adodb.recordset")
										sql="select * from biz where biz_type_id="&biztype
										rs.Open sql,conn,1,1
										
										i=0
				            do while not rs.EOF	
								    i=i+1
									 %>
									 <tr>
										<td  align="center" style="padding:1px; border:#E1E1E1 1px solid;" ><span><%=i %></span></td>
									 <td style="padding:1px; border:#E1E1E1 1px solid;" ><span><%=rs("biz_title") %></span></td>
									 <td style="padding:1px; border:#E1E1E1 1px solid;" ><span><%=rs("biz_content") %></span></td>
									 <td style="padding:1px; border:#E1E1E1 1px solid;" >
											<a href="biz.asp?action=del&id=<%=rs("id")%>&keepThis=true&amp;TB_iframe=true&amp;height=200&amp;width=520" title="删除业务内容" class="thickbox"><input con='icon-del' type="button" name="newbiz" value="删除" ></a>
											<a href="biz.asp?action=modify&id=<%=rs("id")%>&keepThis=true&amp;TB_iframe=true&amp;height=200&amp;width=520" title="编辑业务内容" class="thickbox"><input con='icon-add' type="button" name="newbiz" value="修改" ></a>
									 </td>
									</tr>		
									 <%
										rs.MoveNext
										loop	
										end if
									%>
								</table>
								</td>
					  </tr>
             </table>
					</td>
		  </tr>	
		  <tr>
				<td style="padding:5px; border:#E1E1E1 1px solid;" >
						<%	
						   conn.Close
			  			 set rs=nothing
			  			 set conn=nothing				 
							 %>
				</td>
			</tr>
		</table>	
     </form>	
</BODY>
</HTML>
