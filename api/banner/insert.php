<?php
include_once './../../dbcontext/connect.php';
$name_ar = $_POST['name_ar'];
$name_en = $_POST['name_en'];
$date = date("Y-m-d");

$image = $_FILES['image']['name'];
$db_img_param = "depart/" . $image;
$target = "./../../uploads/depart/" . basename($image);
$name = array('ar' => $name_ar, 'en' => $name_en);
$name_json = json_encode($name);
$sql = "insert into banners (name,image,created_at,updated_at) values
        ('$name_json','$db_img_param','$date','$date')";
if (mysqli_query($con, $sql)  && move_uploaded_file($_FILES['image']['tmp_name'], $target)) {
    header("Location:./../../banner.php?inserted=true");
} else {
    die("could not insert news right now : " . mysqli_error($con));
}

mysqli_close($con);
