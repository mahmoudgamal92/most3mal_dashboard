<?php

// Database connection parameters
$servername = "localhost";
$username = "username";
$password = "password";
$database = "database";

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get current date
$currentDate = date("Y-m-d");

// SQL query to select records where the date is greater than today
$sql = "SELECT * FROM auctions WHERE end_date > '$currentDate'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Loop through each row
    while ($row = $result->fetch_assoc()) {
        // Update status column
        $id = $row['id']; // Assuming 'id' is the primary key
        $sql_update = "UPDATE auctions SET status = 'done' WHERE id = $id";
        if ($conn->query($sql_update) === TRUE) {
            echo "Record updated successfully";
        } else {
            echo "Error updating record: " . $conn->error;
        }
    }
} else {
    echo "No records found where date is greater than today";
}

// Close connection
$conn->close();
