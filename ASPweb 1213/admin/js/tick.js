/*---------------------------------------------------------------
// AspStudio_Codepage="936"
//
// �������ƣ�tick.js
// ԭ�����ߣ�lyn_ma
// �����ʼ���lyn.ma@hotmail.com
// �������ڣ������壬2010��06��25�� 15:25:14
// ��Ȩ����(C)sagemwirless
//--------------------------------------------------------------*/


//����һ��tick�������Ի�ȡϵͳ��ʱ��
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
//��ȡϵͳʱ���Сʱ��
if(intHours==0)
{
hours=intHours+":";
ap="�賿";
}
else if(intHours<12)
{
hours=intHours+":";
ap="�糿";
}
else if(intHours==12)
{
hours=intHours+":";
ap="����";
}
else
{
intHours=intHours-12;
hours=intHours+":";
ap="����";
}
//��ȡϵͳʱ��ķ���
if(intMinutes<10)
{
minutes="0"+intMinutes+":";
}
else
{
minutes=intMinutes+":";
}
//��ȡϵͳʱ�������
if(intSeconds<10)
{
seconds="0"+intSeconds+" ";
}
else
{
seconds=intSeconds+" ";
}
timeString=intYear+'��'+intMonth+'��'+intDay+'��'+ap+hours+minutes+seconds;
document.getElementById("time").innerHTML=timeString;
//ÿ��0.1����ִ��һ��tick����
window.setTimeout("tick()",100);
}
window.onload=tick;