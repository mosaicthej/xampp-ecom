<?php
require_once '../includes/db_connection.php';
require_once '../includes/functions.php';


$id = $_POST['id'];
$productName = $_POST['productName'];
$productPrice = $_POST['productPrice'];
$productDescription = $_POST['productDescription'];

$query = "UPDATE products SET name = :name, price = :price, description = :description WHERE id = :id";
$params = [
    ':id' => $id,
    ':name' => $productName,
    ':price' => $productPrice,
    ':description' => $productDescription
];

dbExecute($query, $params);
?>