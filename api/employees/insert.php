<?php
include_once './../../dbcontext/connect.php';
$name = $_POST['name'];
$phone = $_POST['phone'];
$email = $_POST['email'];
$password = $_POST['password'];

$role = $_POST['role'];

$date = date("Y-m-d");


$sql = "insert into employees (name,phone,email,password,role) values
        ('$name','$phone','$email','$password','$role')";
if (mysqli_query($con, $sql)) {
    header("Location:./../../employees.php?inserted=true");
} else {
    die("could not insert news right now : " . mysqli_error($con));
}

mysqli_close($con);
