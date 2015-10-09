<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
'
' 档案名称：conn2.asp
' 原创作者：lyn_ma
' 作者邮件：lyn.ma@hotmail.com
' 创建日期：星期五，2010年06月25日 15:36:45
' 版权所有(C)sagemwirless
'--------------------------------------------------------------%>

<%
set conn=server.createobject("adodb.connection")
		connstr="Provider=Microsoft.jet.oledb.4.0;Jet OLEDB:Database Password=masky5310;data source="&server.mappath("../db/data.mdb")
		conn.open connstr		
%>