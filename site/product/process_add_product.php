<?php
require_once '../includes/db_connection.php';
require_once '../includes/functions.php';
echo '<pre>';
var_dump($_POST);
echo '</pre>';
$productName = $_POST['productName'];
$productPrice = $_POST['productPrice'];
$productImageUrl = $_POST['productImageUrl']; // Handle file upload and get the URL
$productDescription = $_POST['productDescription'];

$query = "INSERT INTO product (name, price, image, description) VALUES (:name, :price, :imageUrl, :description)";
$params = [
    ':name' => $productName,
    ':price' => $productPrice,
    ':imageUrl' => $productImageUrl,
    ':description' => $productDescription
];

dbExecute($query, $params);
?>