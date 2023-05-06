<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
	<div class="sidebar-sticky pt-3">
		<h3 class="text-center my-3">Ecommerce Platform</h3>
		<ul class="nav flex-column">
			<?php // try not write everything twice
				$nav_pages = ['dashboard', 'category', 'product', 'user', 'order', 'logout'];
				$nav_names = ['Dashboard', 'Category', 'Products', 'Users', 'Orders', 'Log Out'];

				for ($i = 0; $i < count($nav_pages); $i++) {
					$nav_page = $nav_pages[$i];
					$nav_name = $nav_names[$i];
					$active = ($nav_page == $page) ? 'active text-primary bg-gray' : 'text-dark';
					echo "<li class='nav-item $active'>
						<a class='nav-link $active' href='../$nav_page' id='$nav_page"."Link'>
							$nav_name
						</a>
					</li>";
				}
			?>
		</ul>
	</div>
</nav>
