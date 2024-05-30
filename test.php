<?php
// Establish a MySQL connection
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "most3mal";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Calculate the date 12 months ago
$startDate = date('Y-m-d', strtotime('-12 months'));

// Query to get count of ads created in each month for the last 12 months
$sql = "SELECT MONTHNAME(created_at) AS month_name, COUNT(*) AS ads_count 
        FROM ads 
        WHERE created_at >= '$startDate' 
        GROUP BY MONTH(created_at)
        ORDER BY MONTH(created_at)";
$result = $conn->query($sql);

// Initialize arrays to store the month names and ad counts
$monthNames = array();
$adsPerMonth = array();

// If there are results, fetch them into the arrays
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $monthNames[] = $row["month_name"];
        $adsPerMonth[] = $row["ads_count"];
    }
}

// Close the MySQL connection
$conn->close();

// Output the arrays
echo "Month Names: ";
print_r($monthNames);
echo "<br>";
echo "Ads Per Month: ";
print_r($adsPerMonth);
