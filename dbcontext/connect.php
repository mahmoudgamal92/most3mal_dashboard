<?php
$host = "localhost";
$username = "root";
$password = "";
$database = "most3mal";

// Create a connection
$con = new mysqli($host, $username, $password, $database);

// Check the connection
if ($con->connect_error) {
    die("Connection failed: " . $con->connect_error);
}
// Connected successfully
