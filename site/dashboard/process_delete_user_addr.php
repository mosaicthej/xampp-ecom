<?php
// this not actually deleting the address, but rather just marking it as deleted

require_once '../includes/db_connection.php';
require_once '../includes/functions.php';
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $ua_id = $_POST['ua_id'];
    $query_unset_user_defaddr = "UPDATE user SET default_usr_address_id = -1 WHERE default_usr_address_id = ? AND id = ?;";
    $query_unset_user_defaddr_params = [
        $ua_id,
        $_SESSION['id']
    ];

    $query_del_user_addr = "UPDATE user_address SET deleted = 1 WHERE id = ? AND idUser = ?;";
    $query_del_user_addr_params = [
        $ua_id,
        $_SESSION['id']
    ];

    $conn->beginTransaction();
    // $stmt = $conn->prepare($query_unset_user_defaddr);
    $success_unset = dbExecute($query_unset_user_defaddr, $query_unset_user_defaddr_params)['success'];
    if($success_unset){
        $success_del = dbExecute($query_del_user_addr, $query_del_user_addr_params)['success'];
        if($success_del){
            $conn->commit();
            echo 'success';
        } else {
            $conn->rollBack();
            echo 'error while deleting user address';
        }
    } else {
        $conn->rollBack();
        echo 'error while unsetting user default address';
    }
}