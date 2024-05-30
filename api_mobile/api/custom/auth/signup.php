<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
include_once './../config/dbconnect.php';

$username = $_POST['username'];
$userphone = $_POST['userphone'];
$useremail = $_POST['useremail'];
$password = password_hash($_POST['password'], PASSWORD_BCRYPT);
$current_date = date("Y-m-d");

function generateUserToken($userId, $additionalData = '') {
    $tokenInput = $userId . $additionalData;
    $hashedToken = hash('sha256', $tokenInput);
    return $hashedToken;
}

$userToken = generateUserToken($userphone, $_POST['password']);

if (empty($username) || empty($_POST['password']) || empty($_POST['userphone']) || empty($_POST['useremail'])) {
    die("Username and password are required.");
}



$cmd = "select * from users where email = '$useremail' or phone = '$userphone'";
$res = mysqli_query($con,$cmd);

if (mysqli_num_rows($res) > 0) {

    echo json_encode(array(
        "success" => false,
        "message" => "هناك مستخدم مرتبط بالفعل بهذة البيانات , يمكنك استرجاع كلمة المرور , إذا نسيتها",
    ));

    return;
}

// Insert the new user into the database
$cmd = "insert into users(token,name,email,phone,password,created_at) VALUES ('$userToken','$username','$useremail','$userphone','$password','$current_date')";
$res = mysqli_query($con,$cmd);

if ($res) {
    
   $cmd = "select * from users where email = '$useremail' and phone = '$userphone'";
   $res = mysqli_query($con,$cmd);
   $user = mysqli_fetch_array($res);

    echo json_encode(array(
        "success" => true,
        "message" => "تم إنشاء الحساب بنجاح",
        "data" => $user
        ));
} else {
    echo json_encode(array(
        "success" => false,
        "message" => "نأسف هناك مشكلة في إنشاء الحساب",
    ));
}

$con->close();
?>