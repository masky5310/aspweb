<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
'
' �������ƣ�AddCase.asp
' ԭ�����ߣ�lyn_ma
' �����ʼ���lyn.ma@hotmail.com
' �������ڣ������壬2010��06��25�� 16:32:11
' ��Ȩ����(C)sagemwirless
'--------------------------------------------------------------%>

<!--#include file="../db/conn2.asp"-->

<HTML>
<HEAD>
	<Title>AddCase.asp</Title>
	<META http-equiv="Content-Type" content="text/html; charset=gb2312">
	<META name="Generator" content="Asp Studio 1.0">
	
	<script language="javascript" type="text/javascript">
var xmlhttp=false;
function createXmlHttpRequest(){
  xmlhttp=false;
  if (window.XMLHttpRequest){
     xmlhttp=new XMLHttpRequest();	  
     //xmlhttp.overrideMimeType("text/xml");	
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
function uplogo(){
  var form1=document.form1;  
  createXmlHttpRequest();
  if (xmlhttp){
     xmlhttp.onreadystatechange=ProcessResponse;
     xmlhttp.open("POST","uplogo.asp",true);
     xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
     xmlhttp.send("filepath=" + document.getElementById("custom_logo_path").value );	 
  }
  else{
    alert("XmlHttpRequest error!")
  }
}

var http_request = false;
function send_request(method,url,content,responseType,callback){
alert(content);
 http_request = false;
 if(window.XMLHttpRequest){
  http_request = new XMLHttpRequest();
  if(http_request.overrideMimeType){
   http_request.overrideMimeType("text/xml");
  }
 }
 else if(window.ActiveXObject){
  try{
   http_request = new ActiveXObject("Msxml2.XMLHTTP");
   }catch(e){
    try{
     http_request = new ActiveXObject("Microsoft.XMLHTTP");
    }catch(e){}
    }
 }
 if(!http_request){
  window.alert("���ܴ���xmlhttprequest����ʵ��!");
  return false;
  }
 if(responseType.toLowerCase() == "text"){
  http_request.onreadystatechange = callback;
  }
 else if(responseType.toLowerCase() == "xml"){
  http_request.onreadystatechange = callback;
  }
 else{
  window.alert("��Ӧ����������!");
  return false;
  }
 if(method.toLowerCase() == "get"){
  http_request.open(method,url,true);
  }
 else if(method.toLowerCase() == "post"){
  http_request.open(method,url,true);
  http_request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
  }
 else{
  window.alert("http��������������!");
  return false;
  }
 http_request.send(content);
} 

function ProcessResponse(){
  alert(xmlhttp.readyState+" response!!!");
  if (xmlhttp.readyState==4){
     if (xmlhttp.status==200){	  
		     //alert(xmlhttp.responseText);			  
		     var filename=document.getElementById("filename");
				  filename.value=xmlhttp.responseText;
				  
				  alert("Logo"+filename.value+"ͼƬ�ϴ��ɹ�");
     }
     else{
        alert("error status:" + xmlhttp.status);
     }
  }
}

function ProcessResponse_new(){
  alert(http_request.readyState+" response!!!");
  if (http_request.readyState==4){
     //if (http_request.status==200){	  
		     //alert(xmlhttp.responseText);			  
		     var filename=document.getElementById("filename");
				  filename.value=http_request.responseText;
				  
				  alert("Logo<"+filename.value+">ͼƬ�ϴ��ɹ�");
    // }
    // else{
    //    alert("error status:" + http_request.status);
    // }
  }
}
function uplogo_new()
{
  var content="filepath=" + document.getElementById("custom_logo_path").value;
  alert(content);
	send_request("POST","uplogo.asp",content,"text",ProcessResponse_new);
}

</script>
</HEAD>
<BODY>
<%
dim submit,custom_name,biz_type,project_name,custom_logo_path

submit=Request.Form("submit")

if submit<> "" then
    custom_name=Request.Form("custom_name")
		biz_type=Request.Form("biz_type")
		project_name=Request.Form("project_name")
		
		filename=Trim(Request.Form("filename"))
		custom_logo_path="admin\products_pic\"&filename
		
	 if custom_name ="" or biz_type="" or project_name =""or custom_logo_path ="" then
			response.Write("<script language=javascript>alert('���ݲ�����!������!');history.go(-1)</script>")
	 else	  
	  set rs=server.createobject("adodb.recordset") 
		sql="select * from cases" 
		rs.open sql,conn,1,3 
		rs.addnew 

		rs("custom_name")=custom_name
		rs("biz_type")=biz_type
		rs("project_name")=project_name
		rs("custom_logo_path")=custom_logo_path	 

    rs.update 
	  rs.close 
	  set rs=nothing 
	  conn.close 
	  set conn=nothing 
	  response.write("<script language='javascript'>alert('�������ӳɹ�!');parent.location.reload();window.close();</script>")
	end if
end if

%>
<form action="#" method="post" name="form1">
 <table  width="100%" border="1" cellspacing="1" cellpadding="5" style="border:#DFDFDF 1px solid; padding:25px 12px 15px 12px; background:#FDFDFD; ">
				<tr ><td  width="100%" colspan="2"align="center" style= "border:#E1E1E1 1px solid;"><b>�� �� �� ҵ �� ��</b></td></tr>
				<tr><td width="40%" align="center" style= "border:#E1E1E1 1px solid;">���ͻ�����:</td><td  align="left" style= "border:#E1E1E1 1px solid;"><input type="text" size="40" name="custom_name"></td></tr>
				<tr><td width="40%" align="center" style= "border:#E1E1E1 1px solid;">��������ҵ:</td><td  align="left" style= "border:#E1E1E1 1px solid;"><input type="text" size="40" name="biz_type"></td></tr>
				<tr><td width="40%" align="center" style= "border:#E1E1E1 1px solid;">����Ŀ����:</td><td  align="left" style= "border:#E1E1E1 1px solid;"><input type="text" size="40" name="project_name"></td> </td></tr>
				<tr><td width="40%" align="center" style= "border:#E1E1E1 1px solid;">���ͻ�Logo:</td>
				     <td  align="left" style= "border:#E1E1E1 1px solid;">
				     <input type="file" size="50" name="custom_logo_path"  id="custom_logo_path" onchange="uplogo_new()"><input  type="hidden" name="filename" id="filename">
					  </td>
				</tr>
				<tr width="100%">
				    <td   colspan="2" align="center" style= "border:#E1E1E1 1px solid;">
					    <input type="submit" name="submit" value="���Ӱ���"  icon='icon-add'>&nbsp;&nbsp;&nbsp;&nbsp;
						  <input type="reset" name="cancel" value="ȡ������" icon='icon-reset'> 
						</td>
				</tr>					 
 </table>	 
</form>	
</BODY>
</HTML>