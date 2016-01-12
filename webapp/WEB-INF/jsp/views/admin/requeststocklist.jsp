
<div id="request_stock_list"
	style="display: none; width: 80%; height: auto;">
	<div class="modal-content">
		<div class="modal-header">

			<button type="button" class="close" aria-hidden="true">
				<span class="button b-close"><span>×</span></span>
			</button>
			<h4 class="modal-title">Products Requested</h4>
		</div>
		<div class="modal-body" style="height: auto;">
			<div class='row'>
				<div class='col-sm-7 col-md-7 col-lg-7 col-xs-7 pull-right'>
					<div class='col-sm-2 col-md-2 col-lg-2 col-xs-2 pull-right'>
						<button id="btn_approve" class="btn btn-primary">Approve</button>
					</div>

					<div class='col-sm-5 col-md-5 col-lg-5 col-xs-5 pull-right'>
						<select class="form-control" id="req_no">
						</select>
					</div>
					<div class="col-sm-3 col-md-3 col-lg-3 col-xs-3 pull-right">
						<select class="form-control" id="out_of_stock">
							<option value="all">---Show All-----</option>
							<option value="out">Qty out of stock</option>
						</select>
					</div>

				</div>
			</div>
			<br />


			<div class="table-responsive">

				<table class="table table-hover table-bordered"
					style="font-family: 'Khmer OS', 'Khmer OS System'; font-size: 10pt;">
					<thead class="style2">
						<tr class="active">
							<th>Request No</th>
							<th>Product Code</th>
							<th>Product Name</th>
							<th>Request Qty</th>
							<th>Qty In Hand</th>
							<th>Qty In Stock</th>
							<th>Requested By</th>
							<th>Request Date</th>
							<th>Action</th>

						</tr>
					</thead>
					<tbody id="request_stock_info">

					</tbody>
				</table>
			</div>

			<div class="row">

				<div id="PAGINATION" class="pull-right"></div>
			</div>

		</div>

	</div>
</div>