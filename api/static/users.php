<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
require_once './../../utils/network.php';
require_once './../../utils/config.php';
// Validate and sanitize input
$action = isset($_GET['action']) ? $_GET['action'] : '';
$id = isset($_GET['id']) ? $_GET['id'] : '';

// Handle the delete action
switch ($action) {
    case 'delete':
        if (!empty($id)) {
            // Uncomment the following line if deletion is intended
            // CURL_DELETE(API_URL.'records/users/'.$id);

            // Redirect after deletion
            header('../../users.php'.'?deleted=true');
            exit; // Ensure that no further code is executed after the redirect
        } else {
            // Handle the case where 'id' is not provided
            header('../../error.php'.'?message=Invalid%20ID');
            exit;
        }
        break;
    default:
        // Handle unknown actions
        header(ROOT_URL.'error.php'.'?message=Invalid%20Action');
        exit;
}