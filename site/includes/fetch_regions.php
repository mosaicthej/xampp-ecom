<?php
require_once './db_connection.php';
require_once './functions.php';

$country_id = $_GET['country_id'];

$query = "SELECT * FROM regions WHERE country_id = ?";
$regions = dbExecute($query, [$country_id])['stmt']->fetchAll(PDO::FETCH_ASSOC);

header('Content-Type: application/json');
echo json_encode($regions);
