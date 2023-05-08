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
                        <input type="hidden" id="productId">
                        <input type="hidden" id="selectedCategoryId">
                    <div class="form-group">
                        <label for="categoryDropdown">Category</label>
                        <div id="categoryDropdown" class="nested-dropdown" onclick="handleCategoryClick(event)">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="productName">Product Name:</label>
                        <input type="text" class="form-control" id="productName" placeholder="Enter product name" required>
                    </div>
                    <div class="form-group">
                        <label for="productPrice">Price:</label>
                        <input type="number" step="0.01" class="form-control" id="productPrice" placeholder="Enter price" required>
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