/*---------------------------------------------------------------
// AspStudio_Codepage="936"
//
// 档案名称：tick.js
// 原创作者：lyn_ma
// 作者邮件：lyn.ma@hotmail.com
// 创建日期：星期五，2010年06月25日 15:25:14
// 版权所有(C)sagemwirless
//--------------------------------------------------------------*/


//定义一个tick函数，以获取系统的时间
function tick()
{
var year,month,day,hours,minutes,seconds,ap;
var intYear,intMonth,intDay,intHours,intMinutes,intSeconds;
var today;
today=new Date();
intYear=today.getYear();//+1900;
intMonth=today.getMonth()+1;
intDay=today.getDate();
intHours=today.getHours();
intMinutes=today.getMinutes();
intSeconds=today.getSeconds();
//获取系统时间的小时数
if(intHours==0)
{
hours=intHours+":";
ap="凌晨";
}
else if(intHours<12)
{
hours=intHours+":";
ap="早晨";
}
else if(intHours==12)
{
hours=intHours+":";
ap="中午";
}
else
{
intHours=intHours-12;
hours=intHours+":";
ap="下午";
}
//获取系统时间的分数
if(intMinutes<10)
{
minutes="0"+intMinutes+":";
}
else
{
minutes=intMinutes+":";
}
//获取系统时间的秒数
if(intSeconds<10)
{
seconds="0"+intSeconds+" ";
}
else
{
seconds=intSeconds+" ";
}
timeString=intYear+'年'+intMonth+'月'+intDay+'日'+ap+hours+minutes+seconds;
document.getElementById("time").innerHTML=timeString;
//每隔0.1秒钟执行一次tick函数
window.setTimeout("tick()",100);
}
window.onload=tick;