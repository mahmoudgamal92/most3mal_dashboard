<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
include_once './../config/dbconnect.php';


$json_Array = array();

// Handle User Offers
if(isset($_GET['ads']))
{
$user_id = $_GET['user_id'];
$cmd = "select * from item_offers where user_id = '$user_id'";
$res = mysqli_query($con, $cmd);
if(mysqli_num_rows($res) > 0)
{
    while($info = mysqli_fetch_assoc($res)){
        $item_id = $info['item_id'];
        $cmd1 = "select * from ads where id = '$item_id'";
        $res1 = mysqli_query($con, $cmd1);
        $ad = mysqli_fetch_assoc($res1);
        $new_ar = array_merge($info,[ad => $ad]);
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
        "message" => "Woops! Something went wrong. 1"
    ));
}

}



// Handle Auctions 
else if(isset($_GET['auction']))
{
$user_id = $_GET['user_id'];
$cmd = "select * from offers where user_id = '$user_id'";
$res = mysqli_query($con, $cmd);
if(mysqli_num_rows($res) > 0)
{
    while($info = mysqli_fetch_assoc($res)){
        $item_id = $info['auction_id'];
        $cmd1 = "select * from auctions where id = '$item_id'";
        $res1 = mysqli_query($con, $cmd1);
        $ad = mysqli_fetch_assoc($res1);
        $new_ar = array_merge($info,[auction => $ad]);
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
        "message" => "Woops! Something went wrong.ddd"
    ));
}
}
?>