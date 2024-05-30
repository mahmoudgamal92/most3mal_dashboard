<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once './../config/dbconnect.php';

$user_id =  $_GET['user_id'];

$cmd = "select * from conversations where sender_id = '$user_id' or reciver_id = '$user_id'";
$res = mysqli_query($con, $cmd);

if(mysqli_num_rows($res) > 0)
{
    $json_Array = array();

   while ($info = mysqli_fetch_assoc($res)) {
       //$obj = array();
       $conv_id = $info['conv_num'];
       $cmd1 = "select COUNT(id) AS UnseenMsg from messages where conv_id = '$conv_id' and sender_id != '$user_id' and seen = '0'";
       $res1 = mysqli_query($con,$cmd1);
       $unseen = mysqli_fetch_assoc($res1);
       $obj = array_merge($info,["unseen_msg" => $unseen['UnseenMsg']]);
       array_push($json_Array, $obj);
    }
       http_response_code(200);
       echo json_encode(array(
        "success" => true,
        "data" => $json_Array
        ));
   }
   
   else
   {
       http_response_code(503);
        echo json_encode(array([
        "success" => false,
        "message" => "لا توجد محادثات حاليا"
        ]
    ));   
   }







?>