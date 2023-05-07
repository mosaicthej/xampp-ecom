<?php
// Start session
session_start();
$page = "dashboard";

// Check if the user is logged in
if (!isset($_SESSION['username'])) {
		// Redirect to login page if not logged in
		header('Location: login.php');
		exit();
}

// Database connection
require_once '../includes/db_connection.php';
require_once '../includes/functions.php';

// Get user information
$userid = $_SESSION['id'];
$stmt = dbExecute("SELECT * FROM user WHERE id = ?", [$userid])['stmt'];
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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
</head>


<body>
	<div class="container-fluid">
		<div class="row">
			<?php require_once '../includes/navbar.php'; ?>
			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
					<h1 class="h2">Dashboard</h1>
				</div>
				<div id="mainContent">
					<?php include './my_info_card.php';
						include './site_statistics.php';
						include './sales_overview_card.php';
						?>
				</div>
			</main>
		</div>
		<div id="toast_container" class = "row fixed-bottom">
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.3.0/jquery.form.min.js" integrity="sha384-qlmct0AOBiA2VPZkMY3+2WqkHtIQ9lSdAsAn5RUJD/3vA5MKDgSGcdmIv4ycVxyn" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src='./scripts_dashboard.js'></script>
</body>

</html>