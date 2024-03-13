<?php
// Include your database connection code here
include_once './../../dbcontext/connect.php';

try {
    $depart_id = $_POST['depart_id'];

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        // Update the 'name_ar' and 'name_en' columns based on the 'name' column
        $sql = "UPDATE departments SET name_ar = ?, name_en = ?";
        $stmt = $con->prepare($sql);

        $name_ar = $_POST['name_ar'];
        $name_en = $_POST['name_en'];

        $stmt->bind_param("ss", $name_ar, $name_en);
        $stmt->execute();

        // Check if a new image has been uploaded
        if ($_FILES['image']['error'] == UPLOAD_ERR_OK) {
            // Process the uploaded image and update the database
            // ...

            // For example, move the uploaded file to a specific directory
            move_uploaded_file($_FILES['image']['tmp_name'], './../../uploads/depart/' . $_FILES['image']['name']);

            // Update the 'image' column in the database
            $updateImageSQL = "UPDATE departments SET image = ? WHERE id = ?";
            $stmtImage = $con->prepare($updateImageSQL);
            $stmtImage->bind_param("si", $_FILES['image']['name'], $depart_id);
            $stmtImage->execute();
            $stmtImage->close();
        }

        echo "Records updated successfully";
        header("Location:./../../department.php?updated=true&id=$depart_id");
    }
} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
}

// Close the prepared statement
$stmt->close();

// Close the database connection
$con->close();
