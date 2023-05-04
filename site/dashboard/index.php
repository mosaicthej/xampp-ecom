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
require_once '../includes/db_connection.php';

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
				<?php require_once '../includes/navbar.php'; ?>
		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
						<h1 class="h2">Dashboard</h1>
				</div>
				<div id="mainContent">
						<?php include './my_info_card.php';
						include 'site_statistics.php';
						include 'sales_overview_card.php';
						?>
				</div>
			</main>
		</div>
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

</html>