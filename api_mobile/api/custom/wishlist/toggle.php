<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once './../config/dbconnect.php';

$user_id =  $_POST['user_id'];
$ad_id  =  $_POST['ad_id'];

$cmd = "select * from wishlists where user_id = '$user_id' and ad_id = '$ad_id'";
$res = mysqli_query($con, $cmd);

if(mysqli_num_rows($res) > 0)
{
   $cmd1 = "delete from wishlists where user_id = '$user_id' and ad_id = '$ad_id'";
  if(mysqli_query($con, $cmd1))
  {
       http_response_code(200);
    echo json_encode(array(
        "success" => true,
        "message" => "تم الحذف من المفضلة بنجاح"
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


}

else
{
    $cmd2 = "insert into wishlists (user_id,ad_id) values('$user_id','$ad_id')";
     if(mysqli_query($con, $cmd2))
     {
    http_response_code(200);
    echo json_encode(array(
        "success" => true,
        "message" => "تم الأضافة للمفضلة بنجاح"
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
}
?>