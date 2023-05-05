<?php
$page = 'category';

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/dashboard.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
</head>
<body>
    <div class="container-fluid">
        <div class="row">
			<?php require_once '../includes/navbar.php'; ?>
            <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
                    <h1 class="h2">Category Management</h1>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <form id="categoryForm">
                            <div class="form-group">
                                <label for="categoryName">Category Name:</label>
                                <input type="text" class="form-control" id="categoryName" placeholder="Enter category name" name="categoryName" required>
                            </div>
                            <button type="submit" class="btn btn-primary" id="addCategoryBtn">Add Category</button>
                            <button type="button" class="btn btn-warning" id="updateCategoryBtn" disabled>Update Category</button>
                            <button type="button" class="btn btn-danger" id="deleteCategoryBtn" disabled>Delete Category</button>
                        </form>
                    </div>
                    <div class="col-md-6">
                        <h5>Categories</h5>
                        <ul class="list-group" id="categoryList">
                            <!-- Categories will be listed here -->
                        </ul>
                    </div>
                </div>
            </main>
        </div>
    </div>
    <script src="../../src/js/mock/category.js"></script>
</body>
</html>