<?php
/*
*   This should be accessed via GET method,
*   to which the parameter `categoryID` is required
*   (default to -1 if not provided)
*   
*   The response should be a HTML snippet 
*   (top-level div with id `productGrid`) of product cards
*   which belong to the specified category.
*/

require_once '../includes/db_connection.php';
require_once  '../includes/functions.php';
session_start();

if ($_SERVER['REQUEST_METHOD'] != 'GET') {
    http_response_code(405);
    die();
} else{
    $categoryID = $_GET['categoryID'];
    if ($categoryID == null) {
        $categoryID = -1;
    }

    echo 'received category name: ' . dbExecute("SELECT category_name FROM category WHERE id = :categoryID", [':categoryID' => $categoryID])['stmt']->fetch(PDO::FETCH_ASSOC)['category_name'] . '<br>';

    $query = <<<SQL
        SELECT * FROM product WHERE deleted = 0
        AND categoryid IN (
            WITH RECURSIVE subcategories (category_id, child_id) AS (
                SELECT category_id, child_id FROM category_subcategories 
                    WHERE category_id = :categoryid AND deleted = 0
                UNION ALL
                SELECT cs.category_id, cs.child_id FROM category_subcategories cs
                    INNER JOIN subcategories s ON s.child_id = cs.category_id
                    WHERE cs.deleted = 0
            ) SELECT child_id FROM subcategories
        ) OR categoryid = :categoryid
        SQL;
    $stmt = dbExecute($query,
        [':categoryid' => $categoryID])['stmt'];
    
    $products = $stmt->fetchAll(PDO::FETCH_ASSOC);
    // echo 'found products: ';
    // $stmt->debugDumpParams();
    // echo '<pre>'; var_dump($products); echo '</pre>';

    $productGrid = '<div class="row" id="productGrid">';

    foreach ($products as $product){
        $productGrid .= include './card_product.php';
    }

    $productGrid .= '</div>';
    echo $productGrid;
    exit();
}