/*---------------------------------------------------------------
// AspStudio_Codepage="936"
//
// �������ƣ�test.js
// ԭ�����ߣ�lyn_ma
// �����ʼ���lyn.ma@hotmail.com
// �������ڣ����ڶ���2010��07��27�� 16:52:24
// ��Ȩ����(C)sagemwirless
//--------------------------------------------------------------*/

var http_request = false;
function send_request(method,url,content,responseType,callback){
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