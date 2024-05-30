<?php
session_start();
include_once './../../dbcontext/connect.php';
include_once './../../utils/logs.php';
$id = $_GET['id'];
$status = $_GET['status'];
$details = 'تم تعديل الصفقة رقم : ' . $id . ' بواسطة الموظف  : ' . $_SESSION['name'] .
    ' إلي '  . $status;
$action = "update";

$cmd = "update item_offers  set status = '$status' where id = '$id'";
if (mysqli_query($con, $cmd)) {
    logAction($con, $action, $_SESSION['id'], $details);
    header("Location:./../../requests.php?updated=true");
} else {
    die("could not insert news right now : " . mysqli_error($con));
}
mysqli_close($con);
