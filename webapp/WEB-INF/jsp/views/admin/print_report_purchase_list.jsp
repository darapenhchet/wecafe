
<!-- Modal Daily-->
<div class="modal fade" id="daily_list" role="dialog ">
	<div class="modal-dialog modal-lg" style="width: 80%">
		<div class="modal-content">

			<div id="print_data">
				<!-- <button type="button" class="close hidden-print" data-dismiss="modal">&times;</button> -->
				<a href="javascrpt:;"
					class="btn btn-inverse waves-effect waves-light pull-right hidden-print"
					id="btn_print"><i class="fa fa-print"></i></a>

				<h2 style="text-align: center;">Daily Sale List</h2>
				<h5>
					<span id="report_start_daily"></span>
				</h5>

				<div>
					<table border="1" cellpadding="0" cellspacing="0" border="1"
						style="text-align: center; width: 100%; line-height: 24px;">
						<thead class="style2">
							<tr class="active">
								<th>#</th>
								<th>Customer</th>
								<th>Item</th>
								<th>Qty</th>
								<th>Unit Price</th>
								<th>Purchase By</th>
								<th>Purchase Type</th>
								<th>Total</th>
							</tr>
						</thead>
						<tbody id="PRINT_CONTENTS_DAILY" style="width: 100%;">
						</tbody>
					</table>
				</div>

				<br />
				<div
					style="border: 1px solid; margin: 0 auto; padding: 3px; width: 28%; margin-right: -2px; color: blue; text-align: left; padding-left: 8px;">
					<span>Total Amount : </span><span id="allTotalAmount_print_daily"></span>
				</div>
			</div>
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		</div>
	</div>
</div>

<!-- Modal Weekly-->
<div class="modal fade" id="weekly_list" role="dialog ">
	<div class="modal-dialog modal-lg" style="width: 80%">
		<div class="modal-content">

			<div id="print_data_weekly">
				<!-- <button type="button" class="close hidden-print" data-dismiss="modal">&times;</button> -->
				<a href="javascrpt:;"
					class="btn btn-inverse waves-effect waves-light pull-right hidden-print"
					id="btn_print_weekly"><i class="fa fa-print"></i></a>

				<h2 style="text-align: center;">Weekly Sale List</h2>
				<h5>
					<span id="report_start_weekly"></span> - <span
						id="report_end_weekly"></span>
				</h5>

				<div>
					<table border="1" cellpadding="0" cellspacing="0" border="1"
						style="text-align: center; width: 100%; line-height: 24px;">
						<thead class="style2">
							<tr>
								<th rowspan="2">#</th>
								<th rowspan="2">Item</th>
								<th colspan="2" id="week_print1"></th>
								<th colspan="2" id="week_print2"></th>
								<th colspan="2" id="week_print3"></th>
								<th colspan="2" id="week_print4"></th>
								<th colspan="2" id="week_print5"></th>
								<th colspan="2" id="week_print6"></th>
								<th colspan="2" id="week_print7"></th>
								<th colspan="2">Total</th>
							</tr>
							<tr>
								<th>qty</th>
								<th>Amount</th>
								<th>qty</th>
								<th>Amount</th>
								<th>qty</th>
								<th>Amount</th>
								<th>qty</th>
								<th>Amount</th>
								<th>qty</th>
								<th>Amount</th>
								<th>qty</th>
								<th>Amount</th>
								<th>qty</th>
								<th>Amount</th>
								<th>Total Qty</th>
								<th>Total Amount</th>
							</tr>
						</thead>
						<tbody id="PRINT_CONTENTS_WEEKLY" style="width: 100%;">
						</tbody>
					</table>
				</div>

				<br />
				<div
					style="border: 1px solid; margin: 0 auto; padding: 3px; width: 28%; margin-right: -2px; color: blue; text-align: left; padding-left: 8px;">
					<span>Total Amount : </span><span id="allTotalAmount_print_weekly"></span>
				</div>
			</div>

			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		</div>
	</div>
</div>
<!-- Modal Weekly-->
<div class="modal fade" id="monthly_list" role="dialog ">
	<div class="modal-dialog modal-lg" style="width: 80%">
		<div class="modal-content">
			<div id="print_data_monthly">
				<!-- <button type="button" class="close hidden-print" data-dismiss="modal">&times;</button> -->
				<a href="javascrpt:;"
					class="btn btn-inverse waves-effect waves-light pull-right hidden-print"
					id="btn_print_monthly"><i class="fa fa-print"></i></a>

				<h2 style="text-align: center;">Monthly Sale List</h2>
				<h5>
					<span id="report_start_monthly"></span> 
				</h5>

				<div>
					<table border="1" cellpadding="0" cellspacing="0" border="1" style="text-align: center; width: 100%; line-height: 24px;">
						<thead class="style2" id="tbl_header_month_print">
						</thead>
						<tbody id="PRINT_CONTENTS_MONTHLY" style="width: 100%;">
						</tbody>
					</table>
				</div>

				<br />
				<div
					style="border: 1px solid; margin: 0 auto; padding: 3px; width: 28%; margin-right: -2px; color: blue; text-align: left; padding-left: 8px;">
					<span>Total Amount : </span><span id="allTotalAmount_print_monthly"></span>
				</div>
			</div>
		
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
<!-- Modal Yearly-->
<div class="modal fade" id="yearly_list" role="dialog ">
	<div class="modal-dialog modal-lg" style="width: 80%">
		<div class="modal-content">
			<div class="modal-header">
				<a href="javascrpt:;"
					class="btn btn-inverse waves-effect waves-light pull-right hidden-print"
					onclick="window.print();"><i class="fa fa-print"></i></a>
				<h4 class="modal-title">Yearly Sale List</h4>
				<small id="report_start_yearly"></small>
			</div>
			<div class="modal-body">
				<div class="table-responsive">
					<table class="table table-hover table-bordered table-responsive"
						style="font-family: 'Khmer OS', 'Khmer OS System'; font-size: 10pt;">
						<thead class="style2" id="tbl_header_month">
							<tr>
								<th rowspan="2">#</th>
								<th rowspan="2">Item</th>
								<th colspan="2" id="mon1">Jan</th>
								<th colspan="2" id="mon2">Feb</th>
								<th colspan="2" id="mon3">Mar</th>
								<th colspan="2" id="mon4">Air</th>
								<th colspan="2" id="mon5">May</th>
								<th colspan="2" id="mon6">Jun</th>
								<th colspan="2" id="mon7">Jul</th>
								<th colspan="2" id="mon7">Aug</th>
								<th colspan="2" id="mon7">Sep</th>
								<th colspan="2" id="mon7">Oct</th>
								<th colspan="2" id="mon7">Nov</th>
								<th colspan="2" id="mon7">Dec</th>
								<th colspan="2">Total</th>
							</tr>
							<tr>
								<th>qty</th>
								<th>Amount</th>
								<th>qty</th>
								<th>Amount</th>
								<th>qty</th>
								<th>Amount</th>
								<th>qty</th>
								<th>Amount</th>
								<th>qty</th>
								<th>Amount</th>
								<th>qty</th>
								<th>Amount</th>
								<th>qty</th>
								<th>Amount</th>
								<th>qty</th>
								<th>Amount</th>
								<th>qty</th>
								<th>Amount</th>
								<th>qty</th>
								<th>Amount</th>
								<th>qty</th>
								<th>Amount</th>
								<th>qty</th>
								<th>Amount</th>
								<th>Total Qty</th>
								<th>Total Amount</th>
							</tr>
						</thead>
						<tbody id="PRINT_CONTENTS_YEARLY" style="width: 100%;">
						</tbody>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<div class="col-md-10 form-horizontal" align="right">
					<label class="control-label col-md-9">Total Amount : </label>
					<div class="col-md-3">
						<input class="form-control" readonly="readonly"
							id="allTotalAmount_print_yearly" type="text">
					</div>
				</div>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<!-- ============================  tbodydaily  ================================== -->
<script id="CONTENT_DAILY_PRINT" type="text/x-jquery-tmpl">
    	<tr>
			<td>{{= order}}</td>
			<td>{{= supplier_name}}</td>
			<td>{{= product_name}}</td>
			<td>{{= product_qty}}</td>
			<td>{{= pro_unit_price}}</td>
			<td>{{= purchase_by}}​</td>
			<td>{{= purchase_type}}</td>
			<td>{{= purchase_total_amount}}</td>
		</tr>
    </script>
<!-- ============================  tbodyweekly  ================================== -->
<script id="CONTENT_WEEKLY_PRINT" type="text/x-jquery-tmpl">
    	<tr>
			<td>{{= order}}</td>
			<td>{{= pro_name}}</td>
			<td>{{= day1_qty}}</td>
			<td>{{= day1_amount}}</td>
			<td>{{= day2_qty}}</td>
			<td>{{= day2_amount}}</td>
			<td>{{= day3_qty}}</td>
			<td>{{= day3_amount}}</td>
			<td>{{= day4_qty}}</td>
			<td>{{= day4_amount}}</td>
			<td>{{= day5_qty}}</td>
			<td>{{= day5_amount}}</td>
			<td>{{= day6_qty}}</td>
			<td>{{= day6_amount}}</td>
			<td>{{= day7_qty}}</td>
			<td>{{= day7_amount}}</td>
			<td>{{= total_qty}}</td>
			<td>{{= total_amount}}</td>
		</tr>
    </script>
<!-- ============================  tbodyyearly  ================================== -->
<script id="CONTENT_YEARLY_PRINT" type="text/x-jquery-tmpl">    
			<tr> 
			<td>{{= order}}</td>
			<td style="text-align:left; width: 100px;">{{= pro_name}}</td>
			<td>{{= jan_qty}}</td>
			<td>{{= jan_amount}}</td>
			<td>{{= feb_qty}}</td>
			<td>{{= feb_amount}}</td>
			<td>{{= mar_qty}}</td>
			<td>{{= mar_amount}}</td>
			<td>{{= apr_qty}}</td>
			<td>{{= apr_amount}}</td>
			<td>{{= may_qty}}</td>
			<td>{{= may_amount}}</td>
			<td>{{= jun_qty}}</td>
			<td>{{= jun_amount}}</td>
			<td>{{= jul_qty}}</td>
			<td>{{= jul_amount}}</td>
			<td>{{= aug_qty}}</td>
			<td>{{= aug_amount}}</td>
			<td>{{= sep_qty}}</td>
			<td>{{= sep_amount}}</td>
			<td>{{= oct_qty}}</td>
			<td>{{= oct_amount}}</td>
			<td>{{= nov_qty}}</td>
			<td>{{= nov_amount}}</td>
			<td>{{= dec_qty}}</td>
			<td>{{= dec_amount}}</td>
			<td>{{= total_qty}}</td>
			<td>{{= total_amount}}</td>
		</tr>
    </script>