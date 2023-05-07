<div class="col-md-4 col-lg-3 mb-4" data-product-id="<?php echo $product['id']; ?>">
    <div class="card">
        <img src="<?php echo $product['image']; ?>" class="card-img-top" alt="Product image">
        <div class="card-body">
            <h5 class="card-title"><?php echo $product['name']; ?></h5>
            <p class="card-text"><?php echo $product['description']; ?></p>
            <p class="card-price text-success">$<?php echo number_format($product['price'], 2); ?></p>
        </div>
    </div>
</div>
