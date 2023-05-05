<?php
require_once '../includes/db_connection.php';
session_start();
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $fields = [
        'first_name', 'last_name', 'email', 'phone_number'
    ];
    $query_userinfo_update = "
      UPDATE user SET";
    $query_userinfo_update_params = [];
    foreach ($fields as $field) {
        $value = isset($_POST[$field]) ? $_POST[$field] : '';
        $query_userinfo_update .= " $field = ?,";
        $query_userinfo_update_params[] = $value;
    }
    $query_userinfo_update = rtrim($query_userinfo_update, ',');
    $query_userinfo_update .= " WHERE id = ? AND username = ?";
    $query_userinfo_update_params[] = $_SESSION['id'];
    $query_userinfo_update_params[] = $_SESSION['username'];

    $conn->beginTransaction();
    $stmt = $conn->prepare($query_userinfo_update);
    $success = $stmt->execute($query_userinfo_update_params);

    // update the response format to return a JSON object that includes the status and user data:
    if ($success) {
        $conn->commit();
    
        $response = [
        "status" => "success",
        "user" => [
            "username" => $_SESSION['username'],
            "name" => $_POST['first_name'] . ' ' . $_POST['last_name'],
            "email" => $_POST['email'],
            "phone_number" => $_POST['phone_number'],
            // "default_address" => "", // You'll need to get the default address and set it here
        ]
        ];
    
        echo json_encode($response);
        exit();
    } else {
        $conn->rollBack();
    
        $response = [
        "status" => "error",
        "message" => "Error updating user info."
        ];
    
        echo json_encode($response);
        exit();
    }
}
?>