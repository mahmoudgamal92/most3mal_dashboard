<?php

require __DIR__ . '/../utils/config.php';
$DB_HOST = "localhost";
$DB_USER = "root";
$DB_PASSWORD = "";
$DB_DATABASE = "most3mal";
// Create a connection
$con = new mysqli(DB_HOST, DB_USER, DB_PASSWORD, DB_DATABASE);

// Check the connection
if ($con->connect_error) {
    die("Connection failed: " . $con->connect_error);
}
// Connected successfully