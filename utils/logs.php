<?php
function logAction($con, $action, $user_id = null, $details = null)
{
    $sql = "INSERT INTO logs (action, user_id, details) VALUES (?, ?, ?)";
    $stmt = $con->prepare($sql);
    $stmt->bind_param("sss", $action, $user_id, $details);
    $result = $stmt->execute();
    $stmt->close();
    $con->close();
    return $result;
}
