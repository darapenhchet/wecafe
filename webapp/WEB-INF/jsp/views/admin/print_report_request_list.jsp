
<!-- Modal Daily-->
<div class="modal fade" id="daily_list" role="dialog ">
	<div class="modal-dialog modal-lg" style="width: 80%">
		<div class="modal-content">

			<div id="print_data">
				<!-- <button type="button" class="close hidden-print" data-dismiss="modal">&times;</button> -->
				<a href="javascrpt:;"
					class="btn btn-inverse waves-effect waves-light pull-right hidden-print"
					id="btn_print"><i class="fa fa-print"></i></a>

				<h2 style="text-align: center;">Daily Purchase List</h2>
				<h5>
					<span id="report_start_daily"></span>
				</h5>

				<div style="overflow-x: auto">
					<table id="dailytable" >
													<thead>
														<tr>
															<th>#</th>
															<th>Product Name</th>
															<th>Request Qty</th>
															<th>Request Date</th>
															<th>Approve Date</th>
															<th>Request By</th>
															<th>Approve By</th>
															<th>Total Qty</th>
														</tr> 
													</thead>
													<tbody id="tbodydaily_print">
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

				<h2 style="text-align: center;">Weekly Purchase List</h2>
				<h5>
					<span id="report_start_weekly"></span> - <span
						id="report_end_weekly"></span>
				</h5>

				<div style="overflow-x: auto">
					<table id="weeklytable">
														<thead>
															<tr>
																<th rowspan="2" id="order">#</th>
																<th rowspan="2">Item</th>
																<th id="week1"></th>
																<th id="week2"></th>
																<th id="week3"></th>
																<th id="week4"></th>
																<th id="week5"></th>
																<th id="week6"></th>
																<th id="week7"></th>
																<th rowspan="2">Total Qty</th>
															</tr>
															<tr>
																<th>qty</th>									
																<th>qty</th>																
																<th>qty</th>																
																<th>qty</th>																
																<th>qty</th>									
																<th>qty</th>																
																<th>qty</th>	
																													
																
															</tr>
														</thead>
														<tbody id="tbodyweekly"> 
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
			<select id="select_yearly">
				<option value="1">01-15</option>
				<option value="2" id="end"></option>
			</select>
			<div id="print_data_monthly">
				<!-- <button type="button" class="close hidden-print" data-dismiss="modal">&times;</button> -->
				<a href="javascrpt:;"
					class="btn btn-inverse waves-effect waves-light pull-right hidden-print"
					id="btn_print_monthly"><i class="fa fa-print"></i></a>

				<h2 style="text-align: center;">Monthly Purchase List</h2>
				<h5>
					<span id="report_start_monthly"></span> 
				</h5>

				<div style="overflow-x: auto">
					<table id="monthlytable">
						<thead id="tbl_header_month_print"> 
						</thead>
						<tbody id="tbodymonthly_print"> 
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

				<h2 style="text-align: center;">Yearly Purchase List</h2>
				<h5>
					<span id="report_start_yearly"></span> 
				</h5>

				<div style="overflow-x: auto">
					<table id="tbl_print_year"  style="border: none;">
						<thead>
															<tr>
																<th rowspan="2" id="order">#</th>
																<th rowspan="2">Item</th>
																<th id="mon1">Jan</th>
																<th  id="mon2">Feb</th>
																<th  id="mon3">Mar</th>
																<th  id="mon4">Air</th>
																<th  id="mon5">May</th>
																<th  id="mon6">Jun</th>
																<th  id="mon7">Jul</th>
																<th  id="mon7">Aug</th>
																<th  id="mon7">Sep</th>
																<th  id="mon7">Oct</th>
																<th  id="mon7">Nov</th>
																<th  id="mon7">Dec</th>
																<th colspan="2">Total</th>
															</tr>
															<tr>
																<th>qty</th>																
																<th>qty</th>																
																<th>qty</th>																
																<th>qty</th>															
																<th>qty</th>																
																<th>qty</th>																
																<th>qty</th>																
																<th>qty</th>															
																<th>qty</th>															
																<th>qty</th>																
																<th>qty</th>																
																<th>qty</th>																
																<th>Total Qty</th>															
															</tr>
														</thead>
														<tbody id="tbodyyearly_print"> 
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


<!-- ============================  tbodydaily  ================================== -->
<script id="CONTENT_DAILY_PRINT" type="text/x-jquery-tmpl">
			{{if order==37}} 
				<tr >
					<td colspan="8" style="border: none;padding:22px;"></td>
				</tr>	
			{{/if}}	
    	<tr>
			<td>{{= order}}</td>
			<td class="content-left"><span class="ellipsis">{{= req_pro}}</span></td>
			<td>{{= req_qty}}</td>
			<td>{{= req_date}}</td>
			<td>{{= app_date}}</td>
			<td>{{= request_by}}​</td>
			<td>{{= approve_by}}</td>
			<td class="content-right" rowspan="{{= total_row}}">{{= total_pro_qty}}</td>
		</tr>
    </script>
<!-- ============================  tbodyweekly  ================================== -->
<script id="CONTENT_WEEKLY_PRINT" type="text/x-jquery-tmpl">
			{{if order==37}} 
				<tr >
					<td colspan="8" style="border: none;padding:22px;"></td>
				</tr>	
			{{/if}}	
    	<tr>
			<td>{{= order}}</td>
			<td class="content-left"><span class="ellipsis">{{= product_name}}</span></td>
			<td>{{= (day1_qty=day1_qty?day1_qty:0)}}</td>
			<td>{{= (day2_qty=day2_qty?day2_qty:0)}}</td>
			<td>{{= (day3_qty=day3_qty?day3_qty:0)}}</td>
			<td>{{= (day4_qty=day4_qty?day4_qty:0)}}</td>
			<td>{{= (day5_qty=day5_qty?day5_qty:0)}}</td>
			<td>{{= (day6_qty=day6_qty?day6_qty:0)}}</td>
			<td>{{= (day7_qty=day7_qty?day7_qty:0)}}</td>
			<td class="content-right">{{= total_qty}}</td>
		</tr>
    </script>
    

<!-- ============================  tbodyyearly  ================================== -->
<script id="CONTENT_YEARLY_PRINT" type="text/x-jquery-tmpl">    
			{{if order==37}} 
				<tr>
					<td colspan="8" style="border: none;padding:22px;"></td>
				</tr>	
			{{/if}}	
			
			<tr>
			<td>{{= order}}</td>
			<td class="content-left"><span class="ellipsis">{{= pro_name}}</span></td>
			<td>{{= (jan_qty=jan_qty)?jan_qty:0}}</td>
			<td>{{= (feb_qty=feb_qty)?feb_qty:0}}</td>
			<td>{{= (mar_qty=mar_qty)?mar_qty:0}}</td>
			<td>{{= (apr_qty=apr_qty)?apr_qty:0}}</td>
			<td>{{= (may_qty=may_qty)?may_qty:0}}</td>
			<td>{{= (jun_qty=jun_qty)?jun_qty:0}}</td>
			<td>{{= (jul_qty=jul_qty)?jul_qty:0}}</td>
			<td>{{= (aug_qty=aug_qty)?aug_qty:0}}</td>
			<td>{{= (sep_qty=sep_qty)?sep_qty:0}}</td>
			<td>{{= (oct_qty=oct_qty)?oct_qty:0}}</td>
			<td>{{= (nov_qty=nov_qty)?nov_qty:0}}</td>
			<td>{{= (dec_qty=dec_qty)?dec_qty:0}}</td>
			<td class="content-right">{{= total_qty}}</td>
		</tr>
		

    </script>