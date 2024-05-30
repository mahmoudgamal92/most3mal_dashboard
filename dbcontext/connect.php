<?php

require __DIR__ . '/../utils/config.php';
$DB_HOST = "localhost";
$DB_USER = "user3153_mahmoud";
$DB_PASSWORD ="belive 2684 @#$";
$DB_DATABASE = "user3153_most3mal";

// Create a connection
$con = new mysqli(DB_HOST, DB_USER, DB_PASSWORD, DB_DATABASE);

// Check the connection
if ($con->connect_error) {
    die("Connection failed: " . $con->connect_error);
}
// Connected successfully