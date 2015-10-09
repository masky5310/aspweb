
<!--#include file="head1.asp"-->

<div class="cont_right">
 <table width="98%" border="0" cellspacing="0" cellpadding="0" id="cont_table">
      <tr>
        <td style="background:url(theme/img/position.gif) no-repeat 5px 0px; color:#B01F24; padding-left:15px; padding-bottom:7px">
		     &nbsp; 您所在的位置：<span class="font5">首页</span> ->> <span><u>业务范围</u></span></td>
      </tr>		  
      <tr>		    
        <td  align="left" valign="top" style="border:#DFDFDF 1px solid; padding:25px 12px 15px 12px; background:#FDFDFD;">		       
								<table width="98%" border="0" cellspacing="0" cellpadding="0" class="biz_table" style="border:#DFDFDF 1px solid;">
								 <tr bgcolor="#698cc3" height="20px">
										<td  width="20%" style="border:#DFDFDF 1px solid;" align="center"><span class="head_font"><b>业 务 类 型</b></span></td>
										<td style="border:#DFDFDF 1px solid;" align="center" colspan="2"><span class="head_font" ><b>业 务 内 容</b></span></td></tr>
								 <tr>
										<%
													set rs=server.CreateObject("adodb.recordset")
													sql="select * from biz_type inner join biz on biz_type.biz_type_id=biz.biz_type_id"
													rs.open sql,conn,1,1
													if rs.eof and rs.bof then
														response.write"<table width='100%' style='height: 130px; margin-top: 3px;' border='0' align='center'   cellpadding='0' cellspacing='0'><tr><td width='100%' colspan='2'>没有查询到相关数据<td></tr></table>"
													else
														do while not rs.eof
													%>			
										<td style="border:#DFDFDF 1px solid;" align="left"><img src="Theme/Img/title.bmp" style="Z-INDEX: 0; MARGIN-LEFT: 10px"> <span><b><%=rs("biz_type_name")%></b></span></td>										
								    <td style="border:#DFDFDF 1px solid;"><span style="Z-INDEX: 0; MARGIN-LEFT: 10px"><%=rs("biz_title")%></span></td>
									  <td style="border:#DFDFDF 1px solid;width:5%"><img src="Theme/Img/ico_yes.gif" style="Z-INDEX: 0; MARGIN-LEFT: 10px"></td></tr>
									<%
											rs.movenext  
											loop
											rs.close
											set rs=nothing	
											end if
				 							%>	
							</table>											
        </td>
      </tr>
    </table>
</div>
</div>
<!--#include file="foot.asp"-->