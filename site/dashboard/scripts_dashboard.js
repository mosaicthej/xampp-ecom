document.getElementById('profilePictureEditIcon').addEventListener('click', function () {
    document.getElementById('profilePictureInput').click();
});

document.getElementById('profilePictureInput').addEventListener('change', function () {
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
    setTimeout(function () {
        $(toast).toast('hide');
    }, 2000);
}

// handling the update user info form submission
$(document).ready(function () {
    $("#updateUserInfoForm").on("submit", function (e) {
        e.preventDefault();

        $.ajax({
            type: "POST",
            url: "process_update_user_info.php",
            data: $(this).serialize(),
            dataType: "json",
            success: function (response) {
                if (response.status === "success") {
                    showToast("User info updated successfully.", "success");
                    updateUserInfoCard(response.user);
                    $("#updateUserInfoModal").modal("hide");
                } else {
                    showToast("Error updating user info.", "error");
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("Error details: ", textStatus, errorThrown);
                showToast("An error occurred while processing the request.", "error");
            }
        });
    });
});

function updateUserInfoCard(user) {
    $("#userUsername").text(user.username);
    $("#userName").text(user.first_name + " " + user.last_name)
    $("#userEmail").text(user.email);
    $("#userPhonenumber").text(user.phone_number);
    if (user.default_address) {
        $("#userDefaultAddress").text(user.default_address);
    }
}


/*
*   For user address management
*/
function fetchUserAddresses() {
    $.ajax({
        type: "GET",
        url: "../includes/fetch_user_address.php",
        /*
         upon a GET request, the PHP script will return a JSON like this:
         {'default_usr_addr_id' => <id in user_address that is user's default address>,
          'addresses' => [ ## an array of addresses]
         }     
         
         when checking for the match in default address,
            for each `address` in `addresses`:
                if address.usr_addr_id == default_usr_addr_id:
                    address is the default address
        */
        dataType: "json",
        success: function (response) {
            // Populate the addresses list with the fetched addresses
            const default_usr_addr_id = response.default_usr_addr_id;
            const addresses = response.addresses;
            $("#addressesList").empty();
            addresses.forEach(function (address) {
                console.log(JSON.stringify(address));
                // Check if the current address is the default address
                const isChecked = address.usr_addr_id == default_usr_addr_id;
                const addressItem = `
                    <li class="list-group-item">
                        <div class="address-item">
                            <input type="radio" name="default_address" value="${address.usr_addr_id}" ${isChecked ? 'checked' : ''} />
                            <label>
                                ${address.contact_name}, ${address.contact_phone}, ${address.contact_email}.\n\n
                                Apartment: ${address.apartment_no}, Street: ${address.streetno} ${address.street},\n\n
                                City: ${address.city}, Region: ${address.region}, Country: ${address.country}, \n
                                Postal Code: ${address.postal_code}
                            </label>
                            <span class="delete-address" data-address-id="${address.usr_addr_id}">
                                <i class="fas fa-trash"></i>
                            </span>
                        </div>
                    </li>
                `;
                $("#addressesList").append(addressItem);
            });
        },
        error: function () {
            // Handle errors (e.g., show an error message)
        },
    });
}
$("#manageAddressesModal").on("shown.bs.modal", function () {
    fetchUserAddresses();
});

// You can add event listeners for the edit, delete, and add new address buttons here

function fetchCountries() {
    $.ajax({
        type: "GET",
        url: "../includes/fetch_countries.php",
        dataType: "json",
        success: function (countries) {
            countries.forEach(function (country) {
                $("#country").append(
                    $("<option>", {
                        value: country.id,
                        text: country.name,
                    })
                );
            });
        },
        error: function () {
            // Handle errors (e.g., show an error message)
        },
    });
}

function fetchRegions(country_id) {
    $.ajax({
        type: "GET",
        url: "../includes/fetch_regions.php",
        data: { country_id: country_id },
        dataType: "json",
        success: function (regions) {
            $("#region").empty().append($('<option>', { value: '', text: 'Select a region' }));
            regions.forEach(function (region) {
                $("#region").append(
                    $("<option>", {
                        value: region.id,
                        text: region.name,
                    })
                );
            });
        },
        error: function () {
            // Handle errors (e.g., show an error message)
        },
    });
}

function fetchCities(region_id) {
    $.ajax({
        type: "GET",
        url: "../includes/fetch_cities.php",
        data: { region_id: region_id },
        dataType: "json",
        success: function (cities) {
            $("#city").empty().append($('<option>', { value: '', text: 'Select a city' }));
            cities.forEach(function (city) {
                $("#city").append(
                    $("<option>", {
                        value: city.id,
                        text: city.name,
                    })
                );
            });
        },
        error: function () {
            // Handle errors (e.g., show an error message)
        },
    });
}

$(document).ready(function () {
    fetchCountries();

    $("#country").on("change", function () {
        const country_id = $(this).val();
        if (country_id) {
            fetchRegions(country_id);
        } else {
            $("#region").empty().append($('<option>', { value: '', text: 'Select a region' }));
            $("#city").empty().append($('<option>', { value: '', text: 'Select a city' }));
        }
    });

    $("#region").on("change", function () {
        const region_id = $(this).val();
        if (region_id) {
            fetchCities(region_id);
        } else {
            $("#city").empty().append($('<option>', { value: '', text: 'Select a city' }));
        }
    });
});

// handling add new address form submission
$(document).ready(function () {
    $("#addAddressForm").on("submit", function (e) {
        e.preventDefault();

        $.ajax({
            type: "POST",
            url: "./process_add_address.php",
            data: $(this).serialize(),
            dataType: "json",
            success: function (response) {
                if (response.status === "success") {
                    showToast("Address added successfully.", "success");
                    $("#addAddressModal").modal("hide");
                } else {
                    showToast("Error adding address.", "error");
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("Error details: ", textStatus, errorThrown);
                showToast("An error occurred while processing the request.", "error");
            }
        });
    });
});