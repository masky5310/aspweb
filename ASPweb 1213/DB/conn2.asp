<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
'
' �������ƣ�conn2.asp
' ԭ�����ߣ�lyn_ma
' �����ʼ���lyn.ma@hotmail.com
' �������ڣ������壬2010��06��25�� 15:36:45
' ��Ȩ����(C)sagemwirless
'--------------------------------------------------------------%>

<%
set conn=server.createobject("adodb.connection")
		connstr="Provider=Microsoft.jet.oledb.4.0;Jet OLEDB:Database Password=masky5310;data source="&server.mappath("../db/data.mdb")
		conn.open connstr		
%>