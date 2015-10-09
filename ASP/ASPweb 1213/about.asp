
<!--#include file="head1.asp"-->

	<div class="cont_right">
	<table width="98%" border="0" cellspacing="0" cellpadding="0" id="cont_table">
      <tr>
       <td style="background:url(theme/img/position.gif) no-repeat 5px 0px; color:#B01F24; padding-left:15px; padding-bottom:7px">
		    &nbsp; 您所在的位置：<span class="font5">首页</span> ->><span><u>公司简介</u></span></td>
      </tr>
      <tr>
        <td height="580" align="left" valign="top" style="border:#DFDFDF 1px solid; padding:25px 12px 15px 12px; background:#FDFDFD;">
		       <table width="600" border="0" cellspacing="0" cellpadding="0">
				    <th>
							<tr>
								<td align="center" class="introduce">公 司 简 介</td>								
							</tr>
					  </th>
					  <tbody>					 
			      <tr>
              <td  valign="center" style="line-height:3">
				        <%
														set rs=server.CreateObject("adodb.recordset")
														sql="select top 1 * from resume"
														rs.open sql,conn,1,1
														if rs.RecordCount=1 then														
													%>
													<br>
													
				      <span><%=rs("resume")%></span>
						<%
							end if
							rs.close
						set rs=nothing
						%>
							</td>
						</tr>
						<tr><td align="right"><img src="theme/img/jieshao.bmp"></td></tr>
						 </tbody>
        </table>
        </td>
      </tr>
    </table>	 
	</div>
</div>

<!--#include file="foot.asp"-->
