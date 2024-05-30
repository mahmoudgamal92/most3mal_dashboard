<?php
session_start();
include_once './../../dbcontext/connect.php';
include_once './../../utils/logs.php';
$id = $_GET['id'];
$details = ' تم حذف المزاد رقم  ' . $id . ' بواسطة الموظف  : ' . $_SESSION['name'];
$action = "delete";
$cmd = "delete from auctions where id = '$id'";
if (mysqli_query($con, $cmd)) {
    logAction($con, $action, $_SESSION['id'], $details);
    header("Location:./../../auctions.php?deleted=true");
} else {
    die("could not insert news right now : " . mysqli_error($con));
}
mysqli_close($con);
