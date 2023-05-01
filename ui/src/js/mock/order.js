// Sample orders data
const orders = [
    {
        id: 1,
        shipmentInfo: 'Shipment #1',
        amountDue: 100,
        amountPaid: 100,
        orderDetails: 'Order details #1',
        shippingAddress: '123 Main St, City, Country',
        items: ['Item 1', 'Item 2']
    },
    {
        id: 2,
        shipmentInfo: 'Shipment #2',
        amountDue: 200,
        amountPaid: 200,
        orderDetails: 'Order details #2',
        shippingAddress: '456 Market St, City, Country',
        items: ['Item 3', 'Item 4']
    }
];

// Selected order for updating
let selectedOrder = null;

// Functions to generate order table HTML
function createOrderRow(order) {
    return `
        <tr data-order-id="${order.id}">
            <td>${order.id}</td>
            <td>${order.shipmentInfo}</td>
            <td>$${order.amountDue.toFixed(2)}</td>
            <td>$${order.amountPaid.toFixed(2)}</td>
            <td>${order.orderDetails}</td>
            <td>${order.shippingAddress}</td>
            <td>${order.items.join(', ')}</td>
        </tr>
    `;
}

function updateOrderTable() {
    const orderTable = document.getElementById('orderTable');
    orderTable.querySelector('tbody').innerHTML = orders.map(order => createOrderRow(order)).join('');
}

// Initial rendering of the order table
updateOrderTable();

// Event listeners for the order table
document.getElementById('orderTable').addEventListener('click', function(event) {
    const orderRow = event.target.closest('[data-order-id]');
    if (orderRow) {
        const orderId = parseInt(orderRow.dataset.orderId);
        selectedOrder = orders.find(order => order.id === orderId);

        // Fill in order modal with selected order's data
        // Replace the following line with the actual form elements
        document.getElementById('orderModal').querySelector('.modal-body').textContent = `Update order #${selectedOrder.id}`;

        $('#orderModal').modal('show');
    }
});

document.getElementById('updateOrderBtn').addEventListener('click', function() {
    // Update selected order's data based on form input
    // Replace the following lines with the actual form input values
    selectedOrder.shipmentInfo = `Updated ${selectedOrder.shipmentInfo}`;
    selectedOrder.amountDue = selectedOrder.amountDue + 10;
    selectedOrder.amountPaid = selectedOrder.amountPaid + 10;
    selectedOrder.orderDetails = `Updated ${selectedOrder.orderDetails}`;
    selectedOrder.shippingAddress = 'Updated Shipping Address';
    selectedOrder.items = ['Updated Item 1', 'Updated Item 2'];

    updateOrderTable();
    $('#orderModal').modal('hide');
});
