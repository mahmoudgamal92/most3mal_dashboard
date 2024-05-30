<?php
include 'config.php';
session_start();

if (!isset($_SESSION['name'])) {
    header("Location: " . SIGNIN_URL);
} else {

    $session_role = isset($_SESSION['role']) ? $_SESSION['role'] : 'super_admin';
    $user_selected_roles = getRolePermissions($session_role);

    function _Read($tableName, $arguments = array(), $operator = 'AND')
    {
        try {
            $pdo = new PDO(CONNECTION_STRING, DB_USER, DB_PASSWORD);
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            $sql = "SELECT * FROM $tableName";
            $params = array();

            if (!empty($arguments)) {
                $conditions = array();
                foreach ($arguments as $column => $value) {
                    $conditions[] = "$column = :$column";
                    $params[":$column"] = $value;
                }
                $sql .= " WHERE " . implode(" $operator ", $conditions);
            }

            $stmt = $pdo->prepare($sql);
            $stmt->execute($params);

            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
            return $rows;
        } catch (PDOException $e) {
            // Log the error instead of echoing it
            error_log("Connection failed: " . $e->getMessage());
            // Return an empty array or handle the error gracefully based on your application's requirements
            return array();
        } finally {
            // Explicitly close the connection
            $pdo = null;
        }
    }
    function insertIntoTable($tableName, $data)
    {
        try {
            $pdo = new PDO(CONNECTION_STRING, DB_USER, DB_PASSWORD);
            $columns = implode(', ', array_keys($data));
            $values = ':' . implode(', :', array_keys($data));
            $sql = "INSERT INTO $tableName ($columns) VALUES ($values)";
            $stmt = $pdo->prepare($sql);
            $stmt->execute($data);
            $pdo = null;

            return true;
        } catch (PDOException $e) {
            echo "Connection failed: " . $e->getMessage();
            return false;
        }
    }


    function getValueByKey($key)
    {
        $pdo = new PDO(CONNECTION_STRING, DB_USER, DB_PASSWORD);
        $sql = "SELECT val FROM setting WHERE ob_key = :key";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':key', $key, PDO::PARAM_STR);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($row !== false) {
            return $row['val'];
        } else {
            return null;
        }
    }



    function getUserById($key)
    {
        $pdo = new PDO(CONNECTION_STRING, DB_USER, DB_PASSWORD);
        $sql = "SELECT * FROM users WHERE id = :key";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':key', $key, PDO::PARAM_STR);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($row !== false) {
            return $row;
        } else {
            return null;
        }
    }

    function getBadge($status)
    {

        switch ($status) {
            case "active":
                return '<span class="badge light badge-success"> نشط </span>';
            case "done":
                return '<span class="badge light badge-info"> مكتمل </span>';
            case "inactive":
                return '<span class="badge light badge-danger"> غير نشط </span>';
            case "cancelled":
                return '<span class="badge light badge-danger">ملغي</span>';
            case "onhold":
                return '<span class="badge light badge-danger">قيد الإنتظار</span>';
            case "pending":
                return '<span class="badge light badge-danger">في الإنتظار</span>';

            case "waiting":
                return '<span class="badge light badge-warning">بإنتظار الموافقة علي العرض</span>';

            case "delivered":
                return '<span class="badge light badge-success">تم التوصيل</span>';
            default:
                return '<span class="badge light badge-danger">' . $status . '</span>';
        }
    }


    function getDepartById($id)
    {
        $pdo = new PDO(CONNECTION_STRING, DB_USER, DB_PASSWORD);
        $sql = "SELECT * FROM departments WHERE id = :id";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT); // Assuming ID is an integer, adjust if necessary
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($row !== false) {
            return $row['name_ar'];
        } else {
            return null;
        }
    }
}


function getRolePermissions($role)
{
    $pdo = new PDO(CONNECTION_STRING, DB_USER, DB_PASSWORD);
    $sql = "SELECT * FROM roles WHERE name = :role";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':role', $role, PDO::PARAM_STR);
    $stmt->execute();
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    return $row ? $row['role'] : null;
}


function getAdsPerMonth($tableName)
{
    try {
        // Connect to the database using PDO
        $pdo = new PDO(CONNECTION_STRING, DB_USER, DB_PASSWORD);
        // Set PDO to throw exceptions on error
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Calculate the date 6 months ago
        $startDate = date('Y-m-01', strtotime('-6 months'));
        $endDate = date('Y-m-t', strtotime('now'));

        // Prepare the SQL query
        $sql = "SELECT MONTH(ad.created_at) AS month_num, COUNT(*) AS ads_count 
                FROM $tableName AS ad
                WHERE ad.created_at BETWEEN :startDate AND :endDate
                GROUP BY MONTH(ad.created_at)
                ORDER BY MONTH(ad.created_at)";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':startDate', $startDate, PDO::PARAM_STR);
        $stmt->bindParam(':endDate', $endDate, PDO::PARAM_STR);

        // Execute the query
        $stmt->execute();

        // Fetch results
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Initialize arrays to store the month names and ad counts
        $monthNames = array();
        $adsPerMonth = array();

        // Process results
        foreach ($result as $row) {
            // Format the month number to month name using PHP
            $monthNames[] = date('F', mktime(0, 0, 0, $row["month_num"], 1));
            $adsPerMonth[] = $row["ads_count"];
        }

        // Close the database connection
        $pdo = null;

        // Return the arrays
        return array($monthNames, $adsPerMonth);
    } catch (PDOException $e) {
        // Handle errors
        echo "Connection failed: " . $e->getMessage();
        return array();
    }
}





function getRowCount($tableName)
{
    try {
        // Create a new PDO instance
        $pdo = new PDO(CONNECTION_STRING, DB_USER, DB_PASSWORD);

        // Set the PDO error mode to exception
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Query to get the count of rows in the specified table
        $sql = "SELECT COUNT(*) AS count FROM $tableName";
        $stmt = $pdo->query($sql);

        // Fetch the count
        $count = $stmt->fetch(PDO::FETCH_ASSOC)['count'];

        // Close connection
        $pdo = null;

        // Return the count
        return $count;
    } catch (PDOException $e) {
        // Handle errors
        echo "Connection failed: " . $e->getMessage();
    }
}
