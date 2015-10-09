<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
' 上面这行是软件使用的代码页标记，请不要删除。详情请参考帮助文件。
'
' 档案名称：ta.asp
' 原创作者：Lyn
' 作者邮件：lyn.ma@hotmail.com
' 创建日期：星期六，2010年06月26日 15:46:45
' 版权所有(C)Feng
'--------------------------------------------------------------%>

<HTML>
<HEAD>
	<Title>ta.asp</Title>
	<META http-equiv="Content-Type" content="text/html; charset=gb2312">
	<META name="Generator" content="Asp Studio 1.0">
</HEAD>
<BODY>
<%
If Request.TotalBytes < 1 Then '如果没有数据上传 
response.write "请先选择你要上传的文件！" 
response.End() 
End If 
If Request.TotalBytes > 1024*1024 Then 
response.write "你上传的文件总大小超出了最大限制（1M）" 
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
iFormEnd = oUpFileStream.Size'所有读取的数据大小 
bCrLf = ChrB (13) & ChrB (10)'取得每个项目之间的分隔符 
sSpace = MidB (RequestBinData,1, InStrB (1,RequestBinData,bCrLf)-1)'取得第一个分割线的内容 
iStart = LenB (sSpace) '读取-----------------------------7d71e42c1060a的长度 
iFormStart = iStart+2 '到-----------------------------7d71e42c1060a后的位置 
iInfoEnd = InStrB (iFormStart,RequestBinData,bCrLf & bCrLf)+3'到Content-Disposition: form-data; name="FileName"; filename=""Content-Type: application/octet-stream的位置 
tStream.Type = 1 
tStream.Mode = 3 
tStream.Open 
oUpFileStream.Position = iFormStart 
oUpFileStream.CopyTo tStream,iInfoEnd-iFormStart 
tStream.Position = 0 
tStream.Type = 2 
tStream.CharSet = "gb2312" 
sInfo = tStream.ReadText 
iFindStart = InStr (22,sInfo,"name=""",1)+6 '读取name="的位置，相对sInfo 
iFindEnd = InStr (iFindStart,sInfo,"""",1)'读取name=""的位置,相对sInfo 
sFormName = Mid (sinfo,iFindStart,iFindEnd-iFindStart)'读取name=的内容 
iFindStart = InStr (iFormStart+1,sInfo,"filename=""",1)+10'读取filename="的位置，相对sInfo 
iFindEnd = InStr (iFindStart,sInfo,"""",1)'读取filename=""的位置,相对sInfo 
sFileName = Mid (sinfo,iFindStart,iFindEnd-iFindStart)'读取filename=的内容 
FileName = Mid (sFileName,InStrRev (sFileName, "\")+1)'取得文件名 
FilePath = Left (sFileName,InStrRev (sFileName, "\"))'取得文件路径 
FileExt = Mid (sFileName,InStrRev (sFileName, ".")+1)'取得文件格式 
tStream.Close 
Set tStream = Nothing 

'if sFormName<>"zxtzx" then 
'response.Write "上传错误!" 
'response.End() 
'end if 

'if fileExt<>"jpg" then 
'response.Write "你上传得格式不对~必须是jpg格式的图片" 
'response.End() 
'end if 
iFormStart2 = InStrB (iInfoEnd,RequestBinData,sSpace)-1'读取下一个分割线的位置 
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
response.Write "成功" 
else 
response.Write "上传失败" 
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
