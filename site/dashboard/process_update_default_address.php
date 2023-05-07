<?php
require_once '../includes/db_connection.php';
require_once '../includes/functions.php';
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $def_ua_id = $_POST['def_ua_id'];

    $query_def_addr_update = "
        UPDATE user SET default_usr_address_id = ? WHERE id = ? AND username = ?";
    $query_def_addr_update_params = [
        $def_ua_id,
        $_SESSION['id'],
        $_SESSION['username']
    ];

    $conn->beginTransaction();
    $succuss = dbExecute($query_def_addr_update, $query_def_addr_update_params)['success'];
    if($succuss){
        $conn->commit();
        echo 'success';
    } else {
        $conn->rollBack();
        echo 'error while updating user default address';
    }
}