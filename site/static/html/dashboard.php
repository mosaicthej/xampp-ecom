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
            <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
                <div class="sidebar-sticky pt-3">
                    <h3 class="text-center my-3">Ecommerce Platform</h3>
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link" href="dashboard.php" id="dashboardLink">
                                Dashboard
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="category.php" id="categoryLink">
                                Category
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="product.php" id="productLink">
                                Products
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="user.php" id="userLink">
                                Users
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="order.php" id="orderLink">
                                Orders
                            </a>
                        </li>
                        <!-- Add other navigation items here -->
                    </ul>
                </div>
            </nav>
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
                            <div class="d-flex">
                                <img src="../../res/miku-pix.gif" alt="Profile Picture" class="rounded-circle mr-4" width="80" height="80">
                                <div>
                                    <p>Name: <span id="userName">Hatusne Miku</span></p>
                                    <p>Email: <span id="userEmail">miku01@vocaloid.mk</span></p>
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
</body>
</html>