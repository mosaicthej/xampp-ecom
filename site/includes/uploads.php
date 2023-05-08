<?php
session_start();
require_once './db_connection.php';
require_once './functions.php';

// Check if the user is logged in
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}

// Check if the form has been submitted and the context is set
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['context'])) {
    $context = $_POST['context'];

    // Check if a file was uploaded
    if (isset($_FILES['file']) && $_FILES['file']['error'] == UPLOAD_ERR_OK) {
        $uploadOk = 1;
        $target_dir = "C:\\xampp\\htdocs\\com302\\site\\uploads\\";
        if ($context == 'profile_picture') {
            $target_dir = $target_dir . "profile_pictures\\";
        } elseif ($context == 'product_image') {
            $target_dir = $target_dir . "product_images\\";
        } else {
            $uploadOk = 0;
        }

        $target_file = $target_dir . basename($_FILES["file"]["name"]);
        $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

        // Check if the file is an actual image
        $check = getimagesize($_FILES["file"]["tmp_name"]);
        if ($check !== false) {
            $uploadOk = 1;
        } else {
            $uploadOk = 0;
        }

        // Check if $uploadOk is set to 0 by an error
        if ($uploadOk == 0) {
            $error = "Sorry, your file was not uploaded.";
        } else {
            // If everything is ok, try to upload file
            if (move_uploaded_file($_FILES["file"]["tmp_name"], $target_file)) {
                if ($context == 'profile_picture') {
                    $username = $_SESSION['username'];
                    $sql = "UPDATE user SET pfp = ? WHERE username = ?";
                    $params = [$target_file, $username];
                    $redirect_page = '../dashboard';
                } elseif ($context == 'product_image') {
                    $product_id = $_POST['product_id'];
                    $sql = "UPDATE product SET image = ? WHERE id = ?";
                    $params = [$target_file, $product_id];
                    $redirect_page = '../product';
                }
                
                $result = dbExecute($sql, $params);
?> <script> console.log("uploaded image to <?php echo $target_file; ?>!"); </script> <?php
                if ($result['success']) {
                    header('Location: ' . $redirect_page);
                } else {
                    $error = "Error updating " . $context . ": " . $result['error'];
                }
            }
        }
    }
}
