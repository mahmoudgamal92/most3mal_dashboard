<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
include_once './../config/dbconnect.php';

$user_id =  (int) $_POST['user_id'];
$user_name = $_POST['user_name'];
$user_email = $_POST['user_email'];
$user_phone = $_POST['user_phone'];

if(isset($_FILES['image'])) 
{
  $target = './../../../../uploads/';
  $file_name=$_FILES["image"]["name"];
  $file_tmp=$_FILES["image"]["tmp_name"];
  $target_file = $target . $file_name;
  move_uploaded_file($file_tmp, $target_file);
  
$cmd = "update users set name = '$user_name', email = '$user_email', phone = '$user_phone', image = '$file_name' where id = '$user_id'";
if(mysqli_query($con, $cmd))
{
    http_response_code(200);
    echo json_encode(array(
         
            "success" => true,
            "message" => "تم تحديث بياناتك بنجاح"
        ));
    exit();
}

else{
    // set response code - 503 service unavailable
    http_response_code(503);
    // tell the user
    echo json_encode(array([
        "success" => false,
        "message" => mysqli_error($con)
        ]
    ));
}
}

else
{
  
$cmd = "update users set name = '$user_name', email = '$user_email', phone = '$user_phone' where id = '$user_id'";

if(mysqli_query($con, $cmd))
{
    http_response_code(200);
    echo json_encode(array(
         
            "success" => true,
            "message" => "تم تحديث بياناتك بنجاح"
        ));
    exit();
}

else{
    // set response code - 503 service unavailable
    http_response_code(503);
    // tell the user
    echo json_encode(array([
        "success" => false,
        "message" => mysqli_error($con)
        ]
    ));
}    
}

?>