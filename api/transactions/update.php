<?php
include_once './../../dbcontext/connect.php';
$id = $_POST['transaction_id'];
$token = $_POST['transaction_token'];
$status = $_POST['transaction_status'];
$cmd = "update payment_process  set payment_status = '$status',payment_token ='$token' where payment_id = '$id'";
if (mysqli_query($con, $cmd)) {
    header("Location:./../../transaction.php?id=$id&updated=true");
} else {
    die("could not insert news right now : " . mysqli_error($con));
}
mysqli_close($con);
