
// Mock product data
let products = [];
// in json like this:
/*
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
*/

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
    

function fetchProducts() {
    $.ajax({
        url: './process_fetch_products.php',
        method: 'GET',
        dataType: 'json',
        success: function (response) {
            updateProductGrid(response);
        },
        error: function () {
            alert('Error fetching products.');
        }
    });
}

function buildCategoryTree(categories) {
    if (!categories.length) {
        return '';
    }

    let tree = '<ul>';
    for (const category of categories) {
        tree += `<li 
            data-category-id="${category.id}">
            ${category.name}${buildCategoryTree(category.children)}
            </li>`;
    }
    tree += '</ul>';

    return tree;
}

function fetchCategories() {
    $.ajax({
        url: '../includes/fetch_categories.php',
        method: 'GET',
        dataType: 'json',
        success: function (response) {
            const categoryTree = buildCategoryTree(response);
            document.getElementById('categoryDropdown').innerHTML = categoryTree;
        },
        error: function () {
            alert('Error fetching categories.');
        }
    });
}

// Fetch categories and update the dropdown
fetchCategories();


function handleCategoryClick(event) {
    if (event.target.tagName === 'li') {
        document.getElementById('selectedCategoryId').value = event.target.dataset.categoryId;
    }
}


// Fetch categories and update the dropdown
fetchCategories();


// Initial fetch and rendering of product grid
fetchProducts();


// Event listeners for buttons and product grid
document.getElementById('productForm').addEventListener('submit', function (event) {
    event.preventDefault();

    const formData = [];
    formData.push(`productName=${document.getElementById('productName').value}`);
    formData.push(`productPrice=${document.getElementById('productPrice').value}`);
    formData.push(`productDescription=${document.getElementById('productDescription').value}`);
    formData.push(`productImageUrl=${document.getElementById('productImage').value}`);
    formData.push('categoryId', document.getElementById('selectedCategoryId').value);

    const formDataString = formData.join('&');

    const action = selectedProduct ? './process_update_product.php' : './process_add_product.php';
    console.log('executing ' + action);
    $.ajax({
        url: action,
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        data: formDataString,
        success: function () {
            fetchProducts();
            $('#productModal').modal('hide');
        },
        error: function () {
            alert('Error saving product.');
        }
    });
});


// delete product
document.getElementById('deleteProductBtn').addEventListener('click', function() {
    if (selectedProduct) {
        $.ajax({
            url: './process_delete_product.php',
            method: 'POST',
            data: { id: selectedProduct.id },
            success: function () {
                fetchProducts();
                $('#productModal').modal('hide');
            },
            error: function () {
                alert('Error deleting product.');
            }
        });
    }
});