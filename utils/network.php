<?php

include 'config.php';

session_start();
if (!isset($_SESSION['name'])) {
    header("Location: https://mestamal.com/dashboard/signin.php");
}

// Function to select rows from a table based on arguments
function _Read ($tableName, $arguments = array()) {
    // Database connection parameters

    try {
        // Create a PDO instance
        $pdo = new PDO( CONNECTION_STRING , DB_USER, DB_PASSWORD);

        // Build the SQL query
        $sql = "SELECT * FROM $tableName";
        
        // Add WHERE conditions based on arguments, if provided
        if (!empty($arguments)) {
            $conditions = array();
            foreach ($arguments as $column => $value) {
                $conditions[] = "$column = :$column";
            }
            $sql .= " WHERE " . implode(" AND ", $conditions);
        }

        // Prepare and execute the query
        $stmt = $pdo->prepare($sql);
        $stmt->execute($arguments);

        // Fetch all rows
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Close the connection
        $pdo = null;

        return $rows;
    } catch (PDOException $e) {
        // Handle any database connection errors
        echo "Connection failed: " . $e->getMessage();
    }
}



// Function to insert a row into a table
function insertIntoTable($tableName, $data) {
    // Database connection parameters
    $dsn = 'mysql:host=localhost;dbname=your_database_name';
    $username = 'your_username';
    $password = 'your_password';

    try {
        // Create a PDO instance
        $pdo = new PDO($dsn, $username, $password);

        // Build the SQL query
        $columns = implode(', ', array_keys($data));
        $values = ':' . implode(', :', array_keys($data));
        $sql = "INSERT INTO $tableName ($columns) VALUES ($values)";

        // Prepare and execute the query
        $stmt = $pdo->prepare($sql);
        $stmt->execute($data);

        // Close the connection
        $pdo = null;

        return true; // Return true on success
    } catch (PDOException $e) {
        // Handle any database connection errors
        echo "Connection failed: " . $e->getMessage();
        return false; // Return false on failure
    }
}

?>





<!--// Example usage:-->
<!--$tableName = 'your_table_name';-->
<!--$data = array(-->
<!--    'column1' => 'value1',-->
<!--    'column2' => 'value2',-->
<!--    // Add more columns and values as needed-->
<!--);-->

<!--// Call the insert function-->
<!--if (insertIntoTable($tableName, $data)) {-->
<!--    echo "Insert successful!";-->
<!--} else {-->
<!--    echo "Insert failed!";-->
<!--}-->