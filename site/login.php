<?php
session_start();

// Redirect to dashboard if the user is already logged in
if (isset($_SESSION['username'])) {
    header('Location: dashboard.php');
    exit();
}

// Include the database connection file
require_once './includes/db_connection.php';

// Check if the form has been submitted
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Retrieve the submitted email and password
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Validate the user credentials
    $sql = "SELECT * FROM user WHERE email = ?";
    $stmt = $conn -> prepare($sql);
    $success = $stmt -> execute([$email]); // $stmt -> execute([[$email
    $result = $stmt -> fetch();
    

    if ($result) {
        $user = $result;

        if (password_verify($password, $user['password'])) {
            // Set the session variables and redirect to dashboard
            $_SESSION['username'] = $user['username'];
            $_SESSION['id'] = $user['id'];
            header('Location: dashboard.php');
            exit();
        } else {
            $error = "Incorrect password.";
        }
    } else {
        $error = "Email does not exist.";
    }
}
?>

<!DOCTYPE html>
<!-- The rest of the HTML code remains the same -->

<!-- Update the form to use POST method and set the action to the same file -->
<form id="loginForm" method="POST" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>">
    <!-- The rest of the form code remains the same -->

<!-- Display the error message if there's any -->
<?php if (isset($error)): ?>
    <div class="alert alert-danger" role="alert">
        <?php echo $error; ?>
    </div>
<?php endif; ?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto mt-5">
                <h2 class="text-center mb-4">Ecommerce Platform</h2>
                <div class="card">
                    <div class="card-body">
                    <form id="loginForm" method="POST" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>">
                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" required>
                            </div>
                            <div class="form-group">
                                <label for="password">Password:</label>
                                <input type="password" class="form-control" id="password" placeholder="Enter password" name="password" required>
                            </div>
                            <div class="form-group form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="checkbox" name="remember"> Remember me
                                </label>
                            </div>
                            <button type="submit" class="btn btn-primary">Login</button>
                        </form>
                        <p class="mt-3"><a href="#">Forgot password?</a></p>
                        <p>Don't have an account? <a href="register.php">Sign up</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- Display the error message if there's any -->
<?php if (isset($error)): ?>
    <div class="alert alert-danger" role="alert">
        <?php echo $error; ?>
    </div>
<?php endif; ?>
</body>
</html>
