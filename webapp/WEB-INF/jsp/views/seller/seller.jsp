<%@page import="com.kosign.wecafe.entities.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Order Produce</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

 <script src="http://code.jquery.com/jquery-1.9.1.js"></script>	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.bpopup.min.js"></script>
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
</style>
</head>
<body>
	<div>
		<div style="width: 50%; float: left; margin-left: 3%;">
			<img
				src="${pageContext.request.contextPath}/resources/images/img/user.png"
				width="35px" height="35px"> <label class="control-label"
				style="color: blue; margin-right: 1%;"> Daravuth </label>
			<button type="button" id="btnCart" class="btn btn-warning">Sign
				Out</button>
		</div>
		<div style="text-align: right;">
			<img
				src="${pageContext.request.contextPath}/resources/images/img/add_to_cart.png"
				width="60px" height="35px">
			<button type="button" id="btnCart" class="btn btn-primary">Add
				to Cart</button>
		</div>
	</div>
 
			<div id="myCarousel1" class="carousel slide">
				<!-- Wrapper for slides -->
				<div class="carousel-inner container" role="listbox"
					style="height: 888px;">
					<%
					    		List<Product> products = (List<Product>)request.getAttribute("products");
					    		int A = products.size();
					    		int i;
					    		boolean T = true;
					    		do{
					    			if(T){ T = false;%>
					<div class="item active" style="width: 70%; margin: 0 auto;">
						<%} else  { %>
						<div class="item" style="width: 70%; margin: 0 auto;">
							<%}%>
							<div style="margin-top: 17%">
								<% 
							    		
							    		for(i = A-1; i>=A- 6 && i >=0; i--) 							    			
							    		{ %><div class="col-sm-6">
									<div class="panel panel-default form-group">
										<div class="panel-body">
											<div style="float: left;">
												<div id="idpro" style="display: none;"><%=products.get(i).getProductId()%></div>
												<img id="imgpro"
													src="${pageContext.request.contextPath}/resources/images/img/<%=products.get(i).getImage()%>">
												<span id="Proname"> <%=products.get(i).getProductName()%></span>
												<input type="text" class="form-control" maxlength="30" value="<%=products.get(i).getProductId()%>"  id="pro_id" style="display:none;">
												<input type="text" class="form-control" maxlength="30"  value="<%=products.get(i).getProductName()%>" id="pro_nm" style="display:none;">
											</div>
											<div style="text-align: right;">
												<span id="PRICE"><%=products.get(i).getSalePrice()%></span><span>&nbsp;
													Riels</span>
											</div>
										</div>
									</div>
								</div>
								<% }%>
							</div>
						</div>

						<%
								 if(A/6>=1)
								 {
									 A = A - 6; 
								 }
								 else 
									 A = 0; 
						    	 }while(A >=1 );  
						    	 %>
					</div>
					<!-- Left and right controls -->

					<%-- <c:forEach items="${products}" var="product">
								<div class="col-sm-6">
									<div class="panel panel-default form-group">
										<div class="panel-body">
											
											<div style="float: left;">
												<img id="img"
												
													src="${pageContext.request.contextPath}/resources/images/img/${product.image}">
													<input type="text" name="" value="${product.productName}" id="pro_nm" style="display: none;">
												<input type="text" name="" value="${product.productId}" id="pro_id" style="display: none;">
												${product.productName}
											</div>
											
											<div style="text-align: right;">0.5$</div>
										</div>
									</div>
								</div>
							</c:forEach> --%>
						<a class="left carousel-control" href="#myCarousel1" role="button"
							data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"></span>
							<span class="sr-only">Previous</span>
						</a>
						<a class="right carousel-control" href="#myCarousel1" role="button"
							data-slide="next"> <span class="glyphicon glyphicon-chevron-right"></span>
							<span class="sr-only">Next</span>
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
					<h4 class="modal-title">Coca Cola</h4>
				</div>
				<div class="modal-body form-horizontal" style="height: 290px;">
					<div class="col-sm-4">
						<img
							src="${pageContext.request.contextPath}/resources/images/img/drink.jpg"
							style="height: 250px;">
					</div>
					<div class="col-sm-8 container">
						<div class="form-group">
							<label class="control-label col-sm-3">Price :</label>
							<div class="col-sm-9">
								<label class="control-label col-sm-3">0.5$</label>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3" for="txtName">Qty :</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" maxlength="30"
									name="txtName" id="txtName">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3" for="txtName">Total
								:</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" maxlength="30"
									name="txtName" id="txtName">
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer" style="height: 80px;">
					<button type="button" class="btn btn-default">
						<span class="button b-close"><span>Add to cart</span></span>
					</button>
					<button type="button" class="btn btn-primary" id="bt_add">
						<span class="button b-close"><span>Buy</span></span>
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- ############################################################# -->


	<!-- <div id="addtocart" style="display: none;" style="width: 80%;">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">Cart</h4>
			</div>
			<div class="modal-body" style="height: 290px;">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Customer Name</th>
							<th>Produce Name</th>
							<th>Price</th>
							<th>Qty</th>
							<th>Total Amount</th>
							<th>Comment</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>PenhChet</td>
							<td>Milk</td>
							<td>1500</td>
							<td>1</td>
							<td>1500</td>
							<td>No ice</td>
							<td><a href="#">Edit</a> <a href="#">Delete</a></td>
						</tr>
						<tr>
							<td>Daravuth</td>
							<td>Coffee</td>
							<td>2000</td>
							<td>1</td>
							<td>2000</td>
							<td></td>
							<td><a href="#">Edit</a> <a href="#">Delete</a></td>
						</tr>
					</tbody>
				</table>

				<div class="form-horizontal">
					<div class="form-group">
						<label class="control-label col-sm-10" for="txtName">Total
							Amount :</label>
						<div class="col-sm-2">
							<input type="text" class="form-control" maxlength="30"
								name="txtName" id="txtName">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-10" for="txtName">Money
							In :</label>
						<div class="col-sm-2">
							<input type="text" class="form-control" maxlength="30"
								name="txtName" id="txtName">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-10" for="txtName">Money
							Out :</label>
						<div class="col-sm-2">
							<input type="text" class="form-control" maxlength="30"
								name="txtName" id="txtName">
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer" style="height: 80px;">
				<div align="right">
					<button type="button" class="btn btn-default">
						<span class="button b-close"><span>Confirm</span></span>
					</button>
					<button type="button" class="btn btn-default">
						<span class="button b-close"><span>Cancel</span></span>
					</button>
				</div>
			</div>
		</div>
	</div>
 -->






	<div id="addtocart" style="display: none;" style="width: 80%;">       
  	<div class="modal-content"> 
  	 <div class="modal-header">                     
                     
                    <button type="button" class="close" aria-hidden="true"><span class="button b-close"><span>×</span></span></button>
                    <h4 class="modal-title"  >Cart</h4>
                
                </div>
                <div class="modal-body" style="height: 290px;">
								  <table class="table table-hover">
								    <thead>
								      <tr> 
								        <th>Produce Name</th>
								        <th>Price</th>
								        <th>Qty</th>
								        <th>Total Amount</th>
								        <th></th>
								      </tr>
								    </thead>
								    <tbody id="orderdetail">
								      
								    </tbody>
								  </table>
						 
							<div class="form-horizontal">
								<div class="form-group">
								      	<label class="control-label col-sm-10" for="txtName">Total Amount :</label>
								      	<div class="col-sm-2">
								         	<input type="text" class="form-control" maxlength="30" name="txtName" id="totalamount" style="margin-bottom: 2px;"> 
								    	</div>
		    					</div>
		    				 						 
					   </div>
				</div>
				<div class="modal-footer" style="height: 80px;">
					<div align="right">
						<button type="button" id="btnbuymore" class="btn btn-default"><span class="button b-close"><span>Buy more</span></span></button>
						<button type="button" id="btnconfirm" class="btn btn-default"><span class="button b-close"><span>Confirm</span></span></button>
						<button type="button" id="btncancel" class="btn btn-default"><span class="button b-close"><span>Cancel Order</span></span></button>		
					</div>
				</div>
		</div>
	</div>






	<!-- ################################################################## -->
	<div style="width: 100%; height: 30px; background-color: #E0E0E0;"
		align="center">Copyright&#64; 2015 kosign</div>

</body>
<script type="text/javascript">
		$(document).ready(function(){
			$("#bt_add, #btnCart").click(function(){
				 var st=""; var amount=0;
				$("#addtocart").bPopup();
				$.ajax({
					url: "${pageContext.request.contextPath}/seller/listtocart",
					type: 'POST',
					dataType: 'JSON',
					beforeSend: function(xhr){
						xhr.setRequestHeader("Accept", "application/json");
						xhr.setRequestHeader("Content-Type", "application/json");
					},
					success: function(data){
						console.log(data.length);
						for(i=0; i<data.length; i++)
						{
						
							st += "<tr><td style='display: none;'>" + data[i].productId +"</td>"
				    	  	st += "<td>" + data[i].productName + "</td>";
				    	  	st += "<td>" + data[i].price + "</td>";
				    	  	st += "<td>" + data[i].quantity + "</td>";
				    	  	st += "<td>" + data[i].totalAmount + "</td>";
				    	  	st += "<td><a href= 'javascript:;' id='btnedit'>Edit</a> <a href='javascript:;' id='btndelete'>Delete</a></td></tr>";
				    	  	amount += data[i].totalAmount;
						}	
						 $("#totalamount").val(amount);
					     $("#orderdetail").html(st);
							
					},
					error:function(data,stutus,er){
						console.log("error:  "+data+" status: "+status+" er:" + er)
					}
					
				});
		
			});
			
			$(document).on('click',"#btndelete",function(){
				 var st=""; var amount=0;
				alert($(this).parent().parent().children().html());
				$.ajax({ 
				    url: "${pageContext.request.contextPath}/seller/removetocart/"+$(this).parent().parent().children().html(), 
				    type: 'POST', 
				    dataType: 'JSON', 
				    beforeSend: function(xhr) {
	                    xhr.setRequestHeader("Accept", "application/json");
	                    xhr.setRequestHeader("Content-Type", "application/json");
	                },
				    success: function(data) { 
						for(i=0; i<data.length; i++)
						{
							if(data[i].quantity >= 1){
								st += "<tr><td style='display: none;'>" + data[i].productId +"</td>"
					    	  	st += "<td>" + data[i].productName + "</td>";
					    	  	st += "<td>" + data[i].price + "</td>";
					    	  	st += "<td>" + data[i].quantity + "</td>";
					    	  	st += "<td>" + data[i].totalAmount + "</td>";
					    	  	st += "<td><a href= 'javascript:;' id='btnedit'>Edit</a> <a href='javascript:;' id='btndelete'>Delete</a></td></tr>";
					    	  	amount += data[i].totalAmount;
								
							}else{
								$(this).parents("tr").remove();
							}
						}	
						 $("#totalamount").val(amount);
					     $("#orderdetail").html(st);
						
				    },
				    error:function(data,status,er) { 
				        console.log("error: "+data+" status: "+status+" er:"+er);
				    }
				});
				
			});
			
			$(".panel-body").click(function() {
				//$("#myModal").bPopup();
// 	 			console.log($(this).parents(".panel-body").find("#pro_id").val());
	 			alert($(this).find("#pro_nm").val());
	 			var proNm 		= $(this).find("#pro_nm").val();
	 			var proId 		= $(this).find("#pro_id").val();
	 			var price 		= $(this).find("#PRICE").html();
	 			var price		= $(this).find("#PRICE").html();
	 			var proqty		= 1;
	 			var totalAmount = proqty * price ;
	 			console.log (totalAmount);
	 			json = {
	 						"productId"   : proId,
	 						"productName" : proNm,
	 						"price"		  : price,
	 						"quantity"	  : proqty,
	 						"totalAmount" : totalAmount
	 			};
	 			$.ajax({
	 				 url: "${pageContext.request.contextPath}/seller/addtocart", 
 				    type: 'POST',
	 				datatype: 'JSON',
	 				data: JSON.stringify(json), 
	 				beforeSend: function(xhr) {
	 		            xhr.setRequestHeader("Accept", "application/json");
	 		            xhr.setRequestHeader("Content-Type", "application/json");
	 		        },
	 				success: function(data){
	 					console.log(data);
	 				},
	 				error:function(data, status,er){
	 					console.log("error: " + data + "status: " + status + "er: ");
	 				}
	 			});
			});
			
			$("#btnconfirm").click(function(){
				$.ajax({
	 				 url: "${pageContext.request.contextPath}/seller/insertcartsell", 
				    type: 'POST',
	 				datatype: 'JSON',
	 				data: JSON.stringify(json), 
	 				beforeSend: function(xhr) {
	 		            xhr.setRequestHeader("Accept", "application/json");
	 		            xhr.setRequestHeader("Content-Type", "application/json");
	 		        },
	 				success: function(data){
	 					console.log(data);
	 				},
	 				error:function(data, status,er){
	 					console.log("error: " + data + "status: " + status + "er: ");
	 				}
	 			});
			});
			
			
		});
	</script>
</html>
