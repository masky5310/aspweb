<%
														set rs=server.CreateObject("adodb.recordset")
														sql="select top 1 * from resume"
														rs.open sql,conn,1,1
														if rs.RecordCount=1 then														
													%>
<div class="foot">
   <table width="952" height="124" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td height="130" valign="top" background="theme/img/b1.jpg">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
				 <tr>
             <td height="56" align="center">						
                 <div>
                           <a href="about.asp">关于融智</a>&nbsp; | &nbsp;
											     <a href="friend_links.asp">合作伙伴</a>&nbsp;&nbsp; |&nbsp;&nbsp; 
						               <a href="feedback.asp">客户反馈</a>&nbsp;|&nbsp; &nbsp;
						               <a href="#">咨询流程</a>&nbsp; |&nbsp; &nbsp;&nbsp;
						               <a href="contact.asp">联系我们</a>&nbsp; &nbsp;|&nbsp; &nbsp;
						               <a href="admin/management.asp" target="_blank">后台管理</a>
									</div>
              </td>
          </tr>
          <tr>
						<td height="64" align="center">
              <div style="margin-top: 4px;">
							  <span id="ctl00_lblCompany"><%=rs("company_name")%> 版权所有, </span>
                              <a href="#" target="_blank"><span id="ctl00_lblICP"><%=rs("permitcode")%></span></a> 
							  全国统一服务热线：<span id="ctl00_lblPhone"><b><%=rs("tel")%></b></span>
					   </div>
					   <div>
                           <span id="ctl00_lblemail"><img src="theme/img/pic_email.gif"> Email:<%=rs("email")%></span> 
    				   </div>
					   <div style="margin-top: 4px;">
										 <span>Copyright &copy; 2009-<%=year(now)%>,All Rights Reserved</span>										
					   </div>
					   <div>
					   <script src="http://s16.cnzz.com/stat.php?id=2348944&web_id=2348944&show=pic" language="JavaScript"></script>
					   </div>
					   <div style="display:none"><!--style="display:none"-->
						<script language="javascript" type="text/javascript" src="http://js.users.51.la/4043224.js"></script>
						<noscript>
						<a href="http://www.51.la/?4043224" target="_blank">
						<img alt="&#x6211;&#x8981;&#x5566;&#x514D;&#x8D39;&#x7EDF;&#x8BA1;" src="http://img.users.51.la/4043224.asp" style="border:none" />
						</a>
						</noscript>
					   </div>
            </td>
				 </tr>
				</table>
			</td>
		</tr>
  </table>
</div>
</div>
</body>
</html>
	<%
		end if
		rs.close
	  set rs=nothing
    set conn=nothing	
  %>