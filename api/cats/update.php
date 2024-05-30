<?php
// Include your database connection code here
include_once './../../dbcontext/connect.php';
$cat_id = $_POST['cat_id'];
$name_ar = $_POST['name_ar'];
$name_en = $_POST['name_en'];
$status = $_POST['status'];
if ($_FILES['image']['size'] !== 0) {

    $image = "cat/" . $_FILES['image']['name'];
    $target = "./../../uploads/cat/" . basename($image);

    $cmd = "update categories set name_ar = '$name_ar' , name_en = '$name_en' , image = '$image' where id = '$cat_id'";
    if (mysqli_query($con, $cmd) && move_uploaded_file($_FILES['image']['tmp_name'], $target)) {
        header("Location:./../../cat.php?id=$cat_id");
    } else {
        die("could not insert news right now : " . mysqli_error($con));
    }
} else {
    $cmd = "update categories set name_ar = '$name_ar' , name_en = '$name_en'  where id = '$cat_id'";
    if (mysqli_query($con, $cmd)) {
        header("Location:./../../cat.php?id=$cat_id");
    } else {
        die("could not insert news right now : " . mysqli_error($con));
    }
}
mysqli_close($con);
