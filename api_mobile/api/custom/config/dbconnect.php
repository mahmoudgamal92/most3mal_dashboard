<?php
$con= new mysqli('localhost','mestamal_root','AU+PFln,auzD','mestamal_new') or die ("connection erorr".mysqli_error($con));
$con->query('SET NAMES UTF8');
$con->set_charset("utf8");
?>