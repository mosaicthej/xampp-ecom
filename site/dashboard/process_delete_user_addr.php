<?php
// this not actually deleting the address, but rather just marking it as deleted

require_once '../includes/db_connection.php';
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
    $stmt = $conn->prepare($query_unset_user_defaddr);
    try{
        $stmt->execute($query_unset_user_defaddr_params);
        $stmt = $conn->prepare($query_del_user_addr);
        try{
            $stmt->execute($query_del_user_addr_params);
            $conn->commit();
            echo 'success';
        } catch (PDOException $e) {
            $conn->rollBack();
            echo 'error';
        }
    } catch (PDOException $e) {
        $conn->rollBack();
        echo 'error';
    }
}


?>