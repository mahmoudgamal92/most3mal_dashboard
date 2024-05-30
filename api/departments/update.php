<?php
// Include your database connection code here
include_once './../../dbcontext/connect.php';
$depart_id = $_POST['depart_id'];
$name_ar = $_POST['name_ar'];
$name_en = $_POST['name_en'];
$status = $_POST['status'];
if ($_FILES['image']['size'] !== 0) {

    $image = "depart/" . $_FILES['image']['name'];
    $target = "./../../uploads/depart/" . basename($image);

    $cmd = "update departments set name_ar = '$name_ar' , name_en = '$name_en' , image = '$image' where id = '$depart_id'";
    if (mysqli_query($con, $cmd) && move_uploaded_file($_FILES['image']['tmp_name'], $target)) {
        header("Location:./../../departments.php?updated=true");
    } else {
        die("could not insert news right now : " . mysqli_error($con));
    }
} else {
    $cmd = "update departments set name_ar = '$name_ar' , name_en = '$name_en'  where id = '$depart_id'";
    if (mysqli_query($con, $cmd)) {
        header("Location:./../../departments.php?updated=true");
    } else {
        die("could not insert news right now : " . mysqli_error($con));
    }
}
mysqli_close($con);
