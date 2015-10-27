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

<script
	src="${pageContext.request.contextPath}/resources/js/modernizr.min.js"></script>

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
				<div class="container" id= "Right-container">

					<!-- Page-Title -->
					<div class="row">
<!-- 						<div class="col-sm-12"> -->
<!-- 							<h4 class="pull-left page-title">Sell List</h4> -->
<!-- 						</div> -->
					</div>


					<div class="panel">

						<div class="panel-body">
							
							
							
							
							
							<div class="clearfix">
                                            <div class="pull-left">
                                                <h4 class="text-right"><%-- <img src="${pageContext.request.contextPath}/resources/images/logo_dark.png" alt="velonic"> --%>
                                                	<strong>KOSIGN WECAFE</strong>
                                                </h4>
                                                
                                            </div>
                                            <div class="pull-right">
                                                <h4>Invoice # <br>
                                                    <strong>2015-04-23654789</strong>
                                                </h4>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-12">
                                                
                                                <div class="pull-left m-t-30">
                                                    <address>
                                                      <strong>Twitter, Inc.</strong><br>
                                                      795 Folsom Ave, Suite 600<br>
                                                      San Francisco, CA 94107<br>
                                                      <abbr title="Phone">P:</abbr> (123) 456-7890
                                                      </address>
                                                </div>
                                                <div class="pull-right m-t-30">
                                                    <p><strong>Order Date: </strong> Jun 15, 2015</p>
                                                    <p class="m-t-10"><strong>Order Status: </strong> <span class="label label-pink">Pending</span></p>
                                                    <p class="m-t-10"><strong>Order ID: </strong> #123456</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="m-h-50"></div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="table-responsive">
                                                    <table class="table m-t-30">
                                                        <thead>
                                                            <tr><th>#</th>
                                                            <th>Item</th>
                                                            <th>Description</th>
                                                            <th>Quantity</th>
                                                            <th>Unit Cost</th>
                                                            <th>Total</th>
                                                        </tr></thead>http://localhost:8080/WeCafe/admin/sellreportList
                                                        <tbody>
                                                            <tr>
                                                                <td>1</td>
                                                                <td>LCD</td>
                                                                <td>Lorem ipsum dolor sit amet.</td>
                                                                <td>1</td>
                                                                <td>$380</td>
                                                                <td>$380</td>
                                                            </tr>
                                                            <tr>
                                                                <td>2</td>
                                                                <td>Mobile</td>
                                                                <td>Lorem ipsum dolor sit amet.</td>
                                                                <td>5</td>
                                                                <td>$50</td>
                                                                <td>$250</td>
                                                            </tr>
                                                            <tr>
                                                                <td>3</td>
                                                                <td>LED</td>
                                                                <td>Lorem ipsum dolor sit amet.</td>
                                                                <td>2</td>
                                                                <td>$500</td>
                                                                <td>$1000</td>
                                                            </tr>
                                                            <tr>
                                                                <td>4</td>
                                                                <td>LCD</td>
                                                                <td>Lorem ipsum dolor sit amet.</td>
                                                                <td>3</td>
                                                                <td>$300</td>
                                                                <td>$900</td>
                                                            </tr>
                                                            <tr>
                                                                <td>5</td>
                                                                <td>Mobile</td>
                                                                <td>Lorem ipsum dolor sit amet.</td>
                                                                <td>5</td>
                                                                <td>$80</td>
                                                                <td>$400</td>
                                                            </tr>
                                                            <tr>
                                                                <td>6</td>
                                                                <td>LCD</td>
                                                                <td>Lorem ipsum dolor sit amet.</td>
                                                                <td>1</td>
                                                                <td>$380</td>
                                                                <td>$380</td>
                                                            </tr>
                                                            <tr>
                                                                <td>7</td>
                                                                <td>Mobile</td>
                                                                <td>Lorem ipsum dolor sit amet.</td>
                                                                <td>5</td>
                                                                <td>$50</td>
                                                                <td>$250</td>
                                                            </tr>
                                                             <tr>
                                                                <td>8</td>
                                                                <td>LCD</td>
                                                                <td>Lorem ipsum dolor sit amet.</td>
                                                                <td>1</td>
                                                                <td>$380</td>
                                                                <td>$380</td>
                                                            </tr>
                                                            <tr>
                                                                <td>9</td>
                                                                <td>Mobile</td>
                                                                <td>Lorem ipsum dolor sit amet.</td>
                                                                <td>5</td>
                                                                <td>$50</td>
                                                                <td>$250</td>
                                                            </tr>
                                                            <tr>
                                                                <td>10</td>
                                                                <td>Mobile</td>
                                                                <td>Lorem ipsum dolor sit amet.</td>
                                                                <td>5</td>
                                                                <td>$50</td>
                                                                <td>$250</td>
                                                            </tr>
                                                             <tr>
                                                                <td>11</td>
                                                                <td>Mobile</td>
                                                                <td>Lorem ipsum dolor sit amet.</td>
                                                                <td>5</td>
                                                                <td>$50</td>
                                                                <td>$250</td>
                                                            </tr>
                                                             <tr>
                                                                <td>12</td>
                                                                <td>Mobile</td>
                                                                <td>Lorem ipsum dolor sit amet.</td>
                                                                <td>5</td>
                                                                <td>$50</td>
                                                                <td>$250</td>
                                                            </tr>
                                                             <tr>
                                                                <td>11</td>
                                                                <td>Mobile</td>
                                                                <td>Lorem ipsum dolor sit amet.</td>
                                                                <td>5</td>
                                                                <td>$50</td>
                                                                <td>$250</td>
                                                            </tr>
                                                             <tr>
                                                                <td>12</td>
                                                                <td>Mobile</td>
                                                                <td>Lorem ipsum dolor sit amet.</td>
                                                                <td>5</td>
                                                                <td>$50</td>
                                                                <td>$250</td>
                                                            </tr>
                                                             <tr>
                                                                <td>11</td>
                                                                <td>Mobile</td>
                                                                <td>Lorem ipsum dolor sit amet.</td>
                                                                <td>5</td>
                                                                <td>$50</td>
                                                                <td>$250</td>
                                                            </tr>
                                                             <tr>
                                                                <td>12</td>
                                                                <td>Mobile</td>
                                                                <td>Lorem ipsum dolor sit amet.</td>
                                                                <td>5</td>
                                                                <td>$50</td>
                                                                <td>$250</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="border-radius: 0px;">
                                            <div class="col-md-3 col-md-offset-9">
                                                <p class="text-right"><b>Sub-total:</b> 2930.00</p>
                                                <p class="text-right">Discount: 12.9%</p>
                                                <p class="text-right">VAT: 12.9%</p>
                                                <hr>
                                                <h3 class="text-right">USD 2930.00</h3>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="hidden-print">
                                            <div class="pull-right">
										<!--    <a href="javascrpt:" class="btn btn-inverse waves-effect waves-light" onclick="window.print();"><i class="fa fa-print"></i></a> -->
												<a href="javascrpt:" class="btn btn-inverse waves-effect waves-light" id="btnSubmit"><i class="fa fa-print"></i></a>	
                                                <a href="#" class="btn btn-primary waves-effect waves-light">Submit</a>
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
			<!-- content -->

			<%@ include file="footer.jsp"%>

		</div>
		<!-- ============================================================== -->
		<!-- End Right content here -->
		<!-- ============================================================== -->
		<!-- ############################################################# -->


		<div id="sellDetail" style="display: none;width: 90%;">
			<div class="modal-content">
				<div class="modal-header">

					<button type="button" class="close" aria-hidden="true">
						<span class="button b-close"><span>×</span></span>
					</button>
					<h4 class="modal-title">Cart</h4>

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

					<!-- <div class="form-horizontal">
						<div class="form-group">
							<label class="control-label col-sm-10" for="txtName">Total
								Amount :</label>
							<div class="col-sm-2">
								<input type="text" class="form-control" maxlength="30"
									name="txtName" id="totalamount" style="margin-bottom: 2px;">
							</div>
						</div>

					</div> -->
				</div>
				<!-- <div class="modal-footer" style="height: 80px;">
					<div align="right">
						<button type="button" id="btnbuymore" class="btn btn-default">
							<span class="button b-close"><span>Buy more</span></span>
						</button>
						<button type="button" id="btnconfirm" class="btn btn-default">
							<span class="button b-close"><span>Confirm</span></span>
						</button>
						<button type="button" id="btncancel" class="btn btn-default">
							<span class="button b-close"><span>Cancel Order</span></span>
						</button>
					</div>
				</div> -->
			</div>
		</div>

		<!-- ################################################################## -->

		<!-- Right Sidebar -->
		<div class="side-bar right-bar nicescroll">
			<h4 class="text-center">Chat</h4>
			<div class="contact-list nicescroll">
				<ul class="list-group contacts-list">
					<li class="list-group-item"><a href="#">
							<div class="avatar">
								<img
									src="${pageContext.request.contextPath}/resources/images/users/avatar-1.jpg"
									alt="">
							</div> <span class="name">Chadengle</span> <i
							class="fa fa-circle online"></i>
					</a> <span class="clearfix"></span></li>
					<li class="list-group-item"><a href="#">
							<div class="avatar">
								<img
									src="${pageContext.request.contextPath}/resources/images/users/avatar-2.jpg"
									alt="">
							</div> <span class="name">Tomaslau</span> <i
							class="fa fa-circle online"></i>
					</a> <span class="clearfix"></span></li>
					<li class="list-group-item"><a href="#">
							<div class="avatar">
								<img
									src="${pageContext.request.contextPath}/resources/images/users/avatar-3.jpg"
									alt="">
							</div> <span class="name">Stillnotdavid</span> <i
							class="fa fa-circle online"></i>
					</a> <span class="clearfix"></span></li>
					<li class="list-group-item"><a href="#">
							<div class="avatar">
								<img
									src="${pageContext.request.contextPath}/resources/images/users/avatar-4.jpg"
									alt="">
							</div> <span class="name">Kurafire</span> <i
							class="fa fa-circle online"></i>
					</a> <span class="clearfix"></span></li>
					<li class="list-group-item"><a href="#">
							<div class="avatar">
								<img
									src="${pageContext.request.contextPath}/resources/images/users/avatar-5.jpg"
									alt="">
							</div> <span class="name">Shahedk</span> <i class="fa fa-circle away"></i>
					</a> <span class="clearfix"></span></li>
					<li class="list-group-item"><a href="#">
							<div class="avatar">
								<img
									src="${pageContext.request.contextPath}/resources/images/users/avatar-6.jpg"
									alt="">
							</div> <span class="name">Adhamdannaway</span> <i
							class="fa fa-circle away"></i>
					</a> <span class="clearfix"></span></li>
					<li class="list-group-item"><a href="#">
							<div class="avatar">
								<img
									src="${pageContext.request.contextPath}/resources/images/users/avatar-7.jpg"
									alt="">
							</div> <span class="name">Ok</span> <i class="fa fa-circle away"></i>
					</a> <span class="clearfix"></span></li>
					<li class="list-group-item"><a href="#">
							<div class="avatar">
								<img
									src="${pageContext.request.contextPath}/resources/images/users/avatar-8.jpg"
									alt="">
							</div> <span class="name">Arashasghari</span> <i
							class="fa fa-circle offline"></i>
					</a> <span class="clearfix"></span></li>
					<li class="list-group-item"><a href="#">
							<div class="avatar">
								<img
									src="${pageContext.request.contextPath}/resources/images/users/avatar-9.jpg"
									alt="">
							</div> <span class="name">Joshaustin</span> <i
							class="fa fa-circle offline"></i>
					</a> <span class="clearfix"></span></li>
					<li class="list-group-item"><a href="#">
							<div class="avatar">
								<img
									src="${pageContext.request.contextPath}/resources/images/users/avatar-10.jpg"
									alt="">
							</div> <span class="name">Sortino</span> <i
							class="fa fa-circle offline"></i>
					</a> <span class="clearfix"></span></li>
				</ul>
			</div>
		</div>
		<!-- /Right-bar -->

	</div>
	<!-- END wrapper -->



	<script>
            var resizefunc = [];
        </script>

	<!-- jQuery  -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
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
		src="${pageContext.request.contextPath}/resources/assets/chat/moment-2.2.1.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-sparkline/jquery.sparkline.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-detectmobile/detect.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/fastclick/fastclick.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-slimscroll/jquery.slimscroll.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-blockui/jquery.blockUI.js"></script>

	<!-- sweet alerts -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/sweet-alert/sweet-alert.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/sweet-alert/sweet-alert.init.js"></script>

	<!-- flot Chart -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot-chart/jquery.flot.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot-chart/jquery.flot.time.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot-chart/jquery.flot.tooltip.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot-chart/jquery.flot.resize.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot-chart/jquery.flot.pie.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot-chart/jquery.flot.selection.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot-chart/jquery.flot.stack.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot-chart/jquery.flot.crosshair.js"></script>

	<!-- Counter-up -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/counterup/waypoints.min.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/counterup/jquery.counterup.min.js"
		type="text/javascript"></script>

	<!-- CUSTOM JS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.app.js"></script>

	<!-- Dashboard -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.dashboard.js"></script>

	<!-- Chat -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.chat.js"></script>

	<!-- Todo -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.todo.js"></script>

	<script type="text/javascript">
            /* ==============================================
            Counter Up
            =============================================== */
            jQuery(document).ready(function($) {
            	
            	 $('.counter').counterUp({
                     delay: 100,
                     time: 1200
                 });
            	
            	
            	$("#btnSubmit").click(function(){
            	 //   var newWindow = window.open();
            	    window.document.write($("#Right-container").html());
            	  //  newWindow.print();
            	    window.print();
            	        
            	    });
                
            });
            
            
        </script>

	<!-- Examples -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/magnific-popup/magnific-popup.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-datatables-editable/jquery.dataTables.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/datatables/dataTables.bootstrap.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-datatables-editable/datatables.editable.init.js"></script>
	  <script src="${pageContext.request.contextPath}/resources/js/jquery.bpopup.min.js"></script>
</body>
</html>