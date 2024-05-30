<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
include_once './../../config/dbconnect.php';

$offer_id = $_POST['offer_id'];
$item_id = $_POST['item_id'];
$status = $_POST['status'];

$cmd = "update item_offers set status = '$status' where id = '$offer_id'";
if(mysqli_query($con, $cmd))
{
    $cmd1 = "update ads set status = 'inactive' where id = '$item_id'";
    if(mysqli_query($con, $cmd1))
    {
         http_response_code(200);
         echo json_encode(array(
        "success" => true,
        "message" => "Updated Successfully"));
    exit();
    }
    else {
        http_response_code(503);
    echo json_encode(array(
        "success" => false,
        "message" => "Woops! Something went wrong."
    ));  
    }
}

else {
      http_response_code(503);
    echo json_encode(array(
        "success" => false,
        "message" => "Woops! Something went wrong."
    ));
    
}
?>