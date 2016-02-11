<%@page import="com.kosign.wecafe.forms.Cart"%>
<%@page import="com.kosign.wecafe.entities.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<style>
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 70%;
	margin: auto;
}

.panel-body:hover {
	cursor: pointer;
}

.panel-body img {
	width: 80px;
	height: 100px;
}

#addtocart {
	width: 80%;
}

.modal-content {
	border-radius: 0;
}

.hidebtn {
	display: none;
}
.borderRed {
	border-color: red;
}
</style>

</head>
<body>

	<div id="wrapper">


		<!-- Top Bar Start -->
		<%@ include file="topbar.jsp"%>
		<!-- Top Bar End -->
		<div>
			<button id="btnSendMessage">SEND MESSAGE</button>
			<input type="text" id="txtMessage" /> 
			<div style="width: 50%; float: left; margin-left: 3%;">
				<img
					src="${pageContext.request.contextPath}/resources/images/img/user.png"
					width="35px" height="35px"> <label class="control-label"
					id="cusname" style="color: blue; margin-right: 1%;">
					${user.username} </label>
				<button type="button" id="btnSignout" class="btn btn-warning">Sign
					Out</button>
			</div>
			<div align="right">

				<div style="float: right; margin-left: 10px;">
					<img
						src="${pageContext.request.contextPath}/resources/images/img/add_to_cart.jpg"
						width="55px" height="34px">
					<!-- <button type="button" id="btnCart" class="btn btn-primary">
						<span id="totalproduce" class="badge">0 </span> product
					</button> -->
				</div>
				<div>
					<img
						src="${pageContext.request.contextPath}/resources/images/img/order.png"
						width="55px" height="34px">
					<button type="button" class="btn btn-primary">
						<span class="badge">0 </span> Order
					</button>
				</div>
			</div>
		</div>

		<div id="myCarousel1" class="carousel slide">
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox" style="height: 888px;">
				<%
					List<Product> products = (List<Product>) request.getAttribute("products");
					int A = products.size();
					int i;
					boolean T = true;
					do {
						if (T) {
							T = false;
				%>
				<div class="item active" style="width: 70%; margin: 0 auto;">
					<%
						} else {
					%>
					<div class="item" style="width: 70%; margin: 0 auto;">
						<%
							}
						%>
						<div style="margin-top: 17%">
							<%
								for (i = A - 1; i >= A - 6 && i >= 0; i--) {
							%><div class="col-sm-6">
								<div class="panel panel-default form-group">
									<div class="panel-body">
										<div style="float: left;">
											<div id="idpro" style="display: none;"><%=products.get(i).getProductId()%></div>
											<div style="width: 300px;">
												<img id="imgpro"
													src="${pageContext.request.contextPath}/resources/images/products/<%=products.get(i).getImage()%>">
												<span id="Proname"> <%=products.get(i).getProductName()%></span>
											</div>

											<input type="text" class="form-control"
												value="<%=products.get(i).getProductId()%>" id="pro_id"
												style="display: none;"> <input type="text"
												class="form-control"
												value="<%=products.get(i).getProductName()%>" id="pro_nm"
												style="display: none;">
										</div>
										<div style="text-align: right;">
											<span id="PRICE"><%=products.get(i).getSalePrice()%></span><span>&nbsp;
												Riels</span>
											<div>
												<br> <a href="#"> <span id="btnminus"
													class="glyphicon glyphicon-minus"></span>
												</a>
												<%
													List<Cart> carts = (List<Cart>) request.getAttribute("carts");
															boolean exist = false;
															for (Cart cart : carts) {
																if (cart.getProductId().equals(products.get(i).getProductId())) {
																	exist = true;
												%>
												<input name="orderqty" id='txtqty' type="text"
													readonly="readonly" style="width: 10%; text-align: center;"
													value="<%=cart.getQuantity()%>">
													
												<%
													}
															}
															if (!exist) {
												%>
												<input id='txtqty' name="orderqty" type="text"
													readonly="readonly" style="width: 10%; text-align: center;"
													value="<%=0%>">
												<%
													}
												%>

												<a href="#"> <span id="btnplus" class="glyphicon glyphicon-plus"></span>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<%
								}
							%>
						</div>
					</div>

					<%
						if (A / 6 >= 1) {
								A = A - 6;
							} else
								A = 0;
						} while (A >= 1);
					%>
				</div>
				<!-- Left and right controls -->

		
				<a class="left carousel-control" href="#myCarousel1" role="button"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel1" role="button"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>




		<!-- ############################################################# -->
		<!-- Modal HTML -->
		<div id="myModal" style="display: none;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" aria-hidden="true">
							<span class="button b-close"><span>×</span></span>
						</button>
						<h4 class="modal-title" id="productNm">Coca Cola</h4>
					</div>
					<div class="modal-body form-horizontal" style="height: 290px;">
						<div class="col-sm-4">
							<img
								src="${pageContext.request.contextPath}/resources/images/products/drink.jpg"
								style="height: 250px;">
						</div>
						<div class="col-sm-8 container">
							<div class="form-group">
								<label class="control-label col-sm-3">Price :</label>
								<div class="col-sm-9">
									<label class="control-label col-sm-3" id="productprice">0.5$</label>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3" for="txtName">Qty
									:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" maxlength="30"
										name="txtName" id="qtytxt">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3" id="comment"
									for="txtcomment">Comment:</label>
								<div class="col-sm-9">
									<textarea id="procomment" cols="33" rows="4"
										style="resize: none;"></textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer" style="height: 80px; overflow: auto;">
						<button type="button" class="btn btn-default" id="btnUpdate">
							<span class="button b-close"><span>Update</span></span>
							<!-- 							<span style="display:none;" class='btnhidden' id='orderID'></span> -->
						</button>
						<button type="button" class="btn btn-primary" id="cancelbtn">
							<span class="button b-close"><span>Cancel</span></span>
						</button>
					</div>
				</div>
			</div>
		</div>


		<!-- ############################################################# -->

		<div id="addtocart" style="display: none;" style="width: 80%;">
			<div class="modal-content">
				<div class="modal-header">

					<button type="button" class="close" aria-hidden="true">
						<span class="button b-close"><span>×</span></span>
					</button>
					<h4 class="modal-title">Cart</h4>

				</div>
				<div class="modal-body" style="height: 290px;">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Produce Name</th>
								<th>Price</th>
								<th>Qty</th>
								<th>Total Amount</th>
								<th>Comment</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="orderdetail">

						</tbody>
					</table>

					<div class="form-horizontal">
						<div class="form-group">
							<label class="control-label col-sm-10" for="txtName">Total
								Amount :</label>
							<div class="col-sm-2">
								<input type="text" class="form-control" maxlength="30"
									readonly="readonly" name="txtName" id="totalamount"
									style="margin-bottom: 2px;">
							</div>
						</div>

					</div>
				</div>
				<div class="modal-footer" style="height: 80px;">
					<div align="right">
						<button type="button" id="btnbuymore" class="btn btn-default">
							<span class="button b-close"><span>Buy more</span></span>
						</button>
						<button type="button" id="btnconfirm"
							class="btn btn-default hidebtn">
							<span class="button b-close"><span>Confirm</span></span>
						</button>
						<button type="button" id="btnconfirmorder"
							class="btn btn-default hidebtn">
							<span class="button b-close"><span>Confirm</span></span>
						</button>
						<button type="button" id="btncancel"
							class="btn btn-default hidebtn">
							<span class="button b-close"><span>Cancel Order</span></span>
						</button>
						<button type="button" id="btncancelorder"
							class="btn btn-default hidebtn">
							<span class="button b-close"><span>Cancel Order</span></span>
						</button>
					</div>
				</div>
			</div>
		</div>
		
<!-- Modal -->
<div class="modal fade" id="form_request_stock" role="dialog " >
	<div class="modal-dialog modal-lg" style="width: 80%">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Form Request</h4>
			</div>
			<div class="modal-body">
				<div class=" form">					
						<form class="cmxform form-horizontal tasi-form" id="signupForm"
							method="get" action="#" novalidate="novalidate">
							<div class="form-group ui-widget">
								<label for="product_name" class="control-label col-lg-2">Product
									Name *</label>
								<div class="col-lg-10">
									<input class=" form-control" required="required"
										id="product_name" name="product_name" type="text"> 
										<input class="hidebtn" id="product_id">
								</div>
							</div>
							<div class="form-group ">
								<label for="quantity" class="control-label col-lg-2">Request Qty
									*</label>
								<div class="col-lg-10">
									<input class="form-control " required="required" id="product_qty"
										name="product_qty" type="text">
								</div>
							</div>
							<div class="form-group ">
								<label for="quantity" class="control-label col-lg-2">In Stock
									*</label>
								<div class="col-lg-10">
									<input class="form-control " required="required" id="remain_qty"
										name="remain_qty" type="text">
								</div>
							</div>

							<div class="form-group" align="right">

								<button class="btn btn-success waves-effect waves-light"
									style="width: 100px;" id="btn_add" type="button">Add</button>
								<button class="btn btn-default waves-effect waves-light"
									style="width: 100px; margin-right: 10px;" id="btn_cancel_add"
									type="button">Cancel</button>
							</div>
						</form>
						<!-- =================== -->
						<h5 class="pull-left page-title"># Product List</h5>
						<div class="row">
							<div class="col-md-12 col-sm-12 col-xs-12">
								<table id="datatable"
									class="table table-striped table-bordered dataTable">
									<thead>

									</thead>
									<thead>
										<tr>
											<th>#</th>
											<th>Product Name</th>
											<th style="text-align: center;">Request Qty</th>
											<th style="text-align: center;">In Stock</th>
											<th style="text-align: center;">Edit</th>
										</tr>
									</thead>
									<tbody id="tbllistimport">

									</tbody>
								</table>
							</div>
						</div>

						<!-- =================== -->
						<div class="form-group" align="right">
							<button class="btn btn-success waves-effect waves-light"
								style="width: 100px;" id="btn_save" type="button">Save</button>
							<button class="btn btn-default waves-effect"
								style="width: 100px; margin-right: 10px;" id="btn_cancel_save"
								type="button">Cancel</button>
						</div>

					</div>
					<!-- .form -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>



		<div id="form_request_stock1"
			style="display: none; width: 80%; height: auto;">
			<div class="modal-content">
				<div class="modal-header">

					<button type="button" class="close" aria-hidden="true">
						<span class="button b-close"><span>×</span></span>
					</button>
					<h4 class="modal-title">Form Request Products</h4>

				</div>
				<div class="modal-body" style="height: auto;">
					<div class=" form">					
						<form class="cmxform form-horizontal tasi-form" id="signupForm"
							method="get" action="#" novalidate="novalidate">
							<div class="form-group ui-widget">
								<label for="product_name" class="control-label col-lg-2">Product
									Name *</label>
								<div class="col-lg-10">
									<input class=" form-control" required="required"
										id="product_name" name="product_name" type="text"> 
										<input class="hidebtn" id="product_id">
								</div>
							</div>
							<div class="form-group ">
								<label for="quantity" class="control-label col-lg-2">Request Qty
									*</label>
								<div class="col-lg-10">
									<input class="form-control " required="required" id="product_qty"
										name="product_qty" type="text">
								</div>
							</div>
							<div class="form-group ">
								<label for="quantity" class="control-label col-lg-2">In Stock
									*</label>
								<div class="col-lg-10">
									<input class="form-control " required="required" id="remain_qty"
										name="remain_qty" type="text">
								</div>
							</div>

							<div class="form-group" align="right">

								<button class="btn btn-success waves-effect waves-light"
									style="width: 100px;" id="btn_add" type="button">Add</button>
								<button class="btn btn-default waves-effect waves-light"
									style="width: 100px; margin-right: 10px;" id="btn_cancel_add"
									type="button">Cancel</button>
							</div>
						</form>
						<!-- =================== -->
						<h5 class="pull-left page-title"># Product List</h5>
						<div class="row">
							<div class="col-md-12 col-sm-12 col-xs-12">
								<table id="datatable"
									class="table table-striped table-bordered dataTable">
									<thead>

									</thead>
									<thead>
										<tr>
											<th>#</th>
											<th>Product Name</th>
											<th style="text-align: center;">Request Qty</th>
											<th style="text-align: center;">In Stock</th>
											<th style="text-align: center;">Edit</th>
										</tr>
									</thead>
									<tbody id="tbllistimport">

									</tbody>
								</table>
							</div>
						</div>

						<!-- =================== -->
						<div class="form-group" align="right">
							<button class="btn btn-success waves-effect waves-light"
								style="width: 100px;" id="btn_save" type="button">Save</button>
							<button class="btn btn-default waves-effect"
								style="width: 100px; margin-right: 10px;" id="btn_cancel_save"
								type="button">Cancel</button>
						</div>

					</div>
					<!-- .form -->
				</div>

			</div>
		</div>


		<%@ include file="footer.jsp"%>

		<!-- ======================================================================================= -->
	</div>
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

	<!-- bpopup -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.bpopup.min.js"></script>
		

<!-- Request Stock -->
<script type="text/javascript">
	/* ==============================================
	Counter Up
	=============================================== */
	jQuery(document).ready(function($) {
						var _thisRow;
						
						//Check qty for input only number
						
						$("#product_qty,#remain_qty").keypress(function(e){
							checkOnlyNumber(e);
						});
						

						//Click button save cancel
						$("#btn_cancel_save").click(function() {
							if (confirm("Do you want to cancel?")) {
								$("#tbllistimport tr").remove();
								//$("#form_request_stock").bPopup().close();
							}
						});
						
						//Click cancel add to list
						$("#btn_cancel_add").click(function() {
							clear();
							$("#btn_update").html("Add");
							$("#btn_update").attr("id", "btn_add");
						});
						
						
						//Click request stock
						$("#btn_request_stock").click(function() {
							searchProduct();
							$('#form_request_stock').modal({
								"backdrop":"static"
							});
							//$("#form_request_stock").bPopup();

						});
						$("#btnSearch").click(function(e){
							e.preventDefault(); 
							
							/* if ($("#txtMessage").val() != "")
								url = "${pageContext.request.contextPath}/seller/searchbyname/" + $("#txtMessage").val();
							else
								url = "${pageContext.request.contextPath}/seller/searchbyname/"; */
							
							var url = "${pageContext.request.contextPath}/seller/searchbyname/" + $("#txtMessage").val()
															
							$.ajax({
								url :  url,
								type : 'POST',
								datatype : 'JSON', 
								beforeSend : function(xhr) {
									xhr.setRequestHeader("Accept", "application/json");
									xhr.setRequestHeader("Content-Type", "application/json");
								},
								success : function(data) {
									console.log(data);
									 $("#myCarousel1").html(''); 
									if(data.searchpro.length != 0){
										 var str = "", b = true, A = data.searchpro.length;
										 
									do{
										if (b){
											str += "<div class='carousel-inner' role='listbox' style='height: 888px;'>";
											str += "<div class='item active' style='width: 70%; margin: 0 auto;'>";
											b =false
										}else{
											str += "<div class='item' style='width: 70%; margin: 0 auto;'>";
										}
										 	str += "<div style='margin-top: 17%'>";
										 	
										// alert(	data[0].searchpro.productId);	
										/* var carts = [], count = 0;  */	 
									 	
										for (i = A - 1; i >= A - 6 && i >= 0; i--) {
											
										 	str += "<div class='col-sm-6'>";
										 	str += "<div class='panel panel-default form-group'>";
										 	str += "<div class='panel-body'>";
										 	str += "<div style='float: left;'>"
										 	str += "<div id='idpro' style='display: none;'>" + data.searchpro[i].productId + "</div>";
										 	str += "<div style='width: 300px;'> <img id='imgpro' src='${pageContext.request.contextPath}/resources/images/products/"+  data.searchpro[i].image + "'/>";
										 	str += "<span id='Proname'>" + data.searchpro[i].productName + "</span></div>";
										 	str += "<input type='text' class='form-control' value='" + data.searchpro[i].productId + "'";
										 	str += " id='pro_id' style='display: none;'>";
										 	str += "<input type='text' class='form-control' value='" +data.searchpro[i].productName + "'";
										 	str += " id='pro_nm' + style='display: none;'></div>";
										 	str += "<div style='text-align: right;'>";
										 	str += "<span id='PRICE'>"+ data.searchpro[i].salePrice + "</span><span>&nbsp; Riels</span>";
										 	str += "<div><br><a href='#'><span id='btnminus' class='glyphicon glyphicon-minus'> </span></a>"; 
										 	
											var exist = false;  
										 	for(j = 0; j < data.carts.length; j++) {
										 		
										 		if (data.carts[j].productId == data.searchpro[i].productId) {
										 			exist = true;
										 			str += "<input name='orderqty' id='txtqty' type='text' readonly='readonly' style='width: 10%; text-align: center;' value='" + data.carts[j].quantity + "'>";
										 		}
										 	}
										 	
										 	if (!exist) {
												str += " <input id='txtqty' name='orderqty' type='text' readonly='readonly' style='width: 10%; text-align: center;' value='0'>";													
											} 
											
											str += "<a href='#'> <span id='btnplus' class='glyphicon glyphicon-plus'></span></a>"
											str += "</div></div></div></div></div>";										
										}  
										str += "</div></div>";
										if (A / 6 >= 1) {
											A = A - 6;
										} else
											A = 0;
										} while (A >= 1);
										str += "</div>";
										str += "<a class='left carousel-control' href='#myCarousel1' role='button' data-slide='prev'>";
									 	str += "<span class='glyphicon glyphicon-chevron-left'></span>";
									 	str += "<span class='sr-only'>Previous</span></a>";
									 	str += "<a class='right carousel-control' href='#myCarousel1' role='button' data-slide='next'>";
									 	str += "<span class='glyphicon glyphicon-chevron-right'></span>";
									 	str += "<span class='sr-only'>Next</span></a></div>";
									 }
									 $("#myCarousel1").html(str);
								},
								error : function(data, status, er) {
									console.log("error: " + data + "status: " + status + "er: ");
								} 
							});
							 
						});
						$(document).on("blur", "#product_name ,#product_qty,#remain_qty",
								function() {
									if ($(this).val() == "") {
										$(this).addClass("borderRed");
										return;
									} else
										$(this).removeClass("borderRed");
						});
						
						$(document).on("click", "#btn_add", function() {
											if ($("#product_name").val() == "") {
												$("#product_name").addClass("borderRed");
												return;
											} else
												$("#product_name").removeClass("borderRed");
											if ($("#product_qty").val() == "") {
												$("#product_qty").addClass("borderRed");
												return;
											} else
												$("#product_qty").removeClass("borderRed");
											if ($("#remain_qty").val() == "") {
												$("#remain_qty").addClass("borderRed");
												return;
											} else
												$("#remain_qty").removeClass("borderRed");
											
											var isAdded=false;
											
											$('#tbllistimport tr').each(function() {
												var pro_name=$(this).find("td").eq(3).html()
													if($("#product_name").val()==pro_name){
														alert("Product is already added");
														isAdded=true ;
													}
											});
											
											if(isAdded==false){
											var st = "";
											st += "<tr><td style='display: none;'>"
													+ $('#product_id').val()
													+ "</td>";
											st += "<td style='display: none;'>"
													+ $('#supID').val()
													+ "</td>";
											st += "<td>"
													+ ($("#tbllistimport tr").length + 1)
													+ "</td>";
											st += "<td>"
													+ $("#product_name").val()
													+ "</td>";
											st += "<td>" + $("#product_qty").val()
													+ "</td>";
											st += "<td>" + $("#remain_qty").val()
													+ "</td>";
											st += "<td><a href= 'javascript:;' id='btn_edit'>Edit</a> | <a href='javascript:;' id='btn_delete'>Delete</a></td></tr>";
											$("#tbllistimport").append(st);
											clear();
											}
										});

						$('.counter').counterUp({
							delay : 100,
							time : 1200
						});

						$("#btn_save").click(function() {
											var requestDetail = [];
											if ($('#tbllistimport tr').length == 0) {
												alert("There is no data was added");
												return;
											}
							$('#tbllistimport tr').each(function() {
								json = { 
									"proId" : ($(this).find("td").eq(0).html()),
									"proQty" : ($(this).find("td").eq(4).html()),
									"remainQty" : ($(this).find("td").eq(5).html()) 
								};
								console.log(json);
								requestDetail.push(json);
							}); 
							$.ajax({
											url : "${pageContext.request.contextPath}/seller/request_product",
											type : 'POST',
											datatype : 'JSON',
											data : JSON.stringify(requestDetail),
											beforeSend : function(xhr) {
												xhr.setRequestHeader("Accept", "application/json");
												xhr.setRequestHeader("Content-Type", "application/json");
											},
											success : function(data) {
												alert("Successfully requested");
												$('#form_request_stock').modal('hide');
												clear();
												$("#tbllistimport tr").remove();
												//location.href = "${pageContext.request.contextPath}/admin/importlist";
											},
											error : function(data, status, er) {
												console.log("error: " + data + "status: " + status + "er: ");
											}
										});
									});

						function clear() {
							$("#product_name").val("");
							$("#product_name").removeClass("borderRed");
							$('#product_id').val("");
							$("#product_qty").val("");
							$("#product_qty").removeClass("borderRed");
							$("#remain_qty").val("");
							$("#remain_qty").removeClass("borderRed"); 
						} 
						function searchProduct() {
							$.ajax({	url : "${pageContext.request.contextPath}/seller/searchproduct",
										type : 'POST',
										dataType : 'JSON',
										beforeSend : function(xhr) {
											xhr.setRequestHeader("Accept", "application/json");
											xhr.setRequestHeader("Content-Type", "application/json");
										},
										success : function(data) {
											console.log(data);  
											var availableTags = [];
											for (i = 0; i < data.length; i++) {
												availableTags[i] = {
													"label" : data[i].productName,
													"dataid" : data[i].productId
												};
											}
										$("#product_name").autocomplete({select : function(event, ui) {
										$("#product_id").val(ui.item.dataid);},
											//maxShowItems : 8,
											source : availableTags
										});  $(".ui-autocomplete").css("position", "absolute");
										$(".ui-autocomplete").css("z-index", "2147483647");
										}, 
										error : function(data, status, er) {
											console.log("error: " + data + " status: " + status + " er:" + er);
										}
									}); 
						}
						
						//Edit list
						$(document).on("click", "#btn_edit", function() { 
									_thisRow = $(this).parents("tr"); 
									$("#product_name").val($(this).parents("tr").children().eq(3).html());
									$("#product_qty").val($(this).parents("tr").children().eq(4).html());	
									$("#remain_qty").val($(this).parents("tr").children().eq(5).html());	
									$("#btn_add").html("Update");
									$("#btn_add").attr("id", "btn_update");
								});
						$(document).on("click", "#btn_update", function() {
									_thisRow.children().eq(0).html(
											$("#product_id").val());
									
									_thisRow.children().eq(3).html(
											$("#product_name").val());
									_thisRow.children().eq(4).html(
											$("#product_qty").val());	
									_thisRow.children().eq(5).html(
											$("#remain_qty").val());	
									$("#btn_update").html("Add");
									$("#btn_update").attr("id", "btn_add");
									
									clear();
								});
						
						//Click delete from list
						$(document).on("click", "#btn_delete", function() {
							$(this).parents("tr").remove();
						});

					});
	
	
	function checkOnlyNumber(e){
		if ((e.keyCode == 8)
				|| (e.keyCode == 46)
				|| ((e.keyCode >= 37) && (e.keyCode <= 40)))
			return;

		var data = String
				.fromCharCode(e.which);
		var reg = new RegExp('^[0-9]+$');
		if (!reg.test(data)) {
			e.preventDefault();
		}
	}
	
</script> 
<script type="text/javascript">
	var _orderid = 0;
	var _productid = 0;
	var _qty = 0;
	var _thisRow;
	$(document).ready(function() {
						getsizeSession();
						getordered();
						$(document)
								.on(
										'keypress',
										'#qtytxt',
										function(e) {
											if ((e.keyCode == 8)
													|| (e.keyCode == 46)
													|| ((e.keyCode >= 37) && (e.keyCode <= 40)))
												return;
											var data = String
													.fromCharCode(e.which);
											var reg = new RegExp('^[0-9]+$');
											if (!reg.test(data)) {
												e.preventDefault();
											}
										});
						$("#btnlistorder").click(function() {
							getordered();
						});
						$('#btncancelorder, #btnconfirmorder')
								.click(
										function() {
											if ($(this).attr('id') == 'btncancelorder')
												var updatestatus = 'cancelOrder/';
											else
												var updatestatus = 'confirmOrder/';
											$.ajax({
														url : "${pageContext.request.contextPath}/seller/"
																+ updatestatus
																+ _orderid,
														type : 'GET',
														dataType : 'JSON',
														beforeSend : function(
																xhr) {
															xhr
																	.setRequestHeader(
																			"Accept",
																			"application/json");
															xhr
																	.setRequestHeader(
																			"Content-Type",
																			"application/json");
														},
														success : function(data) {

														},
														error : function(data,
																status, er) {
															console
																	.log("error: "
																			+ data
																			+ " status: "
																			+ status
																			+ " er:"
																			+ er);
														}
													});

											$("#totalorder")
													.html(
															$("#totalorder")
																	.html() - 1);
										});

						$('#btncancel').click(function() {
							clearallsession();

							$('input[name="orderqty"]').val('0');

						});

						$(document)
								.on(
										'click',
										'#cusordered',
										function() {
											_this = $(this);
											_orderid = (_this
													.find("#orderedId").html());
											$("#btnconfirmorder").removeClass(
													"hidebtn");
											$("#btncancelorder").removeClass(
													"hidebtn");
											$("#btncancel").addClass("hidebtn");
											$("#btnconfirm")
													.addClass("hidebtn");
											$
													.ajax({
														url : "${pageContext.request.contextPath}/seller/getOrderedDetail/"
																+ _this
																		.find(
																				"#orderedId")
																		.html(),
														type : 'GET',
														dataType : 'JSON',
														beforeSend : function(
																xhr) {
															xhr
																	.setRequestHeader(
																			"Accept",
																			"application/json");
															xhr
																	.setRequestHeader(
																			"Content-Type",
																			"application/json");
														},
														success : function(data) {
															var st = ""; // var amount = 0;
															console.log(data);
															for (i = 0; i < data.length; i++) {
																st += "<tr><td style='display: none;'>"
																		+ data[i][2].productId
																		+ "</td>"
																st += "<td>"
																		+ data[i][2].productName
																		+ "</td>";
																st += "<td>"
																		+ data[i][0].proUnitPrice
																		+ "</td>";
																st += "<td>"
																		+ data[i][0].proQty
																		+ "</td>";
																st += "<td>"
																		+ (data[i][0].proUnitPrice * data[i][0].proQty)
																		+ "</td>";
																st += "<td>"
																		+ data[i][0].proComment
																		+ "</td>";
																st += "<td><a href= 'javascript:;' id='btnedit'>Edit</a> <a href='javascript:;' id='btndelete'>Delete</a></td></tr>";
																//amount += data[i][1].orderAmount;
															}
															$("#totalamount")
																	.val(
																			data[0][1].orderAmount);
															$("#orderdetail")
																	.html(st);
															$("#orderID")
																	.html(
																			data[0][1].orderId);
															$("#addtocart")
																	.bPopup();
														},
														error : function(data,
																status, er) {
															console
																	.log("error: "
																			+ data
																			+ " status: "
																			+ status
																			+ " er:"
																			+ er);
														}
													});
										});

						function listproductorder() {
							var st = "";
							var amount = 0;
							$
									.ajax({
										url : "${pageContext.request.contextPath}/seller/listtocart",
										type : 'POST',
										dataType : 'JSON',
										beforeSend : function(xhr) {
											xhr.setRequestHeader("Accept",
													"application/json");
											xhr.setRequestHeader(
													"Content-Type",
													"application/json");
										},
										success : function(data) {
											console.log(data);
											for (i = 0; i < data.length; i++) {
												st += "<tr><td id='pro_id' style='display: none;'>"
														+ data[i].productId
														+ "</td>"
												st += "<td>"
														+ data[i].productName
														+ "</td>";
												st += "<td>" + data[i].price
														+ "</td>";
												st += "<td>" + data[i].quantity
														+ "</td>";
												st += "<td>"
														+ data[i].totalAmount
														+ "</td>";
												st += "<td><a href= 'javascript:;' id='btnedit'>Edit</a> <a href='javascript:;' id='btndelete'>Delete</a></td></tr>";
												amount += data[i].totalAmount;
											}
											$("#totalamount").val(amount);
											$("#orderdetail").html(st);
										},
										error : function(data, stutus, er) {
											console.log("error:  " + data
													+ " status: " + status
													+ " er:" + er)
										}
									});
						}

						$("#bt_add, #btnCart").click(function() {
							$("#btncancel").removeClass("hidebtn");
							$("#btncancelorder").addClass("hidebtn");
							$("#btnconfirmorder").addClass("hidebtn");
							$("#btnconfirm").removeClass("hidebtn");
							listproductorder();
							$("#addtocart").bPopup();

						});

						$(document).on('click',"#btndelete, #btnminus, #btnedit,#cancelbtn",function() { 
											_thisRow = $(this).parents("tr");
											var st = "";
											var _url = "";
											var amount = 0;
											_this = $(this);

											if (_this.html() == "Delete") { 
												var proId = $(this).parent().parent().children().eq(0).html(); 
												var txt;
												var msg = confirm("Do you want to remove " + $(this).parent().parent().children().eq(1).html() + " from your cart?");
												if (msg == true) {
													$.ajax({
																url : "${pageContext.request.contextPath}/seller/removefromcart/"+proId, /* deletedOrderProduct/" + _orderid + "/" + proId, */
																type : 'POST',
																dataType : 'JSON',
																beforeSend : function(xhr) {
																	xhr.setRequestHeader("Accept", "application/json");
																	xhr.setRequestHeader("Content-Type", "application/json");
																},
																success : function(data) {
																	console.log(data);
																	$("#totalamount").val($("#totalamount").val() - (_this.parent().parent().children().eq(4).html()));
																	_this.parents("tr").remove();
																},
																error : function(data, status, er) {
																	console.log("error: " + data + " status: " + status + " er:" + er);
																}
															});
													txt = "Successful";
													
												} else {
													// 												        txt = "You pressed Cancel!";
												}
												//document.getElementById("demo").innerHTML = txt;

											} else if (_this.html() == "Edit") {
												_productid = $(this).parent()
														.parent().children()
														.eq(0).html();
												var proId = $(this).parent()
														.parent().children()
														.eq(0).html();
												$("#productNm").html(
														$(this).parent()
																.parent()
																.children().eq(
																		1)
																.html());
												$("#productprice").html(
														$(this).parent()
																.parent()
																.children().eq(
																		2)
																.html());
												$("#qtytxt").val(
														$(this).parent()
																.parent()
																.children().eq(
																		3)
																.html());
												$("#procomment").val(
														$(this).parent()
																.parent()
																.children().eq(
																		5)
																.html());
												$("#myModal").bPopup();
											} else if (_this.html() == "Cancel") {

											} else{
												_this = $(this);
												 var proId =  _this.parents(".panel-body").find("#idpro").html(); 
												 $.ajax({
														url : "${pageContext.request.contextPath}/seller/removetocart/"+proId, /* deletedOrderProduct/" + _orderid + "/" + proId, */
														type : 'POST',
														dataType : 'JSON',
														beforeSend : function(xhr) {
															xhr.setRequestHeader("Accept", "application/json");
															xhr.setRequestHeader("Content-Type", "application/json");
														},
														success : function(data) {
															console.log(data); 
															if(_this.parent().siblings("#txtqty").val() != 0){
																if(_this.parent().siblings("#txtqty").val(_this.parent().siblings("#txtqty").val()-1) == 0);
																{
																	getsizeSession();
																}
															}
 													},
														error : function(data, status, er) {
															console.log("error: " + data + " status: " + status + " er:" + er);
														}
													}); 
													
											}
										});

						$("#btnUpdate").click(function() {
											_qty = $("#qtytxt").val();
											$.ajax({
														url : "${pageContext.request.contextPath}/seller/updateOrderProduct/"
																+ _orderid
																+ "/"
																+ _productid
																+ "/" + _qty,
														type : 'GET',
														dataType : 'JSON',
														beforeSend : function(
																xhr) {
															xhr
																	.setRequestHeader(
																			"Accept",
																			"application/json");
															xhr
																	.setRequestHeader(
																			"Content-Type",
																			"application/json");
														},
														success : function(data) {
															var subtotal = $(
																	"#qtytxt")
																	.val()
																	* _thisRow
																			.children()
																			.eq(
																					2)
																			.html();
															var totalamount = $(
																	"#totalamount")
																	.val()
																	- _thisRow
																			.children()
																			.eq(
																					4)
																			.html();

															_thisRow
																	.children()
																	.eq(3)
																	.html(
																			$(
																					"#qtytxt")
																					.val());
															_thisRow
																	.children()
																	.eq(4)
																	.html(
																			subtotal);
															_thisRow
																	.children()
																	.eq(5)
																	.html(
																			$(
																					"#procomment")
																					.html());
															$("#totalamount")
																	.val(
																			subtotal
																					+ totalamount);
														},
														error : function(data,
																status, er) {
															console
																	.log("error: "
																			+ data
																			+ " status: "
																			+ status
																			+ " er:"
																			+ er);
														}
													});
										});
						$(document).on('click','#btnplus',function() { 
											var proNm = $(this).parents(".panel-body").find("#pro_nm").val();
											var proId = $(this).parents(".panel-body").find("#pro_id").val();
											var price = $(this).parents(".panel-body").find("#PRICE").html();
											var price = $(this).parents(".panel-body").find("#PRICE").html();
											var proqty = 1;
											var _this = $(this);
											var totalAmount = proqty * price;
											console.log(totalAmount);
											json = {
												"productId" : proId,
												"productName" : proNm,
												"price" : price,
												"quantity" : proqty,
												"totalAmount" : totalAmount
											};
											$.ajax({
														url : "${pageContext.request.contextPath}/seller/addtocart",
														type : 'POST',
														datatype : 'JSON',
														data : JSON.stringify(json),
														beforeSend : function(xhr) {
															xhr.setRequestHeader("Accept", "application/json");
															xhr.setRequestHeader("Content-Type", "application/json");
														},
														success : function(data) { 
															getsizeSession();
															for (i = 0; i < data.length; i++) {
																if (data[i].productId == proId) {
																	_this.parents(".panel-body").find("#txtqty").val(data[i].quantity);
																	break;
																}
															}
														},
														error : function(data,status, er) {
															console.log("error: "+ data + "status: " + status + "er: ");
														}
													});
										});

						$("#btnconfirm").click(function() {
											$.ajax({
														url : "${pageContext.request.contextPath}/seller/insertcartsell",
														type : 'POST',
														datatype : 'JSON',
													//	data : JSON.stringify(json),
														beforeSend : function(
																xhr) {
															xhr
																	.setRequestHeader(
																			"Accept",
																			"application/json");
															xhr
																	.setRequestHeader(
																			"Content-Type",
																			"application/json");
														},
														success : function(data) {
															console.log(data);
															clearallsession();
															$(
																	'input[name="orderqty"]')
																	.val('0');
														},
														error : function(data,
																status, er) {
															console
																	.log("error: "
																			+ data
																			+ "status: "
																			+ status
																			+ "er: ");
														}
													});
										});

						function getsizeSession() {
							$.ajax({
										url : "${pageContext.request.contextPath}/order/listcart",
										type : 'POST',
										dataType : 'JSON',
										/* data: JSON.stringify(json), */
										beforeSend : function(xhr) {
											xhr.setRequestHeader("Accept",
													"application/json");
											xhr.setRequestHeader(
													"Content-Type",
													"application/json");
										},
										success : function(data) {
											$("#totalproduce").html(data.length);
										},
										error : function(data, status, er) {
											console.log("error: " + data
													+ " status: " + status
													+ " er:" + er);
										}
									});

						}

						function clearallsession() {
							$.ajax({
										url : "${pageContext.request.contextPath}/order/removeAllFromCart/",
										type : 'POST',
										dataType : 'JSON',
										beforeSend : function(xhr) {
											xhr.setRequestHeader("Accept",
													"application/json");
											xhr.setRequestHeader(
													"Content-Type",
													"application/json");
										},
										success : function(data) {
											console.log(data);
											getsizeSession();
										},
										error : function(data, status, er) {
											console.log("error: " + data
													+ " status: " + status
													+ " er:" + er);
										}
									});
							return;
						}

						function getordered() {
							$.ajax({
										url : "${pageContext.request.contextPath}/seller/getordered",
										type : 'POST',
										dataType : 'JSON',
										beforeSend : function(xhr) {
											xhr.setRequestHeader("Accept",
													"application/json");
											xhr.setRequestHeader(
													"Content-Type",
													"application/json");
										},
										success : function(data) {
											st = "";
											console.log(data);
											$("#totalorder").html(data.length);
											for (i = 0; i < data.length; i++) {
												st += "<a href='javascript:void(0);' id='cusordered' class='list-group-item'><div class='media'><div class='media-body clearfix'>- <span id='cusName'>"
														+ data[i].customer.username
														+ "</span> (<span id='cusorderqty'>"
														+ data[i].orderQuantity
														+ "</span>)</div></div>";
												st += "<div style='display: none;' id='orderedId'>"
														+ data[i].orderId
														+ "</div></a>";
											}
											$("#listorder").html(st);
										},
										error : function(data, status, er) {
											console.log("error: " + data
													+ " status: " + status
													+ " er:" + er);
										}
									});
							return;

						}

						var wsURI = "ws://"+ document.location.host	+ "${pageContext.request.contextPath}/notification";
						if (!("WebSocket" in window)) {
							console
									.log("WebSocket is not support on your browser...")
						} else {
							console
									.log("WebSocket is support on your browser...");
						}
						var connection = new WebSocket(wsURI);
						var sendedMessage = "";
						connection.binaryType = 'arraybuffer';

						connection.onopen = function(event) {
							onOpen(event);
						}

						connection.onerror = function(event) {
							onError(event);
						}

						connection.onmessage = function(event) {
							console.log("MESSAGE...")
							onMessage(event);
						}

						function onOpen(event) {
							console.log("CONNECTED...")
						}

						function onError(event) {
							console.log(event);
						}

						function onMessage(event) {
							console.log(event.data);
							if (sendedMessage == event.data) {
								return;
							}
							console.log(event.data);
							if (event.data == "SENT") {
								getsizeSession();
								getordered();
							}
						}
					});
</script>




<script
	src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.ui.autocomplete.scroll.min.js"></script>






</body>


</html>