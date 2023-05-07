<?php
require_once '../includes/db_connection.php';
require_once  '../includes/functions.php';
session_start();

// Fetch products from the database
$query = "SELECT * FROM product WHERE deleted = 0";
$result = dbExecute($query);

$products = $result['stmt']->fetchAll(PDO::FETCH_ASSOC);
?>

<div class="row" id="productGrid">
    <div class="row" id="productGrid">
        <?php foreach ($products as $product) : ?>
            <?php include './product_card.php'; ?>
        <?php endforeach; ?>
    </div>
</div>