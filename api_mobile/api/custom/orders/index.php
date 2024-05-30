<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
include_once './../config/dbconnect.php';

if(isset($_GET['offer_id']))
{
    $offer_id = $_GET['offer_id'];
    
    
    $cmd = "select * from item_offers where id = '$offer_id'";
    $res = mysqli_query($con,$cmd);
    $offer = mysqli_fetch_assoc($res);
    

    // Client Information
    $user_id = $offer['user_id'];
    $c_cmd = "select * from users where id = '$user_id'";
    $c_res = mysqli_query($con,$c_cmd);
    $client = mysqli_fetch_assoc($c_res);
    
    // Item Information
    $item_info = array();
    $item_id = $offer['item_id'];
    $p_cmd = "select * from ads where id = '$item_id'";
    $p_res = mysqli_query($con,$p_cmd);
    $item = mysqli_fetch_assoc($p_res);
    
    

    // Seller Information
    $user_id = $item['user_id'];
    $s_cmd = "select * from users where id = '$user_id'";
    $s_res = mysqli_query($con,$s_cmd);
    $seller = mysqli_fetch_assoc($s_res);
    
    http_response_code(200);
    echo json_encode(array(
        "success" => "true",
        "offer_info" => $offer,
        "item" => $item,
        "client_info" => $client,
        "seller_info" => $seller,
        ));
    exit();
}

else if (isset($_GET['auction_offer_id'])){
    
        $offer_id = $_GET['auction_offer_id'];
    
    
    $cmd = "select * from offers where id = '$offer_id'";
    $res = mysqli_query($con,$cmd);
    $offer = mysqli_fetch_assoc($res);
    

    // Client Information
    $user_id = $offer['user_id'];
    $c_cmd = "select * from users where id = '$user_id'";
    $c_res = mysqli_query($con,$c_cmd);
    $client = mysqli_fetch_assoc($c_res);
    
    // Item Information
    $item_info = array();
    $item_id = $offer['auction_id'];
    $p_cmd = "select * from auctions where id = '$item_id'";
    $p_res = mysqli_query($con,$p_cmd);
    $item = mysqli_fetch_assoc($p_res);
    
    

    // Seller Information
    $user_id = $item['user_id'];
    $s_cmd = "select * from users where id = '$user_id'";
    $s_res = mysqli_query($con,$s_cmd);
    $seller = mysqli_fetch_assoc($s_res);
    
    http_response_code(200);
    echo json_encode(array(
        "success" => "true",
        "offer_info" => $offer,
        "item" => $item,
        "client_info" => $client,
        "seller_info" => $seller,
        ));
    exit();
    
}
