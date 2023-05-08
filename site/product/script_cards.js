document.querySelectorAll('.card-img-top').forEach(element => {
    element.addEventListener('click', function(event) {
        console.log('clicked product id: ' + event.target.dataset.productId);
      event.preventDefault();
      const productId = event.target.closest('[data-product-id]').getAttribute('data-product-id');
      const fileInput = document.getElementById(`product_img_Input-${productId}`);
      fileInput.click();
    });
  });

document.querySelectorAll('[id^="product_img_Input-"]').forEach(element => {
element.addEventListener('change', function(event) {
    const productId = event.target.closest('[data-product-id]').getAttribute('data-product-id');
    const form = document.getElementById(`productImgForm-${productId}`);
    form.submit();
});
});
