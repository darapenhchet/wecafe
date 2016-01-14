<!-- Modal -->
<div class="modal fade" id="form_add_unit" role="dialog ">
	<div class="modal-dialog modal-lg" style="width: 80%">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Form Add Products</h4>
			</div>
			<div class="modal-body">
				<div class=" form">
					<form class="cmxform form-horizontal tasi-form" id="frmAddCategory"
						method="POST" action="#">
						<div class="form-group ">
							<label for="productname" class="control-label col-lg-2">Unit
								Name *</label>
							<div class="col-lg-10">
								<input class=" form-control" id="unitname" name="unitName"
									type="text" required="required">
							</div>
						</div>
						<div class="form-group ">
							<label for="productname" class="control-label col-lg-2">Qty
								*</label>
							<div class="col-lg-10">
								<input class=" form-control" id="unitqty" name="unitqty"
									type="text" required="required">
							</div>
						</div>
						<div class="form-group ">
							<label for="productname" class="control-label col-lg-2">Type
								*</label>
							<div class="col-lg-10">
								<input class=" form-control" id="unittype" name="unittype"
									type="text" required="required">
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-offset-2 col-lg-10">
								<button class="btn btn-success waves-effect waves-light"
									type="button" id="btnSubmit">Save</button>
								<button class="btn btn-default waves-effect" type="button"
									id="btn_cancel">Cancel</button>
							</div>
						</div>
					</form>
				</div>
				<!-- .form -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>














