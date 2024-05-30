<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once './../config/dbconnect.php';
$conv_id = $_GET['conv_id'];

$cmd = "select * from conversations where conv_num = '$conv_id'";
$res = mysqli_query($con, $cmd);
if ($res)
{
    $json_Array = array();
    $conv = mysqli_fetch_assoc($res);
    $cmd1 = "select * from messages where conv_id = '$conv_id'";
    $res1 = mysqli_query($con, $cmd1);

    while ($info = mysqli_fetch_assoc($res1)) {
        array_push($json_Array, $info);
    }
    http_response_code(200);
    echo json_encode(array(
        "success" => true,
        "conversation" => $conv,
        "messages" => $json_Array
    ));
} else {
    http_response_code(503);
    echo json_encode(array(
        "success" => false,
        "data" => "لاتوجد محادثة بهذة البيانات "
    ));

}
?>