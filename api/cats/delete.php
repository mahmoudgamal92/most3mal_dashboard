<?php
session_start();
include_once './../../dbcontext/connect.php';
include_once './../../utils/logs.php';
$id = $_GET['id'];
$depart_id = $_GET['depart_id'];
$action = "delete";
$details = ' تم حذف القسم الفرعي رقم  ' . $id . ' بواسطة الموظف  : ' . $_SESSION['name'];
$cmd = "delete from categories where id = '$id'";
if (mysqli_query($con, $cmd)) {
    logAction($con, $action, $_SESSION['id'], $details);
    header("Location:./../../cats.php?id=$depart_id&deleted=true");
} else {
    die("could not insert news right now : " . mysqli_error($con));
}
mysqli_close($con);
