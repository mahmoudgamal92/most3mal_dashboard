<?php

include 'config.php';

session_start();
if (!isset($_SESSION['name'])) {
    header("Location: " . SIGNIN_URL);
}


function _Read($tableName, $arguments = array())
{
    try {
        $pdo = new PDO(CONNECTION_STRING, DB_USER, DB_PASSWORD);
        $sql = "SELECT * FROM $tableName";

        if (!empty($arguments)) {
            $conditions = array();
            foreach ($arguments as $column => $value) {
                $conditions[] = "$column = :$column";
            }
            $sql .= " WHERE " . implode(" AND ", $conditions);
        }

        $stmt = $pdo->prepare($sql);
        $stmt->execute($arguments);

        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $pdo = null;
        return $rows;
    } catch (PDOException $e) {
        echo "Connection failed: " . $e->getMessage();
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

function getBadge($status)
{
    switch ($status) {
        case "active":
            return "badge badge-success";
        case "waiting":
            return "badge badge-success";
        case "cancelled":
            return "badge badge-danger";
        case "onhold":
            return "badge badge-danger";
        case "pending":
            return "badge badge-warning";
        default:
            return "badge badge-info";
    }
}
