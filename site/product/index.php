<?php
$page = 'product';

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
                    <h1 class="h2">Product Management</h1>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <button type="button" class="btn btn-primary mb-3" id="addProductBtn" data-toggle="modal" data-target="#productModal">Add Product</button>
                    </div>
                </div>
                <div class="row" id="productGrid">
                    <!-- Product cards will be added here -->
                </div>
            </main>
            
            <!-- Product Modal -->
            <div class="modal fade" id="productModal" tabindex="-1" role="dialog" aria-labelledby="productModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="productModalLabel">Add Product</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form id="productForm">
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="productName">Product Name:</label>
                                    <input type="text" class="form-control" id="productName" placeholder="Enter product name" required>
                                </div>
                                <div class="form-group">
                                    <label for="productPrice">Price:</label>
                                    <input type="number" step="0.01" class="form-control" id="productPrice" placeholder="Enter price" required>
                                </div>
                                <div class="form-group">
                                    <label for="productImage">Product Image:</label>
                                    <input type="file" class="form-control-file" id="productImage">
                                </div>
                                <div class="form-group">
                                    <label for="productDescription">Product Description:</label>
                                    <textarea class="form-control" id="productDescription" rows="3" placeholder="Enter product description"></textarea>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary" id="saveProductBtn">Save Product</button>
                                <button type="button" class="btn btn-secondart" id="deleteProductBtn">Delete Product</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../../src/js/mock/product.js"></script>
</body>
</html>