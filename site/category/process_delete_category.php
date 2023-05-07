<?php
require_once '../includes/db_connection.php';
require_once '../includes/functions.php';

$categoryId = $_POST['categoryId'];

function deleteCategory($categoryId) {
    $stmt = dbExecute("SELECT id FROM category WHERE parent_category = :categoryId", [':categoryId' => $categoryId])['stmt'];
    $childCategories = $stmt->fetchAll(PDO::FETCH_COLUMN);

    foreach ($childCategories as $childCategoryId) {
        deleteCategory($childCategoryId);
    }

    dbExecute("UPDATE category SET deleted = 1 WHERE id = :categoryId", [':categoryId' => $categoryId]);
    dbExecute("UPDATE category_subcategories SET deleted = 1 WHERE category_id = :categoryId OR child_id = :categoryId", [':categoryId' => $categoryId]);
}

deleteCategory($categoryId);

require_once 'fetch_categories.php';
