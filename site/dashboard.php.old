<?php
// Start session
session_start();

// Check if the user is logged in
if (!isset($_SESSION['username'])) {
    // Redirect to login page if not logged in
    header('Location: login.php');
    exit();
}

// Database connection
require_once './includes/db_connection.php';

// Get user information
$userid = $_SESSION['id'];
$sql = "SELECT * FROM user WHERE id = ?";
$stmt = $conn->prepare($sql);
$result = $stmt->execute([$userid]);
$user = $stmt->fetch();

// Fetch site statistics from the database
// (Replace these queries with the relevant ones for your project)
$statTraffic = 0; // Fetch traffic data from the database
$statSales = 0; // Fetch sales data from the database
$statOrders = 0; // Fetch order data from the database
$statRefunds = 0; // Fetch refund data from the database

// Fetch the best seller product from the database
// (Replace this query with the relevant one for your project)
$bestSellerProduct = ""; // Fetch the best seller product from the database
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/dashboard.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <?php require_once './includes/navbar.php'; ?>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
                    <h1 class="h2">Dashboard</h1>
                </div>
                <div id="mainContent">
                    <!-- Add your main content here -->
                    <!-- User Info -->
                    <div class="card mb-4">
                        <div class="card-body">
                            <h5 class="card-title">My Info</h5>
                            <div class="d-flex position-relative">
                            <img src=
                                <?php
                                    if ($user['pfp'] == NULL) {
                                        echo "uploads/profile_pictures/default_pfp.png";
                                    } else {
                                        $profile_picture_path = "uploads/profile_pictures/";
                                        $profile_picture = $user['pfp'];
                                        $profile_picture_extension = pathinfo($profile_picture, PATHINFO_EXTENSION);
                                        echo $profile_picture_path . basename($profile_picture, '.' . $profile_picture_extension) . '.' . $profile_picture_extension;
                                    }
                                ?>
                                alt="Profile Picture" class="rounded-circle mr-4" width="80" height="80"
                                onerror="this.onerror=null; this.src='uploads/profile_pictures/default_pfp.png';">
                                <i class="fas fa-pencil-alt position-absolute" style="bottom: 0; right: 0; cursor: pointer;" id="profilePictureEditIcon"></i>
                                <form action=<?php echo './includes/uploads.php'; ?>
                                    method="post" enctype="multipart/form-data" id="profilePictureForm" style="display: none;">
                                    <input type="file" name="file" id="profilePictureInput">
                                    <input type="hidden" name="context" value="profile_picture">
                                </form>
                                <div>
                                    <p>Name: <span id="userName">
                                        <?php echo $user['first_name'] . " " . $user['last_name'];?>
                                    </span></p>
                                    </span></p>
                                    <p>Email: <span id="userEmail">
                                        <?php echo $user['email']; ?>
                                    </span></p>
                                    <button class="btn btn-sm btn-outline-primary" id="editInfoBtn">
                                        <i class="fas fa-pencil-alt"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Site Statistics -->
                    <div class="card mb-4">
                        <div class="card-body">
                            <h5 class="card-title">Site Statistics</h5>
                            <div class="row">
                                <div class="col-md-3">
                                    <ul class="list-group">
                                        <li class="list-group-item" id="statTraffic">Traffic</li>
                                        <li class="list-group-item" id="statSales">Sales</li>
                                        <li class="list-group-item" id="statOrders">Orders</li>
                                        <li class="list-group-item" id="statRefunds">Refunds</li>
                                    </ul>
                                </div>
                                <div class="col-md-9">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="card-title">Traffic</h5>
                                                <img src="../../res/piechart.jpg" alt="Pie Chart" width="100%" height="100%">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Sales Overview -->
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Sales Overview</h5>
                            <ul class="list-group">
                                <li class="list-group-item">Best Seller Product</li>
                                <!-- Add more items as needed -->
                            </ul>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
    <script src="../../src/js/mock/dashboard.js"></script>
    </div>
</body>

<script>
    document.getElementById('profilePictureEditIcon').addEventListener('click', function() {
        document.getElementById('profilePictureInput').click();
    });

    document.getElementById('profilePictureInput').addEventListener('change', function() {
        document.getElementById('profilePictureForm').submit();
    });
</script>