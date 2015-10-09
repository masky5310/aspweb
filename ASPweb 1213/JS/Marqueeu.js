/*---------------------------------------------------------------
// AspStudio_Codepage="65001"
// 上面这行是软件使用的代码页标记，请不要删除。详情请参考帮助文件。
//
// 档案名称：Marqueeu.js
// 原创作者：Lyn
// 作者邮件：lyn.ma@hotmail.com
// 创建日期：星期二，2010年06月15日 10:50:05
// 版权所有(C)Feng
//--------------------------------------------------------------*/

var speedu=30; //数字越大滚动得越慢
var demou=document.getElementById("demou");
var demo1u=document.getElementById("demo1u");
var demo2u=document.getElementById("demo2u");

demo2u.innerHTML=demo1u.innerHTML;
function Marqueeu(){
if(demo2u.offsetTop-demou.scrollTop<=0)
demou.scrollTop-=demo1u.offsetHeight
else{
demou.scrollTop++
}
}
var MyMaru=setInterval(Marqueeu,speedu)
demou.onmouseover=function() {clearInterval(MyMaru)}
demou.onmouseout=function() {MyMaru=setInterval(Marqueeu,speedu)}


var speed=30 ;//数字越大滚动得越慢
var demo=document.getElementById("demo");
var demo1=document.getElementById("demo1");
var demo2=document.getElementById("demo2");

demo2.innerHTML=demo1.innerHTML;
function Marquee(){
if(demo2.offsetTop-demo.scrollTop<=0)
demo.scrollTop-=demo1.offsetHeight
else{
demo.scrollTop++
}
}
var MyMar=setInterval(Marquee,speed);
demo.onmouseover=function() {clearInterval(MyMar)}
demo.onmouseout=function() {MyMar=setInterval(Marquee,speed)}

//向左滚动
var speed_leftt=30;
var demo_left=document.getElementById("demo_left");
var demo1_left=document.getElementById("demo1_left");
var demo2_left=document.getElementById("demo2_left");

function Marquee_leftt()
{
 if(demo1_left.offsetWidth==demo_left.scrollLeft)
    demo_left.scrollLeft=0;
 else
 {
  demo_left.scrollLeft++;
  }
}
var MyMar_leftt=setInterval(Marquee_leftt,speed_leftt);
demo_left.onmouseover=function() {clearInterval(MyMar_leftt)}
demo_left.onmouseout=function() {MyMar_leftt=setInterval(Marquee_leftt,speed_leftt)}