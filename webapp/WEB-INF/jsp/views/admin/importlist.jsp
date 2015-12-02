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
<style>
	.hidetable{ display: none;}
	thead tr th { text-align: center; font-size:12px;}
	tbody tr td { text-align: center;}
</style>
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



<body class="fixed-left" ng-app="wecafe">

	<!-- Begin page -->
	<div id="wrapper" ng-controller="ImportController as controller">

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
							<h4 class="pull-left page-title">Import List</h4>
						</div>
					</div>
					<div class="panel-body">
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
											  	<select class="form-control" id="sel1">
												    <option>Detail</option>
												    <option>Daily</option>
												    <option>Weekly</option>
												    <option>Monthly</option>
												    <option>Yearly</option>
											  </select>  
    									</div>  
    									                            		
                            </div>
                           </div>
						<div class="row">
							<div class="col-md-12 col-sm-12 col-xs-12">
							<table id="datatable" class="table table-striped table-bordered hidetable">
									<thead>
										<tr>
											<th>#</th>
											<th>Invoice ID</th>
											<th style="text-align: center;">Date</th>
											<th>Name</th>
											<th style="text-align: right;">Total Amount</th>
											<th style="text-align: center;">Action</th>
										</tr>
									</thead>
									<tbody> 
										<tr dir-paginate="(key,importproducts) in imports|filter:search|itemsPerPage:perPage|orderBy : importproducts.createdDate">
											<td>{{key+1}}</td>
											<td ><a href="javascript:;" id="impid"> {{importproducts.impId}}</a> </td>												
											<td style="text-align: center;">{{importproducts.impDate | date:'dd-MMMM-yyyy'}}</td>
											<td>{{importproducts.userId }}
											<td style="text-align: right;">{{importproducts.totalAmount }} Riel
											<td class="actions" style="text-align: center;"><a
												class="on-default edit-row"
												href="${pageContext.request.contextPath}/admin/viewById/{{importproducts.impId}}"><i
													class="fa fa-pencil"></i></a> <a class="on-default remove-row"
												href="javascript:;" id="btnRemove"><i
													class="fa fa-trash-o"></i></a></td>
										</tr>
									</tbody>
								</table>
								<table id="dailytable" class="table table-responsive" >
    <thead>
<tr >
            <th rowspan="2">Customer</th>
            <th rowspan="2">Item</th>

            <th colspan="2">1</th>
            <th colspan="2">2</th>
            <th colspan="2">3</th>
            <th colspan="2">4</th>
            <th colspan="2">5</th>
            <th colspan="2">6</th>
            <th colspan="2">7</th>
            <th colspan="2">8</th>
            <th colspan="2">9</th>
            <th colspan="2">10</th>
            <th colspan="2">11</th>
            <th colspan="2">12</th> 
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
    <tbody>
      <tr>
        <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
			<td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
           
      </tr>
      <tr>
        <td>A</td>
        <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
<td>A</td>
            <td>A</td>
            
      </tr>
      <tr>
      <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
            <td>A</td>
<td>A</td>
            <td>A</td>
          
      </tr>
    </tbody>
  </table>
							</div>
						</div>
					</div>

				</div>
				<!-- end Panel -->

			</div>
				<!-- container -->

			</div>
			<!-- content -->

			<%@ include file="footer.jsp"%>

		</div>
	</div>
	<!-- END wrapper -->

<!-- ############################################################# -->


		<div id="impDetail" style="display: none;width: 90%;">
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
				<div class="modal-footer" style="height: 80px;">
						<div align="right">
							<button class="btn btn-default b-close">Close</button>
						</div>
				</div>
			</div>
		</div>

		<!-- ################################################################## -->

	<script>
            var resizefunc = [];
            var ctx = "${pageContext.request.contextPath}"
    </script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
    <script src="<c:url value='/resources/scripts/dirPagination.js' />"></script>
    <script src="<c:url value='/resources/scripts/app.js' />"></script>
    <script src="<c:url value='/resources/scripts/services/import_service.js' />"></script>
    <script src="<c:url value='/resources/scripts/controllers/import_controller.js' />"></script>

	<!-- jQuery  -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script	src="${pageContext.request.contextPath}/resources/js/jquery.ui.datepicker-ko.js"></script>
    <script	src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css">
	<%-- <script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> --%>
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

	<script src="${pageContext.request.contextPath}/resources/js/jquery.bpopup.min.js"></script>
	<script type="text/javascript">
		/* ==============================================
		Counter Up
		=============================================== */
		jQuery(document).ready(function($) {
			 searchProduct();
			 searchSupplier();
			 setCalendar();
			 searchByDate();
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
		 		$("#REGS_DATE_S").datepicker('setDate', moment().format('YYYY-MM-DD'));
		 		//$("#REGS_DATE_E").datepicker('setDate', moment().add(30, 'days').format('YYYY-MM-DD'));
		 		$("#REGS_DATE_E").datepicker('setDate', moment().format('YYYY-MM-DD'));
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
			//$('#datatable').dataTable();
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
					       for(i=0; i<data.length; i++){
					    	   st += "<tr><td>" + (i + 1) + "</td>";
					    	   st += "<td>" + data[i].proname +"</td>";
					    	   st += "<td>" + data[i].proqty +"</td>";
					    	   st += "<td>" + data[i].prounitprice +"</td>";
					    	   st += "<td>" + data[i].supname +"</td></tr>"
					       }
					       $("#impProDetail").html(st);
					    },
					    error:function(data,status,er) { 
					        console.log("error: "+data+" status: "+status+" er:"+er);
					    }
					});
				 
				  $("#impDetail").bPopup();  
			 });
			function searchSupplier(){
				$.ajax({ 
				    url: "${pageContext.request.contextPath}/admin/searchsupplier", 
				    type: 'POST', 
				    dataType: 'JSON', 
				    beforeSend: function(xhr) {
	                    xhr.setRequestHeader("Accept", "application/json");
	                    xhr.setRequestHeader("Content-Type", "application/json");
	                },
				    success: function(data) { 
				       console.log(data);
	// 			       getsizeSession();
				    },
				    error:function(data,status,er) { 
				        console.log("error: "+data+" status: "+status+" er:"+er);
				    }
				});
				
			}
		
		function searchProduct(){
				$.ajax({ 
				    url: "${pageContext.request.contextPath}/admin/searchproduct", 
				    type: 'POST', 
				    dataType: 'JSON', 
				    beforeSend: function(xhr) {
	                    xhr.setRequestHeader("Accept", "application/json");
	                    xhr.setRequestHeader("Content-Type", "application/json");
	                },
				    success: function(data) { 
				       console.log(data);
	// 			       getsizeSession();
				    },
				    error:function(data,status,er) { 
				        console.log("error: "+data+" status: "+status+" er:"+er);
				    }
				});
				
			}
		
		});
	</script>

	<!-- Examples -->
	 <script src="${pageContext.request.contextPath}/resources/assets/datatables/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/datatables/dataTables.bootstrap.js"></script>
        
        
        
</body>
</html>