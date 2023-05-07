<?php
require_once '../includes/db_connection.php';
require_once '../includes/functions.php';

function fetchCategories($parentId = null) {
    $categories = [];

    if ($parentId === null) {
        $stmt = dbExecute("SELECT * FROM category WHERE parent_category IS NULL AND deleted = 0")['stmt'];
    } else {
        $stmt = dbExecute("SELECT c.* FROM category c JOIN category_subcategories cs ON c.id = cs.child_id WHERE cs.category_id = :parentId AND c.deleted = 0 AND cs.deleted = 0", [':parentId' => $parentId])['stmt'];
    }

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $category = [
            'id' => $row['id'],
            'name' => $row['category_name'],
            'children' => fetchCategories($row['id'])
        ];
        array_push($categories, $category);
    }

    return $categories;
}

$categories = fetchCategories();
echo json_encode($categories);
