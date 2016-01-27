
<!-- Modal -->
<div class="modal fade" id="request_stock_list" role="dialog " >
	<div class="modal-dialog modal-lg" style="width: 80%">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close hidden-print" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Import List </h4>
				<small id="report_start_date"></small> - <small id="report_end_date"></small>
				<a href="javascrpt:;" class="btn btn-inverse waves-effect waves-light pull-right hidden-print" onclick="window.print();"><i class="fa fa-print"></i></a>
			</div>
			<div class="modal-body"> 
				<div class="table-responsive"> 
					<table class="table table-hover table-bordered"
						style="font-family: 'Khmer OS', 'Khmer OS System'; font-size: 10pt;">
						<thead class="style2">
							<tr class="active">
								<th>#</th>
								<th>Invoice ID</th>
								<th style="text-align: center;">Date</th>
								<th>Name</th>
								<th style="text-align: right;">Total Amount</th> 
						 	</tr>
						</thead>
					<tbody id="PRINT_CONTENTS" style="width:100%;">
					</tbody>
					</table>
				</div> 
			</div>
			<div class="modal-footer">
			<div class="col-md-10 form-horizontal" align="right">
				<label class="control-label col-md-9">Total Amount :
				</label>
				<div class="col-md-3">
					<input class="form-control" readonly="readonly"
						id="allTotalAmount_print" type="text">
				</div>
			</div> 
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<script id="CONTENT_Print_Import" type="text/x-jquery-tmpl">
	<tr>
		<td>{{= importDetail}} </td>
		<td><a herf="javascript:" style="cursor:pointer" id="impid">{{= impId}}</a></td>
		<td>{{= impDate}}</td>
		<td>{{= user.firstName +' '+ user.lastName}} </td>
		<td>{{= totalAmount}}</td> 
	</tr>
</script>