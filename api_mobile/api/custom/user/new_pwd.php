<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
include_once './../config/dbconnect.php';

$user_id = (int)$_POST['user_id'];
$new_password = $_POST['new_password'];


        $password = password_hash($new_password, PASSWORD_BCRYPT);
        $cmd = "update users set password = '$password' where id = '$user_id'";
        if(mysqli_query($con,$cmd))
        {
           http_response_code(503);
            echo json_encode(array(
            "success" => true,
            "message" => "Password Updated Successfully"
        ));
        }
        else{
              http_response_code(503);
            echo json_encode(array(
            "success" => false,
            "message" => mysqli_error($con)
        ));
        }

?>