<?php

$con=mysql_connect("61.139.126.44","wuyu531","74516933327zss") or die("Could not connect to server".mysql_error());
$link=mysql_select_db("wuyu531",$con) or die("could not use dn_name".mysql_error());
$sql="select * from product";
 $result=mysql_query($sql,$con) or die("Invalid query:".mysql_error());
 $row_num=mysql_num_rows($result);
if($row_num>0)
{
 echo "connect success! Result row is: ".$row_num;
}
?>