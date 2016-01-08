		<div id="request_stock_list"
			style="display: none; width: 80%; height: auto;">
			<div class="modal-content">
				<div class="modal-header">

					<button type="button" class="close" aria-hidden="true">
						<span class="button b-close"><span>×</span></span>
					</button>
					<h4 class="modal-title">Form Request Products</h4>

				</div>
				<div class="modal-body" style="height: auto;">
					<div class=" form">
						<form class="cmxform form-horizontal tasi-form" id="signupForm"
							method="get" action="#" novalidate="novalidate">
							<div class="form-group ui-widget">
								<label for="product_name" class="control-label col-lg-2">Product
									Name *</label>
								<div class="col-lg-10">
									<input class=" form-control" required="required"
										id="product_name" name="product_name" type="text"> 
										<input class="hidebtn" id="product_id">
								</div>
							</div>
							<div class="form-group ">
								<label for="quantity" class="control-label col-lg-2">Qty
									*</label>
								<div class="col-lg-10">
									<input class="form-control " required="required" id="product_qty"
										name="product_qty" type="text">
								</div>
							</div>

							<div class="form-group" align="right">

								<button class="btn btn-success waves-effect waves-light"
									style="width: 100px;" id="btn_add" type="button">Add</button>
								<button class="btn btn-default waves-effect waves-light"
									style="width: 100px; margin-right: 10px;" id="btn_cancel_add"
									type="button">Cancel</button>
							</div>
						</form>
						<!-- =================== -->
						<h5 class="pull-left page-title"># Product List</h5>
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
								style="width: 100px;" id="btn_save" type="button">Save</button>
							<button class="btn btn-default waves-effect"
								style="width: 100px; margin-right: 10px;" id="btn_cancel_save"
								type="button">Cancel</button>
						</div>

					</div>
					<!-- .form -->
				</div>

			</div>
		</div>