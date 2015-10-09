<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
' 上面这行是软件使用的代码页标记，请不要删除。详情请参考帮助文件。
'
' 档案名称：up.asp
' 原创作者：Lyn
' 作者邮件：lyn.ma@hotmail.com
' 创建日期：星期六，2010年06月26日 09:28:57
' 版权所有(C)Feng
'--------------------------------------------------------------%>

<HTML>
<HEAD>
	<Title>uasdfadsfd</Title>
	<META http-equiv="Content-Type" content="text/html; charset=gb2312">
	<META name="Generator" content="Asp Studio 1.0">
	<script language="javascript" type="text/javascript">
var xmlhttp=false;
function createXmlHttpRequest(){
  xmlhttp=false;
  if (window.XMLHttpRequest){
     xmlhttp=new XMLHttpRequest();	  
     //xmlhttp.overrideMimeType("text/xml");
	  //xmlhttp.overrideMimeType('text/xml');
  }
  else if (window.ActiveXObject){
     try{
        xmlhttp=new ActiveXObject("Msxml2.XMLHTTP");
     }
     catch (e){
       try{
          xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
       }
       catch (e1){
          xmlhttp=false;
       }
     }
  }
}
function check(){
  var form1=document.form1;
  //alert(document.getElementById("file1").value);
  document.getElementById("test").innerText=document.getElementById("file1").value;
  //alert(document.getElementById("test").value);
  createXmlHttpRequest();
  if (xmlhttp){
     xmlhttp.onreadystatechange=ProcessResponse;
     xmlhttp.open("POST","up2.asp",true);
     xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
     xmlhttp.send("file1=" + document.getElementById("file1").value );	 
  }
  else{
    alert("XmlHttpRequest error!")
  }
}
function ProcessResponse(){
  if (xmlhttp.readyState==4){
     if (xmlhttp.status==200){	  
        alert(xmlhttp.responseText;);
     }
     else{
        alert("status:" + xmlhttp.status);
     }
  }
}
</script>
</HEAD>
<BODY>
<form name="form1" action="" method="post" >
<input type="text" id="test" >
<input type="file" name="file1" id="file1"   onchange="check()">
<input type="submit" name="submit" value="Submit">
</form>
</form>
	
</BODY>

</HTML>
