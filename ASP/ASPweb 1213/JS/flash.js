/*---------------------------------------------------------------
// AspStudio_Codepage="65001"
// 上面这行是软件使用的代码页标记，请不要删除。详情请参考帮助文件。
//
// 档案名称：flash.js
// 原创作者：lyn_ma
// 作者邮件：lyn.ma@hotmail.com
// 创建日期：星期六，2010年06月12日 15:43:36
// 版权所有(C)sagemwirless
//--------------------------------------------------------------*/

function flash(ur,w,h){
document.write('<object classid="clsid:D27CDB6E-AE6D-11CF-96B8-444553540000" id="obj1" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0" border="0" width="'+w+'" height="'+h+'">');
document.write('<param name="movie" value="'+ur+'">');
document.write('<param name="quality" value="high"> ');
document.write('<param name="wmode" value="transparent"> ');
document.write('<param name="menu" value="false"> ');
document.write('<embed src="'+ur+'" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" name="obj1" width="'+w+'" height="'+h+'" quality="High" wmode="transparent">');
document.write('</embed>');
document.write('</object>');
}


function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
 
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}
 
function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function key(){ 
//if(event.shiftKey){
//window.close();}
//禁止shift
if(event.altKey){
alert('禁止CTRL-C复制内容');}
//禁止alt
if(event.ctrlKey){
alert('禁止CTRL-C复制内容');}
//禁止ctrl
return false;}
//document.onkeydown=key;
if (window.Event)
document.captureEvents(Event.MOUSEUP);
//swordmaple javascript article.
//from www.jx165.com
//function nocontextmenu(){
//event.cancelBubble = true
//event.returnValue = false;
//return false;}
function norightclick(e){
if (window.Event){
if (e.which == 2 || e.which == 3)
return false;}
else
if (event.button == 2 || event.button == 3){
event.cancelBubble = true
event.returnValue = false;
return false;}
}
function Click(){ 
alert('禁止右键粘内容'); 
window.event.returnValue=false; 
} 
//document.oncontextmenu=Click; 