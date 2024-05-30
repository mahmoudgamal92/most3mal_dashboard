<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once './../config/dbconnect.php';

$user_id = (int)$_GET['user_id'];
$cmd = "select * from auctions where  status = 'active' and user_id = $user_id  order by id desc";
$res = mysqli_query($con, $cmd);

if(mysqli_num_rows($res) > 0)
{
    
$data = array();

while($row = mysqli_fetch_assoc($res))
{
    
    $user_id = (int)$row['user_id'];
    $cmd1 = "select * from users where id = $user_id";
    $res1 = mysqli_query($con,$cmd1);
    $user = mysqli_fetch_assoc($res1);
    $item = array_merge($row,["user" => $user]);
    array_push($data,$item);
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