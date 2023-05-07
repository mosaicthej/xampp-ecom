<?php
require_once './db_connection.php';
require_once './functions.php';

$region_id = $_GET['region_id'];

$stmt = dbExecute("SELECT id, name FROM cities WHERE region_id = ?", [$region_id])['stmt'];
$cities = $stmt->fetchAll(PDO::FETCH_ASSOC);

header('Content-Type: application/json');
echo json_encode($cities);
