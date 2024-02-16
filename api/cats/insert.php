<?php
include_once './../../dbcontext/connect.php';
$depart_id = $_POST['depart_id'];
$name_ar = $_POST['name_ar'];
$name_en = $_POST['name_en'];
$date = date("Y-m-d");
$name = array('ar' => $name_ar, 'en' => $name_en);
$name_json = json_encode($name);
$sql = "insert into categories (depart_id,name,created_at,updated_at) values
        ('$depart_id','$name_json','$date','$date')";
if (mysqli_query($con, $sql)) {
    header("Location:./../../cats.php?id=$depart_id&inserted=true");
} else {
    die("could not insert news right now : " . mysqli_error($con));
}

mysqli_close($con);
