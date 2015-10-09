
<!--#include file="head.asp"-->

<div id="content" >
   <table width="952" border="0" align="center" cellpadding="0" cellspacing="0" style="">	  
	  <tr>
      <td height="109" valign="top">                        
        <table width="952" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
					  <td width="233" height="109" valign="top">
               <table width="233" border="0" cellpadding="0" cellspacing="0">
						     <tr>
						        <td>
                       <img src="theme/img/m1.gif" width="233" height="40" />
							      </td>
						     </tr>
                 <tr>
                    <td height="158" >       <!--background="theme/img/m2.jpg"-->             
													<%
													set rs=server.CreateObject("adodb.recordset")
													sql="select * from biz_type where is_display_frist_page=true order by biz_type_id asc "
													rs.open sql,conn,1,1
													if rs.eof and rs.bof then
														response.write"<table width='100%' style='height: 130px; margin-top: 3px;' border='0' align='center'   cellpadding='0' cellspacing='0'><tr><td width='100%' colspan='2'>没有查询到相关数据<td></tr></table>"
													else
														do while not rs.eof
													%>
											<div class="home_left_<%=rs("biz_type_id")%>">
                           <table width="100%" style="height: 130px; margin-top: 3px;border-right:#DFDFDF 1px solid;"  border="0"  align="center"   cellpadding="0" cellspacing="0">
                                <tr>
                                  <td height="60" align="left" valign="middle">
                                     <div style="float: left; width: 110px; text-align: center;">
                                          <a href="biz.asp">
                                             <img src="<%=rs("biz_type_pic_path")%>" height="60" title='<%=rs("biz_type_name")%>'   style="border: none;" /></a><!-- onload="javascript:DrawImage(this,110,60)"-->
												             </div>
												             <div style="float: right; width: 100px; text-align: left;">
                                         <div style="line-height: 20px; margin-top: 2px; font-weight: bold;">
																						<span class="type_font"><%=rs("biz_type_name")%></span>																						
													               </div>														          
                                     </div>
											            </td>
																</tr>
                                <tr>
																	<td height="70" align="left" valign="middle">
																	<table width="80%" >																	
																	 <%
																	 set rs2=server.CreateObject("adodb.recordset")
																		sql2="select top 5 * from biz where biz_type_id="&rs("biz_type_id")
																		rs2.open sql2,conn,1,1
																		do while not rs2.eof
																	 %>
																	 <tr>
																			<td >
																				<span class="type_font2"><%=rs2("biz_title")%></span>
																			</td>
																			<td align="right"><a href="biz.asp" title="<%=rs("biz_type_name")%>">[More...]</a><br>																	    
																			</td>
																	 </tr>
																	 <%
																	 rs2.movenext  
																	 loop
																	 rs2.close
																	 set rs2=nothing	
																	 %>																	
																	 </table>
																	</td>
                                </tr>
                           </table>
									       </div>
												<%
												rs.movenext  
												loop
												rs.close
												set rs=nothing	
												end if
												%>								       
							       </td>
						     </tr>
                <tr>
                     <td valign="top">
                      <img src="theme/img/m16.jpg" width="233" />
							       </td>
						     </tr>
                </table>
            </td>
            <td width="520" align="center" valign="top">
                <table width="509" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <img src="theme/img/m11.gif" width="509" height="40" />
									      </td>
                    </tr>
                    <tr>
                        <td height="126" background="theme/img/m12.jpg">
                            <div id="demo" style="height: 126px; width: 490px; overflow: hidden;" onmouseover="stopscroll();"
																	onmouseout="doscroll()">
                                <div id="demo1" style="white-space: nowrap; padding: 0;">                                    
																					<table width="100%" border="0" align="center" cellpadding="0" cellspacing="6" style="display: inline;">
                                          <tr>
																							<%
																								set rs=server.CreateObject("adodb.recordset")
																								sql="select * from cases order by datetime desc "
																								rs.open sql,conn,1,1
																								if rs.eof and rs.bof then
																									response.write"<div>没有查询到相关数据!</div>"
																								else
																									do while not rs.eof
																							%>																				
																						<td align="center" valign="middle" style="height: 122px;">
																							<div style="text-align: center;width:160px; background:url(theme/img/case_bg.jpg) no-repeat 0px 0px;">
																	                <a href='case.asp'>
                                                        <img height="77" width="115" title='<%=rs("custom_name")%>' style="border: none;" src="<%=rs("custom_logo_path")%>"></a><!--onload="javascript:DrawImage(this,300.110);"-->
                                                            </div>
                                                <div style="width: 100%; text-align: center;">
                                                    <a href='#'>
                                                       <span><%=rs("custom_name")%></span> 
                                                    </a>
                                                </div>
																							<%
																								rs.movenext  
																								loop
																								end if
																								rs.close
																								set rs=nothing	
																							%>
                                            </td>
                                          </tr>
																			</table>
                                </div>
                            </div>
                            <script type="text/javascript">
                            var t=demo.scrollWidth
                            demo1.innerHTML+=demo1.innerHTML
                            function doMarquee()
                            {
                            demo.scrollLeft=demo.scrollLeft<demo.scrollWidth-demo.offsetWidth?demo.scrollLeft+1:t-demo.offsetWidth;
                            //alert(demo.scrollLeft);
                            }
                            function doscroll()
                            {
                               sc=setInterval(doMarquee,60)
                            }
                            function stopscroll()
                            {
                               clearInterval(sc)
                            }
                            doscroll()
                         </script>
                        </td>
                    </tr>
                   <tr>
                        <td valign="top">
                            <img src="theme/img/m13.jpg" width="509" height="10" />
											 </td>
                    </tr>
                </table>
                <table width="509" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <img src="theme/img/m14.jpg" width="509" height="5" />
									      </td>
                    </tr>
                    <tr>
                        <td height="121" align="center" valign="top" background="theme/img/m15.jpg">
                            <table width="98%" border="0" cellpadding="0" cellspacing="0">
                                <tr width="100%">
                                    <td height="207" ><!--background="theme/img/mbg.jpg"-->
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                          <tr>
                                              <td id="div_news" class="home_news_change" colspan="2">
                                                  <div id="div_news_one" class="home_news_font" onmouseover="javascript:changeNews('div_news_one');">
                                                        融智动态</div>
                                                  <div id="div_news_two" class="home_news_server" onmouseover="javascript:changeNews('div_news_two');">
                                                        行业资讯</div>
                                                  <div style="float: right; width: 50px;">
                                                        <a href="news.asp" style="font-size:11px;">[More..]</a></div>
                                              </td>
                                          </tr>
                                          <tr>
                                              <td height="400" colspan="2" align="center" valign="top">
                                                  <table id="tb_News_one" width="100%" border="0" align="center" style="margin: 7px 0px;"  cellpadding="0" cellspacing="0">
																											<tbody id="tbody_News_one" style="width:505;display:block;overflow: hidden">
                                                      <%
																												set rs=server.CreateObject("adodb.recordset")
																												sql="select top 12 * from news order by datetime desc "
																												rs.open sql,conn,1,1
																												if rs.eof and rs.bof then
																													response.write"<tr><td width='100%' height='50' colspan='2'>没有查询到相关数据<td></tr>"
																												else
																													do while not rs.eof
																											%>
																											
																												<tr width="100%">
                                                        <td width="5%" height="28" align="center" valign="middle">
                                                            <img src="theme/img/jk-2_r18_c10.jpg" />
																												 </td>
                                                         <td align="left">
                                                             <a href="news.asp?id=<%=rs("id")%>" title="<%=rs("title")%>" >
	                                                           <%
                                                             	 if len(rs("title"))>=30 then
		                                                           %>			
		                                                          	<span class="type_font2"><%=left(rs("title"),30)&"..."	%></span>
			                                                          <%			
		                                                           else
		                                                           %>
		                                                          	<span class="type_font2"><%=rs("title")%></span>
		                                                          	<%	
                                                              end if	%>
	                                                          </a>
                                                          	<span style="float:right">[ <%=Year(rs("datetime"))%>/<%																						  
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
																																%>]</span>
                                                         </td>
                                                        </tr>
																										<%
																												rs.movenext  
																												loop
																												end if
																												rs.close
																												set rs=nothing
																										%>
																										</tbody>
																										</table>
																										<table id="tb_News_two" width="100%" border="0" align="center" style="margin: 7px 0px; display: none; border: none;" cellpadding="0" cellspacing="0">
                                                  	<tbody  id="tbody_News_two" style="width:505;display:none;overflow: hidden">
																										<%
																												set rs=server.CreateObject("adodb.recordset")
																												sql="select top 13 * from news order by datetime desc "
																												rs.open sql,conn,1,1
																												if rs.eof and rs.bof then
																													response.write"<tr><td width='100%' height='50' colspan='2'>没有查询到相关数据<td></tr>"
																												else
																													do while not rs.eof
																											%>
																												<tr width="100%">
                                                        <td width="5%" height="28" align="center" valign="middle">
                                                            <img src="theme/img/jk-2_r18_c101.jpg" />
																												 </td>
                                                         <td  align="left">
                                                             <a href="news.asp?id=<%=rs("id")%>" title="<%=rs("title")%>" >
	                                                           <%
                                                             	 if len(rs("title"))>=30 then
		                                                           %>			
		                                                          	<span class="type_font2"><%=left(rs("title"),30)&"..."	%></span>
			                                                          <%			
		                                                           else
		                                                           %>
		                                                          	<span class="type_font2"><%=rs("title")%></span>
		                                                          	<%	
                                                              end if	%>
	                                                          </a>
																										        <span style="float:right">[ <%=Year(rs("datetime"))%>/<%																						  
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
																																%>]</span>
                                                         </td>
                                                        </tr>
																										<%
																												rs.movenext  
																												loop
																												end if
																												rs.close
																												set rs=nothing
																										%>
																										</tbody>
																										</table>   
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                  </tr>
                             </table>
                        </td>
                   </tr>
                   <tr>
										  <td valign="top">
													<img src="theme/img/m16.jpg" width="509" height="4" /></td>
									 </tr>
								</table>
              </td>
						  <td width="199" align="right" valign="top">
								<table width="199" border="0" cellpadding="0" cellspacing="0" >
									<tr>
											<td height="3"></td>
								  </tr>
								  <tr>
											<td height="32" background="theme/img/m4.jpg" class="h_aboutTitle">
                    <span class="head_font">融智概况</span></td>
								  </tr>
									<tr>
										 <td height="115" bgcolor="#F9F9F9" align="left" valign="top" >
												<div style="margin:5px 5px 5px 10px;font-size:12px">
												   <span id="resume">
													<%
														set rs=server.CreateObject("adodb.recordset")
														sql="select top 1 * from resume"
														rs.open sql,conn,1,1
														if rs.RecordCount=1 then														
													%>
													<%
                            if len(rs("resume"))>=210 then
		                       %>			
		                       <span><%=left(rs("resume"),210)&"....."	%><a href="about.asp"><b>[More]</b></a>
			                     <%
                            end if	%>
														<br>
														<p>
														<b>地址：</b><span><%=rs("address")%></span>
														<br>
														<b>邮编：</b><span><%=rs("postcode")%></span>
														<br>
														<br>
														</p>													
														</span>
												</div>											
										 </td>
									</tr>
									<tr>
										<td height="24" align="center" valign="top" bgcolor="#F9F9F9">
											<img src="theme/img/m5a.jpg"/></td>
									</tr>
									<tr>
										<td height="38" align="center" valign="middle" background="theme/img/m6.jpg" bgcolor="#fff">
											<a href="feedback.asp"><img src="theme/img/m6_r2_c2.jpg" border="0" />
											     <img src="theme/img/m6_r3_c4.jpg" 	  border="0"/></a>
										</td>
									</tr>
									<tr>
										<td height="24" align="center" valign="top" bgcolor="#F9F9F9">
                    <a target=blank href=tencent://message/?uin=<%=rs("qq")%>&Site=../index.html&Menu=yes><img src="theme/img/ser.gif" width="185" height="90" border="0" /></a></td>
									</tr>
									<tr>
										<td align="center" valign="top" bgcolor="#F9F9F9">
											<table background="theme/img/cc.gif"  width="190"  height="95"/>
											<tr height="45">
												<td align="right" colspan="2">												
												</td>
											</tr>
											<tr height="20">
											  <td align="right"><span>电 话:</span></td>
												<td align="left">
													<span style="font-size:10px;font-weight:bold;"><%=rs("tel")%></span>
												</td>
											</tr>
											<tr height="20" >
											    <td align="right">传 真:</td>
												  <td align="left">
												<span style="font-size:10px; font-weight:bold;"><%=rs("fax")%></span>
												</td>
											</tr>
											
						        </table>
										</td>
									</tr>									
									<%
										end if
										rs.close
										set rs=nothing	
									%>
             </table>
           </td>
			    </tr> 
	      </table>
      </td>
	  </tr>
   </table>
</div>


<!--#include file="foot.asp"-->
