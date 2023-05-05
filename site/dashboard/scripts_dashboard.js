document.getElementById('profilePictureEditIcon').addEventListener('click', function() {
    document.getElementById('profilePictureInput').click();
});

document.getElementById('profilePictureInput').addEventListener('change', function() {
    document.getElementById('profilePictureForm').submit();
});

function showToast(message, type) {
    // Get the toast container, this should be a div with id="toast_container"
    var toastContainer = document.getElementById('toast_container');
  
    // Create a toast element
    var toast = document.createElement('div');
    toast.classList.add('toast');
    toast.setAttribute('role', 'alert');
    toast.setAttribute('aria-live', 'assertive');
    toast.setAttribute('aria-atomic', 'true');
  
    // Create a toast header
    var toastHeader = document.createElement('div');
    toastHeader.classList.add('toast-header');
  
    // Create a toast body
    var toastBody = document.createElement('div');
    toastBody.classList.add('toast-body');
  
    // Create a toast close button
    var toastCloseButton = document.createElement('button');
    toastCloseButton.classList.add('ml-2', 'mb-1', 'close');
    toastCloseButton.setAttribute('type', 'button');
    toastCloseButton.setAttribute('data-dismiss', 'toast');
    toastCloseButton.setAttribute('aria-label', 'Close');
  
    // Create a toast icon
    var toastIcon = document.createElement('i');
    toastIcon.classList.add('fas');
  
    // Set the toast icon and color based on the type
    if (type === 'success') {
      toastIcon.classList.add('fa-check-circle');
      toastIcon.style.color = '#5cb85c';
    } else if (type === 'error') {
      toastIcon.classList.add('fa-times-circle');
      toastIcon.style.color = '#d9534f';
    }
  
    // Create a toast message
    var toastMessage = document.createTextNode(message);
  
    // Append the toast icon and message to the toast body
    toastBody.appendChild(toastIcon);
    toastBody.appendChild(toastMessage);
  
    // Append the toast body to the toast header
    toastHeader.appendChild(toastBody);
  
    // Append the toast header to the toast
    toast.appendChild(toastHeader);
  
    // Append the toast close button to the toast header
    toastHeader.appendChild(toastCloseButton);
  
    // Append the toast to the toast container
    toastContainer.appendChild(toast);
  
    // Show the toast
    $(toast).toast('show');
  
    // Remove the toast after 2 seconds
    setTimeout(function() {
      $(toast).toast('hide');
    }, 2000);   
}
