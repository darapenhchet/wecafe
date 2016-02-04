
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

				<div class="overflow-x">
					<table style="border: none;">
						<thead class="style2">
							<tr class="active">
								<th>#</th>
								<th>Item</th>
								<th>Qty</th>
								<th>Unit Price</th>
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
	<div class="overflow-x">
					<table style="border: none;">
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
								<th>Qty</th>
								<th>Amt</th>
								<th>Qty</th>
								<th>Amt</th>
								<th>Qty</th>
								<th>Amt</th>
								<th>Qty</th>
								<th>Amt</th>
								<th>Qty</th>
								<th>Amt</th>
								<th>Qty</th>
								<th>Amt</th>
								<th>Qty</th>
								<th>Amt</th>
								<th>Qty</th>
								<th>Amt</th>
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

<!-- Modal Monthly-->
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

				<div class="overflow-x">
					<table style="border: none;">
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
		<select id="select_month">
				<option value="1">January - June</option>
				<option value="2">July - December</option>
			</select>
		<div id="print_data_yearly">
				<!-- <button type="button" class="close hidden-print" data-dismiss="modal">&times;</button> -->
				<a href="javascrpt:;"
					class="btn btn-inverse waves-effect waves-light pull-right hidden-print"
					id="btn_print_yearly"><i class="fa fa-print"></i></a>

				<h2 style="text-align: center;">Yearly Sale List</h2>
				<h5>
					<span id="report_start_yearly"></span> 
				</h5>

				<div class="overflow-x">
					<table style="border: none;page-break-after:always">
						<thead class="style2" id="tbl_header_month">
							<tr>
								<th rowspan="2">#</th>
								<th rowspan="2">Item</th>								
								<th class="show1" colspan="2" id="mon1">Jan</th>
								<th class="show1" colspan="2" id="mon2">Feb</th>
								<th class="show1" colspan="2" id="mon3">Mar</th>
								<th class="show1" colspan="2" id="mon4">Air</th>
								<th class="show1" colspan="2" id="mon5">May</th>
								<th class="show1" colspan="2" id="mon6">Jun</th>
								<th class="hide"  colspan="2" id="mon7">Jul</th>
								<th class="hide"  colspan="2" id="mon7">Aug</th>
								<th class="hide"  colspan="2" id="mon7">Sep</th>
								<th class="hide"  colspan="2" id="mon7">Oct</th>
								<th class="hide"  colspan="2" id="mon7">Nov</th>
								<th class="hide"  colspan="2" id="mon7">Dec</th>
								<th class="hide"  colspan="2">Total</th>
							</tr>
							<tr>
								<th class="show1">Qty</th>
								<th class="show1">Amt</th>
								<th class="show1">Qty</th>
								<th class="show1">Amt</th>
								<th class="show1">Qty</th>
								<th class="show1">Amt</th>
								<th class="show1">Qty</th>
								<th class="show1">Amt</th>
								<th class="show1">Qty</th>
								<th class="show1">Amt</th>
								<th class="show1">Qty</th>
								<th class="show1">Amt</th>
								<th class="hide" >Qty</th>
								<th class="hide" >Amt</th>
								<th class="hide" >Qty</th>
								<th class="hide" >Amt</th>
								<th class="hide" >Qty</th>
								<th class="hide" >Amt</th>
								<th class="hide" >Qty</th>
								<th class="hide" >Amt</th>
								<th class="hide" >Qty</th>
								<th class="hide" >Amt</th>
								<th class="hide" >Qty</th>
								<th class="hide" >Amt</th>
								<th class="hide" >Qty</th>
								<th class="hide" >Amt</th>
							</tr>
						</thead>
						<tbody id="PRINT_CONTENTS_YEARLY" style="width: 100%;">
						</tbody>
					</table>
				</div>

				<br />
				<div
					style="border: 1px solid; margin: 0 auto; padding: 3px; width: 28%; margin-right: -2px; color: blue; text-align: left; padding-left: 8px;">
					<span>Total Amount : </span><span id="allTotalAmount_print_yearly"></span>
				</div>
			</div>
	
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>

<script id="CONTENT_DAILY_PRINT" type="text/x-jquery-tmpl">
			{{if order==44}} 
				<tr>
					<td colspan="8" style="border: none;padding:22px;"></td>
				</tr>	
			{{/if}}	
    	<tr>
			<td>{{= order}}</td>
			<td class="content-left"><span class="ellipsis">{{= pro_name}}</span></td>
			<td>{{= product_qty}}</td>
			<td>{{= pro_unit_price}}</td> 
			<td>{{= total_amount}}</td> 
		</tr>
 </script>
<!-- ============================  tbodyweekly  ================================== -->
<script id="CONTENT_WEEKLY_PRINT" type="text/x-jquery-tmpl">
		{{if order==44}} 
				<tr>
					<td colspan="8" style="border: none;padding:22px;"></td>
				</tr>	
			{{/if}}	
    	<tr>
			<td>{{= order}}</td>
			<td class="content-left"><span class="ellipsis">{{= pro_name}}</span></td>
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
			<td class="content-right">{{= total_qty}}</td>
			<td class="content-right">{{= total_amount}}</td>
		</tr>
    </script>
<!-- ============================  tbodyyearly  ================================== -->
<script id="CONTENT_YEARLY_PRINT" type="text/x-jquery-tmpl">    
			{{if order==44}} 
				<tr>
					<td colspan="8" style="border: none;padding:10px;"></td>
				</tr>	
			{{/if}}	
			<tr> 
			<td>{{= order}}</td>
			<td class="content-left"><span class="ellipsis">{{= pro_name}}</span></td>
			<td class="show1">{{= jan_qty}}</td>
			<td class="show1">{{= jan_amount}}</td>
			<td class="show1">{{= feb_qty}}</td>
			<td class="show1">{{= feb_amount}}</td>
			<td class="show1">{{= mar_qty}}</td>
			<td class="show1">{{= mar_amount}}</td>
			<td class="show1">{{= apr_qty}}</td>
			<td class="show1">{{= apr_amount}}</td>
			<td class="show1">{{= may_qty}}</td>
			<td class="show1">{{= may_amount}}</td>
			<td class="show1">{{= jun_qty}}</td>
			<td class="show1">{{= jun_amount}}</td>
			<td class="hide" >{{= jul_qty}}</td>
			<td class="hide" >{{= jul_amount}}</td>
			<td class="hide" >{{= aug_qty}}</td>
			<td class="hide" >{{= aug_amount}}</td>
			<td class="hide" >{{= sep_qty}}</td>
			<td class="hide" >{{= sep_amount}}</td>
			<td class="hide" >{{= oct_qty}}</td>
			<td class="hide" >{{= oct_amount}}</td>
			<td class="hide" >{{= nov_qty}}</td>
			<td class="hide" >{{= nov_amount}}</td>
			<td class="hide" >{{= dec_qty}}</td>
			<td class="hide" >{{= dec_amount}}</td>
			<td class="content-right hide">{{= total_qty}}</td>
			<td class="content-right hide">{{= total_amount}}</td>
		</tr>
    </script>