<?php
require_once '../includes/db_connection.php';
require_once '../includes/functions.php';

$categoryId = $_POST['categoryId'];
$newcategory_name = $_POST['category_name'];
$newcategory_desc = $_POST['category_desc'];
$parentCategoryId = isset($_POST['parentCategoryId']) ? $_POST['parentCategoryId'] : -1;

dbExecute("UPDATE category SET category_name = :category_name, category_desc = :category_desc, parent_category = :parentCategoryId WHERE id = :categoryId", [
    ':category_name' => $newcategory_name,
    ':category_desc' => $newcategory_desc,
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

require_once 'process_fetch_categories.php';
