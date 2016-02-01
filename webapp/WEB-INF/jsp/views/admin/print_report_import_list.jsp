


<!-- <!-- Modal -->
<div class="modal fade" id="request_stock_list" role="dialog " > 
	 <div class="modal-dialog modal-lg" style="width: 80%">
		<div class="modal-content">
		  
		  <div id="print_data">
				<!-- <button type="button" class="close hidden-print" data-dismiss="modal">&times;</button> -->
				<a href="javascrpt:;" class="btn btn-inverse waves-effect waves-light pull-right hidden-print"
				 id="btn_print"><i class="fa fa-print"></i></a>
				 
				<h2 style="text-align: center;">Import List </h2>
				<h5><span id="report_start_date"></span> - <span id="report_end_date"></span> </h5>
				
				
					
				<div id="tbl_import_data" > 
					<table border="1" cellpadding="0" cellspacing="0" border="1" style="text-align:center;width: 100%;line-height: 24px;" >
						<thead class="style2">
							<tr class="active">
								<th>#</th>
								<th>Invoice ID</th>
								<th style="text-align: center;">Date</th>
								<th>Name</th>
								<th style="text-align:center;">Total Amount</th> 
						 	</tr>
						</thead>
						<tbody id="PRINT_CONTENTS" style="width:100%;">
						</tbody>
					</table>
				</div> 
						
				<br/>
				<div style="    border: 1px solid;margin: 0 auto; padding: 3px;width: 28%;margin-right: -2px; color: blue; text-align: left;padding-left: 8px;">
					<span>Total Amount : </span><span id="allTotalAmount_print"></span>
					<!-- <input  readonly="readonly" value="0"  id="allTotalAmount_print" type="text"> -->
				</div>
				
			</div>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>		
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



