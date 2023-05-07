<?php
require_once '../includes/db_connection.php';
require_once '../includes/functions.php';

$category_name = $_POST['category_name'];
$category_desc = $_POST['category_desc'];
$parentCategoryId = isset($_POST['parentCategoryId']) ? $_POST['parentCategoryId'] : -1; // Change the default value to -1

$stmt = dbExecute("INSERT INTO category (category_name, category_desc, parent_category) VALUES (:category_name, :category_desc, :parentCategoryId)", [
    ':category_name' => $category_name,
    ':category_desc' => $category_desc,
    ':parentCategoryId' => $parentCategoryId
])['stmt'];

$newCategoryId = $conn->lastInsertId();

dbExecute("INSERT INTO category_subcategories (category_id, child_id) VALUES (:categoryId, :childId)", [
    ':categoryId' => $parentCategoryId,
    ':childId' => $newCategoryId
]);

require_once 'process_fetch_categories.php';
