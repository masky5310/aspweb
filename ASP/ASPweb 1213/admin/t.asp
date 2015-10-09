<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
'
' 档案名称：t.asp
' 原创作者：lyn_ma
' 作者邮件：lyn.ma@hotmail.com
' 创建日期：星期二，2010年07月27日 16:01:45
' 版权所有(C)sagemwirless
'--------------------------------------------------------------%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>简单的文件上传示例及详细说明</title>
<style>
BODY {font-size:12px;}
INPUT {font-size:12px;border:1px #dddddd solid;}
.f {font-size:12px;border:1px #dddddd solid;width:300px}
IMG {border:0px;}
</style>
</head>
<body>
<h3>简单的文件上传示例及详细说明</h3>
<a href="http://www.ii-home.cn"><img src="http://www.ii-home.cn/img/myblog.jpg" /></a>
本示例由Anlige制作，QQ417833272，Email:zhanghuiguoanlige@126.com  
<hr />
<form name="form1" action="?act=upload" method="post" enctype="multipart/form-data">
选择本地文件: <input class="f" type="file" name="file1" /> <input type="submit" value="提交" />
</form>
<%
if request.querystring("act")="upload" then
dim t_stream,FormName,localname,servername,tdata     '定义变量
tdata=request.binaryread(request.totalbytes)
call getdata(tdata)                                  '调用主体函数处理数据
response.write "<b>成功上传文件到服务器!</b><br />"
response.write "表单名:<font color=green>"&FormName&"</font><br />"
response.write "本地文件名:<font color=green>"&localname&"</font><br />"
response.write "服务器文件名:<font color=green>"&server.mappath(servername)&"</font><br />"
response.write "<a href="""&servername&""">打开文件</a>"
end if
%>
</body>
</html>

<%
'函数名:getdata
'参数:tempdata-待处理的二进制数据,由客户端提交得到
'作用:处理客户端提交来的数据
Function getdata(tempdata)
  set t_stream=server.createobject("adodb.stream")   '初始化stream对象
  t_stream.type=1                                    '设置数据模式为二进制
  t_stream.mode=3                                    '设置读写模式为读和写
  t_stream.open                                      '打开stream对象
  t_stream.write tempdata                            '写入用户提交的数据，写入文件用
  bcrlf=chrb(13)&chrb(10)                            '换行符
  fpos=instrb(1,tempdata,bcrlf)                      '找到第一个换行符位置
  sSplit=midb(tempdata,1,fpos-1)                     '得到数据分割标志
  slen=lenb(ssplit)                                  '得到数据分割标志的长度
  istart=slen+2                                      '表单开始位置
  formend=instrb(istart,tempdata,bcrlf&bcrlf)        '获得表单的结束位置
  formhead=midb(tempdata,istart,formend-istart)      '获得表单相关的文本内容
  str=bytes2str(formhead)                            '将二进制内容转换为文本
  startpos=instr(str,"name=""")+6                    '查找表单名的开始位置，为什么要+6?name="正好6个字符长
  endpos=instr(startpos,str,"""")                    '查找表单名的结束位置
  FormName=mid(str,startpos,endpos-startpos)         '获得表单名
  startpos=instr(str,"filename=""")+10               '获得本地文件路径的开始位置，+10和上面原理一样
  endpos=instr(startpos,str,"""")                    '获得本地文件路径的结束位置
  filename=mid(str,startpos,endpos-startpos)         '获得本地文件路径
  localname=filename                                 '保存本地文件路径到变量
  filename=mid(filename,instrrev(filename,"\")+1)    '获得本地文件名
  fileExe=split(filename,".")(1)                     '获地文件后缀
  valueend=instrb(formend+3,tempdata,sSplit)         '获得文件数据的结束位置
  newname=getRndName()                               '调用函数生成随即字串
  newname=newname&"."&fileExe                        '连接后缀生成新文件名,以后保存到服务器用
  servername="/admin/products_pic/"&newname          '保存新文件名到变量
  call savf(servername,formend+3,valueend-formend-6)    '调用函数保存文件
  t_stream.close                                     '关闭stream对象
  set t_stream=nothing                               '销毁stream对象
End Function

'函数名:savf
'参数:fname-以本参数为文件名保存到服务器，pos-要保存文件内容在流内的位置,siz-要保存的流大小(也就是文件大小)
'作用:保存文件
Function savf(fname,pos,siz)
    dim mystream
    set mystream=server.createobject("adodb.stream")
    mystream.type=1
    mystream.mode=3
    mystream.open
    t_stream.position=Pos
    t_stream.CopyTo mystream,siz
	 ' response.Write server.mappath("/admin/products_pic/")
	 ' response.Write server.mappath("/admin/products_pic/")&fname
	 'response.Write server.mappath("/admin/products_pic/"&fname)
		
    mystream.savetofile server.mappath(fname)
    mystream.close
    set mystream=nothing
End Function

'函数名:bytes2str
'参数:byt-待转换的二进制数据
'作用:将二进制数据转换为文本
Function bytes2str(byt)
    if lenb(byt)=0 then
    bytes2str=""
    exit function
    end if
    dim mystream
    set mystream=server.createobject("adodb.stream")
    mystream.type=2
    mystream.mode=3
    mystream.open
    mystream.writetext byt
    mystream.position=0
    mystream.charset="gb2312"
    mystream.position=2
    bstr=mystream.readtext()
    mystream.close
    set mystream=nothing
    bytes2str=bstr
End Function

'函数名:getRndName
'参数:无
'作用:根据时间获得一个随即字串
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