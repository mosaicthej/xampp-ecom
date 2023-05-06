<?php
require_once './db_connection.php';

$country_id = $_GET['country_id'];

$query = "SELECT id, name FROM regions WHERE country_id = ?";
$stmt = $conn->prepare($query);
$stmt->execute([$country_id]);
$regions = $stmt->fetchAll(PDO::FETCH_ASSOC);

header('Content-Type: application/json');
echo json_encode($regions);
