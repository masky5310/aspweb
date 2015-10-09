<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
' 上面这行是软件使用的代码页标记，请不要删除。详情请参考帮助文件。
'
' 档案名称：contact.asp
' 原创作者：Lyn
' 作者邮件：lyn.ma@hotmail.com
' 创建日期：星期四，2010年06月24日 22:56:01
' 版权所有(C)Feng
'--------------------------------------------------------------%>


<!--#include file="head1.asp"-->

<div class="cont_right">
<table width="98%" border="0" cellspacing="0" cellpadding="0" id="cont_table">
      <tr>
        <td style="background:url(theme/img/position.gif) no-repeat 5px 0px; color:#B01F24; padding-left:15px; padding-bottom:7px">
		    &nbsp; 您所在的位置：<span class="font5">首页</span> ->> <u>联系我们</u></td>
      </tr>
      <tr>
        <td height="580" align="left" valign="top" style="border:#DFDFDF 1px solid; padding:25px 12px 15px 12px; background:#FDFDFD;">
		    <table width="98%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td >
				    <table cellpadding="0" cellspacing="0" width="100%">
               <tr>
                <td height="25" align="left">
						      <b>联 系 我 们</b>  <img src="theme/img/tel.gif" border="0"> 
     					 </td>
               </tr>
               <tr>
                  <td height="4" background="theme/img/line.gif">
										<img src="theme/img/space.gif" width="12" height="1" border="0">                                                       
									</td>
							</tr>
							<tr>
                <td height="10">
									<img src="theme/img/space.gif" width="12" height="1" border="0">    
								</td>
               </tr>
               <tr>
                 <td></td>
               </tr>
              <tr>
				  <%
														set rs=server.CreateObject("adodb.recordset")
														sql="select top 1 * from resume"
														rs.open sql,conn,1,1
														if rs.RecordCount=1 then														
													%>
                 <td height="20" align="left" style="line-height:3">地址：<span><%=rs("address")%></span>
					       <IMG height=179 src="theme/img/feedback.gif" width=222 align=right>
							 <BR>咨询师：<span><%=rs("contacter")%></span>
							 <BR>手机：<span><%=rs("cell")%></span>
							 <BR>电话：<span><%=rs("tel")%></span>
							 <BR>传真：<span><%=rs("fax")%></span>
							 <BR>
							 <BR>Email联系 
							 <BR>[接待中心] 
							 <A href="mailto:<%=rs("email")%>"><span><%=rs("email")%></span></A>
							 <BR>负责处理公司日常业务,接待您的咨询和处理您的服务要求。
							 <BR>[客户支持] <A href="mailto:<%=rs("email")%>"><%=rs("email")%></A>
							 <BR>负责帮助您解决有关服务方面的问题.
							 <BR>
							 <BR>[总经理信箱] 
							 <BR>如果您对服务不满意，经过投诉也未得到及时解决，请直接发信此信箱。
							 </td>
              </tr>
			   </table>
					<%
		end if
		rs.close
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
