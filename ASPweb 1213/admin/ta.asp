<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
' �������������ʹ�õĴ���ҳ��ǣ��벻Ҫɾ����������ο������ļ���
'
' �������ƣ�ta.asp
' ԭ�����ߣ�Lyn
' �����ʼ���lyn.ma@hotmail.com
' �������ڣ���������2010��06��26�� 15:46:45
' ��Ȩ����(C)Feng
'--------------------------------------------------------------%>

<HTML>
<HEAD>
	<Title>ta.asp</Title>
	<META http-equiv="Content-Type" content="text/html; charset=gb2312">
	<META name="Generator" content="Asp Studio 1.0">
</HEAD>
<BODY>
<%
If Request.TotalBytes < 1 Then '���û�������ϴ� 
response.write "����ѡ����Ҫ�ϴ����ļ���" 
response.End() 
End If 
If Request.TotalBytes > 1024*1024 Then 
response.write "���ϴ����ļ��ܴ�С������������ƣ�1M��" 
response.End() 
End If 

call upload 

sub upload() 
dim bCrLf,sSpace,iStart ,iInfoEnd,iFormStart,iFindStart ,iFindEnd,sFileName,FileName,FilePath, FileExt 
Set tStream = Server.CreateObject ("ADODB.Stream") 
Set oUpFileStream = Server.CreateObject ("ADODB.Stream") 
oUpFileStream.Type = 1 
oUpFileStream.Mode = 3 
oUpFileStream.Open 
oUpFileStream.Write Request.BinaryRead (Request.TotalBytes) 
oUpFileStream.Position = 0 
RequestBinData = oUpFileStream.Read 
iFormEnd = oUpFileStream.Size'���ж�ȡ�����ݴ�С 
bCrLf = ChrB (13) & ChrB (10)'ȡ��ÿ����Ŀ֮��ķָ��� 
sSpace = MidB (RequestBinData,1, InStrB (1,RequestBinData,bCrLf)-1)'ȡ�õ�һ���ָ��ߵ����� 
iStart = LenB (sSpace) '��ȡ-----------------------------7d71e42c1060a�ĳ��� 
iFormStart = iStart+2 '��-----------------------------7d71e42c1060a���λ�� 
iInfoEnd = InStrB (iFormStart,RequestBinData,bCrLf & bCrLf)+3'��Content-Disposition: form-data; name="FileName"; filename=""Content-Type: application/octet-stream��λ�� 
tStream.Type = 1 
tStream.Mode = 3 
tStream.Open 
oUpFileStream.Position = iFormStart 
oUpFileStream.CopyTo tStream,iInfoEnd-iFormStart 
tStream.Position = 0 
tStream.Type = 2 
tStream.CharSet = "gb2312" 
sInfo = tStream.ReadText 
iFindStart = InStr (22,sInfo,"name=""",1)+6 '��ȡname="��λ�ã����sInfo 
iFindEnd = InStr (iFindStart,sInfo,"""",1)'��ȡname=""��λ��,���sInfo 
sFormName = Mid (sinfo,iFindStart,iFindEnd-iFindStart)'��ȡname=������ 
iFindStart = InStr (iFormStart+1,sInfo,"filename=""",1)+10'��ȡfilename="��λ�ã����sInfo 
iFindEnd = InStr (iFindStart,sInfo,"""",1)'��ȡfilename=""��λ��,���sInfo 
sFileName = Mid (sinfo,iFindStart,iFindEnd-iFindStart)'��ȡfilename=������ 
FileName = Mid (sFileName,InStrRev (sFileName, "\")+1)'ȡ���ļ��� 
FilePath = Left (sFileName,InStrRev (sFileName, "\"))'ȡ���ļ�·�� 
FileExt = Mid (sFileName,InStrRev (sFileName, ".")+1)'ȡ���ļ���ʽ 
tStream.Close 
Set tStream = Nothing 

'if sFormName<>"zxtzx" then 
'response.Write "�ϴ�����!" 
'response.End() 
'end if 

'if fileExt<>"jpg" then 
'response.Write "���ϴ��ø�ʽ����~������jpg��ʽ��ͼƬ" 
'response.End() 
'end if 
iFormStart2 = InStrB (iInfoEnd,RequestBinData,sSpace)-1'��ȡ��һ���ָ��ߵ�λ�� 
FileSize=iFormStart2 -iInfoEnd 
filename="test.jpg"'Year(Now)&Month(Now)&Day(Now)&Hour(Now)&Minute(Now)&Second(Now)&"."&FileExt
response.write(filename)
Set oFileStream = CreateObject ("ADODB.Stream") 
oFileStream.Type = 1 
oFileStream.Mode = 3 
oFileStream.Open 
oUpFileStream.Position = iInfoEnd 
oUpFileStream.CopyTo oFileStream,FileSize 
oFileStream.SaveToFile Server.mappath("products_pic/"&FileName) ,2 
if err=0 then 
response.Write "�ɹ�" 
else 
response.Write "�ϴ�ʧ��" 
end if 
oFileStream.Close 
Set oFileStream = Nothing 

oUpFileStream.Close 
Set oUpFileStream = Nothing 
end sub 



		
%>

<form action="" method="post"  enctype="multipart/form-data">

<input type="file" name="upfile">
<input type="submit" name="submit" value="Submit">
</form>
	
</BODY>

</HTML>
