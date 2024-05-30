<?php
try {
    // Replace 'your_database', 'your_username', 'your_password', and 'your_table' with your actual database details
    $pdo = new PDO("mysql:host=localhost;dbname=most3mal", "root", "");

    // Set the PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Update the 'name_ar' and 'name_en' columns based on the 'name' column
    $sql = "UPDATE departments SET name_ar = JSON_UNQUOTE(JSON_EXTRACT(name, '$.ar')), name_en = JSON_UNQUOTE(JSON_EXTRACT(name, '$.en'))";
    $pdo->exec($sql);

    echo "Records updated successfully";
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

// Close the database connection
$pdo = null;
