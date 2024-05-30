<?php
include_once './../../dbcontext/connect.php';
$id = $_GET['id'];
$status = $_GET['status'];
$cmd = "update users  set status = '$status' where id = '$id'";
if (mysqli_query($con, $cmd)) {
    header("Location:./../../users.php?updated=true");
} else {
    die("could not insert news right now : " . mysqli_error($con));
}
mysqli_close($con);
