

<!-- Modal -->
<div class="modal fade" id="form_add_import" role="dialog ">
	<div class="modal-dialog modal-lg" style="width: 80%">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Form Add Import</h4>
			</div>
			<div class="modal-body">
				<div class=" form">
					<form class="cmxform form-horizontal tasi-form" id="signupForm"
						method="get" action="#" novalidate="novalidate">
						<div class="form-group ui-widget">
							<label for="productName" class="control-label col-lg-2">Product
								Name *</label>
							<div class="col-lg-10">
								<input class=" form-control" required="required"
									id="productName" name="productName" type="text"> <input
									class="hidebtn" id="proID">
							</div>
						</div>
						<div class="form-group ">
							<label for="quantity" class="control-label col-lg-2">Qty
								*</label>
							<div class="col-lg-10">
								<input class="form-control " required="required" id="qty"
									name="qty" type="text">
							</div>
						</div>
						<div class="form-group ">
							<label for="UnitPrice" class="control-label col-lg-2">Unit
								Price *</label>
							<div class="col-lg-10">
								<input class="form-control " required="required" id="UnitPrice"
									name="Unit Pirce" type="text">
							</div>
						</div>
						<div class="form-group ">
							<label for="supplierName" class="control-label col-lg-2">Supplier
								Name *</label>
							<div class="col-lg-10">
								<input class="form-control " required="required"
									id="supplierName" name="SupplierName" type="text"> <input
									class="hidebtn" id="supID">
							</div>
						</div>
						<div class="form-group" align="right">

							<button class="btn btn-success waves-effect waves-light"
								style="width: 100px;" id="addbtn" type="button">Add</button>
							<button class="btn btn-default waves-effect waves-light"
								style="width: 100px; margin-right: 10px;" id="canceladd"
								type="button">Cancel</button>
						</div>
					</form>
					<!-- =================== -->
					<h5 class="pull-left page-title"># Import List</h5>
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<table id="datatable"
								class="table table-striped table-bordered dataTable">
								<thead>

								</thead>
								<thead>
									<tr>
										<th>#</th>
										<th>Product Name</th>
										<th style="text-align: center;">Qty</th>
										<th style="text-align: center;">Unit Price</th>
										<th style="text-align: center;">Supplier Name</th>
										<th style="text-align: center;">Edit</th>
									</tr>
								</thead>
								<tbody id="tbllistimport">

								</tbody>
							</table>
						</div>
					</div>

					<!-- =================== -->
					<div class="form-group" align="right">
						<button class="btn btn-success waves-effect waves-light"
							style="width: 100px;" id="savebtn" type="button">Save</button>
						<button class="btn btn-default waves-effect"
							style="width: 100px; margin-right: 10px;" id="cencelBtn"
							type="button">Cancel</button>
					</div>

				</div>
				<!-- .form -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>









