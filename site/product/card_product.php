<?php
$parsed_str = "
<div class='col-md-4 col-lg-3 mb-4' data-product-id='".$product['id']."'>
    <div class='card'>
        <img src=";
            if ($product['image'] == null) {
                $parsed_str .= '../uploads/product_images/default_product.jpg';
            } else {
                $product_pic_path = "../uploads/product_images/";
                $product_pic = $product['image'];
                $product_pic_ext = pathinfo($product_pic, PATHINFO_EXTENSION);
                $parsed_str .= $product_pic_path . basename($product_pic, '.' . $product_pic_ext) . '.' . $product_pic_ext;
            }
        $parsed_str .=" alt='Product image' class='card-img-top' width='200' height='200' onerror=\"this.onerror=null; this.src='../uploads/product_images/default_product.jpg';\"onclick=\"triggerFileInput(" . $product['id'] . ")\">
        <form action='../includes/uploads.php' method=\"post\" enctype=\"multipart/form-data\" id=\"productImgForm-" . $product['id'] . "\" style=\"display: none;\">
            <input type=\"file\" name=\"file\" id=\"product_img_Input-" . $product['id'] . "\" onchange=\"handleImageInputChange(" . $product['id'] . ")\">
            <input type=\"hidden\" name=\"context\" value=\"product_image\">
            <input type=\"hidden\" name=\"product_id\" value=\"" . $product['id'] . "\">
        </form>
        
        <div class='card-body' data-toggle=\"modal\" data-target=\"#productModal\">
            <h5 class='card-title'>". $product['name']. "</h5>".
            // "<p class='card-text'>".$product['description']."</p>".
            "<p class='card-price text-success'>".
            // (new NumberFormatter("ja-JP", NumberFormatter::CURRENCY))
            //     ->formatCurrency($product['price'], "JPY").
            "¥".$product['price']."
            </p>
        </div>
    </div>
</div>
<script src='./script_cards.js'></script>
";
return $parsed_str;