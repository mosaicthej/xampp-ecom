<?php
require_once '../includes/db_connection.php';
require_once '../includes/functions.php';


$result = dbExecute("SELECT * FROM product WHERE deleted = 0");

$products = [];
while ($row = $result['stmt']->fetch(PDO::FETCH_ASSOC)) {
    $products[] = $row;
}

header('Content-Type: application/json');
echo json_encode($products);
?>