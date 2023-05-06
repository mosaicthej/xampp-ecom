<?php
require_once '../includes/db_connection.php';
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $def_ua_id = $_POST['def_ua_id'];

    $query_userinfo_update = "
        UPDATE user SET default_usr_address_id = ? WHERE id = ? AND username = ?";
    $query_userinfo_update_params = [
        $def_ua_id,
        $_SESSION['id'],
        $_SESSION['username']
    ];

    $conn->beginTransaction();
    $stmt = $conn->prepare($query_userinfo_update);
    try{
        $stmt->execute($query_userinfo_update_params);
        $conn->commit();
        echo 'success';
    } catch (PDOException $e) {
        $conn->rollBack();
        echo 'error';
    }
}