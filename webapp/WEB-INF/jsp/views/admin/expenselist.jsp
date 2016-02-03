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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<style>
.hidebtn {
	display: none;
}

.borderRed {
	border-color: red;
}
	table{
	font-family: 'Khmer OS', 'Khmer OS System'; font-size: 10pt;
}

thead tr th {
	text-align: center !important;
	font-size: 14px !important;
	font-weight: bold;
}
</style>
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
							<h4 class="pull-left page-title">Expense List</h4>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="panel panel-default">				
								<div class="panel-heading">						
									<div class="row">
										<!-- <h3 class="panel-title">Product Lists</h3> -->
										<div class="col-md-10">
											<div class="m-h-50 form-group hidden-print ">
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
										</div>									
										<div class="col-md-2 pull-right">
											<button id="btn_add_expense" class="btn btn-primary">Add Expense</button>
										</div>								
									</div>
								</div>
								<!--End Panel Head -->
								<div class="panel-body">
									<div class="row">
										<div class="col-md-12 col-sm-12 col-xs-12">
											<table id="datatable" class="table table-striped table-bordered">
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
												<tbody id="CONTENTS">
													
												</tbody>
											</table>
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
										<div class="col-md-10 form-horizontal" align="right">
											<label  class="control-label col-md-9">Total Amount : </label>
												<div class="col-md-3">
														<input class="form-control" readonly="readonly" id="allTotalAmount" type="text">
												</div>												
										</div>
										<div id="PAGINATION" class="pull-right"></div>
									</div>
									<div class="row" style="border-radius: 0px;">
											 <div class="hidden-print">
											<div class="pull-right">
												<a href="javascrpt:"
													class="btn btn-inverse waves-effect waves-light" id="print_report"><i class="fa fa-print"></i></a> 
													<!-- <a onclick="window.print();" href="#" class="btn btn-primary waves-effect waves-light">Print</a> -->
											</div>
										</div>
										</div>
								</div>	
								<!--End  Panel Body -->				
					</div>

				</div>
				<!-- end Panel -->
				</div>
			</div>
			<!-- container -->

		</div>
		<!-- content -->

		<%@ include file="footer.jsp"%>

	</div>
	</div>
	<!-- END wrapper -->

	<!-- ############################################################# -->


	<div id="impDetail" style="display: none; width: 80%;">
		<div class="modal-content">
			<div class="modal-header">

				<button type="button" class="close" aria-hidden="true">
					<span class="button b-close"><span>×</span></span>
				</button>
				<h4 class="modal-title">Expense</h4>

			</div>
			<div class="modal-body" style="width: 100%;">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>#</th>
							<th>Produce Name</th>
							<th>Qty</th>
							<th>Unit Price</th>
							<th>Amount</th>
							<th>Supplier Name</th>
							<th>Remark</th>
						</tr>
					</thead>
					<tbody id="impProDetail">
					</tbody>
				</table>

				<div class="modal-footer" style="height: 80px;">
					<div style="float: left;">
						<div class="form-group form-horizontal">
							<label class="control-label col-lg-6">Total Amount</label>
							<div class="col-lg-6">
								<input class=" form-control" id="txttotal" type="text"
									readonly="readonly">
							</div>
						</div>
					</div>
					<div align="right">
						<button class="btn btn-default b-close">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- ################################################################## -->
	
	<%@ include file="expenseadd.jsp"%>
	<%@ include file="print_report_expense_list.jsp"%>
	<script>
            var resizefunc = [];
            var ctx = "${pageContext.request.contextPath}"
    </script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
	<script src="<c:url value='/resources/scripts/dirPagination.js' />"></script>
	<script src="<c:url value='/resources/scripts/app.js' />"></script>
	<script
		src="<c:url value='/resources/scripts/services/import_service.js' />"></script>
	<script
		src="<c:url value='/resources/scripts/controllers/import_controller.js' />"></script>

	<!-- jQuery  -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
		
	<script	src="${pageContext.request.contextPath}/resources/js/jquery.ui.datepicker-ko.js"></script>
	<script	src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
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
	<script src="${pageContext.request.contextPath}/resources/js/jquery.app.js"></script>
	<script	src="${pageContext.request.contextPath}/resources/js/jquery.tmpl.min.js"></script>
	<script	src="${pageContext.request.contextPath}/resources/js/jquery.bootpag.min.js"></script>
	<script	src="${pageContext.request.contextPath}/resources/js/numeral.min.js"></script>
		<script id="CONTENT_Expenselist" type="text/x-jquery-tmpl">
	<tr>
		<td>{{= importDetail}} </td>
		<td ><a herf="javascript:" style="cursor:pointer" id="expid">{{= expId}}</a></td>
		<td>{{= exp_date}}</td>
		<td>{{= exp_user.firstName + ' ' + exp_user.lastName}} </td>
		<td>{{= totalAmount}}</td>  
		<td class="actions" style="text-align: center;">
			<a class="on-default edit-row" href="${pageContext.request.contextPath}/admin/expenseupdate/{{= expId}}">
			<i class="fa fa-pencil"></i></a> <a class="on-default remove-row" href="javascript:;" id="btnRemove">
			<i class="fa fa-trash-o"></i></a>
		</td>
	</tr>
</script>
	<script	src="${pageContext.request.contextPath}/resources/js/jquery.bpopup.min.js"></script>
	<script type="text/javascript">
		/* ==============================================
		Counter Up
		=============================================== */
		jQuery(document).ready(function($) {
			var check=true;
			var order = 1;
    		var v=[];
    		var b = true;
			setCalendar(); 
			getListExpense(1);
				function getListExpense(currentPage){
					 var json = {
							 	"currentPage" : currentPage,
					    		"perPage"     : $("#PER_PAGE").val(),
				   				"start_date" : $("#REGS_DATE_S").val(),
				   				"end_date"   : $("#REGS_DATE_E").val()
						};$.ajax({
						 url: "${pageContext.request.contextPath}/admin/getexpenselist/",
						 type: 'GET',
						 data: json, 
						    beforeSend: function(xhr) {
			                    xhr.setRequestHeader("Accept", "application/json");
			                    xhr.setRequestHeader("Content-Type", "application/json");
			                },
						 success: function(data){
							 console.log(data);
							 b =true;
							 v=data; 
							  if(data.expense.length>0){ 
									$("tbody#CONTENTS").html('');					
									for(i=0; i<data.expense.length;i++)
										{
											format(data.expense[i]); 
										}
									$("#CONTENT_Expenselist").tmpl(data.expense).appendTo("tbody#CONTENTS");
									$("#allTotalAmount").val(numeral(data.total_amount[0].total_amount).format('0,0'));
								}else{
									$("tbody#CONTENTS").html('<tr>NO CONTENTS</tr>');
									$("#allTotalAmount").val("");
								}
						    	if(check){
						    		setPagination(data.pagination.totalPages,1);
						    		check=false;
						    	}  
						 },
						 error:function(data,status,er){
							 console.log("error: "+data+" status: "+status+" er: "+ er);
						 } 
					 });
			}
		format = function(value){
			 		value["exp_date"] =(value["exp_date"]).substring(0, 10);
			 		value["totalAmount"] = numeral(value["totalAmount"]).format('0,0');	
			 		if(b){
			 			order = v.pagination.perPage * (v.pagination.currentPage-1);
			 			j = order + 1;
			 			value["importDetail"] =j;
			 			b = false;
			 		}
			 		else  
			 			value["importDetail"] = ++j;
			 		 
		 }
		 $("#PER_PAGE").change(function(){
 			check = true;
 			getListExpense(1);
		    });
		 
			 $(document).on("click","#expid", function(){
		 		   $.ajax({ 
					    url: "${pageContext.request.contextPath}/admin/getexpensedetail/" + $(this).html() , 
					    type: 'GET', 
					    dataType: 'JSON', 
					    beforeSend: function(xhr) {
		                    xhr.setRequestHeader("Accept", "application/json");
		                    xhr.setRequestHeader("Content-Type", "application/json");
		                },
					    success: function(data) {  
					    var	amount = 0;
					    var st= "";
					       for(i=0; i<data.length; i++){
					    	   st += "<tr><td>" + (i + 1) + "</td>";
					    	   st += "<td>" + data[i].exp_description +"</td>";
					    	   st += "<td>" + numeral(data[i].exp_qty).format('0,0') +"</td>";
					    	   st += "<td>" + numeral(data[i].exp_unitprice).format('0,0') +"</td>";
					    	   st += "<td>" + numeral((data[i].exp_unitprice * data[i].exp_qty)).format('0,0') +"</td>";
					    	   st += "<td>" + data[i].customer +"</td>";
					    	   st += "<td>" + data[i].remark +"</td></tr>"; 
					    	   amount += (data[i].exp_unitprice * data[i].exp_qty);
					       }
					       $("#txttotal").val(numeral(amount).format('0,0'));
					       $("#impProDetail").html(st); 
					    },
					    error:function(data,status,er) { 
					        console.log("error: "+data+" status: "+status+" er:"+er);
					    }
					});  
				 
				  $("#impDetail").bPopup();  
			 });
			 function setCalendar(){		
			 		$("#REGS_DATE_S").datepicker({
			 		      defaultDate: new Date(),
			 		      setDate: new Date(),
			 		      changeMonth: true,
			 		      numberOfMonths: 1,
			 		      dateFormat: "yy-mm-dd",
			 		      onClose: function( selectedDate ) {			    	  
			 			    	    /* alculateDay($("#REGS_DATE_S").datepicker("getDate"),$("#REGS_DATE_E").datepicker("getDate")); */
			 						//moneyPerDay($("#totalAmount").val(), $("#totalday").val());
			 						$("#REGS_DATE_E").datepicker("option", "minDate", selectedDate);
			 						check = true;
			 						getListExpense(1);
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
			 			    	 check = true;
			 			    	 getListExpense(1);
			 			      }
			 		});		
			 		
			 		$("#REGS_DATE_S").datepicker('setDate', moment().subtract(30, 'days').format('YYYY-MM-DD'));
			 		$("#REGS_DATE_E").datepicker('setDate', moment().format('YYYY-MM-DD'));
			 		//$("#REGS_DATE_E").datepicker('setDate', moment().format('YYYY-MM-DD'));
			 }
			 $("#btnREGS_DATE_S").click(function(){	
		 			$( "#REGS_DATE_S" ).datepicker("show");		
		 			
		 		});		
		 	$("#btnREGS_DATE_E").click(function(){
		 			$( "#REGS_DATE_E" ).datepicker("show");			
		 		});

			 setPagination = function(totalPage, currentPage){
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
				    	getListExpense(currentPage);
				    }); 
				};
		
            /* ==============================================Add Expense=============================================== */
           
            	var _thisRow ;
            	
            		
                		
        			$("#btn_add_expense").click(function(){    	
        				clear();
        			//	searchProduct();
        		//		searchSupplier()
        				
        				$('#form_add_expense').modal({
        					"backdrop":"static"
        				}) ;
        			});
            	
                $(document).on('keypress','#qty, #UnitPrice', function(e){

    				if((e.keyCode == 8) || (e.keyCode == 46) || ((e.keyCode >=37) && (e.keyCode <= 40)))
    					return ;

    			var data = String.fromCharCode(e.which);	
    					var reg = new RegExp('^[0-9]+$');
    		    	    if(!reg.test(data)){
    		    	    	e.preventDefault();
    					}
    			     });
            	
            	$("#cencelBtn").click(function(){
            		if(confirm("Do you want to cancel?")){
            			clear();
            			$("#tbllistimport tr").remove();
            		}
            	});
            	
            	$(document).on("click","#btndelete",function(){
            		$(this).parents("tr").remove();            		
            	});
            	
            	$(document).on("click","#btnedit",function(){
					
            		_thisRow = $(this).parents("tr");
            		
            		$("#productName").val($(this).parents("tr").children().eq(3).html());
            		$("#qty").val($(this).parents("tr").children().eq(4).html());
            		$("#UnitPrice").val($(this).parents("tr").children().eq(5).html());
            		$("#supplierName").val($(this).parents("tr").children().eq(6).html()); 
            		$("#remark").val($(this).parents("tr").children().eq(7).html());
            		$("#addbtn").html("Update");
            		$("#addbtn").attr("id","editbtn");
            		
            	});
            	
            	$(document).on("click","#editbtn",function(){
            		_thisRow.children().eq(0).html($("#proID").val());
            		_thisRow.children().eq(1).html($("#supID").val());
            		_thisRow.children().eq(3).html($("#productName").val());
            		_thisRow.children().eq(4).html($("#qty").val());
            		_thisRow.children().eq(5).html($("#UnitPrice").val()); 
            		_thisRow.children().eq(6).html($("#supplierName").val());
            		_thisRow.children().eq(7).html($("#remark").val());
            		$("#editbtn").html("Add");
            		$("#editbtn").attr("id","addbtn");
            		clear();
            	});
            	
            	$("#canceladd").click(function(){ 
	            		clear(); 
	            		$("#editbtn").attr("id","addbtn");
	            		$("#editbtn").html("Add");
            	});
            	
            	$(document).on("blur","#productName ,#qty ,#UnitPrice ,#supplierName",function(){ 
            		
            	if($(this).val()=="")
        		{ 
        			$(this).addClass("borderRed");
        			return;
        		}
        		else
        				$(this).removeClass("borderRed"); 
            	});
            	
            	$(document).on("click","#addbtn",function(){ 
            		if($("#productName").val()=="")
            			{
            				$("#productName").addClass("borderRed");
            				return;
            			}
            		else
            				$("#productName").removeClass("borderRed");
            		if($("#qty").val()=="")
        			{
        				$("#qty").addClass("borderRed");
        				return;
        			}
            		else
        				$("#qty").removeClass("borderRed");
            		if($("#UnitPrice").val()=="")
        			{
        				$("#UnitPrice").addClass("borderRed");
        				return;
        			}
            		else
        				$("#UnitPrice").removeClass("borderRed");
            		if($("#supplierName").val()=="")
        			{
        				$("#supplierName").addClass("borderRed");
        				return;
        			}
            		else
        				$("#supplierName").removeClass("borderRed");
            		
					var isAdded=false;
					
					$('#tbllistimport tr').each(function() {						
						var pro_name=$(this).find("td").eq(3).text();
											
							if($.trim($("#productName").val())==$.trim(pro_name)){
								alert("Product is already added");
								isAdded=true ;
							}
					});
					
					if(isAdded==false){
            		var st="";
            		st += "<tr><td style='display: none;'>" + $('#proID').val() +"</td>";
            		st += "<td style='display: none;'>"+ $('#supID').val() +"</td>";
            		st += "<td>" + ($("#tbllistimport tr").length + 1) +"</td>"; 
            		st += "<td>" + $("#productName").val() +"</td>";
            		st += "<td>" + $("#qty").val() +"</td>";
            		st += "<td>" + $("#UnitPrice").val() +"</td>";
            		st += "<td>" + $("#supplierName").val() +"</td>";
            		st += "<td>" + $("#remark").val() +"</td>";
            		st += "<td><a href= 'javascript:;' id='btnedit'>Edit</a> | <a href='javascript:;' id='btndelete'>Delete</a></td></tr>";
            		$("#tbllistimport").append(st);
            		clear();
					}
            	});
            	
                $('.counter').counterUp({
                    delay: 100,
                    time: 1200
                });
                
                $("#savebtn").click(function(){ 
                	var expenseDetail = [];
                	if($('#tbllistimport tr').length==0){
                		alert("There is no data was added");
                		return;
                	}
                		$('#tbllistimport tr').each(function(){
                			json ={
                						"proname"			: ($(this).find("td").eq(3).html()),
                						"quantity" 		 	:($(this).find("td").eq(4).html()),
                						"unitPrice"		    :($(this).find("td").eq(5).html()),
                						"remark"		    :($(this).find("td").eq(7).html()),
                						"suppliername"	  	:($(this).find("td").eq(6).html())
                					};
                			expenseDetail.push(json);	
                		}); 
                		
    	 			$.ajax({
    	 				 url: "${pageContext.request.contextPath}/admin/saveExpense", 
     				    type: 'POST',
    	 				datatype: 'JSON',
    	 				data: JSON.stringify(expenseDetail), 
    	 				beforeSend: function(xhr) {
    	 		            xhr.setRequestHeader("Accept", "application/json");
    	 		            xhr.setRequestHeader("Content-Type", "application/json");
    	 		        },
    	 				success: function(data){
    	 					if(data==true){
    	 						getListExpense(1);
    	 						alert("Successfully saved");
    	 						clear();
    	 						$('#tbllistimport tr').remove();   	 						
    	 						$('#form_add_expense').modal('hide');
    	 						
    	 					}else{
    	 						alert("Please try to save again!");
    	 					}
    	 					
    	 					//console.log(data);
    	 					//location.href="${pageContext.request.contextPath}/admin/expenselist";
    	 				},
    	 				error:function(data, status,er){
    	 					console.log("error: " + data + "status: " + status + "er: ");
    	 				}
    	 			});    
                });
                
                
           
                function clear(){
            		$("#productName").val(""); 	$("#productName").removeClass("borderRed"); 
            		$("#qty").val("");			$("#qty").removeClass("borderRed");
            		$("#UnitPrice").val("");	$("#UnitPrice").removeClass("borderRed");
            		$("#supplierName").val(""); $("#supplierName").removeClass("borderRed");
            		$("#remark").val(""); $("#remark").removeClass("borderRed");
            	}
                
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
    				       //console.log(data); 
    				       var availableTags=[];
    				       for(i=0; i<data.length; i++)
		   						{							
    				    	   availableTags[i]= 
		   						         {
		   						         	"label": data[i].supplierName,
		   									"dataid": data[i].supId 
		   						         };
		   						}
    				       $("#supplierName" ).autocomplete({
    				    	   
    				    	   select: function(event, ui){
    				    		   $("#supID").val(ui.item.dataid);
    				    	   },
    				    	   //maxShowItems: 8,
    				           source: availableTags
    				       });  
    				    },
    				    error:function(data,status,er) { 
    				        console.log("error: "+data+" status: "+status+" er:"+er);
    				    }
    				});
    				
    			}
                 
                function clear(){
            		$("#productName").val(""); 	$("#productName").removeClass("borderRed");
            		$('#proID').val("");		 
            		$('#supID').val("");		 
            		$("#qty").val("");			$("#qty").removeClass("borderRed");
            		$("#UnitPrice").val("");	$("#UnitPrice").removeClass("borderRed");
            		$("#supplierName").val(""); $("#supplierName").removeClass("borderRed");
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
    				      // console.log(data); 
    				       var availableTags=[];
    				       for(i=0; i<data.length; i++)
		   						{							
    				    	   availableTags[i]= 
		   						         {
		   						         	"label": data[i].productName,
		   									"dataid": data[i].productId 
		   						         };
		   						}
    				       $("#productName" ).autocomplete({
    				    	   
    				    	   select: function(event, ui){
    				    		   $("#proID").val(ui.item.dataid);
    				    	   },
    				    	  // maxShowItems: 8,
    				           source: availableTags
    				       });
    				       $(".ui-autocomplete").css("position", "absolute");
						   $(".ui-autocomplete").css("z-index", "2147483647");
    				    },
    				    error:function(data,status,er) { 
    				        console.log("error: "+data+" status: "+status+" er:"+er);
    				    }
    				});
    				
    			} 
                $("#print_report").click(function() {
                	$("#report_start_date").html(" Date " + $("#REGS_DATE_S").val());
                	$("#report_end_date").html($("#REGS_DATE_E").val());
                	list_print_report();
    				$('#request_stock_list').modal({
    					"backdrop":"static"
    				}) ;
    				
    			});
                function list_print_report(){
                	var json = { 
			   				"start_date" : $("#REGS_DATE_S").val(),
			   				"end_date"   : $("#REGS_DATE_E").val()
					};$.ajax({
					 url: "${pageContext.request.contextPath}/admin/getexpenselist_print/",
					 type: 'GET',
					 data: json, 
					    beforeSend: function(xhr) {
		                    xhr.setRequestHeader("Accept", "application/json");
		                    xhr.setRequestHeader("Content-Type", "application/json");
		                },
					 success: function(data){ 
						b =true;
						v=data;				
						console.log(data);
						 if(data.expense_print.length>0){ 
								$("tbody#PRINT_CONTENTS").html('');					
								  for(i=0; i<data.expense_print.length;i++)
									{
									  format_print(data.expense_print[i]); 
									}  
								$("#CONTENT_Print_Import").tmpl(data.expense_print).appendTo("tbody#PRINT_CONTENTS");
								$("#allTotalAmount_print").val(numeral(data.total_amount_print[0].total_amount).format('0,0'));
							}else{
								$("tbody#PRINT_CONTENTS").html('<tr>NO CONTENTS</tr>');
								$("#allTotalAmount_print").val("");
							} 
					 },
					 error:function(data,status,er){
						 console.log("error: "+data+" status: "+status+" er: "+ er);
					 } 
				 });
                }
                format_print = function(value){ 
			 		value["totalAmount"] = numeral(value["totalAmount"]).format('0,0');		
			 		
			 	 	value["exp_date"] =(value["exp_date"]).substring(0, 10);
			 		if(b){
			 			order = 0
			 			j = order + 1;
			 			value["importDetail"] =j;
			 			b = false;
			 		}
			 		else  
			 		value["importDetail"] = ++j; 
					
		 }
            });
        </script>

	<!-- Examples -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/datatables/dataTables.bootstrap.js"></script>

	<script
	src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.ui.autocomplete.scroll.min.js"></script>

</body>
</html>