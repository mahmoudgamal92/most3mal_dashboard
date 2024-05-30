<?php
include_once './../../dbcontext/connect.php';

$depart_id = $_POST['depart_id'];
$name_ar = mysqli_real_escape_string($con, $_POST['name_ar']);
$name_en = mysqli_real_escape_string($con, $_POST['name_en']);
$date = date("Y-m-d");

$image = $_FILES['image']['name'];
$db_img_param = "cat/" . $image;
$target = "./../../uploads/cat/" . basename($image);
$sql = "INSERT INTO categories (depart_id,name_ar,name_en, image, created_at, updated_at) VALUES
        ('$depart_id','$name_ar','$name_en', '$db_img_param', '$date', '$date')";

if (mysqli_query($con, $sql) && move_uploaded_file($_FILES['image']['tmp_name'], $target)) {
    header("Location:./../../cats.php?id=$depart_id&inserted=true");
} else {
    echo "Error: " . mysqli_error($con);
}

mysqli_close($con);
