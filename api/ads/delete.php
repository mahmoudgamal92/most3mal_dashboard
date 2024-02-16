<?php
include_once './../../dbcontext/connect.php';
include_once './../../utils/logs.php';
$id = $_GET['id'];
$user_id =  "0";
$action = "delete";
$details = "Delete Add Id = >" . $id;
$cmd = "delete from ads where id = '$id'";
if (mysqli_query($con, $cmd)) {
    logAction($con, $action, $user_id, $details);
    header("Location:./../../ads.php?deleted=true");
} else {
    die("could not insert news right now : " . mysqli_error($con));
}
mysqli_close($con);
