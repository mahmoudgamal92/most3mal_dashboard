<?php

/* For simplicity check our PHP SDK library here https://myfatoorah.readme.io/php-library  */
/* ------------------------ Configurations ---------------------------------- */
//Test
$apiURL = 'https://apitest.myfatoorah.com';
$apiKey = 'rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL';

//Live
//$apiURL = 'https://api.myfatoorah.com';
//$apiKey = ''; //Live token value to be placed here: https://myfatoorah.readme.io/docs/live-token


/* ------------------------ Call getPaymentStatus Endpoint ------------------ */
//Inquiry using paymentId
$keyId   = '100202110305128442';
$KeyType = 'paymentId';

//Inquiry using invoiceId 
/*$keyId   = '613842';
$KeyType = 'invoiceId';*/

//Fill POST fields array
$postFields = [
    'Key'     => $keyId,
    'KeyType' => $KeyType
];
//Call endpoint
$json       = callAPI("$apiURL/v2/getPaymentStatus", $apiKey, $postFields);

//Display the payment result to your customer
echo 'Payment status is ' . $json->Data->InvoiceStatus;

/* ------------------------ Functions --------------------------------------- */
/*
 * Call API Endpoint Function
 */

function callAPI($endpointURL, $apiKey, $postFields = []) {

    $curl = curl_init($endpointURL);
    curl_setopt_array($curl, array(
        CURLOPT_CUSTOMREQUEST  => 'POST',
        CURLOPT_POSTFIELDS     => json_encode($postFields),
        CURLOPT_HTTPHEADER     => array("Authorization: Bearer $apiKey", 'Content-Type: application/json'),
        CURLOPT_RETURNTRANSFER => true,
    ));

    $response = curl_exec($curl);
    $curlErr  = curl_error($curl);

    curl_close($curl);

    if ($curlErr) {
        //Curl is not working in your server
        die("Curl Error: $curlErr");
    }

    $error = handleError($response);
    if ($error) {
        die("Error: $error");
    }

    return json_decode($response);
}

//------------------------------------------------------------------------------
/*
 * Handle Endpoint Errors Function 
 */

function handleError($response) {

    $json = json_decode($response);
    if (isset($json->IsSuccess) && $json->IsSuccess == true) {
        return null;
    }

    //Check for the errors
    if (isset($json->ValidationErrors) || isset($json->FieldsErrors)) {
        $errorsObj = isset($json->ValidationErrors) ? $json->ValidationErrors : $json->FieldsErrors;
        $blogDatas = array_column($errorsObj, 'Error', 'Name');

        $error = implode(', ', array_map(function ($k, $v) {
                    return "$k: $v";
                }, array_keys($blogDatas), array_values($blogDatas)));
    } else if (isset($json->Data->ErrorMessage)) {
        $error = $json->Data->ErrorMessage;
    }

    if (empty($error)) {
        $error = (isset($json->Message)) ? $json->Message : (!empty($response) ? $response : 'API key or API URL is not correct');
    }

    return $error;
}

/* -------------------------------------------------------------------------- */