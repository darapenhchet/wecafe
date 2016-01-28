
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
<meta name="author" content="Coderthemes">

<link rel="shortcut icon" href="images/favicon_1.ico">

<title>KOSIGN WeCafe...</title>
<style>
a { 
	cursor: pointer;
}
.hidetable {
	display: none;
}

  table {
	border: 1px solid;
}

thead tr th {
	text-align: center;
	font-size: 12px;
	border: 1px solid;
}

tbody tr td {
	text-align: center;
	border-right: 1px solid;
} 
#tblfooter td {
	text-align: center;
	border-top: 1px solid;
} 

</style>
<!-- Base Css Files -->
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet" />

<!-- Font Icons -->
<link
	href="${pageContext.request.contextPath}/resources/assets/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/assets/ionicon/css/ionicons.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/material-design-iconic-font.min.css"
	rel="stylesheet">

<!-- animate css -->
<link
	href="${pageContext.request.contextPath}/resources/css/animate.css"
	rel="stylesheet" />

<!-- Waves-effect -->
<link
	href="${pageContext.request.contextPath}/resources/css/waves-effect.css"
	rel="stylesheet">

<!-- sweet alerts -->
<link
	href="${pageContext.request.contextPath}/resources/assets/sweet-alert/sweet-alert.min.css"
	rel="stylesheet">

<!-- Custom Files -->
<link href="${pageContext.request.contextPath}/resources/css/helper.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->

<script src="${pageContext.request.contextPath}/resources/js/modernizr.min.js"></script>

<style>
@media print {
	.content-page {
		margin-top: 0px;
		margin-left: 0px;
	}
	.content {
		margin-top: 0px;
		margin-bottom: 0px;
	}
}
</style>
</head>



<body class="fixed-left-void">

	<!-- Begin page -->
	<div id="wrapper">

		<!-- Top Bar Start -->
		<%@ include file="topbar.jsp"%>
		<!-- Top Bar End -->


		<!-- ========== Left Sidebar Start ========== -->
		<%@ include file="left_sidebar.jsp"%>
		<!-- Left Sidebar End -->
		<!-- ============================================================== -->
		<!-- Start right Content here -->
		<!-- ============================================================== -->
		<div class="content-page">
			<!-- Start content -->
			<div class="content">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="panel panel-default">
								<!-- <div class="panel-heading">
                                    <h4>Invoice</h4>
                                </div> -->
								<div class="panel-body">
									<div class="clearfix">
										<div class="pull-left">
											<h2 class="text-right">
												<%-- <img src="${pageContext.request.contextPath}/resources/images/logo_dark.png" alt="velonic"> --%>

												<strong>Purchase Information</strong> 
												<small id="startfrom"></small>
												<!-- <small>start from</small> <small id="purchasemonth"></small> -->
											</h2>
										</div>
									</div>

									<hr>
									<div class="m-h-50 form-group hidden-print ">
										<div class="col-sm-9 ">
										<spen id="datelable" class="hidetable">
											<label class="col-sm-1 control-label">Date : </label> <input
												type="hidden" id="SEND_DT" data-id="SEND_DT" />
											<div id="sendFrdt" class="date-range col-sm-5">
												<input type="text" readonly="readonly" id="REGS_DATE_S"
													name="startdate" class="range-start"
													style="width: 100px; text-align: center;">&nbsp; <a
													href="#none" id="btnREGS_DATE_S"><img
													style="width: 20px; height: 20px;"
													src="${pageContext.request.contextPath}/resources/images/img/ico_calendar.png">
													</a><span id="EDate">&nbsp;~&nbsp;
												<input type="text" readonly="readonly" id="REGS_DATE_E"	name="stopdate" class="range-end" style="width: 100px; text-align: center;">&nbsp; 
												<a href="#none" id="btnREGS_DATE_E"><img style="width: 20px; height: 20px;" src="${pageContext.request.contextPath}/resources/images/img/ico_calendar.png"></a>
													</span>
											</div>
										</spen>
										<span id="monthcombo" class="hidetable">
											<select id="selectmonth">
												<option value="0">January</option>
												<option value="1">February</option>
												<option value="2">March</option>
												<option value="3">April</option>
												<option value="4">May</option>
												<option value="5">June</option>
												<option value="6">July</option>
												<option value="7">August</option>
												<option value="8">September</option>
												<option value="9">October</option>
												<option value="10">November</option>
												<option value="11">December</option>
											</select>
										</span>
										<span id="yearcombo">
											<select id="selectyear">
												<option value="2014">2014</option>
												<option value="2015">2015</option>
												<option value="2016">2016</option>												
											</select>
										</span>
										</div>
										<div class="col-sm-3 form-group">
											<select class="form-control" id="selectreport">
												<option value="0">Detail</option>
												<option value="1">Daily</option>
												<option value="2">Weekly</option>
												<option value="3">Monthly</option>
												<option value="4">Yearly</option>
											</select>
										</div>

									</div>

									<div class="row">
										<div class="col-md-12 col-sm-12 col-xs-12">
											<div class="hidetable" id="tbldaily">
												<table id="dailytable" class="table table-responsive">
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
													<tbody id="tbodydaily">
													</tbody>
												</table>
											</div>
											<div id="tbldetail">
												<table id="detailtable" class="table table-responsive">
													<thead>
														<tr> 
															<th>#</th>
															<th>Request No</th> 
															<th>Request Date</th>
															<th>Request By</th> 														
															<th>Request Total Qty</th>
														</tr>
													</thead>
													<tbody id="tbodydetail"> 
													</tbody>
												</table>
											</div>
											<div>
												<div class="hidetable" id="tblweekly">
													<table id="weeklytable" class="table table-responsive">
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
												<div id="tblmonthly" class="hidetable  table-responsive">
													<table id="monthlytable" class="table">
														<thead id="tbl_header_month"> 
														</thead>
														<tbody id="tbodymonthly"> 
														</tbody>
													</table>
												</div>
												<div class="hidetable table-responsive" id="tblyearly">
													<table id="yearlytable" class="table table-responsive">
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
														<tbody id="tbodyyearly"> 
														</tbody>
													</table>
												</div>
												
											</div>
										</div>
										<div class="row">
											<div class="col-md-2" style="padding-top: 5px;">
												<select id="PER_PAGE"  class="form-control">
													<option value="10">10</option>
													<option value="15">15</option>
													<option value="20">20</option>
													<option value="25">25</option>
												</select>
											</div>
											<div class="col-md-10 form-horizontal" align="right">
												<label  class="control-label col-md-9">Total :</label>
													<div class="col-md-3" style="padding-top: 6px;">
															<input class="form-control" readonly="readonly" id="allTotalAmount" type="text">
													</div>												
											</div>
												
					
							<div class="col-md-12 col-sm-12 col-lg-12 col-xs-12" style="text-align: center;">
								<ul class="pagination" id="PAGINATION" style="margin: 0 auto;">
								</ul>						
							</div>

				
											<!-- <div id="PAGINATION" class="pull-right"></div> -->
										</div>
										<div class="row" style="border-radius: 0px;">
											 <div class="hidden-print">
											<div class="pull-right">
												<a href="javascrpt:"
													class="btn btn-inverse waves-effect waves-light"
													onclick="window.print();"><i class="fa fa-print"></i></a> <a
													href="#" class="btn btn-primary waves-effect waves-light">Submit</a>
											</div>
										</div>
										</div>
										<br>
										
									</div>
								</div>

							</div>

						</div>



					</div>
					<!-- container -->

				</div>
				<!-- content -->

				<%@ include file="footer.jsp"%>

			</div>
			<!-- ============================================================== -->
			<!-- End Right content here -->
			<!-- ============================================================== -->
		</div>
		<!-- END wrapper -->
		<!-- ############################################################# --> 
		<div id="impDetail" style="display: none; width: 90%;">
			<div class="modal-content">
				<div class="modal-header">

					<button type="button" class="close" aria-hidden="true">
						<span class="button b-close"><span>×</span></span>
					</button>
					<h4 class="modal-title">Import Detail</h4>

				</div>
				<div class="modal-body" style="width: 100%;">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>#</th>
								<th>Request No</th>
								<th>Product Name</th>
								<th>Request Qty</th>
								<th>Request Date</th>
								<th>Request By</th>
								<th>Approve Date</th>
								<th>Approve By</th>
							</tr>
						</thead>
						<tbody id="impProDetail"> 
						</tbody> 
					</table>
				</div> 
				<div class="modal-footer form-group form-horizontal" style="height: 80px;"> 
					<div align="right">
						<label  class="control-label col-lg-1" style="color: red">Total Qty : </label>
							<div class="col-lg-2">
									<input readonly="true" class="form-control" id="btotalamount"type="text" style="color: blue">
							</div>
						<button class="btn btn-default b-close">Close</button>
					</div>
				</div>
			</div>
		</div>

		<!-- ################################################################## -->

		<script id="CONTENT_TEMPLATE" type="text/x-jquery-tmpl">
	 

        </script>
		<script>
        var resizefunc = [];
        var ctx = "${pageContext.request.contextPath}";
    </script>

		<!-- jQuery  -->
		<script
			src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
		<script	src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
		<script	src="${pageContext.request.contextPath}/resources/js/jquery.ui.datepicker-ko.js"></script>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css">

		<script
			src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/waves.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/js/wow.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/js/jquery.nicescroll.js"
			type="text/javascript"></script>
		<script
			src="${pageContext.request.contextPath}/resources/js/jquery.scrollTo.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/assets/jquery-detectmobile/detect.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/assets/fastclick/fastclick.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/assets/jquery-slimscroll/jquery.slimscroll.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/assets/jquery-blockui/jquery.blockUI.js"></script>

		<script	src="${pageContext.request.contextPath}/resources/js/jquery.tmpl.min.js"></script>
		<script	src="${pageContext.request.contextPath}/resources/js/jquery.bootpag.min.js"></script>
		<!-- CUSTOM JS -->
		<script src="${pageContext.request.contextPath}/resources/js/jquery.app.js"></script>
		<script	src="${pageContext.request.contextPath}/resources/js/jquery.bpopup.min.js"></script>
		
		<!-- Pageination -->
		<script src="${pageContext.request.contextPath}/resources/js/jquery.simplePagination.js"></script>
		
		
<!-- ============================  tbodydetail  ================================== -->		
	<script id="CONTENT_DETAIL" type="text/x-jquery-tmpl">
    	<tr>  
			<td>{{= order}}</td>
			<td ><a herf="javascript:;" id="impid" class="ng-binding">{{= req_id}}</a></td>
			<td style="text-align:right;">{{= req_date}} </td>
			<td style="text-align:right;">{{= request_by}} ​</td>
			<td style="text-align:right;">{{= total_request_qty}} ​</td>
		</tr>
    </script>
 
 <!-- ============================  tbodydaily  ================================== -->		
	<script id="CONTENT_DAILY" type="text/x-jquery-tmpl">
    	<tr>
			<td>{{= order}}</td>
			<td>{{= req_pro}}</td>
			<td>{{= req_qty}}</td>
			<td>{{= req_date}}</td>
			<td>{{= app_date}}</td>
			<td>{{= request_by}}​</td>
			<td>{{= approve_by}}</td>
			<td rowspan="{{= total_row}}">{{= total_pro_qty}}</td>
		</tr>
    </script>
 
 <!-- ============================  tbodyweekly  ================================== -->		
	<script id="CONTENT_WEEKLY" type="text/x-jquery-tmpl">
    	<tr>
			<td>{{= order}}</td>
			<td>{{= product_name}}</td>
			<td>{{= (day1_qty=day1_qty?day1_qty:0)}}</td>
			<td>{{= (day2_qty=day2_qty?day2_qty:0)}}</td>
			<td>{{= (day3_qty=day3_qty?day3_qty:0)}}</td>
			<td>{{= (day4_qty=day4_qty?day4_qty:0)}}</td>
			<td>{{= (day5_qty=day5_qty?day5_qty:0)}}</td>
			<td>{{= (day6_qty=day6_qty?day6_qty:0)}}</td>
			<td>{{= (day7_qty=day7_qty?day7_qty:0)}}</td>
			<td>{{= total_qty}}</td>
		</tr>
    </script>
 <!-- ============================  tbodymonthly  ================================== -->		


 <!-- ============================  tbodyyearly  ================================== -->		
	<script id="CONTENT_YEARLY" type="text/x-jquery-tmpl">    
			<tr>
			<td>{{= order}}</td>
			<td style="text-align:left; width: 100px;">{{= pro_name}}</td>
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
			<td>{{= total_qty}}</td>
		</tr>
    </script>
   <!-- ============================================================== -->   
 <script>
 var st = "";
 $(document).ready(function(){
	var products ={};
	var check = true;
	var order = 1;
	var v=[];
	var b = true;
	var index = 0;
	var currentPage=1;
	 setCalendar();
	 searchByDate();
	  
	 $("#PAGINATION").pagination({
			items:10,
			itemsOnPage:10,
			cssStyle: 'light-theme',
			edges:3,
			displayedPages:3,
			currentPage:1,
			onPageClick:pageingClick
		});
	 
	 function pageingClick(pageN,event){
			checkFilter(pageN);
		}
	  
	 $('select#selectyear option[value="'+new Date().getFullYear()+'"]').attr("selected",true); 
	 $("#selectyear").change(function(){
		 switch($("#selectreport").val()){
		 case '0': 
			 products.listDetail(1); 
			 break;
		 case '1':
			 products.listDaily(1);
			 break;
		 case '2':
			 products.listWeekly(1);
			 break;
		 case '3':
			 products.listMonthly(1); 
			 break;
			 
		 case '4':
			 products.listYearly(1); 
			 break;
	 	}
		 $("#PAGINATION").pagination('selectPage',1);
	 });
	 
	 function checkFilter(currentPage){
		 switch($("#selectreport").val()){
		 case '0': 
			 
			 products.listDetail(currentPage); 
			 break;
		 case '1':
			 products.listDaily(currentPage);
			 break;
		 case '2':
			 products.listWeekly(currentPage);
			 break;
		 case '3':
			 products.listMonthly(currentPage); 
			 break;
			 
		 case '4':
			 products.listYearly(currentPage); 
			 break;
	 	}
		
	} 
	 
	 $("#selectmonth").change(function(){ 
		 setheadermonthly();
		 products.listMonthly(1);
		 $("#PAGINATION").pagination('selectPage',1);
		 
	 });
	 
	 $("#PER_PAGE").change(function(){
		 $("#PAGINATION").pagination('updateItemsOnPage', $(this).val());
		 checkFilter(1);
		 
	 });
	 
	 
	 products.listDetail=function  (currentPage){
		
		 var input={
				 "currentPage" : currentPage,
		    	 "perPage"     : $("#PER_PAGE").val(), 
		    	 "year" 	  :  $("#selectyear").val()
		 }

		 
		var byyear = $("#selectyear").val(); 
		 $.ajax({ 
			    url: "${pageContext.request.contextPath}/admin/reports/get_report_request/" , 
			    type: 'GET', 
			    data: input,
				   beforeSend: function(xhr) {
	               xhr.setRequestHeader("Accept", "application/json");
	               xhr.setRequestHeader("Content-Type", "application/json");
	           },
			    success: function(data) { 
			    	console.log("detail==="+data.total_qty);
					$("#PAGINATION").html("");
			    	
					$("#PAGINATION").pagination('updateItems',data.pagination.totalCount);
			    	
				    	b =true;
						v=data;
						var total_qty=0;
						if(data!="" || data!=null){
							total_qty=data.total_qty;
						 if(data.REPORT_REQUEST_DETAIL.length>0){
							
						$("tbody#tbodydetail").html('');
							 for(var i=0;i<data.REPORT_REQUEST_DETAIL.length;i++){							
								products.format(data.REPORT_REQUEST_DETAIL[i]);
							} 
							$("#CONTENT_DETAIL").tmpl(data.REPORT_REQUEST_DETAIL).appendTo("tbody#tbodydetail");
							
							$("#allTotalAmount").val(total_qty);
						}else{
							$("tbody#tbodydetail").html(''); 
							$("#allTotalAmount").val('');
						}
					}
			    },
			    error:function(data,status,er) { 
			        console.log("error: ",data," status: ",status," er:",er);
			    }
			}); 
	 }
	 products.listDaily = function(currentPage){ 
	
	 var input={
			 "currentPage" : currentPage,
	    	 "perPage"     : $("#PER_PAGE").val(),
	    	 "day"   : $.trim($("#REGS_DATE_S").val())			 
	 };
	
		 $.ajax({ 
			    url: "${pageContext.request.contextPath}/admin/reports/get_request_dailly/" , 
			    type: 'GET', 
			    data:input,
				    beforeSend: function(xhr) {
	               xhr.setRequestHeader("Accept", "application/json");
	               xhr.setRequestHeader("Content-Type", "application/json");
	           },
			    success: function(data) { 
			    	console.log("daily==="+data.total_qty);
					$("#PAGINATION").html("");
			    	
					$("#PAGINATION").pagination('updateItems',data.pagination.totalCount);
					
			    	index = 0;
			    	
			    	b =true;
					v=data;
					var total_qty=0;
				 	 if(data.reportdaily.length>0){
						$("tbody#tbodydaily").html('');
						   for(var i=0;i<data.reportdaily.length;i++){		
							   total_qty=data.reportdaily[0].total_req_qty;  
							   products.formatDaily(data.reportdaily[i]);
							   
						}   
						$("#CONTENT_DAILY").tmpl(data.reportdaily).appendTo("tbody#tbodydaily"); 
						$("#allTotalAmount").val(total_qty);
					}else{
						$("tbody#tbodydaily").html("");
						$("#allTotalAmount").val('');
					}
			    	 
			    },
			    error:function(data,status,er) { 
			        console.log("error: ",data," status: ",status," er:",er);
			    }
			}); 
	 }
	 products.listWeekly = function(currentPage){ 
		 var json = {
				   "currentPage" : currentPage,
				   "perPage"     : $("#PER_PAGE").val(),
	   				"startdate" : $("#REGS_DATE_S").val(),
	   				"enddate"   : $("#REGS_DATE_E").val()
			};$.ajax({ 
			    url: "${pageContext.request.contextPath}/admin/reports/get_request_weekly/", 
			    type: 'GET',  
			    data: json, 
			    beforeSend: function(xhr) {
                    xhr.setRequestHeader("Accept", "application/json");
                    xhr.setRequestHeader("Content-Type", "application/json");
                },
			    success: function(data) {
			    	console.log("weeekly==="+data.total_qty);
			    	b=true;
			    	v=data;
			    	
					$("#PAGINATION").html("");
			    	
					$("#PAGINATION").pagination('updateItems',data.pagination.totalCount);
				
					
					if(data.reportweekly.length>0){
						$("tbody#tbodyweekly").html('');
						   for(var i=0;i<data.reportweekly.length;i++){
							products.formatWeekly(data.reportweekly[i]);
						}   
						$("#CONTENT_WEEKLY").tmpl(data.reportweekly).appendTo("tbody#tbodyweekly"); 
					 	
						$("#allTotalAmount").val(data.total_qty); 
					}else{
						$("tbody#tbodyweekly").html("");
						$("#allTotalAmount").val('');
					}
							    
			    },	
			    error:function(data,status,er) { 
			        console.log("error: "+data+" status: "+status+" er:"+er);
			    }
			}); 
		 
	 }
	 products.listMonthly = function(currentPage){ 
		
		 var json = {
				 	"currentPage" : currentPage,
		    		"perPage"     : $("#PER_PAGE").val(),
	   				"start_date" : $("#selectyear").val() + "-" + (parseInt($("#selectmonth").val()) + 1) + "-01",
	   				"end_date"   : $("#selectyear").val() + "-" + (parseInt($("#selectmonth").val()) + 1) + "-" + (new Date($("#selectyear").val(),parseInt($("#selectmonth").val()) + 1, 0).getDate())
			};
		 $.ajax({
			    url: "${pageContext.request.contextPath}/admin/reports/get_request_monthly/", 
			    type: 'GET',  
			    data: json, 
			    beforeSend: function(xhr) {
                    xhr.setRequestHeader("Accept", "application/json");
                    xhr.setRequestHeader("Content-Type", "application/json");
                },
			    success: function(data) { 
			    	console.log("monthly==="+data.total_qty);
			    	
			    	$("#PAGINATION").html("");
			    	
					$("#PAGINATION").pagination('updateItems',data.pagination.totalCount);
			    	
			    	b=true;
			    	var total_qty1=0;
			    	  		    	    	
			    	    total_qty1=data.total_qty;
			    	    	
				    	$("#monthlytable tbody").html('');
				    	var st = "";
				    	
					    	for(var i=0;i<data.reportmonthly.length;i++){
					    	var total_qty = 0;
				    		st += "<tr>";
				    		if(b){
					 			order = data.pagination.perPage * (data.pagination.currentPage-1); 
					 			orderlist = order + 1;
					 			st += "<td>"+ orderlist +"</td>";
					 			b = false; 
					 		}
					 		else  {
					 			orderlist = orderlist + 1;
					 			st += "<td>"+ (orderlist) +"</td>"; 
					 		} 
				    		st += "<td>" + data.reportmonthly[i].pro_name + "</td>";
				    		
				    		for(var j=0; j<(new Date($("#selectyear").val(),parseInt($("#selectmonth").val()) + 1, 0).getDate());j++) {
				    			var d= data.reportmonthly[i]['day' + (j+1) + '_qty'];			    				
				    				st += "<td>" +(d = d ? d : 0)+ "</td>";
				    				total_qty += data.reportmonthly[i]['day' + (j+1) + '_qty'];

				    		}
				    		st += "<td>" + total_qty + "</td>";				 
				    		st += "</tr>";				    		
						}
					    	$("#monthlytable tbody").html(st);
					    	$("#allTotalAmount").val(total_qty1);
				   
			    },	
			    error:function(data,status,er) { 
			        console.log("error: "+data+" status: "+status+" er:"+er);
			    }
			}); 
	 }
	 products.listYearly = function(currentPage){
		 var json = {
					"currentPage" : currentPage,
		    		"perPage"     : $("#PER_PAGE").val(),
	   				"start_date" : $("#selectyear").val() + "-01-01",
	   				"end_date"   : $("#selectyear").val() + "-12-31"
			};$.ajax({ 
			    url: "${pageContext.request.contextPath}/admin/reports/get_request_yearly/", 
			    type: 'GET',  
			    data: json, 
			    beforeSend: function(xhr) {
                    xhr.setRequestHeader("Accept", "application/json");
                    xhr.setRequestHeader("Content-Type", "application/json");
                },
			    success: function(data) { 
			    	console.log("yearly==="+data.total_qty);
			    	v=data;
			    	b=true;
			    	
					$("#PAGINATION").html("");
			    	
					$("#PAGINATION").pagination('updateItems',data.pagination.totalCount);		    	
			    	
			    	if(data.reportyear){
				    	$("tbody#tbodyyearly").html('');
				    	for(var i=0;i<data.reportyear.length;i++){
				    	formatMonthlySaleReport(data.reportyear[i]);
				    	}
			    		 $("#CONTENT_YEARLY").tmpl(data.reportyear).appendTo("tbody#tbodyyearly");			    	  
			    	}
			    	$("#allTotalAmount").val((data.total_qty>0)?data.total_qty:0);
			    },	
			    error:function(data,status,er) { 
			        console.log("error: "+data+" status: "+status+" er:"+er);
			    }
			}); 
	 }
	 
	 products.formatDaily = function(value){
		 if(index < v["total_qty_pro"].length){
			 value["total_pro_qty"] =v["total_qty_pro"][index]["total_pro_qty"];
			 index++;
		 }	
	
		 if(b){
	 			order = v.pagination.perPage * (v.pagination.currentPage-1);
	 			j = order + 1;
	 			value["order"] =j;
	 			b = false;
	 		}
	 		else  
	 		value["order"] = ++j; 
	 }
	 
	 products.format = function(value){
		
		 if(b){
	 			order = v.pagination.perPage * (v.pagination.currentPage-1);
	 			j = order + 1;
	 			value["order"] =j;
	 			b = false;
	 		}
	 		else  
	 		value["order"] = ++j; 
	 }
	 
	 products.formatWeekly = function(value){
		
		value["total_qty"] =value["day1_qty"] + 
				 value["day2_qty"] + 
				 value["day3_qty"] +
				 value["day4_qty"] +
				 value["day5_qty"] +
				 value["day6_qty"] +
				 value["day7_qty"]  ;
 		for(j =1 ;j<=7; j++){
		value['day' +(j) + '_qty'] = value['day' +(j) + '_qty']; 
	
		}  
		if(b){
	 			order = v.pagination.perPage * (v.pagination.currentPage-1); 
	 			k = order + 1;
	 			value["order"] =k;
	 			b = false; 
	 		}
	 		else  
	 		value["order"] = ++k;  
	 } 
	 
	 function formatMonthlySaleReport(value){
			
	    	value["total_qty"] = value["jan_qty"] + 
								 value["feb_qty"] + 
								 value["mar_qty"] +
								 value["apr_qty"] +
								 value["may_qty"] +
								 value["jun_qty"] +
								 value["jul_qty"] +
								 value["aug_qty"] +
								 value["sep_qty"] +
								 value["oct_qty"] +
								 value["nov_qty"] +
								 value["dec_qty"]  ;
	    	 if(b){
		 			order = v.pagination.perPage * (v.pagination.currentPage-1);
		 			j = order + 1;
		 			value["order"] =j;
		 			b = false;
		 		}
		 		else  
		 		value["order"] = ++j; 
	    	
	    }
		
		products.listDetail(1);

	 
	 $("#selectreport").change(function(){
		 if($(this).val()==0){
			 $("#tbldetail").removeClass("hidetable");
			 $("#tbldaily").addClass("hidetable"); 
			 $("#tblweekly").addClass("hidetable");
			 $("#tblmonthly").addClass("hidetable");
			 $("#tblyearly").addClass("hidetable");
			 $("#yearcombo").removeClass("hidetable");
			 $("#monthcombo").addClass("hidetable");
			 $("#datelable").addClass("hidetable");
			 
			 products.listDetail(1);
		 }			 
		 else if($(this).val()==1){ 
			
			 $("#tbldetail").addClass("hidetable");
			 $("#tbldaily").removeClass("hidetable");
			 $("#tblweekly").addClass("hidetable");
			 $("#tblmonthly").addClass("hidetable");
			 $("#tblyearly").addClass("hidetable");
			 
			 $("#yearcombo").addClass("hidetable");
			 $("#monthcombo").addClass("hidetable");
			 $("#datelable").removeClass("hidetable");
			 $("#EDate").addClass("hidetable");
			 setCalendar();
			 
			 products.listDaily(1);
			
			 
		 }else if($(this).val()==2){ 
			 
			 $("#tbldetail").addClass("hidetable");
			 $("#tbldaily").addClass("hidetable");
			 $("#tblweekly").removeClass("hidetable");
			 $("#tblmonthly").addClass("hidetable");
			 $("#tblyearly").addClass("hidetable");
			 
			 $("#yearcombo").addClass("hidetable");
			 $("#datelable").removeClass("hidetable");
			 $("#EDate").removeClass("hidetable");	
			 $("#monthcombo").addClass("hidetable");
			 setCalendar();
			 settableheader();
			 
			 products.listWeekly(1);
			
			 
		 }else if($(this).val()==3){
			 $("#tbldaily").addClass("hidetable");
			 $("#tbldetail").addClass("hidetable");
			 $("#tblweekly").addClass("hidetable");
			 $("#tblmonthly").removeClass("hidetable");
			 $("#tblyearly").addClass("hidetable");	
			 
			 $('select#selectyear option[value="'+new Date().getFullYear()+'"]').attr("selected",true);
			 $('select#selectmonth option[value="'+new Date().getMonth()+'"]').attr("selected",true);			 
			 $("#yearcombo").removeClass("hidetable");
			 $("#selectmonth").removeClass("hidetable");
			 $("#datelable").addClass("hidetable");
			 $("#monthcombo").removeClass("hidetable");
			 
			 setheadermonthly();
			 products.listMonthly(1);
			
		 }else if($(this).val()==4){
			 $("#tbldaily").addClass("hidetable");
			 $("#tbldetail").addClass("hidetable");
			 $("#tblweekly").addClass("hidetable");
			 $("#tblmonthly").addClass("hidetable");
			 $("#tblyearly").removeClass("hidetable");
			 var startdate = new Date().getFullYear() + '/01/01';
			 var stopdate = new Date().getFullYear() + '/12/31';
			 
			 $("#selectmonth").addClass("hidetable");
			 products.listYearly(1);
		 }	
		 $("#PAGINATION").pagination('selectPage',1);
	 });
	function setheadermonthly(){
		
		var st = "";
			st += "<tr>";
			st += "<th rowspan='2'>#</th>";
			st += "<th rowspan='2'>Item</th>";
		for (i =0; i<(new Date($("#selectyear").val(), parseInt($("#selectmonth").val()) + 1, 0).getDate()) ;i++)
			{			
			st += "<th>" + (1+i) + "</th>";
			}
			st += "<th rowspan='2'>Total</th></tr><tr>";		
			for (i =0; i<(new Date($("#selectyear").val(), parseInt($("#selectmonth").val()) + 1, 0).getDate()) ;i++)
			{			
			st += "<th>qty</th>";
			}	
			
			$("#tbl_header_month").html(st);
			
	}
	 
	function settableheader(){
		var monthOfyear = ['January', 'February', 'Match', 'April', 'May', 'June', 'July','Augest','Septemper', 'October', 'November', 'December'];
		var dd = 0;
		var dayID ="";
		
			for (var i=0; i <7; i++) {
				dayID = "#week" + (i+1);
				dd=	moment($("#REGS_DATE_S").val()).add(i, 'days').get('date');
				$(dayID).html(dd);
			}; 
			 
		}
	 
	 function searchByDate(){
      	var startDate 		= $( "#REGS_DATE_S" ).val() + " 00:00:00";
		var endDate 		= $( "#REGS_DATE_E" ).val() + " 24:00:00"; 
		json = {
					"startdate"   		  : startDate,
					"enddate" 		  	  : endDate
		};
		console.log(JSON.stringify(json));
		$.ajax({
			 url: "${pageContext.request.contextPath}/admin/getsearchsellbydate", 
	    type: 'POST',
			datatype: 'JSON',
			data: JSON.stringify(json), 
			beforeSend: function(xhr) {
	            xhr.setRequestHeader("Accept", "application/json");
	            xhr.setRequestHeader("Content-Type", "application/json");
	        },
			success: function(data){
				st="";
				
            	var a = 1;
            	var total = 0;
            	
	            for(i=0; i<data.length; i++)	
		      	{ 
	            	a = i+1;
	            	total += data[i].Total ;
		    	  	st += "<tr>"
		    	  	st += "<td>" + a + "</td> "
		    	  	st += "<td>" + data[i].productName + "</td>";
		    	  	st += "<td>" + data[i].proQty + "</td>";
		    	  	st += "<td>" + data[i].UnitPrice + "</td>";
		    	  	st += "<td>" + data[i].Total + "</td>"; 
		    	  
		    	}
	            
      			$("#searchDetail").html(st);
      			$("#totalPrice").html(total);
			},
			error:function(data, status,er){
				console.log("error: " + data + "status: " + status + "er: ");
			}
		}); 
	 }
	  

	 $("#btnREGS_DATE_S").click(function(){	
	 			$( "#REGS_DATE_S" ).datepicker("show");		
	 			
	 		});		
	 	$("#btnREGS_DATE_E").click(function(){
	 			$( "#REGS_DATE_E" ).datepicker("show");			
	 		});

	 function calculateDay(start, end){		
	         var days = (end - start) / (1000 * 60 * 60 * 24);
	         $("#totalday").val(days);
	         return;
	 }

	 function setCalendar(){		
	 		$("#REGS_DATE_S").datepicker({
	 		      defaultDate: new Date(),
	 		      setDate: new Date(),
	 		      changeMonth: true,
	 		      numberOfMonths: 1,
	 		      dateFormat: "yy-mm-dd",
	 		      onClose: function( selectedDate ) {		
	 			    	    calculateDay($("#REGS_DATE_S").datepicker("getDate"),$("#REGS_DATE_E").datepicker("getDate"));
	 						//moneyPerDay($("#totalAmount").val(), $("#totalday").val());
	 						$("#REGS_DATE_E").datepicker("option", "minDate", selectedDate);
	 						if($("#EDate").hasClass("hidetable"))
	 							{ 		
	 								check=true;
	 								products.listDaily(1);
	 							
	 							}	 							
	 						else
	 							{
	 								settableheader();
	 								$("#REGS_DATE_E").datepicker('setDate', moment($("#REGS_DATE_S").val()).add(6, 'days').format('YYYY-MM-DD'));
	 								check=true;
	 								products.listWeekly(1);
	 								 
	 							}
	 							
	 						searchByDate();
	 			      }
	 		});
	 		$("#REGS_DATE_E").datepicker({
	 		     defaultDate: new Date(),
	 		      setDate: new Date(),
	 		      changeMonth: true,
	 		      numberOfMonths: 1,
	 		      dateFormat: "yy-mm-dd",
	 		      onClose: function( selectedDate ) {
						
	 			    	  $("#REGS_DATE_S").datepicker("option", "maxDate", selectedDate);
	 			    	    calculateDay($("#REGS_DATE_S").datepicker("getDate"),$("#REGS_DATE_E").datepicker("getDate"));
	 						//moneyPerDay($("#totalAmount").val(), $("#totalday").val());
	 						$("#REGS_DATE_S").datepicker('setDate', moment($("#REGS_DATE_E").val()).subtract(6, 'days').format('YYYY-MM-DD'));
	 						settableheader();
	 						searchByDate();
	 						check=true;
	 						products.listWeekly(1);
	 						
	 			      }
	 		
	 		});	
	 		if($("#EDate").hasClass("hidetable"))
	 			$("#REGS_DATE_S").datepicker('setDate', moment().format('YYYY-MM-DD'));
	 		else
	 			$("#REGS_DATE_S").datepicker('setDate', moment().subtract(6, 'days').format('YYYY-MM-DD'));
	 		//$("#REGS_DATE_E").datepicker('setDate', moment().add(30, 'days').format('YYYY-MM-DD'));
	 		$("#REGS_DATE_E").datepicker('setDate', moment().format('YYYY-MM-DD'));
	 }
	 $(document).on("click","#impid", function(){
		
		   $.ajax({ 
			    url: "${pageContext.request.contextPath}/admin/reports/get_request_detail?req_id=" + $(this).text() , 
			    type: 'POST', 
			    dataType: 'JSON', 
			    beforeSend: function(xhr) {
                  xhr.setRequestHeader("Accept", "application/json");
                  xhr.setRequestHeader("Content-Type", "application/json");
              },
			    success: function(data) { 
			    	console.log(data);
			    	var st= "";
			    	var total_qty = 0,req_qty=0;
			    	
			    	if(data!="" || data!=null){
			    		 for(i=0; i<data.REQUEST_DETAIL.length; i++){
			    			 req_qty=data.REQUEST_DETAIL[i].pro_qty;
					    	   st += "<tr><td>" + (i + 1) + "</td>";
					    	   st += "<td>" + data.REQUEST_DETAIL[i].req_id +"</td>";
					    	   st += "<td>" + data.REQUEST_DETAIL[i].pro_name +"</td>";
					    	   st += "<td>" +req_qty +"</td>";
					    	   st += "<td>" + data.REQUEST_DETAIL[i].req_date +"</td>"
					    	   st += "<td>" + data.REQUEST_DETAIL[i].req_by +"</td>"
					    	   st += "<td>" + data.REQUEST_DETAIL[i].app_date +"</td>"
					    	   st += "<td>" + data.REQUEST_DETAIL[i].app_by +"</td>"
					    	   total_qty+=req_qty;
					    	   
					       }
					       $("#impProDetail").html(st);
					       $("#btotalamount").val(total_qty);
			    	}
			      
			    },
			    error:function(data,status,er) { 
			        console.log("error: "+data+" status: "+status+" er:"+er);
			    }
			});
		 
		  $("#impDetail").bPopup();  
	 });
	 });
 
 </script>
</body>
</html>