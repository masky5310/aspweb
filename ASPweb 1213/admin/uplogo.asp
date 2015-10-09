<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
' 上面这行是软件使用的代码页标记，请不要删除。详情请参考帮助文件。
'
' 档案名称：uplogo.asp
' 原创作者：Lyn
' 作者邮件：lyn.ma@hotmail.com
' 创建日期：星期日，2010年06月27日 13:57:28
' 版权所有(C)Feng
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