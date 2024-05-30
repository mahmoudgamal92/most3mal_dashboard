<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once './../config/dbconnect.php';
$user_token = $_GET['user_token'];
$cmd = "select * from bank_accounts where user_token = '$user_token'";
$res = mysqli_query($con, $cmd);

if(mysqli_num_rows($res) > 0)
{
$data = array();
while($row = mysqli_fetch_assoc($res))
{
    array_push($data,$row);
}
       http_response_code(200);
       echo json_encode(array(
        "success" => true,
        "data" => $data
        ));
   }
   
   else
   {
       http_response_code(503);
       echo json_encode(array([
        "success" => false,
        "message" => "نأسف هناك مشكلة من طرفنا "
        ]
    ));   
   }

?>