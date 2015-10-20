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
				<div class="container">

					<!-- Page-Title -->
					<div class="row">
						<div class="col-sm-12">
							<h4 class="pull-left page-title">Sell List</h4>
						</div>
					</div>


					<div class="panel">

						<div class="panel-body">
							<div class="row">
								<div class="col-md-12 col-sm-12 col-xs-12">
									<table id="datatable"
										class="table table-striped table-bordered">
										<thead>
										<thead>
											<tr>
												<th>Sell ID</th>
												<!-- <th>Order ID</th> -->
												<th>Sell BY</th>
												<th style="text-align: right;">Total Amount</th>
												<th style="text-align: right;">Money In</th>
												<th style="text-align: center;">Date</th>
												<!-- <th style="text-align: center;">Action</th> -->
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${Sale}" var="sell">
												<tr>
													<td ><a href="javascipt:" id="saleId">${sell.saleId}</a></td>
													<td id="orderId" style="display:none;">${sell.order.orderId }</td>
													<td>${sell.user.email}</td>
													<td style="text-align: right;"><a>${sell.totalAmount }</a>	</td>
													<td style="text-align: right;"><a>${sell.moneyIn }</a>	</td>
													<td style="text-align: center;">${sell.saleDatetime}</td>
													<%-- <td class="actions" style="text-align: center;"><a
														class="on-default edit-row"
														href="${pageContext.request.contextPath}/admin/product/${product.productId}"><i
															class="fa fa-pencil"></i></a> <a
														class="on-default remove-row" href="javascript:;"
														id="btnRemove"><i class="fa fa-trash-o"></i></a></td> --%>
												</tr>
											</c:forEach>
										</tbody>
									</table>
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
                
                $("table tbody tr td #saleId").click(function(){
                
                	var id =  $(this).parent().parent().children().eq(1).html()
                	
                	$("#sellDetail").bPopup();
                	//alert("${pageContext.request.contextPath}/admin/sell/"+id); 
                	alert("${pageContext.request.contextPath}/admin/sell/"+id);
                	$.ajax({ 
       				    url: "${pageContext.request.contextPath}/admin/sell/"+id, 
       				    type: 'POST', 
       				    dataType: 'JSON', 
       					
       				    //data: JSON.stringify(json), 
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
                	
                })
                
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