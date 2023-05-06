<?php
require_once './db_connection.php';

$region_id = $_GET['region_id'];

$query = "SELECT id, name FROM cities WHERE region_id = ?";
$stmt = $conn->prepare($query);
$stmt->execute([$region_id]);
$cities = $stmt->fetchAll(PDO::FETCH_ASSOC);

header('Content-Type: application/json');
echo json_encode($cities);
