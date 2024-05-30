<?php
include_once './../../dbcontext/connect.php';

// Sanitize and validate inputs
$name_ar = mysqli_real_escape_string($con, $_POST['name_ar']);
$name_en = mysqli_real_escape_string($con, $_POST['name_en']);
$date = date("Y-m-d");

// File upload handling
$image = $_FILES['image']['name'];
$db_img_param = "depart/" . $image;
$target = "./../../uploads/depart/" . basename($image);

// JSON encode the name with JSON_UNESCAPED_UNICODE option
$name = array('ar' => $name_ar, 'en' => $name_en);
$name_json = json_encode($name, JSON_UNESCAPED_UNICODE);

// Insert data into the database
$sql = "INSERT INTO departments (name_ar,name_en, image, created_at, updated_at) VALUES
        ('$name_ar','$name_en', '$db_img_param', '$date', '$date')";

if (mysqli_query($con, $sql) && move_uploaded_file($_FILES['image']['tmp_name'], $target)) {
    header("Location:./../../departments.php?inserted=true");
} else {
    // Log the error or display a user-friendly message
    echo "Error: " . mysqli_error($con);
}

mysqli_close($con);
?>