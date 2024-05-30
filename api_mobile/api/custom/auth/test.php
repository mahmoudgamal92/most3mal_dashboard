<?php

function generateUserToken($userId, $additionalData = '') {
    $tokenInput = $userId . $additionalData;
    $hashedToken = hash('sha256', $tokenInput);
    return $hashedToken;
}

$userId = 123;
$additionalData = 'some_additional_data';
$userToken = generateUserToken($userId, $additionalData);

echo "User ID: $userId\n";
echo "Additional Data: $additionalData\n";
echo "Generated Token: $userToken\n";

?>