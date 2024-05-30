<?php
session_start();
include_once './../../dbcontext/connect.php';
include_once './../../utils/logs.php';
$id = $_GET['id'];
$action = "delete";
$details = ' تم حذف الإعلان رقم  ' . $id . ' بواسطة الموظف  : ' . $_SESSION['name'];
$cmd = "delete from ads where id = '$id'";
if (mysqli_query($con, $cmd)) {
    logAction($con, $action, $_SESSION['id'], $details);
    header("Location:./../../ads.php?deleted=true");
} else {
    die("could not insert news right now : " . mysqli_error($con));
}
