<%'---------------------------------------------------------------
' AspStudio_Codepage="936"
' �������������ʹ�õĴ���ҳ��ǣ��벻Ҫɾ����������ο������ļ���
'
' �������ƣ�modicase.asp
' ԭ�����ߣ�Lyn
' �����ʼ���lyn.ma@hotmail.com
' �������ڣ���������2010��06��26�� 09:05:28
' ��Ȩ����(C)Feng
'--------------------------------------------------------------%>

<!--#include file="../db/conn2.asp"-->

<HTML>
<HEAD>
	<Title>modicase.asp</Title>
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
function ProcessResponse(){
  alert(xmlhttp.readyState+" response!!! in case.asp line55");
  if (xmlhttp.readyState==4){
     //if (xmlhttp.status==200){	  
        
		     alert(xmlhttp.responseText);
			  
		     var filename=document.getElementById("filename");
				  filename.value=xmlhttp.responseText;
				  
				  alert("Logo<"+filename.value+">ͼƬ�ϴ��ɹ�");
     //}
     //else{
     //   alert("error status:" + xmlhttp.status);
     //}
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

function uplogo_new()
{
  var content="filepath=" + document.getElementById("custom_logo_path").value;
  alert(content);
	//send_request("POST","uplogo.asp",content,"xml",ProcessResponse);
	send_request("POST","uplogo.asp",content,"xml",ProcessResponse_new);
}
</script>
</HEAD>
<BODY>
<form action="#" method="post" name="form1">
<%
 dim submit,custom_name,biz_type,project_name,custom_logo_path,oldpath
 
 submit=Request.Form("submit") 
 if submit<> "" then  
   
	  id=Request.Form("id")
	  action=Request.Form("action")
	  custom_name=Request.Form("custom_name")
		biz_type=Request.Form("biz_type")
		project_name=Request.Form("project_name")
		
		filename=Trim(Request.Form("filename"))
		'response.write("1 filename="&filename)
		response.write("<script language='javascript'>alert('1 filename="&filename&"');</script>")
		
		custom_logo_path="admin\products_pic\"&filename
		'response.write("2 custom_logo_path="&custom_logo_path)
		response.write("<script language='javascript'>alert('2 custom_logo_path="&custom_logo_path&"');</script>")
				
		oldpath=Request.Form("oldpath")	
		'response.write("3 oldpath="&oldpath)
		response.write("<script language='javascript'>alert('3 oldpath="&oldpath&"');</script>")
		
	  set rs=server.createobject("adodb.recordset") 
		sql="select custom_name,biz_type,project_name,custom_logo_path from cases where id="&id 
		rs.open sql,conn,1,3 	

		rs("custom_name")=custom_name
		rs("biz_type")=biz_type
		rs("project_name")=project_name
		
		if custom_logo_path ="" then
			rs("custom_logo_path")=oldpath	 
    else
			rs("custom_logo_path")=custom_logo_path	 
		end if		
		
		response.write("<script language='javascript'>alert('4 custom_logo_path="&custom_logo_path&"');</script>")
		
    rs.update 
	  rs.close 
	  set rs=nothing 
	  conn.close 
	  set conn=nothing 
	  response.write("<script language='javascript'>alert('�����޸ĳɹ�!');window.location.href='manacases.asp';</script>")
	  
else
	  
	  dim id,action
		id=Request.QueryString("id")
		action=Request.QueryString("action")
		
		if id<>"" or action <>"" then			
		  set rs=Server.CreateObject("adodb.recordset")
			sql="select * from cases where id="&id
			rs.Open sql,conn,1,3				
      if action="modify" then			
		
		%>
		
		 <table width="100%">
		   <tr><td  width="100%" colspan="2" align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;""><span>������Ϣ�޸�</span> </td></tr>
			 <tr><td   style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;"><span>�ͻ�����:</span></td><td><input type="text" size=50 value=<%=rs("custom_name")%> name="custom_name"></td></tr>
			 <tr><td  style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;"><span>������ҵ:</span></td><td><input type="text" size=50 value=<%=rs("biz_type")%> name="biz_type"></td></tr>
			 <tr><td  style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;"><span>��Ŀ����:</span></td><td><input type="text" size=50 value=<%=rs("project_name")%> name="project_name"></td></tr>
			 <tr><td  style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;"><span>��Logo:</span></td><td><img src="<%="../"&rs("custom_logo_path")%>" name="oldpath"></td></tr>
			 <tr><td  style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;"><span>��Logo:</span></td><td><input type="file" size=50 value=<%=rs("custom_logo_path")%> name="custom_logo_path" id="custom_logo_path" onchange="uplogo_new()"><input  type="hidden" name="filename" id="filename"></td></tr>
			 <tr><td   colspan="2" align="center" style="padding:5px; border:#E1E1E1 1px solid; background:#F4F3F3;"><input icon='icon-edit' type="submit" name="submit" value="�� ��">&nbsp;&nbsp;&nbsp;&nbsp;<input name="cancel" type="reset" value="ȡ ��" icon='icon-reset'></td></tr>
		</table>
	  <input type="hidden" value="<%=Request.QueryString("id")%>" name="id">
	  <input type="hidden" value="<%=Request.QueryString("action")%>" name="action">
		<%
		 else 
		  rs.Delete()
		  rs.Update()
		  response.Write("<script language=javascript>alert('����ɾ���ɹ�!');window.location.href='ManaCases.asp';</script>")
		 end if
		 %>
		<%
		else 	
		  response.Write("<script language=javascript>alert('û����Ӧ����!');window.location.href='ManaCases.asp';</script>")
		end if
 end if 		
		%>		
</form>
	
</BODY>

</HTML>
