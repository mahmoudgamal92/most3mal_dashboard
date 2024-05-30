<?php
include_once './../../dbcontext/connect.php';
$name_ar = $_POST['name_ar'];
$name_en = $_POST['name_en'];
$date = date("Y-m-d");

$image = $_FILES['image']['name'];
$db_img_param = "banner/" . $image;
$target = "./../../uploads/banner/" . basename($image);
$sql = "insert into banners (name_ar, name_en , image,created_at,updated_at) values
        ('$name_ar','$name_en','$db_img_param','$date','$date')";
if (mysqli_query($con, $sql)  && move_uploaded_file($_FILES['image']['tmp_name'], $target)) {
    header("Location:./../../banner.php?inserted=true");
} else {
    die("could not insert news right now : " . mysqli_error($con));
}
mysqli_close($con);