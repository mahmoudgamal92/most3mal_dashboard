<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
include_once './../config/dbconnect.php';

function generateOTP($length = 4) {
    $characters = '0123456789';
    $otp = '';
    for ($i = 0; $i < $length; $i++) {
        $otp .= $characters[rand(0, strlen($characters) - 1)];
    }
    return $otp;
}

// Function to send styled HTML OTP email
function sendOtpEmail($email, $otp) {
    $to = $email;
    $subject = 'Your One-Time Password (OTP)';
    $message = "
        <html>
        <head>
            <style>
                body {
                    font-family: 'Arial', sans-serif;
                    background-color: #f4f4f4;
                    text-align: center;
                }
                .container {
                    max-width: 600px;
                    margin: 0 auto;
                    padding: 20px;
                    background-color: #ffffff;
                    border-radius: 8px;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                }
                h2 {
                    color: #333333;
                }
                p {
                    color: #666666;
                }
                strong {
                    color: #007BFF;
                }
            </style>
        </head>
        <body>
            <div class='container'>
                <h2>Your One-Time Password (OTP)</h2>
                <p>Your OTP is: <strong>$otp</strong></p>
                <p>Use this OTP to complete your action.</p>
            </div>
        </body>
        </html>
    ";

    // Additional headers for HTML email
    $headers = "From: info@mestamal.com\r\n";
    $headers .= "Reply-To: info@mestamal.com\r\n";
    $headers .= "Content-type: text/html\r\n";

    // Send the email
    mail($to, $subject, $message, $headers);
}



// Example usage
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = isset($_POST['email']) ? $_POST['email'] : '';


$cmd = "select * from users where email = '$email'";
$res = mysqli_query($con,$cmd);

if(mysqli_num_rows($res) == 1)
{
    $user = mysqli_fetch_assoc($res);
    if (!empty($email)) {
        $otp = generateOTP();
        sendOtpEmail($email, $otp);
            echo json_encode(array(
                    "success" => true,
                    "code" => $otp,
                    "data" => $user,
                    "messages" => 'OTP sent successfully to ' . $email
                ));
    } 
    else 
    {
                  echo json_encode(array(
                    "success" => false,
                    "messages" => 'Could Not Send Email Successfully'
                ));
    }
}
  else 
    {
                  echo json_encode(array(
                    "success" => false,
                    "messages" => 'Could Not Find Account Linked to This Email'
                ));
    }
}
?>