<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
' 上面这行是软件使用的代码页标记，请不要删除。详情请参考帮助文件。
'
' 档案名称：manaresume.asp
' 原创作者：Lyn
' 作者邮件：lyn.ma@hotmail.com
' 创建日期：星期日，2010年06月27日 19:47:16
' 版权所有(C)Feng
'--------------------------------------------------------------%>

<!--#include file="../db/conn2.asp"-->

<HTML>
<HEAD>
	<Title>公司介绍管理</Title>
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
					<td align="left"><span style="font-size:14px">公司介绍管理</span></td>
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
                    <td  height="600" align="center">当前没有数据!</td>            
							  </tr> 
			 			  <%
			 			   else 			  		
						  	 do while not rs.EOF
							  %>							 
			 			   <tr >
								<td>
							    <table>
										<tr>							 
											<td   width="10%" align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;" ><span>修改时间:</span></td>
											<td   align="left" style="padding:5px; border:#E1E1E1 1px solid;" ><span><%=rs("edit_date")%></span></td>											
										</tr>	
										<tr>
											<td width="10%" align="center" style="padding:5px; border:#E1E1E1 1px solid;"><span>修改人:</span></td>
											<td   align="left" style="padding:5px; border:#E1E1E1 1px solid;" ><span><%=rs("editor")%></span></td></tr>
										<tr>
											<td width="10%" align="center" style="padding:5px; border:#E1E1E1 1px solid;"><span>内 容:</span></td>
											<td  align="left" style="padding:5px; border:#E1E1E1 1px solid;" ><span><%=rs("resume")%></span></td></tr>
										<tr>	
												<td   colspan="2" align="right" style="padding:5px; border:#E1E1E1 1px solid;" ><span><a href="resume.asp?action=modify&id=1"  target="main">修 改</a></span></td>
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