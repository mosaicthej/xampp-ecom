// Mock product data
let products = [
    {
        id: 1,
        name: '[グッズ]初音ミクマジカルミライ2013ふわふわぬいぐるみ(L)',
        price: 99.99,
        imageUrl: '../../res/mifu.jpg',
        description: '「マジカルミライ2013」の衣装を身にまとったぬいぐるみです。\n\
        セガではおなじみの三月八日デザイン。\n\
        アニメ・ホビー系関連ショップ他にて発売！\n\
        ECサイト「キャラアニ.com」ほか、各種ECサイトで取扱い予定！'
    },
    {
        id: 2,
        name: '鏡音リン 『リンちゃんなう！』大人リンVer.',
        price: 199.99,
        imageUrl: '../../res/rinchan.jpg',
        description: '大人になったリンちゃん、登場です♪\n\
        オワタPによるミリオン再生の人気楽曲「リンちゃんなう！」より、田村ヒロ氏がキャラクターデザインを手がけた“大人になった鏡音リン”が1/8スケールフィギュアになって登場です。腰まで伸びたロングヘアーや、ちょっと大人っぽい表情＆仕草など、14歳のリンちゃんとは違った魅力がいっぱいです。素敵なレディに成長した「大人リン」に、ハートを打ち抜かれてください！'
    }
];

// Selected product for updating or deleting
let selectedProduct = null;

// Functions to generate product grid HTML
function createProductCard(product) {
return `
<div class="col-md-4 col-lg-3 mb-4" data-product-id="${product.id}">
    <div class="card">
        <img src="${product.imageUrl}" class="card-img-top" alt="Product image">
        <div class="card-body">
            <h5 class="card-title">${product.name}</h5>
            <p class="card-text">${product.description}</p>
            <p class="card-price text-success">$${product.price.toFixed(2)}</p>
        </div>
    </div>
</div>
`;
}

function updateProductGrid() {
const productGrid = document.getElementById('productGrid');
productGrid.innerHTML = products.map(product => createProductCard(product)).join('');
}

// Initial rendering of product grid
updateProductGrid();

// Event listeners for buttons and product grid
document.getElementById('productForm').addEventListener('submit', function(event) {
event.preventDefault();

const productName = document.getElementById('productName').value;
const productPrice = parseFloat(document.getElementById('productPrice').value);
const productImageUrl = document.getElementById('productImage').value; // Replace this with the actual uploaded image URL
const productDescription = document.getElementById('productDescription').value;

if (selectedProduct) {
selectedProduct.name = productName;
selectedProduct.price = productPrice;
selectedProduct.imageUrl = productImageUrl;
selectedProduct.description = productDescription;
} else {
const newProduct = {
    id: Date.now(),
    name: productName,
    price: productPrice,
    imageUrl: productImageUrl,
    description: productDescription
};
products.push(newProduct);
}

updateProductGrid();
document.getElementById('productForm').reset();
$('#productModal').modal('hide');
});

document.getElementById('productGrid').addEventListener('click', function(event) {
const productElement = event.target.closest('[data-product-id]');
if (productElement) {
const productId = parseInt(productElement.dataset.productId);
selectedProduct = products.find(product => product.id === productId);

document.getElementById('productName').value = selectedProduct.name;
document.getElementById('productPrice').value = selectedProduct.price.toFixed(2);
document.getElementById('productImage').value = ''; // Clear the file input
document.getElementById('productDescription').value = selectedProduct.description;

document.getElementById('productModalLabel').textContent = 'Update Product';
document.getElementById('saveProductBtn').textContent = 'Update Product';
$('#productModal').modal('show');
}
});

$('#productModal').on('hidden.bs.modal', function() {
selectedProduct = null;
document.getElementById('productForm').reset();
document.getElementById('productModalLabel').textContent = 'Add Product';
document.getElementById('saveProductBtn').textContent = 'Save Product';
});

// delete product
document.getElementById('deleteProductBtn').addEventListener('click', function() {
if (selectedProduct) {
products = products.filter(product => product.id !== selectedProduct.id);
selectedProduct = null;
updateProductGrid();
$('#productModal').modal('hide');
}
});
