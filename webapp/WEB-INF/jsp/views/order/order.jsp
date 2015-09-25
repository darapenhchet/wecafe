<%@page import="com.kosign.wecafe.entities.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<html lang="en">
<head>
  <title>Order Produce</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.bpopup.min.js"></script>
  <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
  }
  .panel-body:hover{
  		cursor: pointer;
  }
  .panel-body img{
  	width: 80px;
  	height: 100px;
  }
  #addtocart{
  	width: 80%;
  }
  .modal-content{
  	border-radius: 0;
  }
  </style>
</head>
<body>  	 
	<div>
  		<div id="mySlideShow" class="carousel slide" data-ride="carousel">  	
		    <ol class="carousel-indicators">
		      <li data-target="#mySlideShow" data-slide-to="0" class="active"></li>
		      <li data-target="#mySlideShow" data-slide-to="1"></li>
		      <li data-target="#mySlideShow" data-slide-to="2"></li>
		      <li data-target="#mySlideShow" data-slide-to="3"></li>
		    </ol>
    <!-- Wrapper for slides -->
	    <div class="carousel-inner" role="listbox">
	      <div class="item active">
	        <img src="${pageContext.request.contextPath}/resources/images/img/slide4.png" alt="Chania" style="width: 100%; height: 955px;">
	      </div>
	      <div class="item">
	        <img src="${pageContext.request.contextPath}/resources/images/img/slide4.png" alt="Chania" style="width: 100%; height: 955px;">
	      </div>    
	      <div class="item">
	        <img src="${pageContext.request.contextPath}/resources/images/img/slide4.png" alt="Flower" style="width: 100%; height: 955px;">
	      </div>
	      <div class="item">
	        <img src="${pageContext.request.contextPath}/resources/images/img/slide4.png" alt="Flower" style="width: 100%; height: 955px;">
	      </div>
	    </div>
	    <!-- Left and right controls -->
	    <a class="left carousel-control" href="#mySlideShow" role="button" data-slide="prev">
	      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	      <span class="sr-only">Previous</span>
	    </a>
	    <a class="right carousel-control" href="#mySlideShow" role="button" data-slide="next">
	      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	      <span class="sr-only">Next</span>
	      
	    </a>
	  </div>
</div>		
			<div align="right">
				<img src="${pageContext.request.contextPath}/resources/images/img/add_to_cart.png" width="60px" height="40px">
				<button type="button" id="btnCart" class="btn btn-primary">Add to Cart</button>
			</div> 
			 
				  
					<div id="myCarousel1" class="carousel slide"> 
					    <!-- Wrapper for slides -->
					    <div class="carousel-inner container" role="listbox" style="height: 888px; overflow: hidden; ">
					    	 <% 
					    	 List<Product> products = (List<Product>)request.getAttribute("products");
					    	 	int  A =  products.size(); 
					    	 	int i;
					    	 	boolean T = true;
						    	 do{
						    		 
						    		 if(T){ T=false;%>						    	 
						    			<div class="item active" style="width : 70%; margin: 0 auto;">
						    		<%}else {%>
						    			<div class="item" style="width : 70%; margin: 0 auto;">
						    		<%}%>	
							    		<div style="margin-top: 17%">	 
							    		<% 
							    		
							    		for(i = A-1; i>=A- 6 && i >=0; i--) 							    			
							    		{ %>	
					    									    									    	 
												<div class="col-sm-6">
													<div class="panel panel-default form-group">
														<div class="panel-body">
															<div style="float: left;">
<div id="idpro" style="display: none;"><%=products.get(i).getProductId()%></div>	
<img id="imgpro" src="${pageContext.request.contextPath}/resources/images/img/<%=products.get(i).getImage()%>"> 
															<span id="Proname">	 <%=products.get(i).getProductName()%></span>
															</div>
															<div style="text-align: right;"><span id="PRICE"><%=products.get(i).getSalePrice()%></span><span>&nbsp; Riels</span></div>
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
					    <a class="left carousel-control" href="#myCarousel1" role="button" data-slide="prev">
					      <span class="glyphicon glyphicon-chevron-left"></span>
					      <span class="sr-only">Previous</span>
					    </a>
					    <a class="right carousel-control" href="#myCarousel1" role="button" data-slide="next">
					      <span class="glyphicon glyphicon-chevron-right"></span>
					      <span class="sr-only">Next</span>
					    </a>
					    </div> 
					</div>
 
 
<!-- ############################################################# -->
	<!-- Modal HTML -->
    <div id="myModal" style="display: none;" >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" aria-hidden="true"><span class="button b-close"><span>×</span></span></button>
                    <h4 class="modal-title" id="protitle"></h4>
                </div>
                <div class="modal-body form-horizontal" style="height: 290px;">
               
                    <div class="col-sm-4">
						  <img id="imgpath" src="${pageContext.request.contextPath}/resources/images/img/drink.jpg" style="width 200px; height: 250px; ">  			
					</div>
					<div class="col-sm-8 container">
						<div class="form-group">
						    <label class="control-label col-sm-3">Price :</label>
						      <div class="col-sm-9">
						        	<label class="control-label col-sm-3" id="MOD_PRICE">0.5$</label>
						      </div>
						       <div style="display: none;" id="proid"></div>
					    </div>   	
					    <div class="form-group">
					      	<label class="control-label col-sm-3" for="proqty">Qty :</label>
					      	<div class="col-sm-9">
					         <input type="text" class="form-control" maxlength="30" name="txtName" id="proqty"> 
					    	</div>
    					</div>	
    					<div class="form-group">
					      	<label class="control-label col-sm-3" for="txtName">Time :</label>
					      	<div class="col-sm-9">
					         <input type="text" class="form-control" maxlength="30" name="txtName" id="txtName"> 
					    	</div>
    					</div>
    					<div class="form-group">
					      	<label class="control-label col-sm-3" for="txtcomment">Comment:</label>
					      	<div class="col-sm-9">
					         <textarea cols="33" rows="4" style="resize: none;"></textarea> 
					    	</div>
    					</div>
					</div>
                </div>
                <div class="modal-footer" style="height: 80px;">
                    <button type="button" class="btn btn-default" id="btnAddToCart"><span class="button b-close"><span>Add to cart</span></span></button>
                    <button type="button" class="btn btn-primary" id="bt_add"> <span class="button b-close"><span>Buy</span></span></button>
                </div>
            </div>
        </div>
    </div>
<!-- ############################################################# -->
 
  
  <div id="addtocart" style="display: none;" style="width: 80%;">       
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
								      	<label class="control-label col-sm-10" for="txtName">Total Amount :</label>
								      	<div class="col-sm-2">
								         	<input type="text" class="form-control" maxlength="30" name="txtName" id="txtName"> 
								    	</div>
		    					</div>
		    					<div class="form-group">
								      	<label class="control-label col-sm-10" for="txtName">Money In :</label>
								      	<div class="col-sm-2">
								         	<input type="text" class="form-control" maxlength="30" name="txtName" id="txtName"> 
								    	</div>
		    					</div>
		    					<div class="form-group">
								      	<label class="control-label col-sm-10" for="txtName">Money Out :</label>
								      	<div class="col-sm-2">
								         	<input type="text" class="form-control" maxlength="30" name="txtName" id="txtName"> 
								    	</div>
		    					</div>						 
					   </div>
				</div>
				<div class="modal-footer" style="height: 80px;">
					<div align="right">
						<button type="button" class="btn btn-default"><span class="button b-close"><span>Confirm</span></span></button>
						<button type="button" class="btn btn-default"><span class="button b-close"><span>Cancel</span></span></button>		
					</div>
				</div>
		</div>
	</div>
 
<!-- ################################################################## -->
<div style="width: 100%; height: 30px; background-color: #E0E0E0;" align="center">
	Copyright&#64; 2015 kosign
</div>

</body>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#bt_add, #btnCart").click(function(){
				$("#addtocart").bPopup();
			});
		});
		$(".panel-body").click(function() {
			$("#MOD_PRICE").html($(this).find("#PRICE").html());
			$("#protitle").html($(this).find("#Proname").html());
			$("#proid").html($(this).find("#idpro").html());
			$("#imgpath").attr('src',$(this).find("#imgpro").attr('src'));
			$("#myModal").bPopup();
		});
	</script>
	<script type="text/javascript">
    		$(function(){
    			$("#btnAddToCart").click(function(){  
    				json = {
    					"productId"   : $("#proid").html(),
    					"productName" : $("#protitle").html(),
    					"quantity"    : $("#proqty").html(),
    					"totalAmount" : $("#MOD_PRICE").html() * $("#proqty").html(),
    					"comment"	  : $("txtcomment").html()
    				};
    				$.ajax({ 
    				    url: "${pageContext.request.contextPath}/order/addtocart", 
    				    type: 'POST', 
    				    dataType: 'JSON', 
    				    data: JSON.stringify(json), 
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
    			});
    		});
    	</script>
</html>
