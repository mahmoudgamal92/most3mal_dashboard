<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: multipart/form-data");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
$user_id = $_GET['user_id'];
$invoice_value = $_GET['invoice_value'];
####### Initiate Payment ######
$token ="bearer rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL" ;
$basURL = "https://apitest.myfatoorah.com";

####### Execute Payment ######
$curl = curl_init();
curl_setopt_array($curl, array(
  CURLOPT_URL => "$basURL/v2/ExecutePayment",
  CURLOPT_CUSTOMREQUEST => "POST",
  CURLOPT_POSTFIELDS => "{
      \"PaymentMethodId\":\"2\",
      \"CustomerName\": \"mahmoud gamal\",
      \"DisplayCurrencyIso\": \"SAR\",
       \"MobileCountryCode\":\"+965\",
       \"CustomerMobile\": \"92249038\",
       \"CustomerEmail\": \"mahmoud.elshwaiukh@gmail.com\",
       \"InvoiceValue\": $invoice_value,
       \"CallBackUrl\": \"https://mestamal.com/dashboard/api_mobile/api/custom/payment/success.php?user_id=$user_id&invoice_value=$invoice_value\",
       \"ErrorUrl\": \"https://mestamal.com/dashboard/api_mobile/api/custom/payment/erorr.php?user_id=$user_id\",
       \"Language\": \"en\",
       \"CustomerReference\" :\"ref 1\",
       \"CustomerCivilId\":12345678,
       \"UserDefinedField\": \"Custom field\",
       \"ExpireDate\": \"\",
       \"CustomerAddress\" :{\"Block\":\"\",\"Street\":\"\",\"HouseBuildingNo\":\"\",\"Address\":\"\",\"AddressInstructions\":\"\"},
       \"InvoiceItems\": [{
           \"ItemName\": \"Course Enroll\",
           \"Quantity\": 1,
           \"UnitPrice\": $invoice_value
          }]}",
  CURLOPT_HTTPHEADER => array("Authorization: $token","Content-Type: application/json"),
));
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} 
else {
    $response_json = json_decode($response);
    if($response_json->IsSuccess == true)
    {
   $url = $response_json->Data->PaymentURL;
    http_response_code(200);
    echo json_encode(array(
        "success" => "true",    
        "url" => $url , 
        ));
    }
    else
    {
         http_response_code(200);
    echo json_encode(array(
        "success" => "false",    
        "message" => $response_json , 
        ));
    }
}
?>