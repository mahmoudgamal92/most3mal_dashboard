<?php
include_once './../../dbcontext/connect.php';
$id = $_GET['id'];
$status = $_GET['status'];
$cmd = "update item_offers  set status = '$status' where id = '$id'";
if (mysqli_query($con, $cmd)) {
    header("Location:./../../requests.php?updated=true");
} else {
    die("could not insert news right now : " . mysqli_error($con));
}
mysqli_close($con);
