<?php
require_once '../includes/db_connection.php';
require_once '../includes/functions.php';

$id = $_POST['id'];

$query = "UPDATE products SET deleted = 1, deleted_time = CURRENT_TIMESTAMP WHERE id = :id";
$params = [':id' => $id];

dbExecute($query, $params);
?>
