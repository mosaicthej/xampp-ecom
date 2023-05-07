<?php
require_once 'db_connection.php';
function dbExecute($query, $params = []) {
    global $conn;
    $stmt = $conn->prepare($query);
    $success = false;

    foreach ($params as $key => &$value) {
        if (is_int($key)) {
            $stmt->bindParam($key + 1, $value);
        } else {
            $stmt->bindParam($key, $value);
        }
    }
    
    try {
        $success = $stmt->execute();
    } catch (PDOException $e) {
        echo "Error when executing query: " . $e->getMessage() . "\n";
        $stmt->debugDumpParams();
    }
    return ["stmt" => $stmt, "success" => $success];
}
