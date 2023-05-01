// Sample users data
const users = [
    {
        id: 1,
        name: 'Kagamine Rin',
        pfp: '../../res/rinchannao.jpg',
        paymentMethods: ['Credit Card'],
        shippingAddress: '123 Main St, City, Country',
        orderHistory: []
    },
    {
        id: 2,
        name: 'Megurine Luka',
        pfp: '../../res/luka.jpg',
        paymentMethods: ['PayPal'],
        shippingAddress: '456 Market St, City, Country',
        orderHistory: []
    }
];

// Selected user for updating
let selectedUser = null;

// Functions to generate user table HTML
function createUserRow(user) {
    return `
        <tr data-user-id="${user.id}">
            <td><img src="${user.pfp}" alt="Profile picture" class="rounded-circle" width="40" height="40"></td>
            <td>${user.name}</td>
        </tr>
    `;
}

function updateUserTable() {
    const userTable = document.getElementById('userTable');
    userTable.querySelector('tbody').innerHTML = users.map(user => createUserRow(user)).join('');
}

// Initial rendering of user table
updateUserTable();

// Event listeners for the user table
document.getElementById('userTable').addEventListener('click', function(event) {
    const userRow = event.target.closest('[data-user-id]');
    if (userRow) {
        const userId = parseInt(userRow.dataset.userId);
        selectedUser = users.find(user => user.id === userId);

        // Fill in user modal with selected user's data
        // You can replace the following lines with the actual form elements
        document.getElementById('info').textContent = `User info for ${selectedUser.name}`;
        document.getElementById('payment').textContent = `Payment methods for ${selectedUser.name}`;
        document.getElementById('shipping').textContent = `Shipping address for ${selectedUser.name}`;
        document.getElementById('orders').textContent = `Order history for ${selectedUser.name}`;

        $('#userModal').modal('show');
    }
});

document.getElementById('updateUserBtn').addEventListener('click', function() {
    // Update selected user's data based on form input
    // Replace the following lines with the actual form input values
    selectedUser.name = `Updated ${selectedUser.name}`;
    selectedUser.paymentMethods = ['Updated Payment Method'];
    selectedUser.shippingAddress = 'Updated Shipping Address';
    selectedUser.orderHistory = [];

    updateUserTable();
    $('#userModal').modal('hide');
});
