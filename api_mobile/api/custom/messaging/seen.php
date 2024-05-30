<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once './../config/dbconnect.php';

$conv_id = $_GET['conv_id'];
$user_id =  $_GET['user_id'];
$cmd = "update messages set seen = '1' where conv_id = '$conv_id' and sender_id != '$user_id'";
        
$res = mysqli_query($con, $cmd);

if(mysqli_num_rows($res) == 1)
 {

    $row = mysqli_fetch_assoc($res);
       http_response_code(200);
       echo json_encode(array(
        "success" => true,
        ));
   }
   
  else
  {
    
        http_response_code(503);
        echo json_encode(array(
        "success" => false)); 
      }
?>