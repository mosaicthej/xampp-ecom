<?php
require_once '../includes/db_connection.php';
require_once  '../includes/functions.php';
session_start();
/*
var_dump($_POST);
*/

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $form_fields = [
        'country', 'region', 'city', 'street', 'streetno', 'apartment', 'postal_code'
    ];
    $db_fields = [
        'country_id', 'region_id', 'city_id', 'street', 'streetno', 'apartment_no', 'postal_code'
    ];

    // query 1: insert the address into the address table
    $query_address_add = "
        INSERT INTO address (  
    ";
    $query_address_add_params = []; $num_field = 0;
    for ($i = 0; $i < count($form_fields); $i++) {
        $value = isset($_POST[$form_fields[$i]]) ? $_POST[$form_fields[$i]] : '';
        $query_address_add .= " $db_fields[$i],";
        $query_address_add_params[] = $value;
        $num_field++;
    }
    // remove the last comma
    $query_address_add = rtrim($query_address_add, ',');
    $query_address_add .= " ) VALUES (";
    for ($i = 0; $i < $num_field; $i++) {
        $query_address_add .= " ?,";
    }
    $query_address_add = rtrim($query_address_add, ',');
    $query_address_add .= " );";

    // query 2: insert the address id and user id into the user_address table
    // address_id is the id of the address that was just inserted
    // which, since we're using auto-increment, is the last inserted id
    $info_fields = [
        'idUser', 'idAddress', 'contact_name', 'contact_phone', 'contact_email'
    ];
    $query_user_address_add = "
        INSERT INTO user_address (
    ";
    $query_user_address_add_params = [
        $_SESSION['id'],
        null,
        $_POST['contact_name'],
        $_POST['contact_phone'],
        $_POST['contact_email']
    ];
    for ($i = 0; $i < count($info_fields); $i++) {
        $query_user_address_add .= " $info_fields[$i],";
    }
    $query_user_address_add = rtrim($query_user_address_add, ',');
    $query_user_address_add .= " ) VALUES (";
    for ($i = 0; $i < count($info_fields); $i++) {
        $query_user_address_add .= " ?,";
    }
    $query_user_address_add = rtrim($query_user_address_add, ',');
    $query_user_address_add .= " );";

    $conn->beginTransaction();
    $success = dbExecute($query_address_add, $query_address_add_params)['success'];

    /*
    echo "executed query is:";
    echo $stmt->debugDumpParams();
    $debugMsg = ob_get_contents();
    ob_end_clean();
    var_dump($debugMsg);
    */
    if ($success) {
        $query_user_address_add_params[1] = $conn->lastInsertId();
        $success = dbExecute($query_user_address_add, $query_user_address_add_params)['success'];
        $response = [
            "status" => "success",
            "message" => "Address added successfully."
        ];
        echo json_encode($response);
        $conn->commit();
        exit();
    } else {
        $conn->rollBack();
        $response = [
            "status" => "error",
            "message" => "Error adding address.",
            "debug" => $debugMsg
        ];
        echo json_encode($response);
        exit();
    }
}