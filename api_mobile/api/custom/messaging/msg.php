<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once './../config/dbconnect.php';

// Check for the presence of POST data
$sender_id = $_POST['sender_id'] ;
$conv_id = $_POST['conv_id'];
$message = $_POST['message'];
$attachments = $_POST['attachments'];
$seen = $_POST['seen'];

$cmd = "insert into messages (sender_id, conv_id, message, attatchments, seen) values ('$sender_id' , '$conv_id' , '$message' , '$attachments' , '$seen')";
if (mysqli_query($con,$cmd)) 
{
        http_response_code(200);
        echo json_encode(array("success" => true));
} 
    else 
    {
        error_log("MySQL Error: " .  mysqli_error($con));
        http_response_code(503);
        echo json_encode(array("success" => false, "error" =>  mysqli_error($con)));
    }
?>