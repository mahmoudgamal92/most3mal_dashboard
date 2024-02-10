<?php
include_once './../../dbcontext/connect.php';
function updateSettings($con, $settings)
{
    foreach ($settings as $key => $value) {
        $key = $con->real_escape_string($key);
        $value = $con->real_escape_string($value);

        $sql = "UPDATE setting SET val = '$value' WHERE ob_key = '$key'";

        if ($con->query($sql) !== TRUE) {
            echo "Error updating record: " . $con->error;
        }
    }
}
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $settingsFromForm = $_POST['settings'];
    updateSettings($con, $settingsFromForm);
    header("Location:./../../settings.php?updated=true");
}
$con->close();
