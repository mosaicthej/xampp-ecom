<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
	<div class="sidebar-sticky pt-3">
		<h3 class="text-center my-3">Ecommerce Platform</h3>
		<ul class="nav flex-column">
			<!-- <li class="nav-item">
				<a class="nav-link" href="../dashboard" id="dashboardLink">
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
			<li class="nav-item">
				<a class="nav-link" href="logout.php" id="logoutLink">
					Log Out
				</a>
			</li> -->

			<?php // try not write everything twice
				$nav_pages = ['dashboard', 'category', 'product', 'user', 'order', 'logout'];
				$nav_names = ['Dashboard', 'Category', 'Products', 'Users', 'Orders', 'Log Out'];

				for ($i = 0; $i < count($nav_pages); $i++) {
					$nav_page = $nav_pages[$i];
					$nav_name = $nav_names[$i];
					$active = ($nav_page == $page) ? 'active' : '';
					echo "<li class='nav-item'>
						<a class='nav-link $active' href='../$nav_page' id='$nav_page"."Link'>
							$nav_name
						</a>
					</li>";
				}
			
			?>
		</ul>
	</div>
</nav>
