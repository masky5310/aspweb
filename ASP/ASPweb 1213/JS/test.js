/*---------------------------------------------------------------
// AspStudio_Codepage="936"
//
// 档案名称：test.js
// 原创作者：lyn_ma
// 作者邮件：lyn.ma@hotmail.com
// 创建日期：星期二，2010年07月27日 16:52:24
// 版权所有(C)sagemwirless
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
  window.alert("不能创建xmlhttprequest对象实例!");
  return false;
  }
 if(responseType.toLowerCase() == "text"){
  http_request.onreadystatechange = callback;
  }
 else if(responseType.toLowerCase() == "xml"){
  http_request.onreadystatechange = callback;
  }
 else{
  window.alert("响应参数类别错误!");
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
  window.alert("http请求类别参数错误!");
  return false;
  }
 http_request.send(content);
} 