<?php
include_once './../../dbcontext/connect.php';
$id = $_GET['id'];
$cmd = "delete from banners where id = '$id'";
if (mysqli_query($con, $cmd)) {
    header("Location:./../../banner.php?deleted=true");
} else {
    die("could not insert news right now : " . mysqli_error($con));
}
mysqli_close($con);
