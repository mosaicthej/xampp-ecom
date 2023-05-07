<?php
require_once '../includes/db_connection.php';
require_once '../includes/functions.php';


$id = $_POST['id'];
$productName = $_POST['productName'];
$productPrice = $_POST['productPrice'];
$productImageUrl = $_POST['productImage']; // Handle file upload and get the URL
$productDescription = $_POST['productDescription'];

$query = "UPDATE products SET name = :name, price = :price, imageUrl = :imageUrl, description = :description WHERE id = :id";
$params = [
    ':id' => $id,
    ':name' => $productName,
    ':price' => $productPrice,
    ':imageUrl' => $productImageUrl,
    ':description' => $productDescription
];

dbExecute($query, $params);
?>