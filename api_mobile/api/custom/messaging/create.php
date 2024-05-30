<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once './../config/dbconnect.php';


$conv_num = rand();
$sender_id =  $_POST['sender_id'];
$reciver_id =  $_POST['reciver_id'];
$sender_name = $_POST['sender_name'];
$reciver_name = $_POST['reciver_name'];

$cmd = "SELECT * FROM conversations WHERE (sender_id = '$sender_id' AND reciver_id = '$reciver_id') OR (sender_id = '$reciver_id' AND reciver_id = '$sender_id')";
        
$res = mysqli_query($con, $cmd);

if(mysqli_num_rows($res) == 1)
 {

    $row = mysqli_fetch_assoc($res);
       http_response_code(200);
       echo json_encode(array(
        "success" => true,
        "id" => $row['conv_num']
        ));
   }
   
  else
  {
      
      $cmd = "insert into conversations (conv_num,sender_id,reciver_id,sender_name,reciver_name) values ('$conv_num','$sender_id','$reciver_id','$sender_name','$reciver_name')";
      if(mysqli_query($con,$cmd))
      {
      http_response_code(200);
        echo json_encode(array(
        "success" => true,
        "id" => $conv_num    
        )); 
      }
      
      else
      {
            http_response_code(503);
        echo json_encode(array(
        "success" => false,
        "message" => "Erorrr"
    )); 
      }
  }







?>