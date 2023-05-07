<?php
require_once '../includes/db_connection.php';
require_once '../includes/functions.php';

$category_name = $_POST['category_name'];
$category_desc = $_POST['category_desc'];

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
