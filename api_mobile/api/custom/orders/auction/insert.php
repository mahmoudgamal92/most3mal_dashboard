<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
include_once './../../config/dbconnect.php';
$json_Array = array();

// Handle User Offers
if(isset($_POST['user_id']))
{
$user_id = $_POST['user_id'];
$amount = $_POST['amount'];
$auction_id = $_POST['auction_id'];

$cmd = "select * from offers where user_id = '$user_id' and auction_id = '$auction_id'";
$res = mysqli_query($con, $cmd);


if(mysqli_num_rows($res) > 0)
{
        $info = mysqli_fetch_assoc($res);
        $item_id = $info['id'];
        $cmd = "update offers set amount = '$amount' where id = '$item_id'";
        $res = mysqli_query($con, $cmd);
}
else 
{
$cmd = "insert into offers (user_id,auction_id,amount,status) values ('$user_id' , '$auction_id' , '$amount','waiting')" ;  
$res = mysqli_query($con, $cmd);
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
?>