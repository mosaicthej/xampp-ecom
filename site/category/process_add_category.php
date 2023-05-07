<?php
require_once '../includes/db_connection.php';
require_once '../includes/functions.php';

$categoryName = $_POST['categoryName'];
$parentCategoryId = isset($_POST['parentCategoryId']) ? $_POST['parentCategoryId'] : null;

$stmt = dbExecute("INSERT INTO category (category_name, parent_category) VALUES (:categoryName, :parentCategoryId)", [
    ':categoryName' => $categoryName,
    ':parentCategoryId' => $parentCategoryId
])['stmt'];

$newCategoryId = $conn->lastInsertId();

if ($parentCategoryId !== null) { // Add this condition
    dbExecute("INSERT INTO category_subcategories (category_id, child_id) VALUES (:categoryId, :childId)", [
        ':categoryId' => $parentCategoryId,
        ':childId' => $newCategoryId
    ]);
}

require_once 'process_fetch_categories.php';
