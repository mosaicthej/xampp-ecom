// Mock category data
let categories = [
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
];

// Selected category for updating or deleting
let selectedCategory = null;

// Functions to generate category list HTML
function createCategoryList(categories) {
    let listHtml = '';
    categories.forEach(category => {
        listHtml += `<li data-category-id="${category.id}" class="list-group-item">${category.name}`;
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
updateCategoryList();

// Event listeners for buttons and category list
document.getElementById('categoryForm').addEventListener('submit', function(event) {
    event.preventDefault();

    const categoryName = document.getElementById('categoryName').value;
    const newCategory = { id: Date.now(), name: categoryName, children: [] };

    if (selectedCategory) {
        const parentCategory = findCategoryById(categories, selectedCategory.id);
        parentCategory.children.push(newCategory);
    } else {
        categories.push(newCategory);
    }

    updateCategoryList();
    document.getElementById('categoryForm').reset();
});

document.getElementById('updateCategoryBtn').addEventListener('click', function() {
    if (selectedCategory) {
        const newCategoryName = document.getElementById('categoryName').value;
        selectedCategory.name = newCategoryName;
        updateCategoryList();
    }
});

document.getElementById('deleteCategoryBtn').addEventListener('click', function() {
    if (selectedCategory) {
        deleteCategoryById(categories, selectedCategory.id);
        selectedCategory = null;
        document.getElementById('categoryName').value = '';
        updateCategoryList();
    }
});

document.getElementById('categoryList').addEventListener('click', function(event) {
    const categoryElement = event.target.closest('[data-category-id]');
    if (categoryElement) {
        const categoryId = parseInt(categoryElement.dataset.categoryId);
        selectedCategory = findCategoryById(categories, categoryId);
        document.getElementById('categoryName').value = selectedCategory.name;
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


