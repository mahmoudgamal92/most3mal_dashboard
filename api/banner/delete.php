<?php
session_start();
include_once './../../dbcontext/connect.php';
include_once './../../utils/logs.php';
$id = $_GET['id'];
$action = "delete";
$details = ' تم حذف البانر رقم  ' . $id . ' بواسطة الموظف  : ' . $_SESSION['name'];
$cmd = "delete from banners where id = '$id'";
if (mysqli_query($con, $cmd)) {
    logAction($con, $action, $_SESSION['id'], $details);
    header("Location:./../../banner.php?deleted=true");
} else {
    die("could not insert news right now : " . mysqli_error($con));
}
mysqli_close($con);
