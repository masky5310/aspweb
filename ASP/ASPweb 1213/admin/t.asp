<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
'
' �������ƣ�t.asp
' ԭ�����ߣ�lyn_ma
' �����ʼ���lyn.ma@hotmail.com
' �������ڣ����ڶ���2010��07��27�� 16:01:45
' ��Ȩ����(C)sagemwirless
'--------------------------------------------------------------%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�򵥵��ļ��ϴ�ʾ������ϸ˵��</title>
<style>
BODY {font-size:12px;}
INPUT {font-size:12px;border:1px #dddddd solid;}
.f {font-size:12px;border:1px #dddddd solid;width:300px}
IMG {border:0px;}
</style>
</head>
<body>
<h3>�򵥵��ļ��ϴ�ʾ������ϸ˵��</h3>
<a href="http://www.ii-home.cn"><img src="http://www.ii-home.cn/img/myblog.jpg" /></a>
��ʾ����Anlige������QQ417833272��Email:zhanghuiguoanlige@126.com  
<hr />
<form name="form1" action="?act=upload" method="post" enctype="multipart/form-data">
ѡ�񱾵��ļ�: <input class="f" type="file" name="file1" /> <input type="submit" value="�ύ" />
</form>
<%
if request.querystring("act")="upload" then
dim t_stream,FormName,localname,servername,tdata     '�������
tdata=request.binaryread(request.totalbytes)
call getdata(tdata)                                  '�������庯����������
response.write "<b>�ɹ��ϴ��ļ���������!</b><br />"
response.write "����:<font color=green>"&FormName&"</font><br />"
response.write "�����ļ���:<font color=green>"&localname&"</font><br />"
response.write "�������ļ���:<font color=green>"&server.mappath(servername)&"</font><br />"
response.write "<a href="""&servername&""">���ļ�</a>"
end if
%>
</body>
</html>

<%
'������:getdata
'����:tempdata-������Ķ���������,�ɿͻ����ύ�õ�
'����:����ͻ����ύ��������
Function getdata(tempdata)
  set t_stream=server.createobject("adodb.stream")   '��ʼ��stream����
  t_stream.type=1                                    '��������ģʽΪ������
  t_stream.mode=3                                    '���ö�дģʽΪ����д
  t_stream.open                                      '��stream����
  t_stream.write tempdata                            'д���û��ύ�����ݣ�д���ļ���
  bcrlf=chrb(13)&chrb(10)                            '���з�
  fpos=instrb(1,tempdata,bcrlf)                      '�ҵ���һ�����з�λ��
  sSplit=midb(tempdata,1,fpos-1)                     '�õ����ݷָ��־
  slen=lenb(ssplit)                                  '�õ����ݷָ��־�ĳ���
  istart=slen+2                                      '����ʼλ��
  formend=instrb(istart,tempdata,bcrlf&bcrlf)        '��ñ��Ľ���λ��
  formhead=midb(tempdata,istart,formend-istart)      '��ñ���ص��ı�����
  str=bytes2str(formhead)                            '������������ת��Ϊ�ı�
  startpos=instr(str,"name=""")+6                    '���ұ����Ŀ�ʼλ�ã�ΪʲôҪ+6?name="����6���ַ���
  endpos=instr(startpos,str,"""")                    '���ұ����Ľ���λ��
  FormName=mid(str,startpos,endpos-startpos)         '��ñ���
  startpos=instr(str,"filename=""")+10               '��ñ����ļ�·���Ŀ�ʼλ�ã�+10������ԭ��һ��
  endpos=instr(startpos,str,"""")                    '��ñ����ļ�·���Ľ���λ��
  filename=mid(str,startpos,endpos-startpos)         '��ñ����ļ�·��
  localname=filename                                 '���汾���ļ�·��������
  filename=mid(filename,instrrev(filename,"\")+1)    '��ñ����ļ���
  fileExe=split(filename,".")(1)                     '����ļ���׺
  valueend=instrb(formend+3,tempdata,sSplit)         '����ļ����ݵĽ���λ��
  newname=getRndName()                               '���ú��������漴�ִ�
  newname=newname&"."&fileExe                        '���Ӻ�׺�������ļ���,�Ժ󱣴浽��������
  servername="/admin/products_pic/"&newname          '�������ļ���������
  call savf(servername,formend+3,valueend-formend-6)    '���ú��������ļ�
  t_stream.close                                     '�ر�stream����
  set t_stream=nothing                               '����stream����
End Function

'������:savf
'����:fname-�Ա�����Ϊ�ļ������浽��������pos-Ҫ�����ļ����������ڵ�λ��,siz-Ҫ���������С(Ҳ�����ļ���С)
'����:�����ļ�
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

'������:bytes2str
'����:byt-��ת���Ķ���������
'����:������������ת��Ϊ�ı�
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

'������:getRndName
'����:��
'����:����ʱ����һ���漴�ִ�
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