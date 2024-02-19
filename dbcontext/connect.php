<?php
include './../utils/config.php';

// Create a connection
$con = new mysqli(DB_HOST, DB_USER , DB_PASSWORD, DB_DATABASE);

// Check the connection
if ($con->connect_error) {
    die("Connection failed: " . $con->connect_error);
}
// Connected successfully