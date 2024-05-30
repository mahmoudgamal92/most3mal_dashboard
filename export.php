<?php
function exportTableToExcel($tableName, $data)
{
    // Set headers for Excel download
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment;filename="' . $tableName . '_export_' . date('Y-m-d_H-i-s') . '.xls"');
    header('Cache-Control: max-age=0');

    // Output Excel HTML markup
    echo '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">';
    echo '<head><meta charset="utf-8"></head>';
    echo '<body>';
    echo '<table>';

    // Add column headers
    echo '<tr>';
    foreach ($data[0] as $columnName => $value) {
        echo '<th>' . htmlspecialchars($columnName) . '</th>';
    }
    echo '</tr>';

    // Add data rows
    foreach ($data as $rowData) {
        echo '<tr>';
        foreach ($rowData as $value) {
            echo '<td>' . htmlspecialchars($value) . '</td>';
        }
        echo '</tr>';
    }

    echo '</table>';
    echo '</body>';
    echo '</html>';

    // Exit to prevent additional output
    exit();
}

// Check if the table name is set
if (isset($_GET['tableName'])) {
    // Get the table name from the URL parameter
    $tableName = $_GET['tableName'];
    // Database connection parameters
    $host = 'localhost';
    $dbname = 'user3153_most3mal';
    $username = 'user3153_mahmoud';
    $password = 'belive 2684 @#$';
    // Create a MySQLi connection
    $conn = new mysqli($host, $username, $password, $dbname);

    // Check the connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Fetch data from the database
    $sql = "SELECT * FROM $tableName";

    // Check if a filter condition is provided
    if (isset($_GET['filterCondition'])) {
        $filterCondition = $_GET['filterCondition'];
        $sql .= " WHERE $filterCondition";
    }

    $result = $conn->query($sql);

    if ($result) {
        // Fetch the data as an associative array
        $data = $result->fetch_all(MYSQLI_ASSOC);

        // Call the export function
        exportTableToExcel($tableName, $data);
    } else {
        echo "Error: " . $conn->error;
    }

    // Close the database connection
    $conn->close();
} else {
    echo "Missing table name parameter.";
}
