<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
include_once './../../config/dbconnect.php';

if (isset($_GET['offer_id'])) {
    $offer_id = $_GET['offer_id'];
    $date = date("F j, Y, g:i a");
    
    $cmd = "select * from item_offers where id = '$offer_id'";
    $res = mysqli_query($con, $cmd);
    $offer = mysqli_fetch_assoc($res);

    $product_id = $offer['item_id'];
    $product_cmd = "select * from ads where id = '$product_id'";
    $product = mysqli_fetch_assoc(mysqli_query($con, $product_cmd));

    $client = $offer['user_id'];
    $seller = $product['user_id'];
    $price = $offer['amount'];

    $update_cmd = "update item_offers set status = 'delivered' where id = '$offer_id'";
    if (mysqli_query($con, $update_cmd)) {
        // Update Users Balance 
        $client_cmd = "update users set current_balance = current_balance - '$price' where id = '$client'";
        $seller_cmd = "update users set current_balance = current_balance + '$price' where id = '$seller'";
        
        $client_payment_cmd = "insert into payment_process (payment_type,amount,user_id,created_at) values ('withdraw','$price','$client','$date')";
        $seller_payment_cmd = "insert into payment_process (payment_type,amount,user_id,created_at) values ('deposite','$price','$seller','$date')";
        
        if (mysqli_query($con, $client_cmd) && mysqli_query($con, $seller_cmd) && mysqli_query($con, $client_payment_cmd) && mysqli_query($con, $seller_payment_cmd)) {
            http_response_code(503);
            echo json_encode(
                array(
                    "success" => true,
                    "offer_info" => "Success"
                )
            );
            exit();
        } else {
            http_response_code(503);
            echo json_encode(
                array(
                    "success" => false,
                    "offer_info" => "Erorr Updating Balance"
                )
            );
            exit();
        }
    } else {
        http_response_code(503);
        echo json_encode(
            array(
                "success" => false,
                "offer_info" => "Erorr Updating Order"
            )
        );
        exit();
    }
} 
else if (isset($_GET['auction_offer_id'])) 
{
    $offer_id = $_GET['auction_offer_id'];
    $date = date("F j, Y, g:i a");
    
    $cmd = "select * from offers where id = '$offer_id'";
    $res = mysqli_query($con, $cmd);
    $offer = mysqli_fetch_assoc($res);

    $auction_id = $offer['auction_id'];
    $auction_cmd = "select * from auctions where id = '$auction_id'";
    $auction = mysqli_fetch_assoc(mysqli_query($con, $auction_cmd));

    $client = $offer['user_id'];
    $seller = $auction['user_id'];
    $price = $offer['amount'];

    $update_cmd = "update offers set status = 'delivered' where id = '$offer_id'";
    if (mysqli_query($con, $update_cmd)) {
        // Update Users Balance 
        $client_cmd = "update users set current_balance = current_balance - '$price' where id = '$client'";
        $seller_cmd = "update users set current_balance = current_balance + '$price' where id = '$seller'";
        
        $client_payment_cmd = "insert into payment_process (payment_type,amount,user_id,created_at) values ('withdraw','$price','$client','$date')";
        $seller_payment_cmd = "insert into payment_process (payment_type,amount,user_id,created_at) values ('deposite','$price','$seller','$date')";
        
        if (mysqli_query($con, $client_cmd) && mysqli_query($con, $seller_cmd) && mysqli_query($con, $client_payment_cmd) && mysqli_query($con, $seller_payment_cmd)) {
            http_response_code(503);
            echo json_encode(
                array(
                    "success" => true,
                    "offer_info" => "Success"
                )
            );
            exit();
        } else {
            http_response_code(503);
            echo json_encode(
                array(
                    "success" => false,
                    "offer_info" => "Erorr Updating Balance"
                )
            );
            exit();
        }
    } 
    else {
        http_response_code(503);
        echo json_encode(
            array(
                "success" => false,
                "offer_info" => "Erorr Updating Order"
            )
        );
        exit();
    }
} 

else {

}

?>