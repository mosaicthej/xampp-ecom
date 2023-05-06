<div class="modal fade" id="manageAddressesModal" tabindex="-1" aria-labelledby="manageAddressesModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="manageAddressesModalLabel">Manage Addresses</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body"> 
				<form id="addressListForm">
					<ul id="addressesList" class="d-flex flex-wrap">
					<!-- The user's addresses will be populated here -->
					</ul>
				</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="saveAddressesBtn" type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>