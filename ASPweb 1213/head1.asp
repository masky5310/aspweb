
<!--#include file="head.asp"-->

<div id="content">
	<div class="cont_left">
	<table width="240" border="0" cellspacing="0" cellpadding="0" id="cont_left_table">
	<tr>
		<td height="25">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" >
			<tr>
				<td align="left" valign="top" style="background:url(theme/img/bt_jt.gif) #D51111 no-repeat 4px 8px; padding-left:15px; padding-top:2px;">最新案例</td>
			    <td align="right" valign="top" style="background:#D51111;padding-right:15px; padding-top:1px; font-size:11px;">
				<a href="news.asp" target="_self" class="link1">More&gt;&gt;</a>
			    </td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="left" valign="top" height="100"> 
			<div id="demo" style="overflow:hidden;height:100px;width:100%;">
				<div id="demo1"> 
					<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
						<%  	
						set rs=server.CreateObject("adodb.recordset")
						sql="select * from news order by datetime desc "
						rs.open sql,conn,1,1
						if rs.eof and rs.bof then
							response.write"<td width='100%' height='50' colspan='2'>没有查询到相关数据<td>"
			   			else
			   				do while not rs.eof
						%>		
							<td width="61%" height="25">
								<a href="news.asp?id=<%=rs("id")%>" title="<%=rs("title")%>" >
								<%
								if len(rs("title"))>=10 then
								%>			
								<span><%=left(rs("title"),10)&"..."	%></span>
								<%			
								else
								%>
								<span><%=rs("title")%></span>
								<%	
								end if	%>
								</a>
							</td>
							<td width="39%" style="font-size:11px;" >[<%=FormatDateTime(rs("datetime"),2)%>]</td>
						</tr>
						 <%
							rs.movenext  
							loop
							end if		
 						 %>  
					</table> 
				</div>
				<div id="demo2"></div>
			</div>
			<script> 
				var speed=60 //数字越大滚动得越慢
				demo2.innerHTML=demo1.innerHTML
				function Marquee(){
				if(demo2.offsetTop-demo.scrollTop<=0)
				demo.scrollTop-=demo1.offsetHeight
				else{
				demo.scrollTop++
				}
				}
				var MyMar=setInterval(Marquee,speed)
				demo.onmouseover=function() {clearInterval(MyMar)}
				demo.onmouseout=function() {MyMar=setInterval(Marquee,speed)}
				</script>
 
		</td>
	</tr>
	<tr>
		<td height="20">
			<table width="240" border="0" cellspacing="0" cellpadding="0" style="height:20px;color:#fff; border-top:#f00 1px solid;">
			<tr>
				<td align="left" valign="top" style="background:url(theme/img/bt_jt.gif) #698cc3 no-repeat 4px 8px; padding-left:15px; padding-top:2px;">成功案例</td>
				<td align="right" valign="top" style="background:#698cc3;padding-right:10px; padding-top:1px; font-size:11px;"><a href="case.asp" target="_self" class="link1">More&gt;&gt;</a></td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="210" valign="top"> 
			<div id="demou" style="overflow:hidden;height:210px;width:100%;">
			    <div id="demo1u"> 
				<%	 	
				 set rs=server.CreateObject("adodb.recordset")
				 sql="select * from cases order by datetime desc "
				 rs.open sql,conn,1,1
				 if rs.eof and rs.bof then
					response.write"<tr><td width='100%' height='50'>没有查询到相关数据<td></tr>"
				 else
				 do while not rs.eof
				%>	
				<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td align="center" valign="top" style=" padding-top:30px">
						<div class="case_home">
							<a href="#" target="_blank"><img src=<%=rs("custom_logo_path")%> width="115" height="77" border="0"></a>
						</div>
					</td>
				</tr>
				<tr>
					<td align="left" valign="top" height="70">
					&nbsp;&nbsp;客户名称:<a href="#" target="_blank"><%=rs("custom_name")%></a><br />
					&nbsp;&nbsp;所属行业:<%=rs("biz_type")%><br />
					&nbsp;&nbsp;顾问项目:<%=rs("project_name")%>
					</td>
				</tr>
				</table> 
				<%
				rs.movenext  
				loop
				end if				
 				%>  
			    </div>
				<div id="demo2u"></div>
			</div>
			<script> 
				var speedu=60;//数字越大滚动得越慢
				var demou=document.getElementById("demou");
				var demo1u=document.getElementById("demo1u");
				var demo2u=document.getElementById("demo2u");
				demo2u.innerHTML=demo1u.innerHTML;
				function Marqueeu(){
				if(demo2u.offsetTop-demou.scrollTop<=0)
				demou.scrollTop-=demo1u.offsetHeight
				else{
				demou.scrollTop++
				 }
				}
				var MyMaru=setInterval(Marqueeu,speedu);
				demou.onmouseover=function() {clearInterval(MyMaru)};
				demou.onmouseout=function() {MyMaru=setInterval(Marqueeu,speedu)};
			</script> 		
		</td>
    </tr>
	<tr>
		<td align="center" valign="top" style="padding-bottom:5px;">
		<table width="240" border="0" cellspacing="0" cellpadding="0" style="height:20px;color:#fff; border-top:#f00 1px solid;">
			<tr>
				<td align="center" valign="top" style="background:url(theme/img/bt_jt.gif) #e27907 no-repeat 4px 8px; color:#000;font-size:11px;">
					<a href="contact.asp"><span style="COLOR: #000000">联系我们</span></a>
				</td>	
				<td align="right" valign="top" style="background:#e27907;padding-right:10px; padding-top:1px; font-size:11px;">
					<a href="contact.asp" target="_self" class="link1">More&gt;&gt;</a>
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<%
					set rs=server.CreateObject("adodb.recordset")
					sql="select top 1 * from resume"
					rs.open sql,conn,1,1
					if rs.RecordCount=1 then														
	%>	
	<tr>
		<td align="left" valign="top" style="background:url(theme/img/bt_jt.gif) no-repeat 4px 8px;" colspan="2">
			<br/>
			<table width="100%">
				<!--<tr width="100%">
					<td  colspan="2"><b>&nbsp;在线业务咨询:</b>
					</td>					
				</tr>-->
				<tr width="100%">
					<td  align="center">QQ咨询:</td>
					<td >
					   <a target=blank href=tencent://message/?uin=<%=rs("qq")%>&Site=index.asp&Menu=yes>
					   <!--<img border="0" SRC=http://wpa.qq.com/pa?p=1:<%=rs("qq")%>:3 alt="点击这里给我发消息" >-->
						<img src="theme/img/qq.gif" alt="点击这里给我发消息" border="0"/>在线咨询
						</a>
					</td>
				</tr>
				<tr>
					<td width="30%" align="center">淘宝旺旺:</td>
				    <td>
					    <a target="_blank" href="http://amos1.taobao.com/msg.ww?v=2&uid=<%=rs("taobao")%>=1" >
						<!--<img border="0" src="http://amos1.taobao.com/online.ww?v=2&uid=cardlanok=1" alt="点击这里给我发消息" />-->
						<img src="theme/img/alibaba.gif" alt="点击这里给我发消息" border="0"/>在线咨询
						</a>
					</td>
				</tr>
				<tr>
					<td width="30%" align="center">Skype:</td>
					<td>
					   <a href="skype:mengsajewel?call" onclick="return skypeCheck();">
					    <!--<img src=http://mystatus.skype.com/smallclassic/<%=rs("skype")%> style="border: none;" alt="Call me!" />-->
						  <img src="theme/img/skype.gif" alt="点击这里给我发消息" border="0"/>在线咨询
						 </a>
					</td>
				</tr>
				<tr>
					<td width="30%" align="center">E-mail:</td>
					<td>
					   <a href="mailto:<%=rs("email")%>">
					    <!--<img src=http://mystatus.skype.com/smallclassic/<%=rs("skype")%> style="border: none;" alt="Call me!" />-->
						  <img src="theme/img/pic_email.gif" alt="点击这里给我发邮件" border="0"/> 邮件咨询
						 </a>
					</td>
				</tr>
				<tr>
					<td width="30%" align="center">联系人:</td>
					<td>	
						&nbsp;<span><%=rs("contacter")%></span>
						</td>	
				</tr>
				<tr>
					<td width="30%" align="center">电 &nbsp;话:</td>
					<td>
						&nbsp;<span><%=rs("tel")%></span>
						</td>	
				</tr>
				 <tr>
						<td width="30%" align="center">传 &nbsp;真:</td>
					  <td>
						&nbsp;<span><%=rs("fax")%></span>
						</td>	
				</tr>
				<tr>
					<td width="30%" align="center">手 &nbsp;机:</td>
					<td>	
						&nbsp;<span><%=rs("cell")%></span>
						</td>	
				</tr>			 
			</table>
		</td>	
	</tr>
	
	<!--<tr>
		<td  align="left" valign="top" style="background:url(theme/img/bt_jt.gif) no-repeat 4px 8px;" colspan="2">
				&nbsp;&nbsp;E-mail：<%=rs("email")%><br>
		</td>	
	</tr>-->
		<%
			end if
			rs.close
			set rs=nothing	
		%>
    </table> 
	</div>
