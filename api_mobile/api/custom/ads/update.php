<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
include_once './../config/dbconnect.php';

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    
    $responseData = [];
    $columns = [];
    $values = [];
    $images = array();

    // Loop through all POST data
    foreach ($_POST as $key => $value) {
        $columns[] = $key;
        $values[] = "'$value'";
    }

    if (!empty($_FILES)) {
        foreach ($_FILES['images']['tmp_name'] as $key => $tmp_name) {
            $target = './../../../../uploads/';
            $file_name = $_FILES["images"]["name"][$key];
            $file_tmp = $_FILES["images"]["tmp_name"][$key];
            $uploadDirectory = $target . $file_name;

            if (move_uploaded_file($file_tmp, $uploadDirectory)) {
                array_push($images, $file_name);
            } else {
                http_response_code(500);
                echo json_encode(array(
                    "success" => false,
                    "message" => "Error In Image Upload"
                ));
                exit();
            }
        }

        $gallery = implode(",", $images);
        $columns[] = "images";
        $values[] = "'$gallery'";
    }

    // Check if there is an 'id' provided for the update
    if (isset($_POST['id'])) {
        $id = $_POST['id'];
        $updateSet = [];

        // Build the update set clause
        foreach ($columns as $index => $column) {
            $updateSet[] = "$column = {$values[$index]}";
        }

        $updateSetClause = implode(", ", $updateSet);
        $sql = "UPDATE ads SET $updateSetClause WHERE id = $id";

    } else {
        // If 'id' is not provided, it's an insert operation
        $columnList = implode(", ", $columns);
        $valueList = implode(", ", $values);
        $sql = "INSERT INTO ads ($columnList) VALUES ($valueList)";
    }

    // Execute the SQL query
    if (mysqli_query($con, $sql) !== true) {
        http_response_code(500);
        echo json_encode([
            "success" => false,
            "error" => mysqli_error($con)
        ]);
        exit();
    }

    $con->close();

    // Return a success response
    http_response_code(200);
    echo json_encode([
        "success" => true,
        "message" => isset($_POST['id']) ? "Data successfully updated in the database" : "Data successfully inserted into the database"
    ]);
} else {
    http_response_code(405);
    echo json_encode([
        "success" => false,
        "error" => "Method Not Allowed"
    ]);
}
?>