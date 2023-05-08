<?php
require_once '../includes/db_connection.php';
require_once '../includes/functions.php';

$productName = $_POST['productName'];
$productPrice = $_POST['productPrice'];
$productDescription = $_POST['productDescription'];
$categoryId = $_POST['categoryId'];

$query = "INSERT INTO product (name, price, description, categoryId) VALUES (:name, :price, :description, :categoryId)";
$params = [
    ':name' => $productName,
    ':price' => $productPrice,
    ':description' => $productDescription,
    ':categoryId' => $categoryId
];

dbExecute($query, $params);
?>
