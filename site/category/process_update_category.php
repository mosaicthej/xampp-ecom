<?php
require_once '../includes/db_connection.php';
require_once '../includes/functions.php';

$categoryId = $_POST['categoryId'];
$newcategory_name = $_POST['category_name'];
$parentCategoryId = isset($_POST['parentCategoryId']) ? $_POST['parentCategoryId'] : -1;

dbExecute("UPDATE category SET category_name = :categoryName, parent_category = :parentCategoryId WHERE id = :categoryId", [
    ':category_name' => $newcategory_name,
    ':parentCategoryId' => $parentCategoryId,
    ':categoryId' => $categoryId
]);

if ($parentCategoryId !== null) {
    dbExecute("UPDATE category_subcategories SET deleted = 1 WHERE child_id = :childId", [':childId' => $categoryId]);
    dbExecute("INSERT INTO category_subcategories (category_id, child_id) VALUES (:categoryId, :childId)", [
        ':categoryId' => $parentCategoryId,
        ':childId' => $categoryId
    ]);
}

require_once 'fetch_categories.php';
