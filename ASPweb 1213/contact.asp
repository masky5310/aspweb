<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
' �������������ʹ�õĴ���ҳ��ǣ��벻Ҫɾ����������ο������ļ���
'
' �������ƣ�contact.asp
' ԭ�����ߣ�Lyn
' �����ʼ���lyn.ma@hotmail.com
' �������ڣ������ģ�2010��06��24�� 22:56:01
' ��Ȩ����(C)Feng
'--------------------------------------------------------------%>


<!--#include file="head1.asp"-->

<div class="cont_right">
<table width="98%" border="0" cellspacing="0" cellpadding="0" id="cont_table">
      <tr>
        <td style="background:url(theme/img/position.gif) no-repeat 5px 0px; color:#B01F24; padding-left:15px; padding-bottom:7px">
		    &nbsp; �����ڵ�λ�ã�<span class="font5">��ҳ</span> ->> <u>��ϵ����</u></td>
      </tr>
      <tr>
        <td height="580" align="left" valign="top" style="border:#DFDFDF 1px solid; padding:25px 12px 15px 12px; background:#FDFDFD;">
		    <table width="98%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td >
				    <table cellpadding="0" cellspacing="0" width="100%">
               <tr>
                <td height="25" align="left">
						      <b>�� ϵ �� ��</b>  <img src="theme/img/tel.gif" border="0"> 
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
                 <td height="20" align="left" style="line-height:3">��ַ��<span><%=rs("address")%></span>
					       <IMG height=179 src="theme/img/feedback.gif" width=222 align=right>
							 <BR>��ѯʦ��<span><%=rs("contacter")%></span>
							 <BR>�ֻ���<span><%=rs("cell")%></span>
							 <BR>�绰��<span><%=rs("tel")%></span>
							 <BR>���棺<span><%=rs("fax")%></span>
							 <BR>
							 <BR>Email��ϵ 
							 <BR>[�Ӵ�����] 
							 <A href="mailto:<%=rs("email")%>"><span><%=rs("email")%></span></A>
							 <BR>������˾�ճ�ҵ��,�Ӵ�������ѯ�ʹ������ķ���Ҫ��
							 <BR>[�ͻ�֧��] <A href="mailto:<%=rs("email")%>"><%=rs("email")%></A>
							 <BR>�������������йط����������.
							 <BR>
							 <BR>[�ܾ�������] 
							 <BR>������Է������⣬����Ͷ��Ҳδ�õ���ʱ�������ֱ�ӷ��Ŵ����䡣
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
