<?php
$to = "elshwaiukh_1111@yahoo.com";
$subject = "Test Email Cron";
$message = "This is a test email.";
$headers = "From: support@bnookholding.com\r\n";
$headers .= "Reply-To: support@bnookholding.com\r\n";
$headers .= "Content-Type: text/html; charset=UTF-8\r\n";
$headers .= "X-Priority: 1 (Highest)\r\n";
$headers .= "X-MSMail-Priority: High\r\n";
$headers .= "Importance: High\r\n";

if (mail($to, $subject, $message, $headers)) {
    echo "Email sent successfully!";
} else {
    echo "Email sending failed.";
}
