


<!-- <!-- Modal -->
<div class="modal fade" id="request_stock_list" role="dialog " > 
	 <div class="modal-dialog modal-lg" style="width: 80%">
		<div class="modal-content">
		  
		  <div id="print_data">
				<!-- <button type="button" class="close hidden-print" data-dismiss="modal">&times;</button> -->
				<a href="javascrpt:;" class="btn btn-inverse waves-effect waves-light pull-right hidden-print"
				 id="btn_print"><i class="fa fa-print"></i></a>
				 
				<h2 style="text-align: left;">Beverage Stock</h2>
				<h5><span id="report_start_date"></span></h5>
										
				<div id="tbl_import_data" class="overflow-x" > 
					<table  style="border: none;" >
						<thead class="style2">
							<tr class="active">
								<th>#</th>
								<th>Item</th>
								<th style="text-align: center;">Carried Over</th>
								<th style="text-align: center;">Purchase</th>
								<th style="text-align:center;">Sale</th> 
								<th style="text-align:center;">Balance</th>
						 	</tr>
						</thead>
						<tbody id="PRINT_CONTENTS" style="width:100%;">
						</tbody>
					</table>
				</div> 
						
				<br/> 
			</div>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>		
		</div>
	</div>
</div>
<script id="CONTENT_Print_beverage" type="text/x-jquery-tmpl"> 
	<tr>
	     <td>{{= order}}</td>
	     <td>{{= pro_name}}</td>
	     <td>{{= carried_over}}</td>
	     <td>{{= pro_qty}}</td>
	     <td>{{= sale}}</td>
	     <td>{{= balance}}</td>
	</tr> 
</script>

 
