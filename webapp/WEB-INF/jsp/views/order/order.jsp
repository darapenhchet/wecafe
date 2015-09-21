<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<html lang="en">
<head>
  <title>Order Produce</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
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
  </style>
</head>
<body>
  	 
	<div>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="${pageContext.request.contextPath}/resources/images/img/slide4.png" alt="Chania" style="width: 100%; height: 915px;">
      </div>

      <div class="item">
        <img src="${pageContext.request.contextPath}/resources/images/img/slide4.png" alt="Chania" style="width: 100%; height: 915px;">
      </div>
    
      <div class="item">
        <img src="${pageContext.request.contextPath}/resources/images/img/slide4.png" alt="Flower" style="width: 100%; height: 915px;">
      </div>

      <div class="item">
        <img src="${pageContext.request.contextPath}/resources/images/img/slide4.png" alt="Flower" style="width: 100%; height: 915px;">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
		<div>
			<div align="right">
				<img src="../img/add_to_cart.png" width="170px" height="40px">
			</div>
			<div>
				<div>	 
					<div id="myCarousel1" class="carousel slide" data-ride="carousel"> 
					    <!-- Wrapper for slides -->
					    <div class="carousel-inner container" role="listbox" style="height: 500px; ">
					    		<div class="item active" style="width : 70%; margin: 0 auto;">
					    			<div class="col-sm-6">
						    			<div class="panel panel-default form-group">
									    	<div class="panel-body" data-toggle="modal" data-target="#myModal">
									    		<div style="float: left;">
										    		<img src="../img/drink.jpg">	
										    		Coca Cola
										    	</div>
										    	<div style="text-align: right;">
										    		0.5$
										    	</div>
									    	</div>
									  	</div>
									  	<div class="panel panel-default">
									    	<div class="panel-body" data-toggle="modal" data-target="#myModal">
									    		<div style="float: left;">
										    		<img src="../img/drink.jpg">	
										    		Coca Cola
										    	</div>
										    	<div style="text-align: right;">
										    		0.5$
										    	</div>
									    	</div>
									  	</div>
									  	<div class="panel panel-default">
									    	<div class="panel-body" data-toggle="modal" data-target="#myModal">
									    		<div style="float: left;">
										    		<img src="../img/drink.jpg">	
										    		Coca Cola
										    	</div>
										    	<div style="text-align: right;">
										    		0.5$
										    	</div>
									    	</div>
									  	</div>
									</div>
									<div class="col-sm-6">
									  	<div class="panel panel-default">
									    	<div class="panel-body" data-toggle="modal" data-target="#myModal">
									    		<div style="float: left;">
										    		<img src="../img/drink.jpg">	
										    		Coca Cola
										    	</div>
										    	<div style="text-align: right;">
										    		0.5$
										    	</div>
									    	</div>
									  	</div>
									  	<div class="panel panel-default">
									    	<div class="panel-body" data-toggle="modal" data-target="#myModal">
									    		<div style="float: left;">
										    		<img src="../img/drink.jpg">	
										    		Coca Cola
										    	</div>
										    	<div style="text-align: right;">
										    		0.5$
										    	</div>
									    	</div>
									  	</div>
									  	<div class="panel panel-default">
									    	<div class="panel-body" data-toggle="modal" data-target="#myModal">
									    		<div style="float: left;">
										    		<img src="../img/drink.jpg">	
										    		Coca Cola
										    	</div>
										    	<div style="text-align: right;">
										    		0.5$
										    	</div>
									    	</div>
									  	</div>
									</div> 
							    </div>

							    <div class="item" style="border 1px solid; width : 70%; margin: 0 auto;">
					    			<div class="col-sm-6">
						    			<div class="panel panel-default form-group">
									    	<div class="panel-body" data-toggle="modal" data-target="#myModal">
									    		<div style="float: left;">
										    		<img src="../img/drink.jpg">	
										    		Coca Cola
										    	</div>
										    	<div style="text-align: right;">
										    		0.5$
										    	</div>
									    	</div>
									  	</div>
									  	<div class="panel panel-default">
									    	<div class="panel-body" data-toggle="modal" data-target="#myModal">
									    		<div style="float: left;">
										    		<img src="../img/drink.jpg">	
										    		Coca Cola
										    	</div>
										    	<div style="text-align: right;">
										    		0.5$
										    	</div>
									    	</div>
									  	</div>
									  	<div class="panel panel-default">
									    	<div class="panel-body" data-toggle="modal" data-target="#myModal">
									    		<div style="float: left;">
										    		<img src="../img/drink.jpg">	
										    		Coca Cola
										    	</div>
										    	<div style="text-align: right;">
										    		0.5$
										    	</div>
									    	</div>
									  	</div>
									</div>
									<div class="col-sm-6">
									  	<div class="panel panel-default">
									    	<div class="panel-body" data-toggle="modal" data-target="#myModal">
									    		<div style="float: left;">
										    		<img src="../img/drink.jpg">	
										    		Coca Cola
										    	</div>
										    	<div style="text-align: right;">
										    		0.5$
										    	</div>
									    	</div>
									  	</div>
									  	<div class="panel panel-default">
									    	<div class="panel-body" data-toggle="modal" data-target="#myModal">
									    		<div style="float: left;">
										    		<img src="../img/drink.jpg">	
										    		Coca Cola
										    	</div>
										    	<div style="text-align: right;">
										    		0.5$
										    	</div>
									    	</div>
									  	</div>
									  	<div class="panel panel-default">
									    	<div class="panel-body" data-toggle="modal" data-target="#myModal">
									    		<div style="float: left;">
										    		<img src="../img/drink.jpg">	
										    		Coca Cola
										    	</div>
										    	<div style="text-align: right;">
										    		0.5$
										    	</div>
									    	</div>
									  	</div>
									</div>
							    </div>
					    </div>
					    <!-- Left and right controls -->
					    <a class="left carousel-control" href="#myCarousel1" role="button" data-slide="prev">
					      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					      <span class="sr-only">Previous</span>
					    </a>
					    <a class="right carousel-control" href="#myCarousel1" role="button" data-slide="next">
					      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					      <span class="sr-only">Next</span>
					    </a>
					</div>
			</div>
		</div>
 
<!-- ############################################################# -->
	<!-- Modal HTML -->
    <div id="myModal" class="modal fade" >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title">Coca Cola</h4>
                </div>
                <div class="modal-body form-horizontal" style="height: 290px;">
                    <div class="col-sm-4">
						  <img src="${pageContext.request.contextPath}/resources/images/img/drink.jpg" style="width 200px; height: 250px; ">  			
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
					         <input type="text" class="form-control" maxlength="30" name="txtName" id="txtName"> 
					    	</div>
    					</div>	
    					<div class="form-group">
					      	<label class="control-label col-sm-3" for="txtName">Time :</label>
					      	<div class="col-sm-9">
					         <input type="text" class="form-control" maxlength="30" name="txtName" id="txtName"> 
					    	</div>
    					</div>
    					<div class="form-group">
					      	<label class="control-label col-sm-3" for="txtName">Comment:</label>
					      	<div class="col-sm-9">
					         <textarea cols="33" rows="4" style="resize: none;"></textarea> 
					    	</div>
    					</div>
					</div>
                </div>
                <div class="modal-footer" style="height: 80px;">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Add to cart</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" id="bt_add">Buy</button>
                </div>
            </div>
        </div>
    </div>
<!-- ############################################################# -->
<div style="width: 100%; height: 30px; background-color: #E0E0E0;" align="center">
	Copyright&#64; 2015 kosign
</div>

</body>
	<script type="text/javascript">
		$(document).ready(function(){
		    $(".panel-body").click(function(){
		        
		    });
		});
	</script>
</html>
