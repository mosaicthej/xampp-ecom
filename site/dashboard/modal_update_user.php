<?php
require_once '../includes/db_connection.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $fields = [
    'first_name', 'last_name', 'email', 'phone_number'
  ];
  $query_userinfo_update = "
      UPDATE user SET";
  $query_userinfo_update_params = [];
  foreach ($fields as $field) {
    $value = isset($_POST[$field]) ? $_POST[$field] : '';
    $query_userinfo_update .= " $field = ?,";
    $query_userinfo_update_params[] = $value;
  }
  $query_userinfo_update = rtrim($query_userinfo_update, ',');
  $query_userinfo_update .= " WHERE id = ? AND username = ?";
  $query_userinfo_update_params[] = $_SESSION['id'];
  $query_userinfo_update_params[] = $_SESSION['username'];

  $conn->beginTransaction();
  $stmt = $conn->prepare($query_userinfo_update);
  $success = $stmt->execute($query_userinfo_update_params);
  if ($success) {
      $conn->commit();
      header('Location: ..');
      ?> <script>showToast('User info updated successfully.', 'success');</script> <?php
      exit();
  } else {
      $conn->rollBack();
      ?> <script>showToast('Error updating user info.', 'error');</script> <?php
      $error = 'Error updating user info.';
  }
}

?>
<div class="modal fade" id="updateUserInfoModal" tabindex="-1" role="dialog" aria-labelledby="updateUserInfoModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="updateUserInfoModalLabel">Update User Info</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="updateUserInfoForm" method="POST" action="<?php echo htmlspecialchars($_SERVER['SCRIPT_NAME']); ?>">
        <div class="modal-body">
            <!-- fields: first_name, last_name, email, phone_number -->
          <?php 
              $form_fields = ['first_name', 'last_name', 'email', 'phone_number'];
              $form_types = ['text', 'text', 'email', 'tel'];
              for ($i = 0; $i < count($form_fields); $i++) {
                  $field = $form_fields[$i];
                  $type = $form_types[$i];

                  echo '<div class="form-group">';
                  echo '<label for="' . $field . '">' . ucwords(str_replace('_', ' ', $field)) . '</label>';
                  echo '<input type="' . $type . '" class="form-control" id="' . $field . '" name="' . $field . '" value="' . $user[$field] . '">';
                  echo '<div class="invalid-feedback"></div>';
                  echo '</div>';
              }
          ?>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary" ">Save changes</button>
        </div>
      </form>
    </div>
  </div>
</div>