<?php
include_once './../../dbcontext/connect.php';
$id = $_GET['id'];
$depart_id = $_GET['depart_id'];
$cmd = "delete from categories where id = '$id'";
if (mysqli_query($con, $cmd)) {
    header("Location:./../../cats.php?id=$depart_id&deleted=true");
} else {
    die("could not insert news right now : " . mysqli_error($con));
}
mysqli_close($con);
