<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<!-- Base Css Files -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"	rel="stylesheet" />

<!-- Font Icons -->
<link href="${pageContext.request.contextPath}/resources/assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/assets/ionicon/css/ionicons.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/material-design-iconic-font.min.css" rel="stylesheet">

<!-- animate css -->
<link href="${pageContext.request.contextPath}/resources/css/animate.css" rel="stylesheet" />

<!-- Waves-effect -->
<link href="${pageContext.request.contextPath}/resources/css/waves-effect.css" rel="stylesheet">

<!-- sweet alerts -->
<link href="${pageContext.request.contextPath}/resources/assets/sweet-alert/sweet-alert.min.css" rel="stylesheet">

<!-- Custom Files -->
<link href="${pageContext.request.contextPath}/resources/css/helper.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css" />
<!-- DATEPICKER -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

<%-- <link href="${pageContext.request.contextPath}/webjars/materializecss/0.97.0/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/> --%>

<script	src="${pageContext.request.contextPath}/resources/js/modernizr.min.js"></script>
<style>
	.hidetable{ display: none;}
	/* table{border: 1px solid;} */
 	thead tr th, thead tr td { text-align: center;}
	tbody tr td { text-align: center; }
	tfoot td{text-align: center;} 
	@media screen and (max-width: 600px) {
		  table td:before {
		      content: attr(data-label);
	          float: left;
	          text-transform: uppercase;
	         font-weight: bold;
	      }
	}
</style>
</head>



<body>
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
					<div class="panel">
						<div class="panel-body">
							 <div class="clearfix">
                                        <div class="pull-left">
                                            <h2 class="text-right">
                                            	<strong>Sale Information</strong>
                                            	<small>start from</small> 
                                            	<small id="saleMonth"></small>
                                            </h2> 
                                        </div>
                                    </div>
							 <div class="panel-heading">
                               <!-- <h3 class="panel-title">Product Lists</h3> -->
						    <!-- <form class="form-inline">
						        <div class="form-group">
						            <label >Search</label>
						            <input type="text" ng-model="search" class="form-control" placeholder="Search" width="400%">
						        </div>
						    </form> -->
						    <div class="m-h-50 form-group hidden-print ">                                     
					            		<div class="col-sm-9">
					                		<label class="col-sm-1 control-label">Date : </label>
												<input type="hidden" id="SEND_DT" data-id="SEND_DT" />
											<div id="sendFrdt" class="date-range col-sm-5"  >
												<input type="text" readonly="readonly" id="REGS_DATE_S" name="startdate" class="range-start" style="width:100px; text-align: center;">&nbsp;
												<a href="#none" id="btnREGS_DATE_S"><img style="width: 20px; height: 20px;" src="${pageContext.request.contextPath}/resources/images/img/ico_calendar.png"></a>&nbsp;~&nbsp;
												<input type="text" readonly="readonly" id="REGS_DATE_E" name="stopdate" class="range-end" style="width:100px; text-align: center;">&nbsp;
												<a href="#none" id="btnREGS_DATE_E"><img style="width: 20px; height: 20px;" src="${pageContext.request.contextPath}/resources/images/img/ico_calendar.png"></a>
											</div>   
    									</div>            
    									<div class="col-sm-3 form-group" >
											  	<select class="form-control" id="selectreport">
												    <option value="0">Detail</option>
												    <option value="1">Daily</option>
												    <option value="2">Weekly</option>
												    <option value="3">Monthly</option>
												    <option value="4">Yearly</option>
											  </select>  
    									</div>  
    									                            		
                            </div>
                           </div>
						<div class="row">
							<div class="col-md-12 col-sm-12 col-xs-12"> 
							<div class="hidetable" id="tbldaily">
							 <table id="dailytable" class="table table-responsive" >
							    <thead>
									<tr >
							            <th rowspan="2">Item</th> 
							            <th colspan="2" id="day1">1</th>
							            <th colspan="2" id="day2">2</th>
							            <th colspan="2" id="day3">3</th>
							            <th colspan="2" id="day4">4</th>
							            <th colspan="2" id="day5">5</th>
							            <th colspan="2" id="day6">6</th>
							            <th colspan="2" id="day7">7</th> 
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
							    <tbody>
							      <tr>
							      		<td>Americano</td>
							      		<td>1</td>
							      		<td>8$</td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      </tr>
							       <tr id="dailyfooter">
							 			<td colspan="2">Total</td>      		 
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td>10</td>
							      		<td>6$</td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      </tr>
							    </tbody>
							  </table>
							 </div>
							 <div id="tbldetail">
							 	<table id="detailtable" class="table table-responsive" >
								    <thead>
										<tr >
											<th >No</th> 
								            <th >Item</th> 
								            <th >Purchase Date</th>
								            <th >Purchase By</th>
								            <th >Total Quantity</th>
								            <th >Total Amount</th>  
								      	</tr> 
								    </thead>
								    <tbody>
								    </tbody>
							 	</table>
							 </div>
							 <div>
							 <div class="hidetable" id="tblweekly">
							 <table id="weeklytable" class="table table-responsive" >
							    <thead>
									<tr >
							            <th rowspan="2">Item</th> 
							            <th colspan="2" id="week1">1</th>
							            <th colspan="2" id="week2">2</th>
							            <th colspan="2" id="week3">3</th>
							            <th colspan="2" id="week4">4</th>
							            <th colspan="2" id="week5">5</th>
							            <th colspan="2" id="week6">6</th>
							            <th colspan="2" id="week7">7</th> 
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
							    	<tbody>
							      		<tr>
								      		<td>Passion</td>
								      		<td>10</td>
								      		<td>18$</td>
								      		<td></td>
								      		<td></td>
								      		<td></td>
								      		<td></td>
								      		<td></td>
								      		<td></td>
								      		<td></td>
								      		<td></td>
								      		<td></td>
								      		<td></td>
								      		<td></td>
								      		<td></td>
								      		<td></td>
								      		<td></td>
							      		</tr>
							      		 <tr id="weeklyfooter">
							 			<td colspan="2">Total</td>      		 
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td>10</td>
							      		<td>6$</td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      </tr>
							    	</tbody>
							 	</table>
							 </div> 
							 <div class="hidetable" id="tblmonthly">
							 <div class="table-responsive">
							 <table id="tblMonthlySaleReport" class="table" >
							    <thead>
									<tr >
							            <th rowspan="2" style="text-align:left; width: 200px;">Item</th> 
							            <th colspan="2" id="mon1">Jan</th>
							            <th colspan="2" id="mon2">Feb</th>
							            <th colspan="2" id="mon3">Mar</th>
							            <th colspan="2" id="mon4">Apr</th>
							            <th colspan="2" id="mon5">May</th>
							            <th colspan="2" id="mon6">Jun</th>
           					            <th colspan="2" id="mon7">Jul</th>
							            <th colspan="2" id="mon8">Aug</th>
							            <th colspan="2" id="mon9">Sep</th>
							            <th colspan="2" id="mon10">Oct</th>
							            <th colspan="2" id="mon11">Nov</th>
							            <th colspan="2" id="mon12">Dec</th>
							            <th colspan="2">Total</th>
							      	</tr>
							      	<tr>
							            <th>Qty</th>
							            <th>Amount</th>
							            <th>Qty</th>
							            <th>Amount</th>
							            <th>Qty</th>
							            <th>Amount</th>
							            <th>Qty</th>
							            <th>Amount</th>
							            <th>Qty</th>
							            <th>Amount</th>
							            <th>Qty</th>
							            <th>Amount</th>
   							            <th>Qty</th>
							            <th>Amount</th>
							            <th>Qty</th>
							            <th>Amount</th>
							            <th>Qty</th>
							            <th>Amount</th>
							            <th>Qty</th>
							            <th>Amount</th>
							            <th>Qty</th>
							            <th>Amount</th>
							            <th>Qty</th>
							            <th>Amount</th>
							            <th>Total Qty</th>
							            <th>Total Amount</th>
							      </tr>
							    </thead> 
							    	<tbody id="MONTHLY_REPORT">
							    	</tbody>
							    	<tfoot>
							    		<tr id="monthlyfooter">
								 			<td>Total</td>      		 
								      		<td id="TOTAL_JAN_QTY"></td>
								      		<td id="TOTAL_JAN_AMOUNT"></td>
								      		<td id="TOTAL_FEB_QTY"></td>
								      		<td id="TOTAL_FEB_AMOUNT"></td>
								      		<td id="TOTAL_MAR_QTY"></td>
								      		<td id="TOTAL_MAR_AMOUNT"></td>
								      		<td id="TOTAL_APR_QTY"></td>
								      		<td id="TOTAL_APR_AMOUNT"></td>
								      		<td id="TOTAL_MAY_QTY"></td>
								      		<td id="TOTAL_MAY_AMOUNT"></td>
								      		<td id="TOTAL_JUN_QTY"></td>
								      		<td id="TOTAL_JUN_AMOUNT"></td>
						      				<td id="TOTAL_JUL_QTY"></td>
								      		<td id="TOTAL_JUL_AMOUNT"></td>
								      		<td id="TOTAL_AUG_QTY"></td>
								      		<td id="TOTAL_AUG_AMOUNT"></td>
								      		<td id="TOTAL_SEP_QTY"></td>
								      		<td id="TOTAL_SEP_AMOUNT"></td>
								      		<td id="TOTAL_OCT_QTY"></td>
								      		<td id="TOTAL_OCT_AMOUNT"></td>
								      		<td id="TOTAL_NOV_QTY"></td>
								      		<td id="TOTAL_NOV_AMOUNT"></td>
								      		<td id="TOTAL_DEC_QTY"></td>
								      		<td id="TOTAL_DEC_AMOUNT"></td>
								      		<td id="TOTAL_QTY"></td>
								      		<td id="TOTAL_AMOUNT"></td>
								      </tr>
							    	</tfoot>
							 	</table>
							 </div>
							 </div>
							 <div id="tblyearly"  class="hidetable">
							 <table id="yearlytable" class="table table-responsive" >
							    <thead>
									<tr >
							            <th rowspan="2">Item</th> 
							            <th colspan="2" id="year1">2014</th>
							            <th colspan="2" id="year2">2015</th>
							            <th colspan="2" id="year3">2016</th>
							            <th colspan="2" id="year4">2017</th>
							            <th colspan="2" id="year5">2018</th>
							            <th colspan="2" id="year6">2019</th>
							            <th colspan="2" id="year7">2020</th> 
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
							    	<tbody>
							      		<tr>
								      		<td>Americano</td>
								      		<td>1</td>
								      		<td>8$</td>
								      		<td></td>
								      		<td></td>
								      		<td></td>
								      		<td></td>
								      		<td></td>
								      		<td></td>
								      		<td></td>
								      		<td></td>
								      		<td></td>
								      		<td></td>
								      		<td></td>
								      		<td></td>
								      		<td></td>
								      		<td></td>
							      		</tr>
							      		<tr id="yearlyfooter">
							 			<td colspan="2">Total</td>      		 
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td>10</td>
							      		<td>6$</td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      		<td></td>
							      </tr>
							    	</tbody>
							 	</table>
							 </div>
							</div>
						</div>
					</div>
					<!-- end: page -->
				</div>
				<!-- end Panel -->
				</div>
				<!-- container -->
			</div>
			</div>
			<!-- content -->
			<%@ include file="footer.jsp"%>
		</div>
		<div id="sellDetail" style="display: none;width: 90%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" aria-hidden="true">
						<span class="button b-close"><span>×</span></span>
					</button>
					<h4 class="modal-title">Sale detail</h4>
				</div>
				<div class="modal-body" style="height: 290px; width: 100%;">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Produce Name</th>
								<th>Price</th>
								<th>Qty</th>
								<th>Total Amount</th>
								<th>Time</th>
								<th>Comment</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="orderProdetail">
						
						</tbody>
					</table>
					</div>
				<div class="modal-footer" style="height: 80px;">
						<div align="right">
							<button class="btn btn-default b-close">Close</button>
						</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- END wrapper -->
	
	<script id="CONTENT_TEMPLATE" type="text/x-jquery-tmpl">
        <tr>
            <td style="text-align: center;"><a href="javascipt:" id="saleId">{{= ID}}</a></td>
			<td id="orderId" style="display : none;">{{= ORDER_ID}}</td>
            <td style="text-align: center;">{{= SALE_DATE}}</td>
            <td style="text-align: center;">{{= TOTAL }}</td>
            <td style="text-align: center;">{{= SELLER }}</td>
        </tr>
    </script>

	<script id="SALE_MONTHLY_TEMPLATE" type="text/x-jquery-tmpl">
		<tr>
			<td style="text-align:left; width: 100px;">{{= product}}</td>
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
	<script>
            var resizefunc = [];
            var ctx = "${pageContext.request.contextPath}"
     </script>
    <!-- jQuery  -->
	        
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script	src="${pageContext.request.contextPath}/resources/js/jquery.ui.datepicker-ko.js"></script>
    <script	src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/waves.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.scrollTo.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/chat/moment-2.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/jquery-sparkline/jquery.sparkline.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/jquery-detectmobile/detect.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/fastclick/fastclick.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/jquery-slimscroll/jquery.slimscroll.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/jquery-blockui/jquery.blockUI.js"></script>

   	<script	src="${pageContext.request.contextPath}/resources/assets/magnific-popup/magnific-popup.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.bpopup.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.bootpag.min.js"></script>	  
	<script src="${pageContext.request.contextPath}/resources/js/jquery.tmpl.min.js"></script>

    <!-- CUSTOM JS -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.app.js"></script>
    <%-- <script src="${pageContext.request.contextPath}/webjars/materializecss/0.97.0/js/materialize.min.js" type="text/javascript"></script> --%>

	<script type="text/javascript">
   		$(document).ready(function($) {
   			settableheader();
   		 
   		 $("#selectreport").change(function(){
   			 if($(this).val()==0){
   				 $("#tbldetail").removeClass("hidetable");
   				 $("#tbldaily").addClass("hidetable"); 
   				 $("#tblweekly").addClass("hidetable");
   				 $("#tblmonthly").addClass("hidetable");
   				 $("#tblyearly").addClass("hidetable");
   			 }			 
   			 else if($(this).val()==1){ 
   				 $("#tbldetail").addClass("hidetable");
   				 $("#tbldaily").removeClass("hidetable");
   				 $("#tblweekly").addClass("hidetable");
   				 $("#tblmonthly").addClass("hidetable");
   				 $("#tblyearly").addClass("hidetable");
   				saleReport.getAllSalesDailyReport();
   			 }else if($(this).val()==2){ 
   				 $("#tbldetail").addClass("hidetable");
   				 $("#tbldaily").addClass("hidetable");
   				 $("#tblweekly").removeClass("hidetable");
   				 $("#tblmonthly").addClass("hidetable");
   				 $("#tblyearly").addClass("hidetable");
   			 }else if($(this).val()==3){
   				 $("#tbldaily").addClass("hidetable");
   				 $("#tbldetail").addClass("hidetable");
   				 $("#tblweekly").addClass("hidetable");
   				 $("#tblmonthly").removeClass("hidetable");
   				 $("#tblyearly").addClass("hidetable");
   				 //var start_date = moment().date(1).format('YYYY-MM-DD');
   				 //var end_date = moment().add('months', 1).date(0).format('YYYY-MM-DD');
   				 saleReport.getAllSalesMonthlyReport();
   			 }else if($(this).val()==4){
   				 $("#tbldaily").addClass("hidetable");
   				 $("#tbldetail").addClass("hidetable");
   				 $("#tblweekly").addClass("hidetable");
   				 $("#tblmonthly").addClass("hidetable");
   				 $("#tblyearly").removeClass("hidetable");
   			 }		 
   		 });
   		 
   		var saleReport = {};
   		
   		saleReport.getAllSalesDailyReport = function(){
   			var json = {
   				"start_date" : $("#REGS_DATE_S").val(),
   				"end_date"   : $("#REGS_DATE_E").val()
   			};
   			$.ajax({ 
			    url: "${pageContext.request.contextPath}/admin/rest/sales/daily", 
			    type: 'GET',  
			    data: json, 
			    beforeSend: function(xhr) {
                    xhr.setRequestHeader("Accept", "application/json");
                    xhr.setRequestHeader("Content-Type", "application/json");
                },
			    success: function(data) { 
			    	console.log(data);
			    },	
			    error:function(data,status,er) { 
			        console.log("error: "+data+" status: "+status+" er:"+er);
			    }
			});
   		};
   		 
   		saleReport.getAllSalesMonthlyReport = function(){
   			var json = {
   	   				"start_date" : $("#REGS_DATE_S").val(),
   	   				"end_date"   : $("#REGS_DATE_E").val()
   			};
   			$.ajax({ 
			    url: "${pageContext.request.contextPath}/admin/rest/sales/monthly", 
			    type: 'GET',  
			    data: json, 
			    beforeSend: function(xhr) {
                    xhr.setRequestHeader("Accept", "application/json");
                    xhr.setRequestHeader("Content-Type", "application/json");
                },
			    success: function(data) { 
			    	console.log(data);
			    	if(data.sales){
				    	$("tbody#MONTHLY_REPORT").html('');
				    	for(var i=0;i<data.sales.length;i++){
				    		formatMonthlySaleReport(data.sales[i]);
						}
						$("#SALE_MONTHLY_TEMPLATE").tmpl(data.sales).appendTo("tbody#MONTHLY_REPORT");
						$("#tblMonthlySaleReport #TOTAL_JAN_QTY").html(data.total_sales.total_jan_qty);
						$("#tblMonthlySaleReport #TOTAL_JAN_AMOUNT").html(data.total_sales.total_jan_amount);
						$("#tblMonthlySaleReport #TOTAL_FEB_QTY").html(data.total_sales.total_feb_qty);
						$("#tblMonthlySaleReport #TOTAL_FEB_AMOUNT").html(data.total_sales.total_feb_amount);
						$("#tblMonthlySaleReport #TOTAL_MAR_QTY").html(data.total_sales.total_mar_qty);
						$("#tblMonthlySaleReport #TOTAL_MAR_AMOUNT").html(data.total_sales.total_mar_amount);
						$("#tblMonthlySaleReport #TOTAL_APR_QTY").html(data.total_sales.total_apr_qty);
						$("#tblMonthlySaleReport #TOTAL_APR_AMOUNT").html(data.total_sales.total_apr_amount);
						$("#tblMonthlySaleReport #TOTAL_MAY_QTY").html(data.total_sales.total_may_qty);
						$("#tblMonthlySaleReport #TOTAL_MAY_AMOUNT").html(data.total_sales.total_may_amount);
						$("#tblMonthlySaleReport #TOTAL_JUN_QTY").html(data.total_sales.total_jun_qty);
						$("#tblMonthlySaleReport #TOTAL_JUN_AMOUNT").html(data.total_sales.total_jun_amount);
						$("#tblMonthlySaleReport #TOTAL_JUL_QTY").html(data.total_sales.total_jul_qty);
						$("#tblMonthlySaleReport #TOTAL_JUL_AMOUNT").html(data.total_sales.total_jul_amount);
						$("#tblMonthlySaleReport #TOTAL_AUG_QTY").html(data.total_sales.total_aug_qty);
						$("#tblMonthlySaleReport #TOTAL_AUG_AMOUNT").html(data.total_sales.total_aug_amount);
						$("#tblMonthlySaleReport #TOTAL_SEP_QTY").html(data.total_sales.total_sep_qty);
						$("#tblMonthlySaleReport #TOTAL_SEP_AMOUNT").html(data.total_sales.total_sep_amount);
						$("#tblMonthlySaleReport #TOTAL_OCT_QTY").html(data.total_sales.total_oct_qty);
						$("#tblMonthlySaleReport #TOTAL_OCT_AMOUNT").html(data.total_sales.total_oct_amount);
						$("#tblMonthlySaleReport #TOTAL_NOV_QTY").html(data.total_sales.total_nov_qty);
						$("#tblMonthlySaleReport #TOTAL_NOV_AMOUNT").html(data.total_sales.total_nov_amount);
						$("#tblMonthlySaleReport #TOTAL_DEC_QTY").html(data.total_sales.total_dec_qty);
						$("#tblMonthlySaleReport #TOTAL_DEC_AMOUNT").html(data.total_sales.total_dec_amount);
						$("#tblMonthlySaleReport #TOTAL_QTY").html(data.total_sales.total_jun_qty +
																   data.total_sales.total_feb_qty + 
																   data.total_sales.total_mar_qty +
																   data.total_sales.total_apr_qty +
																   data.total_sales.total_may_qty +
																   data.total_sales.total_jun_qty +
																   data.total_sales.total_jul_qty +
																   data.total_sales.total_aug_qty +
																   data.total_sales.total_sep_qty +
																   data.total_sales.total_oct_qty +
																   data.total_sales.total_nov_qty +
																   data.total_sales.total_dec_qty );
						$("#tblMonthlySaleReport #TOTAL_AMOUNT").html(data.total_sales.total_jun_amount +
																   data.total_sales.total_feb_amount + 
																   data.total_sales.total_mar_amount +
																   data.total_sales.total_apr_amount +
																   data.total_sales.total_may_amount +
																   data.total_sales.total_jun_amount  +
																   data.total_sales.total_jul_amount +
																   data.total_sales.total_aug_amount +
																   data.total_sales.total_sep_amount +
																   data.total_sales.total_oct_amount +
																   data.total_sales.total_nov_amount +
																   data.total_sales.total_dec_amount );
			    	}
			    },	
			    error:function(data,status,er) { 
			        console.log("error: "+data+" status: "+status+" er:"+er);
			    }
			});
   		}
   		
   		function formatMonthlySaleReport(value){
   			console.log(value);
	    	value["total_amount"] = value["jan_amount"] + 
	    							value["feb_amount"] + 
	    							value["mar_amount"] +
	    							value["apr_amount"] +
	    							value["may_amount"] +
	    							value["jun_amount"] +
	    							value["jul_amount"] +
	    							value["aug_amount"] +
	    							value["sep_amount"] +
	    							value["oct_amount"] +
	    							value["nov_amount"] +
	    							value["dec_amount"] ;
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
	    	
	    }
   		
   		function settableheader(){
   			var monthOfyear = ['January', 'February', 'Match', 'April', 'May', 'June', 'July','Augest','Septemper', 'October', 'November', 'December'];
   			var mm = moment().isoWeekday(1);
   			mm = moment().weekday(6);
   			console.log(mm.weekday(1).get('date'));
   			$("#saleMonth").html(monthOfyear[mm.get('month')] +" "+ mm.weekday(1).get('date') +", "+ mm.get('year'));
   			var dd = moment(mm.weekday(1).get('date')).isoWeekday(1);
   			var dayID ="";
   				for (var i=1; i <8; i++) {
   					dayID = "#day" + i;
   					$(dayID).html(mm.weekday(i).get('date'));				
   				};  
   			}
       	$(document).on(" click","table tbody tr td #saleId", function(){
           	var id =  $(this).parent().parent().children().eq(1).html()
           	$("#sellDetail").bPopup();
             	$.ajax({ 
     				    url: "${pageContext.request.contextPath}/admin/sell/"+id, 
     				    type: 'POST', 
     				    dataType: 'JSON', 
     				    beforeSend: function(xhr) {
     	                    xhr.setRequestHeader("Accept", "application/json");
     	                    xhr.setRequestHeader("Content-Type", "application/json");
     	                },
     	                
     				    success: function(data) { 
     				        console.log(data.length);
     				        var str = "";
     				        for(i = 0; i < data.length; i++){
     				        	str += "<tr>"
								str += "<td>" + data[i].productName + "</td>"
								str += "<td>" + data[i].SalePrice + "</td>"
								str += "<td>" + data[i].ProQty + "</td>"
								str += "<td>" + data[i].ProUnitPrrice + "</td>"	
								str += "<td>" + data[i].orderDate + "</td>"	
								str += "<td>" + data[i].ProComment + "</td>"	
								str += "</tr>"
								$("#orderProdetail").html(str);
     				        }
     				    },
     				    error:function(data,status,er) { 
     				        console.log("error: "+data+" status: "+status+" er:"+er);
     				    }
     				});
              });
           });
    </script>
	<script type="text/javascript">
	  	$(function(){
	  		setCalendar();
	  		searchByDate();
	  		
		    getAllSales(1, 15, true);
		    
		    function getAllSales(pNum, pSize, check){
		    	var json = {
			  			"page" :pNum,
			  			"limit" : pSize,
		  		};
		    	$.ajax({ 
				    url: "${pageContext.request.contextPath}/admin/rest/sales", 
				    type: 'GET',  
				    data: json, 
				    beforeSend: function(xhr) {
	                    xhr.setRequestHeader("Accept", "application/json");
	                    xhr.setRequestHeader("Content-Type", "application/json");
	                },
				    success: function(data) { 
				    	console.log(data);
						if(data.SALES.length>0){
							$("tbody#CONTENTS").html('');
							for(var i=0;i<data.SALES.length;i++){
								format(data.SALES[i]);
							}
							$("#CONTENT_TEMPLATE").tmpl(data.SALES).appendTo("tbody#CONTENTS");
						}else{
							$("tbody#CONTENTS").html('<tr>NO CONTENTS</tr>');
						}
				    	if(check){
				    		pagination(data.PAGINATION.totalPages,1);
				    		check=false;
				    	}
				    },	
				    error:function(data,status,er) { 
				        console.log("error: "+data+" status: "+status+" er:"+er);
				    }
				});
		    }
		    
		    function format(value){
		    	value["SALE_DATE"] = moment(value["SALE_DATE"]).format("DD-MMMM-YYYY H:mm:ss");
		    }
			
		    function pagination(tPage, currentPage){
		    	$('#PAGINATION').bootpag({
			        total: tPage,
			        page: currentPage,
			        maxVisible: 10,
			        leaps: true,
			        firstLastUse: true,
			        first: 'First',
			        last: 'Last',
			        wrapClass: 'pagination',
			        activeClass: 'active',
			        disabledClass: 'disabled',
			        nextClass: 'next',
			        prevClass: 'prev',
			        lastClass: 'last',
			        firstClass: 'first'
			    }).on("page", function(event, num){
			    	getAllSales(num,$("#PER_PAGE").val(),false);
			    }); 
		    }
		    
		    $("#PER_PAGE").change(function(){
		    	getAllSales(1,$(this).val(),true);
		    });
		    
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
	 						$("#REGS_DATE_E").datepicker("option", "minDate", selectedDate);
	 						searchByDate();
	 			      }
	 			});
		 		$("#REGS_DATE_E").datepicker({
		 		     defaultDate: getSundayOfCurrentWeek(new Date()),
	 			     setDate: new Date(),
	 			     changeMonth: true,
	 		      	 numberOfMonths: 1,
		 		     dateFormat: "yy-mm-dd",
		 		     onClose: function( selectedDate ) {
		 			    	  $("#REGS_DATE_S").datepicker("option", "maxDate", selectedDate);
    	 			    	  calculateDay($("#REGS_DATE_S").datepicker("getDate"),$("#REGS_DATE_E").datepicker("getDate"));
    	 			    	  searchByDate();
	 			      }
		 		});		
		 		$("#REGS_DATE_S").datepicker('setDate', getMondayOfCurrentWeek(new Date()));
		 		$("#REGS_DATE_E").datepicker('setDate', getSundayOfCurrentWeek(new Date()));
		 	}
		 	
		 	function searchByDate(){
		      	var startDate 		= $( "#REGS_DATE_S" ).val() + " 00:00:00";
				var endDate 		= $( "#REGS_DATE_E" ).val() + " 24:00:00"; 
				json = {
							"startdate"   		  : startDate,
							"enddate" 		  	  : endDate
				};
				console.log(JSON.stringify(json));
				getAllSales(1,$("#PER_PAGE").val(),true);
				return;
			 }
		 	
		 	function getMondayOfCurrentWeek(d)
		 	{
		 	    var day = d.getDay();
		 	    console.log(day);
		 	    return new Date(d.getFullYear(), d.getMonth(), d.getDate() + (day == 0?-6:1)-day );
		 	}
		 	function getSundayOfCurrentWeek(d)
		 	{
		 	    var day = d.getDay();
		 	    console.log(day);
		 	    return new Date(d.getFullYear(), d.getMonth(), d.getDate() + (day == 0?0:7)-day );
		 	}
	  	});
	  </script>
</body>
</html>
