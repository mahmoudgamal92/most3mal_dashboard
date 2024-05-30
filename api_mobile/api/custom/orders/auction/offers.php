<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once './../../config/dbconnect.php';
$json_Array = array();

if(isset($_GET['item_id']))
{
$item_id = (int) $_GET['item_id'];
$cmd = "select * from offers where auction_id = '$item_id'";
$res = mysqli_query($con, $cmd);
if(mysqli_num_rows($res) > 0)
{
    while($info = mysqli_fetch_assoc($res)){
        $user_id = $info['user_id'];
        $cmd1 = "select * from users where id = '$user_id'";
        $res1 = mysqli_query($con, $cmd1);
        $user = mysqli_fetch_assoc($res1);
        $new_ar = array_merge($info,[user => $user]);
        array_push($json_Array, $new_ar);
}


    http_response_code(200);
    echo json_encode(array(
        "success" => true,
        "data" => $json_Array));
    exit();
}

else{
    http_response_code(503);
    echo json_encode(array(
        "success" => false,
        "message" => "Woops! Something went wrong."
    ));
}
}
?>