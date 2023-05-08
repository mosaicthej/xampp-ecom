// adding the category selector
let categories = [];
// Selected category for updating or deleting
let selectedCategory = null;

// Functions to generate category list HTML
function createCategoryList(categories) {
    let listHtml = '';
    categories.forEach(category => {
        listHtml += `<li data-category-id="${category.id}" class="list-group-item">
                        <div>${category.name}</div>
                        <small class="text-muted">${category.desc}</small>`;
        if (category.children.length > 0) {
            listHtml += `<ul class="list-group">${createCategoryList(category.children)}</ul>`;
        }
        listHtml += '</li>';
    });
    return listHtml;
}

document.getElementById('categoryList').addEventListener('click', function(event) {
    const categoryElement = event.target.closest('[data-category-id]');
    if (categoryElement) {
        const categoryId = parseInt(categoryElement.dataset.categoryId);
        selectedCategory = findCategoryById(categories, categoryId);

        filterProdByCategory(categoryId);
    }
}); 

// Helper functions
function findCategoryById(categories, categoryId) {
    for (const category of categories) {
        if (category.id === categoryId) {
            return category;
        }
        const foundCategory = findCategoryById(category.children, categoryId);
        if (foundCategory) {
            return foundCategory;
        }
    }
    return null;
}


function updateCategoryList() {
    document.getElementById('categoryList').innerHTML = createCategoryList(categories);
}

// Initial rendering of category list
fetch('../category/process_fetch_categories.php')
    .then(response => response.json())
    .then(data => {
        categories = data;
        updateCategoryList();
    });


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

function filterProdByCategory(categoryId){
    fetch('./wrapper_product.php'.concat('?categoryID=', categoryId), {
            method: 'GET',
        }).then( (res) => {
            console.log(res);
            return res.text();
        }).then( (text) => {    
            console.log(text);
            document.getElementById('prod_wrapper').innerHTML = text;
        }, (err) => {
            console.log(err);
        }
    );
}

function updateProductGrid(products) {
    const productGrid = document.getElementById('productGrid');
    console.log('products is now:' + products);
}
    

function fetchProducts() {
    $.ajax({
        url: './process_fetch_products.php',
        method: 'GET',
        dataType: 'json',
        success: function (response) {
            updateProductGrid(response);
            console.log('displaying products:')
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
            data-category-id="${category.id}"
            onclick="handleCategoryClick(event)"
            hover="pointer"
            >
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
    if (event.target.tagName === 'LI') {
        console.log('clicked category id: ' + event.target.dataset.categoryId);
        document.getElementById('selectedCategoryId').value = event.target.dataset.categoryId;
    }
}


// Fetch categories and update the dropdown
fetchCategories();


// Initial fetch and rendering of product grid
filterProdByCategory(-1);


// Event listeners for buttons and product grid
document.getElementById('productForm').addEventListener('submit', function (event) {
    event.preventDefault();

    const formData = [];
    formData.push(`productName=${document.getElementById('productName').value}`);
    formData.push(`productPrice=${document.getElementById('productPrice').value}`);
    formData.push(`productDescription=${document.getElementById('productDescription').value}`);
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
            filterProdByCategory(-1);
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
                filterProdByCategory(-1);
                $('#productModal').modal('hide');
            },
            error: function () {
                alert('Error deleting product.');
            }
        });
    }
});