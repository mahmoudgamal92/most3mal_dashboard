<?php
include_once './../../dbcontext/connect.php';
$roles = $_POST['roles'];
$roles_param = implode(", ", $roles);
$name = $_POST['name'];
$title = $_POST['title'];

$sql = "insert into roles (title,name,role) values ('$title','$name','$roles_param')";
if (mysqli_query($con, $sql)) {
    header("Location:./../../roles.php?inserted=true");
} else {
    die("could not insert news right now : " . mysqli_error($con));
}

mysqli_close($con);
