<?php
require_once './db_connection.php';

$query = "SELECT id, name FROM countries";
$stmt = $conn->query($query);
$countries = $stmt->fetchAll(PDO::FETCH_ASSOC);

header('Content-Type: application/json');
echo json_encode($countries);
