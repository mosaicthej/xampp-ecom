<!-- User Info -->
<div class="card mb-4">
	<div class="card-body">
		<h5 class="card-title">My Info</h5>
		<div class="d-flex position-relative">
			<div class="mr-4">
				<i class="fas fa-pencil-alt position-absolute" style="cursor: pointer;" id="profilePictureEditIcon"></i>
				<img src=<?php
									if ($user['pfp'] == NULL) {
										echo "../uploads/profile_pictures/default_pfp.png";
									} else {
										$profile_picture_path = "../uploads/profile_pictures/";
										$profile_picture = $user['pfp'];
										$profile_picture_extension = pathinfo($profile_picture, PATHINFO_EXTENSION);
										echo $profile_picture_path . basename($profile_picture, '.' . $profile_picture_extension) . '.' . $profile_picture_extension;
									}
									?> alt="Profile Picture" class="rounded-circle mr-4" width="80" height="80" onerror="this.onerror=null; this.src='../uploads/profile_pictures/default_pfp.png';">
			</div>
			<form action=<?php echo '../includes/uploads.php'; ?> method="post" enctype="multipart/form-data" id="profilePictureForm" style="display: none;">
				<input type="file" name="file" id="profilePictureInput">
				<input type="hidden" name="context" value="profile_picture">
			</form>
			<div>
				<?php // fields: username, name (first+last), email, phone_number
					$fields = ['username', 'name', 'email', 'phone_number'];
					$labels = ['Username', 'Name', 'Email', 'Phone Number'];
					$user['name'] = $user['first_name'] . " " . $user['last_name'];
					for ($i = 0; $i < count($fields); $i++) {
						$field = $fields[$i];
						$label = $labels[$i];
						echo '<p class="mb-0">' . $label . ': <span id="user' . ucwords(str_replace('_', '', $field)) . '" class="mr-2" style="font-weight: bold;">' . $user[$field] . '</span></p>';
					}
				?>
				<?php
				// Default address, $user['default_usr_address_id'] is the id to look in table user_address,
				// then get the address_id, then get the address from table address
				// if ($user['default_usr_address_id'] == -1): do not display "Default Address"
				$def_addr_id = $user['default_usr_address_id'];

				require_once '../includes/db_connection.php';
				require_once '../includes/db_functions.php';
				
				if ($def_addr_id != -1) {
					$addr_stmt = dbExecute("SELECT * FROM address WHERE id = (
							SELECT idAddress FROM user_address WHERE id = ? )", [$def_addr_id])['stmt'];
					$addr_row = $addr_stmt->fetch(PDO::FETCH_ASSOC);
					
					// $city_info: getting `city`, `region`, `country` by getting the `name` field 
						// from table `cities`, `regions`, `countries` respectively
					$city_info = [];
					$city_stmt = dbExecute("SELECT name FROM cities WHERE id = ?", [$addr_row['city_id']])['stmt'];
					$city_info['city'] = $city_stmt->fetchColumn();

					$region_stmt = dbExecute("SELECT name FROM regions WHERE id = ?", [$addr_row['region_id']])['stmt'];
					$city_info['region'] = $region_stmt->fetchColumn();

					$country_stmt = dbExecute("SELECT name FROM countries WHERE id = ?", [$addr_row['country_id']])['stmt'];
					$city_info['country'] = $country_stmt->fetchColumn();
				
					$addr_stmt->closeCursor();

					echo "<p>Default Address: <span id='userDefaultAddress' class='mr-2' style='font-weight: bold;'>" 
						. $addr_row['apartment_no'] . " " . $addr_row['streetno'] . " " . $addr_row['street'] . "\n"
						. $city_info['city'] . ", " . $city_info['region'] . ", " . $city_info['country'] . "\n"
						. $addr_row['postal_code'] . "</span></p>";
				}
				?>

				<?php	require_once './modal_update_user.php'; ?>
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateUserInfoModal">
					<i class="fas fa-pencil-alt"></i>
				</button>
				
				<?php require_once './modal_manage_address.php';?>
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#manageAddressesModal">
					<i class="fas fa-compass"></i>
				</button>
				
				<?php require_once './modal_add_address.php'; ?>
				<button id="addNewAddressBtn" type="button" class="btn btn-primary" data-toggle="modal" data-target="#addAddressModal">
					<i class="fas fa-plus"></i>
				</button>

			</div>
		</div>
	</div>
</div>