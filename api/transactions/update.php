<?php
include_once './../../dbcontext/connect.php';
$id = $_POST['id'];
$status = $_POST['status'];
$cmd = "update payment_process  set payment_status = '$status' where payment_id = '$id'";
if (mysqli_query($con, $cmd)) {
    header("Location:./../../transaction.php?id=$id&updated=true");
} else {
    die("could not insert news right now : " . mysqli_error($con));
}
mysqli_close($con);
