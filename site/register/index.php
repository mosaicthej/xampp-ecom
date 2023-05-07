<?php
session_start();

// Redirect to dashboard if the user is already logged in
if (isset($_SESSION['username'])) {
    header('Location: dashboard.php');
    exit();
}

// Include the database connection file
require_once './includes/db_connection.php';
require_once './includes/functions.php';

// Check if the form has been submitted
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Retrieve the submitted information
    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $first_name = $_POST['first_name'];
    $last_name = $_POST['last_name'];
    $phone = $_POST['phone_number'];
    // Hash the password
    $hashed_password = password_hash($password, PASSWORD_DEFAULT, ['cost' => 10]);

    // Insert the new user into the database
    /*
    $sql = "INSERT INTO user (username, email, password, first_name, last_name, phone_number) VALUE (:username, :email, :password, :first_name, :last_name, :phone_number)";
    $stmt = $conn->prepare($sql);
    $result = $stmt->execute(['username' => $username, 
                    'email' => $email, 
                    'password' => $hashed_password, 
                    'first_name' => $first_name, 
                    'last_name' => $last_name, 
                    'phone_number' => $phone]);
    */
    $stmt = dbExecute(
        <<<SQL
        INSERT INTO user
            (username, email, password, first_name, last_name, phone_number)
        VALUES
            (?, ?, ?, ?, ?, ?)
        SQL,
        [$username, $email, $hashed_password, $first_name, $last_name, $phone]
    )['stmt'];
    

    // If the user is successfully added
    if ($stmt->rowCount() > 0) {
        // Set the session variables and redirect to dashboard
        $_SESSION['username'] = $username;
        $_SESSION['id'] = $conn->lastInsertId();
        header('Location: dashboard.php');
        exit();
    } else {
        $error = "Something went wrong. Please try again later.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registeration</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto mt-5">
                <h2 class="text-center mb-4">Register</h2>
                <div class="card">
                    <div class="card-body">
                        <form id="registerForm" method="POST" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>">
                        <?php
                            $inp_elem = [ // (field name, label, type, required) for (username, password, email, first name, last name, phone number)
                                ['username', 'Username', 'text', true],
                                ['email', 'Email', 'email', true],
                                ['password', 'Password', 'password', true],
                                ['first_name', 'First Name', 'text', false],
                                ['last_name', 'Last Name', 'text', false],
                                ['phone_number', 'Phone Number', 'text', false]
                            ];

                            for ($i = 0; $i < count($inp_elem); $i++) {
                                $name = $inp_elem[$i][0];
                                $label = $inp_elem[$i][1];
                                $type = $inp_elem[$i][2];
                                $required = $inp_elem[$i][3];

                                echo '<div class="form-group">';
                                echo '<label for="' . $name . '">' . $label . ':</label>';
                                echo '<input type="' . $type . '" class="form-control" id="' . $name . '" placeholder="Enter ' . $label . '" name="' . $name . '" ' . ($required ? 'required' : '') . '>';
                                echo '</div>';
                            }
                        ?>
                            <button type="submit" class="btn btn-primary">Register</button>
                        </form>
                        <p class="mt-3">Already have an account? <a href="login.php">Login</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
