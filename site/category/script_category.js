// Mock category data
let categories = [];
/* in json format like this:

[
    {
        id: 1,
        name: 'Computer Hardwares',
        children: [
            {
                id: 2,
                name: 'Graphic Cards',
                children: [
                    { id: 3, name: 'HTPC', children: [] },
                    { id: 4, name: 'USB Card', children: [] }
                ]
            },
            {
                id: 5,
                name: 'Hard Drives',
                children: [
                    { id: 6, name: 'SSD', children: [] },
                    { id: 7, name: 'HDD', children: [] }
                ]
            }
        ]
    }
]
    */

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

function updateCategoryList() {
    document.getElementById('categoryList').innerHTML = createCategoryList(categories);
}

// Initial rendering of category list
fetch('./process_fetch_categories.php')
    .then(response => response.json())
    .then(data => {
        categories = data;
        updateCategoryList();
    });


// Event listeners for buttons and category list
document.getElementById('categoryForm').addEventListener('submit', function(event) {
    event.preventDefault();

    const category_name = document.getElementById('category_name').value;
    const category_desc = document.getElementById('category_desc').value;
    const parentCategoryId = selectedCategory ? selectedCategory.id : null;

    fetch('./process_add_category.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: `category_name=${encodeURIComponent(category_name)}
            &category_desc=${encodeURIComponent(category_desc)}
            &parentCategoryId=${encodeURIComponent(parentCategoryId)==='null'?'-1':encodeURIComponent(parentCategoryId)
            }` // Include category_desc here
    })
        .then(response => response.json())
        .then(data => {
            categories = data;
            updateCategoryList();
            document.getElementById('categoryForm').reset();
        });
});



document.getElementById('updateCategoryBtn').addEventListener('click', function() {
    if (selectedCategory) {
        const newcategory_name = document.getElementById('category_name').value;
        const newcategory_desc = document.getElementById('category_desc').value; 

        fetch('./process_update_category.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: `categoryId=${encodeURIComponent(selectedCategory.id)}
                &category_name=${encodeURIComponent(newcategory_name)}
                &category_desc=${encodeURIComponent(newcategory_desc)}`
        })
            .then(response => response.json())
            .then(data => {
                categories = data;
                updateCategoryList();
            });
    }
});


document.getElementById('deleteCategoryBtn').addEventListener('click', function() {
    if (selectedCategory) {
        fetch('./process_delete_category.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: `categoryId=${encodeURIComponent(selectedCategory.id)}`
        })
            .then(response => response.json())
            .then(data =>  {
                categories = data;
                selectedCategory = null;
                document.getElementById('category_name').value = '';
                updateCategoryList();
            });
    }
});
               


document.getElementById('categoryList').addEventListener('click', function(event) {
    const categoryElement = event.target.closest('[data-category-id]');
    if (categoryElement) {
        const categoryId = parseInt(categoryElement.dataset.categoryId);
        selectedCategory = findCategoryById(categories, categoryId);
        document.getElementById('category_name').value = selectedCategory.name;
        document.getElementById('category_desc').value = selectedCategory.desc; // Add this line
        document.getElementById('updateCategoryBtn').disabled = false;
        document.getElementById('deleteCategoryBtn').disabled = false;
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

function deleteCategoryById(categories, categoryId) {
    for (let i = 0; i < categories.length; i++) {
        if (categories[i].id === categoryId) {
            categories.splice(i, 1);
            return true;
        }
        const deleted = deleteCategoryById(categories[i].children, categoryId);
        if (deleted) {
            return true;
        }
    }
    return false;
}