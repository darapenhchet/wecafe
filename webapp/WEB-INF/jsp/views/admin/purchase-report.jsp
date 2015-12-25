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

												<strong>Purchase Information</strong> <small>start
													from</small> <small id="purchasemonth"></small>
											</h2>
										</div>
									</div>

									<hr>
									<div class="m-h-50 form-group hidden-print ">
										<div class="col-sm-9">
											<label class="col-sm-1 control-label">Date : </label> <input
												type="hidden" id="SEND_DT" data-id="SEND_DT" />
											<div id="sendFrdt" class="date-range col-sm-5">
												<input type="text" readonly="readonly" id="REGS_DATE_S"
													name="startdate" class="range-start"
													style="width: 100px; text-align: center;">&nbsp; <a
													href="#none" id="btnREGS_DATE_S"><img
													style="width: 20px; height: 20px;"
													src="${pageContext.request.contextPath}/resources/images/img/ico_calendar.png"></a>&nbsp;~&nbsp;
												<input type="text" readonly="readonly" id="REGS_DATE_E"
													name="stopdate" class="range-end"
													style="width: 100px; text-align: center;">&nbsp; <a
													href="#none" id="btnREGS_DATE_E"><img
													style="width: 20px; height: 20px;"
													src="${pageContext.request.contextPath}/resources/images/img/ico_calendar.png"></a>
											</div>
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
															<th rowspan="2">Customer</th>
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
													<tbody id="tbodydaily">
														<tr>
															<td>Malongo</td>
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
												<table id="detailtable" class="table table-responsive">
													<thead>
														<tr> 
															<th>Invoice No</th> 
															<th>Purchase Date</th>
															<th>Purchase By</th> 
															<th>Total Amount</th>
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
																<th rowspan="2">Customer</th>
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
														<tbody id="tbodyweekly">
															<tr>
																<td>Malongo</td>
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
													<table id="monthlytable" class="table table-responsive">
														<thead>
															<tr>
																<th rowspan="2">Customer</th>
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
														<tbody id="tbodymonthly">
															<tr>
																<td>Malongo</td>
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
															<tr id="monthlyfooter">
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
												<div id="tblyearly" class="hidetable">
													<table id="yearlytable" class="table table-responsive">
														<thead>
															<tr>
																<th rowspan="2">Customer</th>
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
														<tbody id="tbodyyearly">
															<tr>
																<td>Malongo</td>
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
										<div class="row">
											<div class="col-md-2">
												<select id="PER_PAGE" class="form-control">
													<option value="15">15</option>
													<option value="30">30</option>
													<option value="50">50</option>
													<option value="100">100</option>
												</select>
											</div>
											<div id="PAGINATION" class="pull-right"></div>
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
								<th>Produce Name</th>
								<th>Qty</th>
								<th>Unit Price</th>
								<th>Supplier Name</th>
							</tr>
						</thead>
						<tbody id="impProDetail"> 
						</tbody> 
					</table>
				</div> 
				<div class="modal-footer form-group form-horizontal" style="height: 80px;"> 
					<div align="right">
						<label  class="control-label col-lg-1">Total Amount : </label>
							<div class="col-lg-2">
									<input class="form-control" id="btotalamount"type="text">
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
		
<!-- ============================  tbodydetail  ================================== -->		
	<script id="CONTENT_DETAIL" type="text/x-jquery-tmpl">
    	<tr>  
			<td ><a herf="javascript:;" id="impid" class="ng-binding">{{= impId}}</a></td>
			<td style="text-align:right;">{{= impDate}} </td>
			<td style="text-align:right;">{{= username}} ​</td>
			<td style="text-align:right;">{{= totalAmount}} </td>
		</tr>
    </script>
 
 <!-- ============================  tbodydaily  ================================== -->		
	<script id="CONTENT_DAILY" type="text/x-jquery-tmpl">
    	<tr>
			<td>{{= productId}}</td>
			<td>{{= productName}}</td>
			<td style="text-align:right;">{{= quantity}}</td>
			<td style="text-align:right;">{{= unitPrice}} <span style="font-weight:bold;">Riel</span></td>
			<td style="text-align:right;">{{= costPrice}} <span style="font-weight:bold;">Riel</span>​</td>
			<td style="text-align:right;">{{= salePrice}} <span style="font-weight:bold;">Riel</span></td>
			<td>{{= category.catName}}</td>
			<td style="text-align:center;"><img style="text-align:center;" src="${pageContext.request.contextPath}/resources/images/products/{{= image}}" class="img-thumbnail" alt="" width="30px" height="30px"/></td>
			<td style="text-align:center;">
				<span>
					<a href="javascript:;" class="btn btn-success btn-sm waves-effect" type="button" id="btnStatus">{{= status}}</a>
				</span>
			</td>
			<td class="actions" style="text-align:center;">
				<a class="on-default edit-row" href="${pageContext.request.contextPath}/admin/product/{{= productId}}" id="btnUpdate" data-id="{{= productId}}"><i class="fa fa-pencil"></i></a>
				<a class="on-default remove-row" href="javascript:;" id="btnRemove" data-id="{{= productId}}"><i class="fa fa-trash-o"></i></a>
			</td>
		</tr>
    </script>
 
 <!-- ============================  tbodyweekly  ================================== -->		
	<script id="CONTENT_WEEKLY" type="text/x-jquery-tmpl">
    	<tr>
			<td>{{= productId}}</td>
			<td>{{= productName}}</td>
			<td style="text-align:right;">{{= quantity}}</td>
			<td style="text-align:right;">{{= unitPrice}} <span style="font-weight:bold;">Riel</span></td>
			<td style="text-align:right;">{{= costPrice}} <span style="font-weight:bold;">Riel</span>​</td>
			<td style="text-align:right;">{{= salePrice}} <span style="font-weight:bold;">Riel</span></td>
			<td>{{= category.catName}}</td>
			<td style="text-align:center;"><img style="text-align:center;" src="${pageContext.request.contextPath}/resources/images/products/{{= image}}" class="img-thumbnail" alt="" width="30px" height="30px"/></td>
			<td style="text-align:center;">
				<span>
					<a href="javascript:;" class="btn btn-success btn-sm waves-effect" type="button" id="btnStatus">{{= status}}</a>
				</span>
			</td>
			<td class="actions" style="text-align:center;">
				<a class="on-default edit-row" href="${pageContext.request.contextPath}/admin/product/{{= productId}}" id="btnUpdate" data-id="{{= productId}}"><i class="fa fa-pencil"></i></a>
				<a class="on-default remove-row" href="javascript:;" id="btnRemove" data-id="{{= productId}}"><i class="fa fa-trash-o"></i></a>
			</td>
		</tr>
    </script>
 
 <!-- ============================  tbodymonthly  ================================== -->		
	<script id="CONTENT_MONTHLY" type="text/x-jquery-tmpl">
    	<tr>
			<tr>
			<td>{{= customer}}</td>
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
     <!-- ============================  tbodyearly  ================================== -->		
	<script id="CONTENT_YEARLY" type="text/x-jquery-tmpl">
    	<tr>
			<td>{{= productId}}</td>
			<td>{{= productName}}</td>
			<td style="text-align:right;">{{= quantity}}</td>
			<td style="text-align:right;">{{= unitPrice}} <span style="font-weight:bold;">Riel</span></td>
			<td style="text-align:right;">{{= costPrice}} <span style="font-weight:bold;">Riel</span>​</td>
			<td style="text-align:right;">{{= salePrice}} <span style="font-weight:bold;">Riel</span></td>
			<td>{{= category.catName}}</td>
			<td style="text-align:center;"><img style="text-align:center;" src="${pageContext.request.contextPath}/resources/images/products/{{= image}}" class="img-thumbnail" alt="" width="30px" height="30px"/></td>
			<td style="text-align:center;">
				<span>
					<a href="javascript:;" class="btn btn-success btn-sm waves-effect" type="button" id="btnStatus">{{= status}}</a>
				</span>
			</td>
			<td class="actions" style="text-align:center;">
				<a class="on-default edit-row" href="${pageContext.request.contextPath}/admin/product/{{= productId}}" id="btnUpdate" data-id="{{= productId}}"><i class="fa fa-pencil"></i></a>
				<a class="on-default remove-row" href="javascript:;" id="btnRemove" data-id="{{= productId}}"><i class="fa fa-trash-o"></i></a>
			</td>
		</tr>
    </script>
 <!-- ============================================================== -->
 <script>
 var st = "";
 $(document).ready(function(){
	var products ={};
	var check = true;
	 setCalendar();
	 searchByDate();
	 settableheader();
	 
	 
	 listDaily();
	 listWeekly();
	  
	 listYearly();
	 
	 products.listDetail = function(currentPage){ 
		 $.ajax({ 
			    url: "${pageContext.request.contextPath}/api/admin/reports/purchasereportdetail/" , 
			    type: 'GET', 
			    data: {
			    		"currentPage" : currentPage,
			    		"perPage"     : $("#PER_PAGE").val(),
			    		"startDate"   : "03/12/2015",
			    		"endDate"     : "03/12/2015"
			    },
				    beforeSend: function(xhr) {
	               xhr.setRequestHeader("Accept", "application/json");
	               xhr.setRequestHeader("Content-Type", "application/json");
	           },
			    success: function(data) { 
			    	console.log(data);
					 if(data.reportdetail.length>0){
						$("tbody#tbodydetail").html('');
						for(var i=0;i<data.reportdetail.length;i++){
							data.reportdetail[i]["username"] = "";
							products.format(data.reportdetail[i]);
						}
						$("#CONTENT_DETAIL").tmpl(data.reportdetail).appendTo("tbody#tbodydetail");
					}else{
						$("tbody#tbodydetail").html('<tr>NO CONTENTS</tr>');
					}
			    	if(check){
			    		products.setPagination(data.pagination.totalPages,1);
			    		check=false;
			    	}  
			    },
			    error:function(data,status,er) { 
			        console.log("error: ",data," status: ",status," er:",er);
			    }
			}); 
	 }
	 products.listMonthly = function(){
		 var json = {
	   				"start_date" : $("#REGS_DATE_S").val(),
	   				"end_date"   : $("#REGS_DATE_E").val()
			};$.ajax({ 
			    url: "${pageContext.request.contextPath}/api/admin/reports/purchasereportmonthly/", 
			    type: 'GET',  
			    data: json, 
			    beforeSend: function(xhr) {
                    xhr.setRequestHeader("Accept", "application/json");
                    xhr.setRequestHeader("Content-Type", "application/json");
                },
			    success: function(data) { 
			    	console.log(data);
			    	  if(data.reportmonth){
				    	$("tbody#tbodymonthly").html('');
				    	for(var i=0;i<data.reportmonth.length;i++){
				    		formatMonthlySaleReport(data.reportmonth[i]);
						}
						$("#CONTENT_MONTHLY").tmpl(data.reportmonth).appendTo("tbody#tbodymonthly");/* 
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
																   data.total_sales.total_dec_amount ); */
			    	}  
			    },	
			    error:function(data,status,er) { 
			        console.log("error: "+data+" status: "+status+" er:"+er);
			    }
			}); 
	 }
	 products.format = function(value){
		 value["username"] = value["user"]["lastName"] + " " + value["user"]["firstName"];
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
	 products.setPagination = function(totalPage, currentPage){
	    	$('#PAGINATION').bootpag({
		        total: totalPage,
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
		    }).on("page", function(event, currentPage){
		    	check = false;
		    	products.findAllProducts(currentPage);
		    }); 
		};
	 products.listDetail(1);
	 
	 function listDaily(){
		 
	 }
	 
	 function listWeekly(){
		 
	 }
	 
	 function listMonthly(){
		 
	 }
	 
	 function listYearly(){
		 
	 }
	 
	 
	 $("#selectreport").change(function(){
		 if($(this).val()==0){
			 $("#tbldetail").removeClass("hidetable");
			 $("#tbldaily").addClass("hidetable"); 
			 $("#tblweekly").addClass("hidetable");
			 $("#tblmonthly").addClass("hidetable");
			 $("#tblyearly").addClass("hidetable");
			 setCalendar();
			 products.listDetail(1);
		 }			 
		 else if($(this).val()==1){ 
			 $("#tbldetail").addClass("hidetable");
			 $("#tbldaily").removeClass("hidetable");
			 $("#tblweekly").addClass("hidetable");
			 $("#tblmonthly").addClass("hidetable");
			 $("#tblyearly").addClass("hidetable");
			 setCalendar();
		 }else if($(this).val()==2){ 
			 $("#tbldetail").addClass("hidetable");
			 $("#tbldaily").addClass("hidetable");
			 $("#tblweekly").removeClass("hidetable");
			 $("#tblmonthly").addClass("hidetable");
			 $("#tblyearly").addClass("hidetable");
			 $("#REGS_DATE_S").datepicker('setDate', new Date(startdate));
			 $("#REGS_DATE_E").datepicker('setDate', new Date(stopdate));
			 
		 }else if($(this).val()==3){
			 $("#tbldaily").addClass("hidetable");
			 $("#tbldetail").addClass("hidetable");
			 $("#tblweekly").addClass("hidetable");
			 $("#tblmonthly").removeClass("hidetable");
			 $("#tblyearly").addClass("hidetable");		
			 var startdate = new Date().getFullYear() + '/01/01';
			 var stopdate = new Date().getFullYear() + '/12/31'; 
			 $("#REGS_DATE_S").datepicker('setDate', new Date(startdate));
			 $("#REGS_DATE_E").datepicker('setDate', new Date(stopdate));
			 products.listMonthly();
		 }else if($(this).val()==4){
			 $("#tbldaily").addClass("hidetable");
			 $("#tbldetail").addClass("hidetable");
			 $("#tblweekly").addClass("hidetable");
			 $("#tblmonthly").addClass("hidetable");
			 $("#tblyearly").removeClass("hidetable");
		 }		 
	 });
	 
	function settableheader(){
		var monthOfyear = ['January', 'February', 'Match', 'April', 'May', 'June', 'July','Augest','Septemper', 'October', 'November', 'December'];
		var mm = moment().isoWeekday(1);
		mm = moment().weekday(6);
		console.log(mm.weekday(0).get('date'));
		$("#purchasemonth").html(monthOfyear[mm.get('month')] +" "+ mm.weekday(1).get('date') +", "+ mm.get('year'));
	/* 	$("#purchasemonth").html(monthOfyear[mm.get('month')]);	*/
		var dd = moment(mm.weekday(0).get('date')).isoWeekday(1);
		var dayID ="";
			for (var i=1; i <8; i++) {
				dayID = "#day" + i;
				$(dayID).html(mm.weekday(i).get('date'));				
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
	 			    	   searchByDate();
	 			      }
	 		});		
	 		$("#REGS_DATE_S").datepicker('setDate', moment ().format('YYYY-MM-DD'));
	 		//$("#REGS_DATE_E").datepicker('setDate', moment().add(30, 'days').format('YYYY-MM-DD'));
	 		$("#REGS_DATE_E").datepicker('setDate', moment().format('YYYY-MM-DD'));
	 }
	 $(document).on("click","#impid", function(){
		 
		   $.ajax({ 
			    url: "${pageContext.request.contextPath}/admin/getimportdetail/" + $(this).html() , 
			    type: 'POST', 
			    dataType: 'JSON', 
			    beforeSend: function(xhr) {
                  xhr.setRequestHeader("Accept", "application/json");
                  xhr.setRequestHeader("Content-Type", "application/json");
              },
			    success: function(data) { 
			    	console.log(data);
			    	var st= "";
			    	var amount = 0;
			       for(i=0; i<data.length; i++){
			    	   st += "<tr><td>" + (i + 1) + "</td>";
			    	   st += "<td>" + data[i].proname +"</td>";
			    	   st += "<td>" + data[i].proqty +"</td>";
			    	   st += "<td>" + data[i].prounitprice +"</td>";
			    	   st += "<td>" + data[i].supname +"</td></tr>"
			    	   amount += data[i].proqty * data[i].prounitprice;
			       }
			       $("#impProDetail").html(st);
			       $("#btotalamount").val(amount);
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