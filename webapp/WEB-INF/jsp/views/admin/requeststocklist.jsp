
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
				<div class='col-sm-4 col-md-4 col-lg-4 col-xs-4 pull-right'>
					<select class="form-control" id="req_no">

					</select>
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