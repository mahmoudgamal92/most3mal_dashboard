<?php
$DB_HOST = "localhost";
$DB_USER = "mestamal_root";
$DB_PASSWORD = "AU+PFln,auzD";
$DB_DATABASE = "mestamal_new";

// Create a connection
$con = new mysqli($DB_HOST, $DB_USER, $DB_PASSWORD, $DB_DATABASE);

// Check the connection
if ($con->connect_error) {
    die("Connection failed: " . $con->connect_error);
}
// Connected successfully