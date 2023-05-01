document.getElementById("loginForm").addEventListener("submit", function(event) {
    event.preventDefault();

    const email = document.getElementById("email").value;
    const password = document.getElementById("password").value;
    const rememberMe = document.querySelector("input[name='remember']").checked;

    // You can use this data to call an authentication API
    console.log("Email:", email);
    console.log("Password:", password);
    console.log("Remember me:", rememberMe);

    // Redirect to the admin dashboard after successful login
    window.location.href = "static/html/dashboard.html";
});
