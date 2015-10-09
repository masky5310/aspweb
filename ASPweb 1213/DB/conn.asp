<%
set conn=server.createobject("adodb.connection")
connstr="Provider=Microsoft.jet.oledb.4.0;Jet OLEDB:Database Password=masky5310;data source="&server.mappath("db/data.mdb") 'Jet OLEDB:Database Password=masky5310;
conn.open connstr ',"Admin","masky5310"
%>