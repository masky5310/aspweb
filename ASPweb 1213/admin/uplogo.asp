<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
' �������������ʹ�õĴ���ҳ��ǣ��벻Ҫɾ����������ο������ļ���
'
' �������ƣ�uplogo.asp
' ԭ�����ߣ�Lyn
' �����ʼ���lyn.ma@hotmail.com
' �������ڣ������գ�2010��06��27�� 13:57:28
' ��Ȩ����(C)Feng
'--------------------------------------------------------------%>

<%
   filepath=Request.Form("filepath")
  'Response.Write(file1)
  'response.write("<script language='javascript'>alert('3 filepath="&filepath&" in uploag.asp line 15');</script>")
  set objStream=Server.CreateObject("ADODB.Stream")
  objStream.Type=1
  objStream.Open
  objStream.LoadFromFile filepath

  path=Right(filepath,Len(filepath)-InStrRev(filepath,"\"))
  ext=Right(filepath,Len(filepath)-InStrRev(filepath,"."))
  path=getRndName()&"."&ext
  
  objStream.SaveToFile Server.MapPath("products_pic/"&path),2
  objStream.Close
  set objStream=Nothing

  Response.Write(path)
  
  
  Function getRndName()
    dim y,m,d,h,mm,s,r
    Randomize()
    y=year(now)
    m=month(now):if m<10 then m="0"&m
    d=day(now):if d<10 then d="0"&d
    h=hour(now):if h<10 then h="0"&h
    mm=minute(now):if mm<10 then mm="0"&mm
    s=second(now):if s<10 then s="0"&s
    r=cint(rnd()*10):if r<10 then r="0"&r
    getRndName=y&m&d&h&mm&s&r
End Function
%>