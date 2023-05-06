<div class="modal fade" id="addAddressModal" tabindex="-1" aria-labelledby="addAddressModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="manageAddressesModalLabel">Manage Addresses</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form id="addAddressForm">
				<div class="modal-body">
					<div id="newAddressList" class="d-flex flex-wrap">
						<span>
							<div class="form-group">
								<label for="country">Country</label>
								<select class="form-control" id="country" name="country">
									<option value="">Select a country</option>
									<!-- Countries will be populated here -->
								</select>
							</div>
							<div class="form-group">
								<label for="region">Region/Province</label>
								<select class="form-control" id="region" name="region">
									<option value="">Select a region</option>
									<!-- Regions will be populated here -->
								</select>
							</div>
							<div class="form-group">
								<label for="city">City</label>
								<select class="form-control" id="city" name="city">
									<option value="">Select a city</option>
									<!-- Cities will be populated here -->
								</select>
							</div>
						</span>
						<span>
							<div class="form-group">
								<label for="street">Street</label>
								<input type="text" class="form-control" id="street" name="street" placeholder="Enter street">
							</div>
							<div class="form-group">
								<label for="streetno">Street No.</label>
								<input type="text" class="form-control" id="streetno" name="streetno" placeholder="Enter street no.">
							</div>
							<div class="form-group">
								<label for="apartment">Apartment</label>
								<input type="text" class="form-control" id="apartment" name="apartment" placeholder="Enter apartment">
							</div>
							<div class="form-group">
								<label for="postal_code">Postal Code</label>
								<input type="text" class="form-control" id="postal_code" name="postal_code" placeholder="Enter postal code">
							</div>
						</span>
						<span>
							<div class="form-group">
								<label for="contact_name">Contact Name</label>
								<input type="text" class="form-control" id="contact_name" name="contact_name" placeholder="Enter contact name">
							</div>
							<div class="form-group">
								<label for="contact_phone">Contact Phone</label>
								<input type="text" class="form-control" id="contact_phone" name="contact_phone" placeholder="Enter contact phone">
							</div>
							<div class="form-group">
								<label for="contact_email">Contact Email</label>
								<input type="text" class="form-control" id="contact_email" name="contact_email" placeholder="Enter contact email">
							</div>
						</span>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					<button id="saveAddressesBtn" type="submit" class="btn btn-primary">Save changes</button>
				</div>
			</form>
		</div>
	</div>
</div>