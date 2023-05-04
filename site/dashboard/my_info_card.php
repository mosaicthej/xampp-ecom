<!-- User Info -->
<div class="card mb-4">
	<div class="card-body">
		<h5 class="card-title">My Info</h5>
		<div class="d-flex position-relative">
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
			<i class="fas fa-pencil-alt position-absolute" style="bottom: 0; right: 0; cursor: pointer;" id="profilePictureEditIcon"></i>
			<form action=<?php echo '../includes/uploads.php'; ?> method="post" enctype="multipart/form-data" id="profilePictureForm" style="display: none;">
				<input type="file" name="file" id="profilePictureInput">
				<input type="hidden" name="context" value="profile_picture">
			</form>
			<div>
				<p>Name: <span id="userName">
						<?php echo $user['first_name'] . " " . $user['last_name']; ?>
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